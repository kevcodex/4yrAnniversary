//
//  TimeCounter.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//


import UIKit

protocol TimeKeeper {
  var now: Date { get }
}

struct RealTime: TimeKeeper {
  var now: Date {
    return Date()
  }
}

struct TimeCounter {
  
  private var eventTime: TimeInterval
  private var startTime: Date?
  
  ///The amount of time that has passed
  private var accumulated: TimeInterval = 0
  
  internal var timeKeeper: TimeKeeper
  
  //default timekeeper is now
  //need to set a inital time
  init(eventTime: TimeInterval, timeKeeper: TimeKeeper = RealTime() ) {
    self.eventTime = eventTime
    self.timeKeeper = timeKeeper
  }
  
  
  var isRunning: Bool {
    return startTime != nil
  }
  
  var didFinish: Bool = false {
    
    didSet {
      
      //prevents repeating same action
      guard oldValue != didFinish else { return }
      
      if didFinish {
        accumulated = elapsed
        startTime = nil
        
      }
      
    }
    
    
  }
  
  var currentTimeLeft: TimeInterval {
    
    return eventTime - elapsed
  }
  
  private var elapsed: TimeInterval {
    return round(accumulated + (startTime.map { timeKeeper.now.timeIntervalSince($0) } ?? 0))
  }
  
  
  mutating func start() {
    startTime = timeKeeper.now
  }
  

  mutating func reset(newTime: TimeInterval) {
    accumulated = 0
    startTime = timeKeeper.now
    eventTime = newTime
  }
}

