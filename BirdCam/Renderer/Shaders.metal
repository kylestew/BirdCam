#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct Vertex {
    vector_float4 color;
    vector_float2 pos;
};

struct VertexIn {
    float3 position [[attribute(0)]];
    float3 normal [[attribute(1)]];
    float2 texCoords [[attribute(2)]];
};

struct VertexOut {
    float4 position [[position]];
    float3 worldNormal;
    float3 worldPosition;
    float2 texCoords;
};

struct VertexUniforms {
    float4x4 modelMatrix;
    float4x4 viewProjectionMatrix;
    float3x3 normalMatrix;
};

#define LightCount 3

struct Light {
    float3 worldPosition;
    float3 color;
};

struct FragmentUniforms {
    float3 cameraWorldPosition;
    float3 ambientLightColor;
    float3 specularColor;
    float specularPower;
    Light lights[LightCount];
};

vertex VertexOut vertexShader(VertexIn vertexIn [[stage_in]],
                           constant VertexUniforms &uniforms [[buffer(1)]]) {
    float4 worldPosition = uniforms.modelMatrix * float4(vertexIn.position, 1);
    VertexOut vertexOut;
    vertexOut.position = uniforms.viewProjectionMatrix * worldPosition; // clip-space position
    vertexOut.worldPosition = worldPosition.xyz;
    vertexOut.worldNormal = uniforms.normalMatrix * vertexIn.normal;
    vertexOut.texCoords = vertexIn.texCoords;
    return vertexOut;
}

fragment float4 fragmentShader(VertexOut fragmentIn [[stage_in]],
                               constant FragmentUniforms &uniforms [[buffer(0)]],
                               texture2d<float, access::sample> baseColorTexture [[texture(0)]],
                               sampler baseColorSampler [[sampler(0)]])
{
    float3 baseColor = baseColorTexture.sample(baseColorSampler, fragmentIn.texCoords).rgb;
    float3 specularColor = uniforms.specularColor;

    // world-space normal
    float3 N = normalize(fragmentIn.worldNormal.xyz);
    // world-space viewing direction
    float3 V = normalize(uniforms.cameraWorldPosition - fragmentIn.worldPosition.xyz);

    float3 finalColor(0, 0, 0);
    for (int i = 0; i < LightCount; ++i) {
        // diffuse
        float3 L = normalize(uniforms.lights[i].worldPosition - fragmentIn.worldPosition.xyz);
        float3 diffuseIntensity = saturate(dot(N, L));

        // specular
        float3 H = normalize(L + V);
        float specularBase = saturate(dot(N, H));
        float specularIntensity = powr(specularBase, uniforms.specularPower);

        float3 lightColor = uniforms.lights[i].color;
        finalColor += uniforms.ambientLightColor * baseColor +
                    diffuseIntensity * lightColor * baseColor +
                    specularIntensity * lightColor * specularColor;
    }
    return float4(finalColor, 1);
}
