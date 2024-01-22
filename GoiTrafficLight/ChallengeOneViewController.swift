//
//  ViewController.swift
//  GoiTrafficLight
//
//  Created by Guilherme Delfino on 19/12/23.
//

import UIKit

class ChallengeOneViewController: UIViewController {

    let challengeOneView = ChallengeOneView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func loadView() {
        view = challengeOneView
    }


}

