//
//  ItinerayViewController.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ItineraryViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  // reference to tab bar controller
  fileprivate var rootController: TabBarViewController {
    return parent as! TabBarViewController
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    tabBarItem.image = UIImage.fontAwesomeIcon(name: .list, textColor: .black, size: CGSize(width: 40, height: 40))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    // Do any additional setup after loading the view.
  }
  

}

//MARK: - table view data source
extension ItineraryViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let sectionInfo = rootController.eventFetchedResultsController.sections?[section] else {
      return 0
    }
    return sectionInfo.numberOfObjects
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItineraryCell", for: indexPath) as! ItineraryCell
    
    let event = rootController.eventFetchedResultsController.object(at: indexPath)
    
    cell.event = event
    
    return cell
  }
  
  // select row
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  

}

//MARK: - Segue

extension ItineraryViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let cell = sender as? ItineraryCell,
      let indexPath = tableView.indexPath(for: cell),
      let navigationController = segue.destination as? UINavigationController,
      let itineraryDetailsViewController = navigationController.topViewController as? ItineraryDetailsViewController
      else {
        return
    }
    
    let event = rootController.eventFetchedResultsController.object(at: indexPath)
    itineraryDetailsViewController.event = event
    
  }
}








