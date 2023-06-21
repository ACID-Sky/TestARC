//
//  FirstViewModel.swift
//  Test ARC
//
//  Created by Лёха Небесный on 21.06.2023.
//

import Foundation

final class FirstViewModel {
    enum State {
        case initial
        case secondViewController
    }

    var onStateDidChange: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }

    func updateState(toSecondVC: Bool) {
        self.state = toSecondVC ? .secondViewController : .initial
    }

    deinit{
        print("⭐️ FirstViewModel")
    }
}
