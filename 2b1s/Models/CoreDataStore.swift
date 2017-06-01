//
//  CoreDataStore.swift
//  OceanTemperature
//
//  Created by Kirby on 5/23/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore {

  var persistentContainer: NSPersistentContainer

  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  init(dataModel: String) {
    persistentContainer = NSPersistentContainer(name: dataModel)
    persistentContainer.loadPersistentStores { desc, error in
      if let error = error as NSError? {
        print("Persist container failed", error.localizedDescription)
      }
    }
  }

  func save() {
    guard context.hasChanges else {
      return
    }
    do {
      try context.save()
    } catch {
      print("Saving didn't work!", error)
    }
  }
}
