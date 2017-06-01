//
//  RoundedView.swift
//  2b1s
//
//  Created by Kirby on 6/1/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {

  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
}
