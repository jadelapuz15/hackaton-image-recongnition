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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cb1.style = .tick
        cb2.style = .tick
        cb3.style = .tick
        cb4.style = .tick

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
