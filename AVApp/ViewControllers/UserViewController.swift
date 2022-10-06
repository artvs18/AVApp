//
//  UserViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 05.10.2022.
//

import UIKit

class UserViewController: UIViewController  {

    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .darkGray, .black)
        title = user.person.fullName
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        birthdayLabel.text = user.person.birthday
        userImage.image = UIImage(named: user.person.photos[0])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userBioVC = segue.destination as? UserBioViewController else {
            return
        }
        userBioVC.user = user
    }
}
