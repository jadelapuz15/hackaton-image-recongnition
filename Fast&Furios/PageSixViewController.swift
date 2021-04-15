//
//  PageSixViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageSixViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    @IBAction func onRequestQuoteClicked(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.layer.borderWidth = 1.0;
        textField.layer.cornerRadius = 8.0;
        textField.layer.borderColor = UIColor.lightGray.cgColor;
        
        
        // Do any additional setup after loading the view.
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
