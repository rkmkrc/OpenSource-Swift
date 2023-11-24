//
//  WheellChart.swift
//  Chart
//
//  
//

import Foundation
import UIKit

class WheellChart: UIView {
    var sectionPercentages: [CGFloat] = []
    var sectionSpacing: CGFloat = 0.02 // Adjust this value to control the spacing
    var startAngle: CGFloat = .pi // Fixed start angle
    var borderLineWidth: CGFloat = 2.0 // Adjust this value for the border width
    var borderColor: UIColor = .black // Adjust this value for the border color
    var score: Int = -1
    var numberOfColoredSections: Int = -1
    var leftInterval: Int = 0
    var rightInterval: Int = 25
    var leftIntervalLabel: UILabel = UILabel()
    var rightIntervalLabel: UILabel = UILabel()
    var textLabel: UILabel = UILabel()
    var scoreLabel: UILabel = UILabel()
    var chartDescriptionLabel: String = "Label"
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Center of the circle according to its parent view.
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // This is the radius of the circle placed the most behind.
        let radius = min(bounds.width, bounds.height) / 2.5
        
        // Adjust this to control the size of the hole, this is basically the radius of the white hole at the center.
        let holeRadius = radius * 0.7
        
        // Do not change this, this is a mathematical arrangement in order to seperate sections perfectly.
        for (index, percentage) in sectionPercentages.enumerated() {
            sectionPercentages[index] = percentage + sectionSpacing / CGFloat(sectionPercentages.count)
        }
        
