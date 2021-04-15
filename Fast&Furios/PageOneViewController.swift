//
//  PageOnViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageOneViewController: UIViewController {
    @IBOutlet weak var cb1: CheckBox!
    @IBOutlet weak var cb2: CheckBox!
    @IBOutlet weak var cb3: CheckBox!
    @IBOutlet weak var cb4: CheckBox!
    @IBOutlet weak var cb5: CheckBox!
    
    @IBAction func onCb1Checked(_ sender: Any) {
        cb1.isChecked = true
        cb2.isChecked = false
        cb3.isChecked = false
        cb4.isChecked = false
        cb5.isChecked = false
    }
    @IBAction func onCb2Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = true
        cb3.isChecked = false
        cb4.isChecked = false
        cb5.isChecked = false
    }
    @IBAction func onCb3Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = false
        cb3.isChecked = true
        cb4.isChecked = false
        cb5.isChecked = false
    }
    @IBAction func onCb4Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = false
        cb3.isChecked = false
        cb4.isChecked = true
        cb5.isChecked = false
    }
    @IBAction func onCb5Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = false
        cb3.isChecked = false
        cb4.isChecked = false
        cb5.isChecked = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cb1.style = .tick
        cb2.style = .tick
        cb3.style = .tick
        cb4.style = .tick
        cb5.style = .tick

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
