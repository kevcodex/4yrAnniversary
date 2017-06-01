//
//  FadeSegue.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class FadeSegue: UIStoryboardSegue {
  
  override func perform() {
    
    guard let firstVCView = self.source.view,
      let secondVCView = self.destination.view else {
        return
    }
    
  
    secondVCView.alpha = 0.0
    
    let window = UIApplication.shared.keyWindow
    window?.insertSubview(secondVCView, aboveSubview: firstVCView)
    
    //fade
    UIView.animate(withDuration: 0.4, animations: { () -> Void in

      
      firstVCView.alpha = 0.0
      secondVCView.alpha = 1.0
      
    }, completion: { (Finished) -> Void in
      self.source.present(self.destination as UIViewController,
                          animated: false,
                          completion: nil)
    })
  }
  
}
