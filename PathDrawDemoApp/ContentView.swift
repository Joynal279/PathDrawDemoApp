//
//  ContentView.swift
//  PathDrawDemoApp
//
//  Created by JOYNAL ABEDIN on 27/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 50, y: 10))
                path.addLine(to: CGPoint(x: 10, y: 350))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
            }
            .fill(Color.green)
            
            MyShape()
                .fill(Color.red)
                .frame(width: 360, height: 350)
        }
    }
}

//Custom Shape
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
