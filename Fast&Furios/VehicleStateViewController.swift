//
//  VehicleStateViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class VehicleStateViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton(shouldEnable: false)
        }
    }
    
    @IBOutlet weak var selectStateTextField: UITextField!
    
    @IBAction func onNextClicked(_ sender: Any) { self.performSegue(withIdentifier: "showPlateNumberView", sender: nil)
    }
    
    private let states: [String: String] = ["New South Wales": "NSW", "Northern Territory": "NT", "Queensland": "QLD", "South Australia": "SA", "Tasmania": "TAS", "Victoria": "VIC", "Western Australia": "WA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectStateTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func showActionSheet() {
        let actionSheet = UIAlertController(title: "", message: "Please select a state", preferredStyle: .actionSheet)
        
        for (key, value) in states {
            actionSheet.addAction(UIAlertAction(title: key, style: .default, handler: { (action) in
                self.selectStateTextField.text = value
                guard let license = self.selectStateTextField.text, !license.isEmpty else {
                    return
                }
                
                self.nextButton(shouldEnable: true)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlateNumberView" {
            if let destination = segue.destination as? PlateNumberViewController {
                destination.selectedState = selectStateTextField.text ?? ""
            }
        }
    }
    
    private func nextButton(shouldEnable: Bool) {
        if shouldEnable {
            nextButton.backgroundColor = UIColor(rgb: 0x3D9EA0)
            nextButton.setTitleColor(.white, for: .normal)
        } else {
            nextButton.backgroundColor = UIColor(rgb: 0xEBEBEB)
            nextButton.setTitleColor(.lightGray, for: .normal)
        }
        
        nextButton.isEnabled = shouldEnable
    }
}

extension VehicleStateViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showActionSheet()
        return false
    }
}
