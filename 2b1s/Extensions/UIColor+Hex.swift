//
//  UIColor+ Hex.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//


import UIKit


extension UIColor {
  
  convenience init?(hexCode: String) {
    
    
    //    guard hexCode.characters.count == 7 else {
    //      return nil
    //    }
    
    guard hexCode.characters.first! == "#" else {
      return nil
    }
    
    guard let value = Int(String(hexCode.characters.dropFirst()), radix: 16) else {
      return nil
    }
    
    let hex = String(hexCode.characters.dropFirst())
    
    switch hex.characters.count {
    case 3:
      self.init(hex3: value)
      
    case 6:
      
      self.init(hex6: value)
      
    default:
      self.init()
      return nil
    }
    
  }
  
  
  private convenience init?(hex3: Int) {
    
    
    //bit ugly but it works
    //My notes: shift hex to first then shift one place over and duplicate and add itself to first
    // e.g. for red #fff -> take f00 -> shift to 00f -> shift again to 0f0 -> add 00f -> resul 0ff
    let red = CGFloat(((hex3 & 0xf00) >> 8) << 4 + ((hex3 & 0xf00) >> 8)) / 255
    let green = CGFloat(((hex3 & 0x0f0) >> 4) << 4 + ((hex3 & 0x0f0) >> 4)) / 255
    let blue = CGFloat(((hex3 & 0x00f)) << 4 + (hex3 & 0x00f)) / 255
    
    self.init(red: red, green: green, blue: blue, alpha: 1)
    
    
    //print(((hex3 & 0xf00) >> 8) << 4 + ((hex3 & 0xf00) >> 8))
    
    //print((hex3 & 0xf00) >> 8  + ((hex3 & 0xf00) >> 8 ) << 4)
    
    
  }
  
  private convenience init?(hex6: Int) {
    
    let red = CGFloat(hex6 >> 16 & 0xff) / 255
    let green = CGFloat(hex6 >> 8 & 0xff) / 255
    let blue = CGFloat(hex6 & 0xff) / 255
    
    
    self.init(red: red, green: green, blue: blue, alpha: 1)
    
    
  }
  
  
}

