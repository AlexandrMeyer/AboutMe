//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by Александр on 27.08.21.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet var aboutMeLabel: UILabel!
    
    var aboutMe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = aboutMe
        navigationItem.title = User.getUsernfo().person.fullName
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        photoVC.firstImage = User.getUsernfo().person.photo[0]
        photoVC.secondImage = User.getUsernfo().person.photo[1]
        }
    }


