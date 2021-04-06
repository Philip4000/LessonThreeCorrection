//
//  MyProfileViewController.swift
//  LessonThreeCorrection
//
//  Created by Philip Noskov on 04.04.2021.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName
        
        fullName.text = user.person.fullName
        ageLabel.text = user.person.age
        regionLabel.text = user.person.region
        cityLabel.text = user.person.city
        phoneLabel.text = user.person.phoneNumber
        
    }

}
