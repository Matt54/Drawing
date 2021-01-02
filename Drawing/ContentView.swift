//
//  ContentView.swift
//  Drawing
//
//  Created by Matt Pfeiffer on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var lineWidth: CGFloat = 10.0
    @State private var colorCycle = 0.0
    
    var body: some View {
        Arrow()
            .stroke(Color.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 500)
            .onTapGesture {
                withAnimation(.linear(duration: 1.0)){
                    lineWidth = 30.0
                }
            }
        
        VStack {
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack{
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
}


struct Arrow : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //start at tip
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.maxX - rect.maxX / 3, y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.maxX - rect.maxX / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - rect.maxX * 2 / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - rect.maxX * 2 / 3, y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
