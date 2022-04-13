import MetalKit
import SwiftUI

struct MetalView: UIViewRepresentable {
    @EnvironmentObject var appState: AppState

    let view: MTKView
    let renderer: Renderer

    init() {
        self.view = MTKView.init(frame: .zero)
        self.view.clearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        self.view.layer.isOpaque = false
        self.view.colorPixelFormat = .bgra8Unorm_srgb
        self.view.depthStencilPixelFormat = .depth32Float
        guard let renderer = Renderer(metalView: view) else {
            fatalError("Cannot create GPU pipeline")
        }
        self.renderer = renderer
        self.view.delegate = renderer
    }

    func makeUIView(context: Context) -> MTKView {
        view
    }

    func updateUIView(_ uiView: MTKView, context: Context) {
        renderer.rotationVelocity = appState.rotationVelocity
    }
}
