//
//  ColoredCircleView.swift
//  MyWaste
//
//  Created by Марк Голубев on 27.02.2023.
//

import UIKit

class ColoredCircleView: UIView {
    
    var colors: [UIColor] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = bounds.width / 2
        let totalColors = CGFloat(colors.count)
        var startAngle: CGFloat = -.pi / 2
        for (index, color) in colors.enumerated() {
            let endAngle = startAngle + (.pi * 2 / totalColors)
            let arcPath = UIBezierPath()
            arcPath.move(to: center)
            arcPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            arcPath.close()
            color.setFill()
            arcPath.fill()
            startAngle = endAngle
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            if let color = backgroundColor {
                layer.borderColor = color.cgColor
                layer.borderWidth = 2
            } else {
                layer.borderColor = nil
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
