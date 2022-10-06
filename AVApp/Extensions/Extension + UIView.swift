//
//  Extension + UIView.swift
//  AVApp
//
//  Created by Artemy Volkov on 06.10.2022.
//

import UIKit

extension UIView {
    func setGradient(with colours: UIColor...) {
        let cgColours: [CGColor] = colours.map { $0.cgColor }
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = cgColours
        layer.insertSublayer(gradient, at: 0)
    }
}
