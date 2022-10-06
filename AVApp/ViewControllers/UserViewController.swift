//
//  UserViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 05.10.2022.
//

import UIKit

class UserViewController: UIViewController  {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    
    var name = ""
    var surname = ""
    var birthday = ""
    
    private let user = User.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: .gray, .black)
        nameLabel.text = name
        surnameLabel.text = surname
        birthdayLabel.text = birthday
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.title = "\(user.person.name) \(user.person.surname) Bio"
        moreInfoVC.bio = user.person.bio
    }
    //знаю что неправильно создавать еще один экземпляр модели, но по другому не получилось(
}
