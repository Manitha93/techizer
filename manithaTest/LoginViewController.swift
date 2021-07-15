//
//  ViewController.swift
//  manithaTest
//
//  Created by Arvind Kant on 15/07/21.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTxt : UITextField!
    @IBOutlet weak var pwdTxt : UITextField!
    @IBOutlet weak var msglbl :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pwdTxt.delegate = self
        // Do any additional setup after loading the view.
        print(usernameTxt.text ?? "USERNAME")
        print(pwdTxt.text ?? "PWD" )
    }

    @IBAction func submitClick(_ sender:UIButton!) {

        if usernameTxt.text != "" && pwdTxt.text != "" {
                        self.msglbl.text = "You have logged in";

  
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "TrendingViewController")
            self.navigationController?.pushViewController(vc,animated:true)

    }
        else
        {
            self.msglbl.text = "Enter Valid Details";
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
 




}

