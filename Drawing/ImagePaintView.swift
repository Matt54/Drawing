//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Matt Pfeiffer on 1/2/21.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.09, width: 1, height: 0.5), scale: 0.01), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.09, width: 1, height: 1.0), scale: 0.005), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
