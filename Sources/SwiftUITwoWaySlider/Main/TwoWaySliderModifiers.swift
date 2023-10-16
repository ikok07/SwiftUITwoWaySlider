//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 15.10.23.
//

import SwiftUI

@available(iOS 15.0, *)
public extension TwoWaySlider {
    func frame(height: CGFloat, containerHeight: CGFloat) -> TwoWaySlider {
        var view = self
        view.height = height
        view.containerHeight = containerHeight
        return view
    }
    
    func background(_ colour: Color) -> TwoWaySlider {
        var view = self
        view.bg = colour
        return view
    }
    
    func activeColor(_ colour: Color) -> TwoWaySlider {
        var view = self
        view.activeColor = colour
        return view
    }
    
    func cornerRadius(_ value: CGFloat) -> TwoWaySlider {
        var view = self
        view.cornerRadius = value
        return view
    }
    
    func withLabels(leftLabel: String, rightLabel: String, bgColor: Color? = nil, textColor: Color? = nil) -> TwoWaySlider {
        var view = self
        view.leftLabel = leftLabel
        view.rightLabel = rightLabel
        if bgColor != nil {
            view.labelBg = bgColor!
        }
        if textColor != nil {
            view.labelTextColor = textColor!
        }
        return view
    }
}
