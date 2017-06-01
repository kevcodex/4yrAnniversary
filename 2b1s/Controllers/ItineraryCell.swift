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
  
  var event: Event! {
    didSet {
      titleLabel.text = event.name
      sampleImage.image = UIImage(named: event.photoName)
      
      let eventDate = Date(timeIntervalSince1970: event.time)
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM d, h:mm a"
      dateFormatter.amSymbol = "AM"
      dateFormatter.pmSymbol = "PM"
      
      let eventString = dateFormatter.string(from: eventDate)
      timeLabel.text = eventString
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = .clear
  }
}
