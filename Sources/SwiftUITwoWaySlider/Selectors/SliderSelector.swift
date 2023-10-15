//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 15.10.23.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SliderSelector: View {
    
    let color: Color
    let width: CGFloat
    var borderColor: Color? = nil
    var borderWidth: CGFloat = 2
    
    func border(_ color: Color, width: CGFloat = 2) -> SliderSelector {
        var view = self
        view.borderColor = color
        view.borderWidth = width
        return view
    }
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: width)
            .overlay {
                Circle()
                    .stroke(borderColor != nil ? borderColor! : .clear, lineWidth: borderWidth)
            }
    }
}

@available(iOS 15.0.0, *)
#Preview {
    SliderSelector(color: .white, width: 25)
        .border(.orange, width: 4)
}
