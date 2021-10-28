//
//  ChildViewController.swift
//  Views+Communication
//
//  Created by Alex Paul on 10/28/21.
//

import UIKit

class ChildViewController: UIViewController {

    private var ctaAction: () -> Void

    private var ctaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("CTA", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    init(ctaAction: @escaping () -> Void) {
        self.ctaAction = ctaAction
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCTAButtonConstraints()
    }

    private func setupCTAButtonConstraints() {
        view.addSubview(ctaButton)
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ctaButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            ctaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ctaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ctaButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func buttonPressed() {
        ctaAction()
    }

}
