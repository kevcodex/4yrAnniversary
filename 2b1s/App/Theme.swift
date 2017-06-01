//
//  Theme.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//


import UIKit


protocol ThemeProtocol {
  var errorColor: UIColor { get }
  
  
  
  func install()
}


struct DefaultTheme: ThemeProtocol {
  
  var errorColor: UIColor {
    return .red
  }
  
  func install() {
    
    //    let navigationBarAppearance = UINavigationBar.appearance()
    //
    //    navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    //    navigationBarAppearance.barTintColor = UIColor(hexCode: "#2980b9")!
    //    navigationBarAppearance.tintColor = UIColor(hexCode: "#ffffff")!
    //
    UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    
    let pageControlAppearance = UIPageControl.appearance()
    pageControlAppearance.pageIndicatorTintColor = .red
    pageControlAppearance.backgroundColor = .clear
    
  }
}

struct Theme {
  static var current: ThemeProtocol! {
    didSet {
      current.install()
    }
  }
}