        for (index, percentage) in sectionPercentages.enumerated() {
            
            var endAngle = startAngle + .pi * (percentage - sectionSpacing) // Adjusted for spacing
            
            // Check if this is the last element to make end angle as 0 (Right bottom like the Unit Circle).
            if index == sectionPercentages.count - 1 {
                endAngle = 0
            }
            
            ///-----------------------------------------Behind Circle on the Layer----------------------------------------
            // Outer path
            let outerPath = UIBezierPath()
            outerPath.move(to: center)
            outerPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            outerPath.close()
            
            // Set the color for the section
            let sectionColor: UIColor
            if index < numberOfColoredSections {
                sectionColor = UIColor(hue: startAngle / (.pi * 2), saturation: 0.9, brightness: 1, alpha: 1)
            } else {
                sectionColor = UIColor.white
            }
            sectionColor.setFill()
            
            // Set the border (stroke) for the section
            borderColor.setStroke()
            outerPath.lineWidth = borderLineWidth
            outerPath.stroke()
            
            // Created a CAShapeLayer to represent the filled path
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = outerPath.cgPath
            shapeLayer.fillColor = sectionColor.cgColor
            shapeLayer.opacity = 1
            
            // Add the CAShapeLayer to your view's layer
            self.layer.addSublayer(shapeLayer)
            
            // Create a CABasicAnimation to animate the opacity
            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = 0
            opacityAnimation.toValue = 1
            
            // Adjust the duration as needed
            opacityAnimation.duration = 1.0
            
            // Add the animation to the CAShapeLayer
            shapeLayer.add(opacityAnimation, forKey: "opacityAnimation")
            
            ////-----------------------------------------Middle Circle on the Layer----------------------------------------
            // Inner path
            let innerPath = UIBezierPath()
            innerPath.move(to: center)
            innerPath.addArc(withCenter: center, radius: holeRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            innerPath.close()
            
            // Fill the inner path with white
            UIColor.white.setFill()
            innerPath.fill()
            
            borderColor.setStroke()
            innerPath.lineWidth = borderLineWidth
            innerPath.stroke()
            
            let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = innerPath.cgPath
            shapeLayer2.fillColor = borderColor.cgColor
            shapeLayer2.opacity = 1
            
            // Add the CAShapeLayer to your view's layer
            self.layer.addSublayer(shapeLayer2)
            
            // Create a CABasicAnimation to animate the opacity
            let opacityAnimation2 = CABasicAnimation(keyPath: "opacity")
            opacityAnimation2.fromValue = 0
            opacityAnimation2.toValue = 1
            opacityAnimation2.duration = 1.0 // Adjust the duration as needed
            
            // Add the animation to the CAShapeLayer
            shapeLayer2.add(opacityAnimation2, forKey: "opacityAnimation2")
            
            ////-----------------------------------------Front Circle on the Layer----------------------------------------
            // Inner path 2
            let innerPath2 = UIBezierPath()
            innerPath2.move(to: center)
            innerPath2.addArc(withCenter: center, radius: holeRadius - borderLineWidth * 0.6, startAngle: startAngle - borderLineWidth, endAngle: endAngle + borderLineWidth, clockwise: true)
            innerPath2.close()
            
            // Fill the inner path with white
            UIColor.white.setFill()
            innerPath2.fill()
            
            UIColor.white.setStroke()
            innerPath2.lineWidth = borderLineWidth
            innerPath2.stroke()
            
            let shapeLayer3 = CAShapeLayer()
            shapeLayer3.path = innerPath2.cgPath
            shapeLayer3.fillColor = UIColor.white.cgColor
            shapeLayer3.opacity = 1
            
            // Add the CAShapeLayer to your view's layer
            self.layer.addSublayer(shapeLayer3)
            
            // Create a CABasicAnimation to animate the opacity
            let opacityAnimation3 = CABasicAnimation(keyPath: "opacity")
            opacityAnimation3.fromValue = 0
            opacityAnimation3.toValue = 1
            opacityAnimation3.duration = 1.0 // Adjust the duration as needed
            
            // Add the animation to the CAShapeLayer
            shapeLayer.add(opacityAnimation3, forKey: "opacityAnimation3")
            
            // Updating start angle to start next section from there
            startAngle = endAngle + .pi * sectionSpacing
        }
        
        // Add a white filled circle to hide the center point
        let whiteCircle = UIBezierPath(arcCenter: center, radius: holeRadius - borderLineWidth, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.white.setFill()
        whiteCircle.fill()
        
        ////-------------------------Left Interval Label--------------------------------
        leftIntervalLabel.textAlignment = .center
        leftIntervalLabel.textColor = .black
        leftIntervalLabel.font = UIFont.boldSystemFont(ofSize: 20)
        leftIntervalLabel.text = "\(leftInterval)"
        
        // Calculate the position for the score label
        let labelXleftIntervalLabel = center.x - 2.35 * radius
        leftIntervalLabel.frame = CGRect(x: labelXleftIntervalLabel, y: center.y - 15, width: bounds.width, height: 20) // Adjust frame as needed
        addSubview(leftIntervalLabel)
        
        ////-------------------------Right Interval Label--------------------------------
        rightIntervalLabel.textAlignment = .center
        rightIntervalLabel.textColor = .black
        rightIntervalLabel.font = UIFont.boldSystemFont(ofSize: 20)
        rightIntervalLabel.text = "\(rightInterval)"
        
        // Calculate the position for the score label
        let labelXRightIntervalLabel = center.x - radius * 0.11
        rightIntervalLabel.frame = CGRect(x: labelXRightIntervalLabel, y: center.y - 15, width: bounds.width, height: 20)
        addSubview(rightIntervalLabel)
        
        ///-------------------------Score Label--------------------------------
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 90)
        scoreLabel.text = "\(score)"
        
        // Calculate the position for the score label
        let labelYScore = center.y - 85
        scoreLabel.frame = CGRect(x: 0, y: labelYScore, width: bounds.width, height: 100)
        addSubview(scoreLabel)
        
        ////-------------------------Chart Description Label--------------------------------
        textLabel.textAlignment = .center
        textLabel.textColor = .black
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.text = "\(chartDescriptionLabel)"
        
        // Calculate the position for the chart description label
        let labelYText = center.y + 20
        textLabel.frame = CGRect(x: 0, y: labelYText, width: bounds.width, height: 20)
        addSubview(textLabel)
    }
}



