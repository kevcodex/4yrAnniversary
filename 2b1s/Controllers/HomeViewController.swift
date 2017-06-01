//
//  HomeViewController.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit
import FontAwesome_swift

class HomeViewController: UIViewController {
  
  @IBOutlet weak var RatingsSlider: UISlider!
  @IBOutlet weak var ratingsLabel: UILabel!
  
  @IBOutlet weak var timeTillNextLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var timeCounter: TimeCounter!
  fileprivate var updateTimer: Timer?
  
  // reference to tab bar controller
  fileprivate var rootController: TabBarViewController {
    return parent as! TabBarViewController
  }
  
  var currentEvent: Event! {
    didSet {
      titleLabel.text = currentEvent.name
      imageView.image = UIImage(named: currentEvent.photoName)
      RatingsSlider.value = Float(currentEvent.rating)
      ratingsLabel.text = String(RatingsSlider.value.rounded())
      
      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    tabBarItem.image = UIImage.fontAwesomeIcon(name: .home, textColor: .black, size: CGSize(width: 40, height: 40))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    updateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeUI(timer:)), userInfo: nil, repeats: true)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let allEvents = rootController.eventFetchedResultsController.fetchedObjects
    
    let filteredEvents = allEvents?.filter { $0.time > Date().timeIntervalSince1970 }
    
    
    if let currentEvent = filteredEvents?.first {
      
      self.currentEvent = currentEvent
      
    }
    
    if filteredEvents!.count > 1 {
      if let nextEvent = filteredEvents?[1] {
        let eventDate = Date(timeIntervalSince1970: nextEvent.time)
        let timeUntil =  eventDate.timeIntervalSinceNow
        
        
        timeCounter = TimeCounter(eventTime: timeUntil)
        timeCounter.start()
        
      }

    } else {
      updateTimer?.invalidate()
      updateTimer = nil
      
      timeTillNextLabel.text = "No More Events"
    }

  }
  
}

//MARK: - Actions
extension HomeViewController {
  
  @IBAction func RatingsValueChanged(_ sender: UISlider) {
    
    let roundedValue = sender.value.rounded()
    
    RatingsSlider.setValue(roundedValue, animated: true)
    ratingsLabel.text = String(roundedValue)
    
    currentEvent.rating = Int16(roundedValue)
    
  }
}

// MARK: - UI Updating

extension HomeViewController {
  
  func updateTimeUI(timer: Timer) {
    
    let currentTimeLeft = timeCounter.currentTimeLeft
    
    timeTillNextLabel.text = String(timeInterval: currentTimeLeft)
    
    
    //the time isn't exactly whole number
    if currentTimeLeft < 0.0 {
      

      let allEvents = rootController.eventFetchedResultsController.fetchedObjects
      let filteredEvents = allEvents?.filter { $0.time > Date().timeIntervalSince1970 }
      
      if let currentEvent = filteredEvents?.first {
      
        self.currentEvent = currentEvent
        
        
      }
      
      if filteredEvents!.count > 1 {
        if let nextEvent = filteredEvents?[1] {
          let eventDate = Date(timeIntervalSince1970: nextEvent.time)
          let timeUntil =  eventDate.timeIntervalSinceNow
          
          timeCounter.reset(newTime: timeUntil)
          
        }
      } else {
        updateTimer?.invalidate()
        updateTimer = nil
        
        timeTillNextLabel.text = "No More Events"
      }
      
    }
  }
  
  func updateEvent (event: Event) {
    
    self.currentEvent = event
    
    
    RatingsSlider.setValue(Float(event.rating), animated: true)
    ratingsLabel.text = String(event.rating)
    
  }
}
