//
//  WelcomeViewController.swift
//  LessonThreeCorrection
//
//  Created by Philip Noskov on 01.04.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = user.person.fullName
    }

}
