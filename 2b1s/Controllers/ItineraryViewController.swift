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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    print("APPEAR")
    tableView.reloadData()
  }
}

// MARK: - table view data source
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

    if event.time > 1_496_617_200 {
      //          if event.time > Date().timeIntervalSince1970  {

      cell.titleLabel.text = "???????"
      cell.sampleImage.image = UIImage.fontAwesomeIcon(name: .questionCircle, textColor: .gray, size: cell.sampleImage.bounds.size)
      cell.event = nil

    } else {
      cell.event = event
      cell.titleLabel.text = event.name
      cell.sampleImage.image = event.image ?? nil
    }

    let eventDate = Date(timeIntervalSince1970: event.time)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, h:mm a"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"

    let eventString = dateFormatter.string(from: eventDate)
    cell.timeLabel.text = eventString

    return cell
  }

  // select row

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let cell = tableView.cellForRow(at: indexPath) as! ItineraryCell

    if cell.event != nil {

      performSegue(withIdentifier: "showDetails", sender: cell)
    } else {

      showAlert()
    }
  }
}

// MARK: - Segue

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

// MARK: - Alerts

extension ItineraryViewController {
  func showAlert() {

    let alert = UIAlertController(title: "Hold it!", message: "Don't skip ahead, wait to be suprised!", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) { _ in
    }

    alert.addAction(action)

    present(alert, animated: true)
  }
}
