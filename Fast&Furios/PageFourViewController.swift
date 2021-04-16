//
//  PageFourViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageFourViewController: UIViewController {
    @IBOutlet weak var cb1: CheckBox!
    @IBOutlet weak var cb2: CheckBox!
    @IBOutlet weak var cb3: CheckBox!
    @IBOutlet weak var cb4: CheckBox!
    @IBAction func onCb1Checked(_ sender: Any) {
        cb1.isChecked = true
        cb2.isChecked = false
        cb3.isChecked = false
        cb4.isChecked = false
    }
    @IBAction func onCb2Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = true
        cb3.isChecked = false
        cb4.isChecked = false
    }
    @IBAction func onCb3Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = false
        cb3.isChecked = true
        cb4.isChecked = false
    }
    @IBAction func onCb4Checked(_ sender: Any) {
        cb1.isChecked = false
        cb2.isChecked = false
        cb3.isChecked = false
        cb4.isChecked = true
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
            self.performSegue(withIdentifier: "showPageFive", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "oneflare-ic"))
        cb1.borderStyle = .rounded
        cb2.borderStyle = .rounded
        cb3.borderStyle = .rounded
        cb4.borderStyle = .rounded
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
