//
//  Event+CoreDataProperties.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import CoreData
import UIKit

extension Event {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
    return NSFetchRequest<Event>(entityName: "Event")
  }
  
  convenience init(context: NSManagedObjectContext, name: String, photoName: String, time: Double, rating: Int16, order: Int16) {
    self.init(context: context)
    
    self.name = name
    self.photoName = photoName
    self.time = time
    self.rating = rating
    self.order = order
  }
  
  @NSManaged public var name: String
  @NSManaged public var photoName: String
  @NSManaged public var time: Double
  @NSManaged public var rating: Int16
  @NSManaged public var order: Int16
}

