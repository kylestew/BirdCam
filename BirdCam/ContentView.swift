//
//  ContentView.swift
//  BirdCam
//
//  Created by Kyle Stewart on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .strokeStyle()

            CameraControls()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
