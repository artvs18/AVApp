//
//  UserBioViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 05.10.2022.
//

import UIKit

class UserBioViewController: UIViewController {

    @IBOutlet var userBioTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .darkGray, .black)
        title = "\(user.person.fullName) Bio"
        userBioTextView.text = user.person.bio
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userPhotosVC = segue.destination as? UserPhotosViewController else {
            return
        }
        userPhotosVC.user = user
    }
}
