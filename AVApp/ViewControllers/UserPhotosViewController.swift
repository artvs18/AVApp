//
//  BulldogViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 06.10.2022.
//

import UIKit

class UserPhotosViewController: UIViewController {
    
    @IBOutlet var userPhotos: [UIImageView]!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .gray, .red, .black)
        var photoNumber = 2
        userPhotos.forEach {
            $0.image = UIImage(named: user.person.photos[photoNumber])
            photoNumber += 1
        }
    }
}
