//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 15.10.23.
//

import SwiftUI

@available(iOS 15.0, *)
extension TwoWaySlider {
    func frame(height: CGFloat) -> TwoWaySlider {
        var view = self
        view.height = height
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
}