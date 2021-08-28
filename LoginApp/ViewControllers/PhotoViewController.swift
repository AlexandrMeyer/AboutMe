//
//  PhotoViewController.swift
//  LoginApp
//
//  Created by Александр on 27.08.21.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var firstPhoto: UIImageView!
    @IBOutlet var secondPhoto: UIImageView!
    
    var firstImage = ""
    var secondImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPhoto.image = UIImage(named: firstImage)
        secondPhoto.image = UIImage(named: secondImage)
        navigationItem.title = User.getUsernfo().person.fullName
    }
}
