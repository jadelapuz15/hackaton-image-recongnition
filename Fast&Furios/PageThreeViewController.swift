//
//  PageThreeViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageThreeViewController: UIViewController {
    
    var car: Car!
    
    @IBOutlet weak var cb1: CheckBox!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var cb2: CheckBox!
    
    @IBAction func onCb1Checked(_ sender: Any) {
        cb1.isChecked = true
        cb2.isChecked = false
    }
    
    @IBAction func onCb2Checked(_ sender: Any) {
        
        cb1.isChecked = false
        cb2.isChecked = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cb1.style = .circle
        cb2.style = .circle
        cb1.borderStyle = .rounded
        cb2.borderStyle = .rounded
    }

}
