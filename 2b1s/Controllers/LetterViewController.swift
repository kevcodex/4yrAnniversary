//
//  LetterViewController.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LetterViewController: UIViewController {

  override func awakeFromNib() {
    super.awakeFromNib()

    tabBarItem.image = UIImage.fontAwesomeIcon(name: .envelope, textColor: .black, size: CGSize(width: 40, height: 40))
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }
}
