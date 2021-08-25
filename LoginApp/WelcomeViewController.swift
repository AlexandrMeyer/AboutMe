//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Александр on 24.08.21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomLabel: UILabel!
    
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomLabel.text = "Welcome, \(label)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
