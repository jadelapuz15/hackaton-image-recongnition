//
//  PageThreeViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageThreeViewController: UIViewController {
    @IBOutlet weak var cb1: CheckBox!
    
    @IBOutlet weak var cb2: CheckBox!
    override func viewDidLoad() {
        super.viewDidLoad()

        cb1.style = .circle
        cb2.style = .circle
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
