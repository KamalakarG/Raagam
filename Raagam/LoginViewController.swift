//
//  LoginViewController.swift
//  Raagam
//
//  Created by DEFTeam on 08/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var viCricleSignIn: UIView!
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var lblSignIn: UILabel!
    @IBOutlet weak var viSignIn: UIView!
    @IBOutlet weak var viSignUp: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!

    var keyboardHeight = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardListener()
        loadUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardListener()
    }
    
    override func keyboardWillShow(_ notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        keyboardHeight = Int(keyboardRectangle.height)
        scrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: ScreenSize.SCREEN_HEIGHT+CGFloat(keyboardHeight))
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        scrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: ScreenSize.SCREEN_HEIGHT-20)
    }
    
    func loadUI() {
        viCricleSignIn.layer.cornerRadius = 25
        viCricleSignIn.clipsToBounds = true
        viSignUp.cornerRadius(usingCorners: [.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        viSignIn.cornerRadius(usingCorners: [.topRight], cornerRadii: CGSize(width: 10, height: 10))
        lblSignUp.transform = CGAffineTransform(rotationAngle: -.pi/2)
        lblSignIn.transform = CGAffineTransform(rotationAngle: -.pi/2)
    }
    
}

extension LoginViewController {
    @IBAction func signUpTapped(sender: UIButton) {
        let signUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpController") as! SignUpController
        self.navigationController?.pushViewController(signUpView, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

