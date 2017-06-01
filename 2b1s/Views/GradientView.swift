//
//  GradientView.swift
//  2b1s
//
//  Created by Kirby on 5/29/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import Foundation
import UIKit

/// A simple view that has a gradient from top to bottom
@IBDesignable class GradientView: UIView {
  @IBInspectable var topColor: UIColor = UIColor.white
  @IBInspectable var bottomColor: UIColor = UIColor.black
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  
  override func layoutSubviews() {
    if let gradientLayer = layer as? CAGradientLayer {
      gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
    }
    
  }
  
//  override func draw(_ rect: CGRect) {
//    let context = UIGraphicsGetCurrentContext()
//    let colors = [topColor.cgColor, bottomColor.cgColor] as CFArray
//    
//    //3 - set up the color space
//    let colorSpace = CGColorSpaceCreateDeviceRGB()
//    
//    //4 - set up the color stops.. ranges from 0 to 1
//    let colorLocations:[CGFloat] = [0.0, 1.0]
//    
//    //5 - create the gradient
//    
//    
//    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: colorLocations)
//    
//    //6 - draw the gradient
//    let startPoint = CGPoint.zero
//    let endPoint = CGPoint(x:0, y:self.bounds.height)
//    context!.drawLinearGradient(gradient!,
//                                start: startPoint,
//                                end: endPoint,
//                                options: CGGradientDrawingOptions(rawValue: 0))
//  }
}
