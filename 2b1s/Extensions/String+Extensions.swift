//
//  String+Extensions.swift
//  2b1s
//
//  Created by Kirby on 6/1/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import Foundation


extension String {
  /**
   initilizer to convert timeInterval to String
   
   - Important: This code is only for converting to hours, minutes, and seconds
   
   */
  init(timeInterval: TimeInterval) {
    
    let seconds = Int(timeInterval) % 60
    
    let minutes = Int(timeInterval) / 60 % 60
    
    let hours = Int(timeInterval) / 3600
    
    let formattedTime = String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    
    self = formattedTime
  }
}
