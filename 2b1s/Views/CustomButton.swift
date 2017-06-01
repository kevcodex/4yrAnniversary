//
//  CustomButton.swift
//  Project1_KevinChen
//
//  Created by Kirby on 4/29/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

  @IBInspectable var cornerRadius: CGFloat = 0 {

    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
}
