//
//  ViewController.swift
//  Views+Communication
//
//  Created by Alex Paul on 10/28/21.
//

import UIKit

class MainViewController: UIViewController {

    private var showButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show CTA", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(addChildVC), for: .touchUpInside)
        return button
    }()

    private var messageLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var embeddedVC: ChildViewController!

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        showButtonConstraints()
        messageLabelConstraints()
    }

    private func showButtonConstraints() {
        view.addSubview(showButton)
        showButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            showButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func messageLabelConstraints() {
        view.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: showButton.bottomAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        ])
    }

    @objc private func addChildVC() {
        showButton.isEnabled = false
        showButton.backgroundColor = .black.withAlphaComponent(0.5)

        messageLabel.text = ""

        // use a closure to communicate data
        embeddedVC = ChildViewController(ctaAction: { [weak self] in
            guard let self = self else { return }
            self.showButton.isEnabled = true
            self.showButton.backgroundColor = .black
            self.messageLabel.text = "CTA button pressed."
            self.removeChildVC()
        })
        addChild(embeddedVC)
        embeddedVC.view.frame = CGRect(x: 0,
                                       y: view.bounds.height - 400,
                                       width: view.bounds.width,
                                       height: view.bounds.height - 88)
        view.addSubview(embeddedVC.view)
        embeddedVC.didMove(toParent: self)
    }

    private func removeChildVC() {
        willMove(toParent: nil)
        embeddedVC.view.removeFromSuperview()
        removeFromParent()
    }
}

