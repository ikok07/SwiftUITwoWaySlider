//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 15.10.23.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SliderTestView: View {
    
    @State private var leftVal: Double = 25
    @State private var rightVal: Double = 70
    
    var body: some View {
        VStack {
            Text("Min: \(leftVal)")
            Text("Max: \(rightVal)")
            TwoWaySlider(leftVal: $leftVal, rightVal: $rightVal, range: 0...100)
                .withLabels(leftLabel: "\(Int(leftVal))", rightLabel: "\(Int(rightVal))")
        }
        .padding()
    }
}

@available(iOS 15.0.0, *)
#Preview {
    SliderTestView()
}
