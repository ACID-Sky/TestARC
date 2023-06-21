//
//  ViewController.swift
//  Test ARC
//
//  Created by Лёха Небесный on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    let viewModel: FirstViewModel
    

    init(viewModel: FirstViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    deinit{
        print("⭐️ ViewController")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.setupButton()
        self.bindViewModel()
    }


    private func setupButton() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.setTitle("Push to second screen", for: .normal)
        self.button.setTitleColor(.blue, for: .normal)
        self.button.addTarget(self, action:  #selector(buttonDidTap), for: .touchUpInside)

        self.view.addSubview(self.button)

        NSLayoutConstraint.activate([
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    private func bindViewModel() {
        viewModel.onStateDidChange = { state in
            switch state {

            case .initial:
                return
            case .secondViewController:
                let viewModel = SecondViewModel()
                let vc = SecondViewController(viewModel: viewModel)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    @objc private func buttonDidTap(){
        self.viewModel.updateState(toSecondVC: true)
    }
}

