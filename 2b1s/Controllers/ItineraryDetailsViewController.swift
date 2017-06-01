//
//  ItineraryDetailsViewController.swift
//  2b1s
//
//  Created by Kirby on 6/1/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit
import CoreData

class ItineraryDetailsViewController: UIViewController {

  var event: Event!

  @IBOutlet weak var RatingsSlider: UISlider!
  @IBOutlet weak var ratingsLabel: UILabel!

  @IBOutlet weak var timeTillNextLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()

    titleLabel.text = event.name
    imageView.image = UIImage(named: event.photoName)
    RatingsSlider.value = Float(event.rating)
    ratingsLabel.text = String(RatingsSlider.value.rounded())

    let eventDate = Date(timeIntervalSince1970: event.time)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, h:mm a"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"

    let eventString = dateFormatter.string(from: eventDate)
    timeTillNextLabel.text = eventString

    // Do any additional setup after loading the view.
  }
}

// MARK: - Actions
extension ItineraryDetailsViewController {

  @IBAction func RatingsValueChanged(_ sender: UISlider) {

    let roundedValue = sender.value.rounded()

    RatingsSlider.setValue(roundedValue, animated: true)
    ratingsLabel.text = String(roundedValue)
  }

  @IBAction func doneTapped(_ sender: Any) {

    event.rating = Int16(RatingsSlider.value)

    dismiss(animated: true, completion: nil)
  }
}
