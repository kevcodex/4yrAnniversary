//
//  TabBarViewController.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.

// time interval
// Show the next event that is upcoming do via filter method like in ocean temp
// table view to show itinerary and upcoming events
// update ratings if changed on home page or event list
// show letter
// passcode letter if time

import UIKit
import CoreData

class TabBarViewController: UITabBarController {

  var events: [Event] = []

  // root controller gets store info
  var store = CoreDataStore(dataModel: "Datamodel")

  // fetched controller of the of the snap type
  // use this to get the objects in a controller
  var eventFetchedResultsController: NSFetchedResultsController<Event>!

  override func viewDidLoad() {
    super.viewDidLoad()

    let eventRequest: NSFetchRequest<Event> = Event.fetchRequest()
    eventRequest.sortDescriptors = [NSSortDescriptor(key: "order", ascending: true)]

    eventFetchedResultsController = NSFetchedResultsController(fetchRequest: eventRequest,
                                                               managedObjectContext: store.context,
                                                               sectionNameKeyPath: nil,
                                                               cacheName: nil)

    try? eventFetchedResultsController.performFetch()
    eventFetchedResultsController.delegate = self

    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    if launchedBefore {
      print("Not first launch.")
    } else {
      print("First launch, setting UserDefault.")
      UserDefaults.standard.set(true, forKey: "launchedBefore")

      loadItinerary()
    }

    // Do any additional setup after loading the view.
  }
}

extension TabBarViewController {
  fileprivate func loadItinerary() {

    let photo1 = "wakeup"
    let photo2 = "park"
    let photo3 = "picnic"
    let photo4 = "kite"
    let photo5 = "beautyAndBeast"
    let photo6 = "dinner"
    let photo7 = "cake"
    let photo8 = "present"
    // 1496592000
    // 1496599200
    _ = Event(context: store.context, name: "Wake Up!", photoName: photo1, time: 1_496_592_000, rating: 0, order: 0)
    _ = Event(context: store.context, name: "Go To Park", photoName: photo2, time: 1_496_599_200, rating: 0, order: 1)
    _ = Event(context: store.context, name: "Picnic", photoName: photo3, time: 1_496_602_800, rating: 0, order: 2)
    _ = Event(context: store.context, name: "Fly Kite", photoName: photo4, time: 1_496_606_400, rating: 0, order: 3)
    _ = Event(context: store.context, name: "B&B", photoName: photo5, time: 1_496_616_300, rating: 0, order: 4)
    _ = Event(context: store.context, name: "Dinner", photoName: photo6, time: 1_496_626_200, rating: 0, order: 5)
    _ = Event(context: store.context, name: "Cake", photoName: photo7, time: 1_496_631_600, rating: 0, order: 6)
    _ = Event(context: store.context, name: "Present", photoName: photo8, time: 1_496_635_200, rating: 0, order: 7)

    store.save()
  }
}

// MARK: - core data fetchresults controller
//these three are primary
extension TabBarViewController: NSFetchedResultsControllerDelegate {
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    return
  }

  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    return
  }

  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

    switch type {
    case .insert:
      print("ADDED")
      return
    case .delete:

      print("DELETED")
      return

    case .move:
      return

    case .update:
      print("UPDATED")
      store.save()

      if let homeVC = self.viewControllers?.first as? HomeViewController {
        if homeVC.isViewLoaded && selectedIndex != 0 {

          let updatedEvent = eventFetchedResultsController.object(at: indexPath!)

          if homeVC.currentEvent.order == updatedEvent.order {
            homeVC.updateEvent(event: updatedEvent)
          }
        }
      }
    }
  }
}
