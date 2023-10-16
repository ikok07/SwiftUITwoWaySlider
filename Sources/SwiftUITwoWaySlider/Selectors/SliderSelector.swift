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
    
    var labelBg: Color
    var labelTextColor: Color
    var label: String
    
    var active: Bool
    
    func border(_ color: Color, width: CGFloat = 2) -> SliderSelector {
        var view = self
        view.borderColor = color
        view.borderWidth = width
        return view
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: width)
                .overlay {
                    Circle()
                        .stroke(borderColor != nil ? borderColor! : .clear, lineWidth: borderWidth)
                }
            if active && label != "" {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(labelBg)
                        .frame(width: width * 2, height: 27)
                    
                    Text(label)
                        .foregroundColor(labelTextColor)
                        .fontWeight(.semibold)
                }
                .offset(y: -width - 10)
            }
        }
        .animation(.easeOut, value: active)
    }
}

@available(iOS 15.0.0, *)
#Preview {
    SliderSelector(color: .white, width: 25, labelBg: .accentColor, labelTextColor: .white, label: "", active: false)
        .border(.orange, width: 4)
}
