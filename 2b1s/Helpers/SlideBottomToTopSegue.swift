//
//  SlideBottomToTopSegue.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class SlideBottomToTopSegue: UIStoryboardSegue {

  override func perform() {

    guard let firstVCView = self.source.view,
      let secondVCView = self.destination.view else {
      return
    }

    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    secondVCView.frame = CGRect(x: 0.0, y: -screenHeight, width: screenWidth, height: screenHeight)

    let window = UIApplication.shared.keyWindow
    window?.insertSubview(secondVCView, aboveSubview: firstVCView)

    // moves entire VC frame
    UIView.animate(withDuration: 0.4, animations: { () -> Void in
      firstVCView.frame = firstVCView.frame.offsetBy(dx: 0.0, dy: screenHeight)
      secondVCView.frame = secondVCView.frame.offsetBy(dx: 0.0, dy: screenHeight)

    }, completion: { (Finished) -> Void in
      self.source.present(self.destination as UIViewController,
                          animated: false,
                          completion: nil)
    })
  }
}
