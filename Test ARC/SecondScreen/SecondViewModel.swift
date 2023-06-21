//
//  SecondViewModel.swift
//  Test ARC
//
//  Created by Лёха Небесный on 21.06.2023.
//

import Foundation

final class SecondViewModel {
    enum State {
        case initial
        case firstViewController
    }

    var onStateDidChange: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }

    func updateState(toFirstVC: Bool) {
        self.state = toFirstVC ? .firstViewController : .initial
    }

    deinit{
        print("⭐️ SecondViewModel")
    }
}
