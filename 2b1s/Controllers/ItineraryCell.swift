//
//  ItineraryCell.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class ItineraryCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var sampleImage: BubbleView!

  var event: Event?

  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = .clear
  }
}
