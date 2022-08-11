//
//  ViewController.swift
//  FaceRecognitionApp
//
//  Created by Gizem on 1.08.2022.
//

import UIKit
import LocalAuthentication //doğrulama için gerekli kütüphane

class ViewController: UIViewController {

  
    
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        let authContext = LAContext()
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you ?") { success, error in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toViewController", sender: nil)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                    self.myLabel.text = "error"
                    }
                }
            }
            
        }
    }
    
}

