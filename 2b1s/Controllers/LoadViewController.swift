//
//  LoadViewController.swift
//  2b1s
//
//  Created by Kirby on 5/29/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

  @IBOutlet weak var animationView: UIView!
  @IBOutlet weak var beginButton: CustomButton!

  fileprivate var timer: Timer?
  fileprivate var count = 0

  // physics stuff
  fileprivate lazy var animator: UIDynamicAnimator = {

    let lazyDynamicAnimator = UIDynamicAnimator(referenceView: self.animationView)
    return lazyDynamicAnimator
  }()

  lazy var bubbleBehavior: BubbleBehavior = {
    let lazyBubbleBehavior = BubbleBehavior()
    self.animator.addBehavior(lazyBubbleBehavior)
    lazyBubbleBehavior.collider.collisionDelegate = self
    return lazyBubbleBehavior
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupButtonBehavior()

    timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(makeBubble), userInfo: nil, repeats: true)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    timer?.invalidate()
    timer = nil
  }
}

// MARK: - Bubble Creation
extension LoadViewController {

  func setupButtonBehavior() {

    bubbleBehavior.addViewToCollider(beginButton)

    let snap = UISnapBehavior(item: beginButton, snapTo: beginButton.center)
    snap.damping = 0.0
    animator.addBehavior(snap)
  }

  func makeBubble() {

    if count >= 13 {
      timer?.invalidate()
      timer = nil
    }

    count += 1

    let randomX = (10 ... Int(animationView.bounds.width - 10)).random
    let frame = CGRect(origin: CGPoint(x: randomX, y: 10), size: CGSize(width: 50.0, height: 50.0))

    let bubbleView = BubbleView(frame: frame, imageNamed: "BI_\(count)")
    bubbleView.contentMode = .scaleAspectFill

    animationView.addSubview(bubbleView)
    bubbleBehavior.addBubble(bubbleView)
  }
}

// MARK: Actions
extension LoadViewController {

  @IBAction func beginTapped(_ sender: Any) {

    //    if let pageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
    //
    //      let transition = CATransition()
    //      transition.duration = 0.5
    //      transition.type = kCATransitionPush
    //      transition.subtype = kCATransitionFromBottom
    //
    //      view.window!.layer.add(transition, forKey: kCATransition)
    //      present(pageVC, animated: false, completion: nil)
    //
    //    }

    // performSegue(withIdentifier: "ShowPage", sender: nil)
  }
}

extension LoadViewController: UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate {
}
