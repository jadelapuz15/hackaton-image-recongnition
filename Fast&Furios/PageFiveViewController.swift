//
//  PageFiveViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageFiveViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.backgroundColor = UIColor(rgb: 0x3D9EA0)
            nextButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "showPageSix", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
