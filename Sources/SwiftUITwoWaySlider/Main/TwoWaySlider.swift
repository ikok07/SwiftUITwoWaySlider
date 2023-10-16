// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 15.0, *)
public struct TwoWaySlider: View {
    
    @Binding var leftVal: Double
    @Binding var rightVal: Double
    
    @State private var leftSelPosition: CGPoint = .zero
    @State private var initialLeftSelDragOffset: CGSize = .zero
    @State private var leftValPercentage: Double = 0.0
    
    @State private var rightSelPosition: CGPoint = .zero
    @State private var initialRightSelDragOffset: CGSize = .zero
    @State private var rightValPercentage: Double = 0.0
    
    
    let range: ClosedRange<Double>
    
    var bg: Color = .gray.opacity(0.5)
    var activeColor: Color = .accentColor
    
    var cornerRadius: CGFloat = 2
    var height: CGFloat = 4
    var containerHeight: CGFloat = 50
    
    var selectorWidth: CGFloat = 25
    
    func calculateMinValPercentage(for val: Double) -> Double {
        return val / range.upperBound
    }
    
    public init(leftVal: Binding<Double>, rightVal: Binding<Double>, range: ClosedRange<Double>) {
        self._leftVal = leftVal
        self._rightVal = rightVal
        self.range = range
    }

    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(bg)
                        .frame(height: height)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(activeColor)
                        .frame(width: (geometry.size.width * rightValPercentage - geometry.size.width * leftValPercentage) + selectorWidth, height: height)
                        .position(x: (geometry.size.width * leftValPercentage) + (geometry.size.width * rightValPercentage - geometry.size.width * leftValPercentage) / 2, y: geometry.size.height / 2)
                    
                    SliderSelector(color: .white, width: selectorWidth)
                        .border(.accentColor, width: 4)
                        .position(leftSelPosition)
                        .gesture (
                            DragGesture()
                                .onChanged { gesture in
                                    let initialPosition = CGPoint(x: leftSelPosition.x - initialLeftSelDragOffset.width, y: geometry.size.height / 2)
                                    let newPosition = CGPoint(x: initialPosition.x + gesture.translation.width, y: geometry.size.height / 2)
                                    leftSelPosition = CGPoint(x: max(0, min(geometry.size.width * rightValPercentage - selectorWidth, newPosition.x)), y: newPosition.y)
                                    leftValPercentage = leftSelPosition.x / geometry.size.width
                                    print(leftValPercentage)
                                    
                                    initialLeftSelDragOffset = CGSize(width: gesture.translation.width, height: 0)
                                }
                                .onEnded({ gesture in
                                    initialLeftSelDragOffset = .zero
                                })
                        )
                    
                    SliderSelector(color: .white, width: selectorWidth)
                        .border(.accentColor, width: 4)
                        .position(rightSelPosition)
                        .gesture (
                            DragGesture()
                                .onChanged { gesture in
                                    let initialPosition = CGPoint(x: rightSelPosition.x - initialRightSelDragOffset.width, y: geometry.size.height / 2)
                                    let newPosition = CGPoint(x: initialPosition.x + gesture.translation.width, y: geometry.size.height / 2)
                                    rightSelPosition = CGPoint(x: min(max(geometry.size.width * leftValPercentage + selectorWidth, newPosition.x), geometry.size.width), y: newPosition.y)
                                    rightValPercentage = rightSelPosition.x / geometry.size.width
                                 
                                    initialRightSelDragOffset = CGSize(width: gesture.translation.width, height: 0)
                                }
                                .onEnded({ gesture in
                                    initialRightSelDragOffset = .zero
                                })
                        )
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .onAppear {
                    leftValPercentage = calculateMinValPercentage(for: leftVal)
                    leftSelPosition = CGPoint(x: geometry.size.width * leftValPercentage, y: geometry.size.height / 2)
                    
                    rightValPercentage = calculateMinValPercentage(for: rightVal)
                    rightSelPosition = CGPoint(x: geometry.size.width * rightValPercentage, y: geometry.size.height / 2)
                }
                .onChange(of: [leftValPercentage, rightValPercentage]) { newValue in
                    leftVal = newValue[0] * range.upperBound
                    rightVal = newValue[1] * range.upperBound
                }
            }
        }
        .frame(height: containerHeight)
    }
}



@available(iOS 15.0, *)
#Preview {
    TwoWaySlider(leftVal: .constant(45), rightVal: .constant(95), range: 0...100)
        .padding()
}
