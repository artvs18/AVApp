//
//  MoreInfoViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 05.10.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var bio = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .gray, .black)
        bioLabel.text = bio
    }
}
