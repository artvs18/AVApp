//
//  WelcomeViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 04.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var username =  ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .gray, .systemYellow, .black)
        welcomeLabel.text = "Welcome, \(username)!"
    }
}

extension UIView {
    func setGradient(with colours: UIColor...) {
        let cgColours: [CGColor] = colours.map { $0.cgColor }
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = cgColours
        layer.insertSublayer(gradient, at: 0)
    }
}

