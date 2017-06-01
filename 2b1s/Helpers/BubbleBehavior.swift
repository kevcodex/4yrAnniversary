//
//  BubbleBehavior.swift
//  2b1s
//
//  Created by Kirby on 5/31/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class BubbleBehavior: UIDynamicBehavior {

  
  lazy var gravity:UIGravityBehavior = {
    let lazyGravity = UIGravityBehavior()
    lazyGravity.magnitude = 1.0
    return lazyGravity
  }()
  
  lazy var elasticityBehavior:UIDynamicItemBehavior = {
    let lazyBehavior = UIDynamicItemBehavior()
    lazyBehavior.elasticity = 0.75
    lazyBehavior.allowsRotation = true
    lazyBehavior.friction = 0.0
    lazyBehavior.resistance = 0.0
    
    return lazyBehavior
  }()
  
  lazy var collider:UICollisionBehavior = {
    let lazyCollider = UICollisionBehavior()
    lazyCollider.translatesReferenceBoundsIntoBoundary = true
    return lazyCollider
  }()
  
  
  override init() {
    super.init()
    addChildBehavior(gravity)
    addChildBehavior(elasticityBehavior)
    addChildBehavior(collider)
  }
  
  func addViewToCollider(_ view: UIView){
    collider.addItem(view)
  }
  
  func addBubble(_ bubbleView:UIView){
    gravity.addItem(bubbleView)
    collider.addItem(bubbleView)
    elasticityBehavior.addItem(bubbleView)
  }


}
