//
//  WelcomeViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 04.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var welcomeImage: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .gray, .systemYellow, .black)
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
        welcomeImage.image = UIImage(named: user.person.photos[1])
    }
}



