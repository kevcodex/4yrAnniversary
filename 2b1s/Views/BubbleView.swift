//
//  BubbleView.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

@IBDesignable
class BubbleView: UIImageView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
//  override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
//    return .ellipse
//  }
  
  
  
  // for custom physic paths
  //  override var collisionBoundingPath: UIBezierPath {
  //    return UIBezierPath(arcCenter: CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2), radius: CGFloat(bounds.size.width / 2), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
  //  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    clipsToBounds = true
    layer.cornerRadius = bounds.width / 2
    
  }
  
  ///A convenience init to set the frame and image of uiimageview
  convenience init(frame: CGRect, imageNamed: String) {
    self.init(frame: frame)
    
    self.image = UIImage(named: imageNamed)
  }
  
  
}
