//
//  PageViewController.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  
  
  private(set) lazy var splashViewControllers: [UIViewController] = {
    
    return [
      self.addViewController(named: "FirstViewController"),
      self.addViewController(named: "SecondViewController"),
      self.addViewController(named: "ThirdViewController"),
      self.addViewController(named: "FourthViewController"),
      self.addViewController(named: "LastViewController")
    ]
    
  }()
  
  //workaround for black bar
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    for view in self.view.subviews {
      if view is UIScrollView {
        view.frame = UIScreen.main.bounds
      } else if view is UIPageControl {
        view.backgroundColor = .clear
      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = self
    
    
    
    if let firstViewController = splashViewControllers.first {
      setViewControllers([firstViewController],
                         direction: .forward,
                         animated: false,
                         completion: nil)
    }
  }
  
}


// MARK: - Page controller data source
extension PageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let viewControllerIndex = splashViewControllers.index(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0 else {
      return nil
    }
    
    guard splashViewControllers.count > previousIndex else {
      return nil
    }
    
    return splashViewControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let viewControllerIndex = splashViewControllers.index(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    let orderedViewControllersCount = splashViewControllers.count
    
    guard orderedViewControllersCount != nextIndex else {
      return nil
    }
    
    guard orderedViewControllersCount > nextIndex else {
      return nil
    }
    
    return splashViewControllers[nextIndex]
  }
  
  // MARK: - UIPageControl
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return splashViewControllers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
      let firstViewControllerIndex = splashViewControllers.index(of: firstViewController) else {
        return 0
    }
    
    return firstViewControllerIndex
  }
}

// MARK: - Add view controllers to array
extension PageViewController {
  
  fileprivate func addViewController(named: String) -> UIViewController {
    
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: named)
  }
}

