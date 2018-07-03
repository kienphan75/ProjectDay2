//
//  ViewController.swift
//  TrainingExe2
//
//  Created by Trung Kien on 7/3/18.
//  Copyright © 2018 Trung Kien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSubmit(_ sender: Any) {
        if let email = tfEmail.text, let firstName = tfFirstName.text, let lastName = tfLastName.text, let phone = tfPhone.text {
            if email != "" && firstName != "" && lastName != "" && phone != "" {
                let alertControler = UIAlertController(title: "Thông báo", message: "Đăng kí thành công", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Oke", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                }
                alertControler.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    let sto = UIStoryboard(name: "Main", bundle: nil)
                    let controller2 = sto.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
                    controller2?.peopele = ["firstName":firstName,"lastName":lastName,"email":email,"phone":phone]
                    self.present(controller2!, animated: true, completion: nil)
                }))
                    
                present(alertControler, animated: true, completion: nil)
            }
            else{
                let alertControler = UIAlertController(title: "Thông báo", message: "Chưa nhập đủ đầu vào", preferredStyle: .alert)
                alertControler.addAction(UIAlertAction(title: "Oke", style: .default, handler: nil))
                present(alertControler, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    @IBAction func actionSubmitWithNavigation(_ sender: Any) {
        if let email = tfEmail.text, let firstName = tfFirstName.text, let lastName = tfLastName.text, let phone = tfPhone.text {
            if email != "" && firstName != "" && lastName != "" && phone != "" {
                let alertControler = UIAlertController(title: "Thông báo", message: "Đăng kí thành công", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Oke", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                }
                alertControler.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    let sto = UIStoryboard(name: "Main", bundle: nil)
                    let controller2 = sto.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
                    controller2?.peopele = ["firstName":firstName,"lastName":lastName,"email":email,"phone":phone]
                    self.navigationController?.pushViewController(controller2!, animated: true)
                }))
                
                present(alertControler, animated: true, completion: nil)
            }
            else{
                let alertControler = UIAlertController(title: "Thông báo", message: "Chưa nhập đủ đầu vào", preferredStyle: .alert)
                alertControler.addAction(UIAlertAction(title: "Oke", style: .default, handler: nil))
                present(alertControler, animated: true, completion: nil)
            }
            
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == tfEmail{
            if let email = tfEmail.text{
                if isValidEmail(testStr: email){
                    
                }
                else{
                    let alertControler = UIAlertController(title: "Thông báo", message: "Email định dạng sai", preferredStyle: .alert)
                    alertControler.addAction(UIAlertAction(title: "Oke", style: .default, handler: nil))
                    present(alertControler, animated: true, completion: nil)
                }
            }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    

}

