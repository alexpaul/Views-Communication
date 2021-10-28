//
//  ViewController.swift
//  Views+Communication
//
//  Created by Alex Paul on 10/28/21.
//

import UIKit

class MainViewController: UIViewController {

    private var embeddedVC: ChildViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC()
    }

    func addChildVC() {
        // use a closure to communicate data
        embeddedVC = ChildViewController(ctaAction: {
            print("CTA button pressed.")
        })
        addChild(embeddedVC)
        embeddedVC.view.frame = CGRect(x: 0,
                                       y: view.bounds.height - 400,
                                       width: view.bounds.width,
                                       height: view.bounds.height - 88)
        view.addSubview(embeddedVC.view)
        embeddedVC.didMove(toParent: self)
    }

    func removeChildVC() {
        willMove(toParent: nil)
        embeddedVC.view.removeFromSuperview()
        removeFromParent()
    }
}

