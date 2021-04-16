//
//  VehicleStateViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class VehicleStateViewController: UIViewController {
    
    @IBOutlet weak var norCb: CheckBox! {
        didSet {
            norCb.style = .tick
        }
    }
    
    @IBOutlet weak var saCb: CheckBox! {
        didSet {
            saCb.style = .tick
        }
    }
    
    @IBOutlet weak var wesCb: CheckBox! {
        didSet {
            wesCb.style = .tick
        }
    }
    
    @IBOutlet weak var tasCb: CheckBox! {
        didSet {
            tasCb.style = .tick
        }
    }
    
    @IBOutlet weak var vicCb: CheckBox! {
        didSet {
            vicCb.style = .tick
        }
    }
    
    @IBOutlet weak var qldCb: CheckBox! {
        didSet {
            qldCb.style = .tick
        }
    }
    
    @IBOutlet weak var nswCb: CheckBox! {
        didSet {
            nswCb.style = .tick
        }
    }
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton(shouldEnable: false)
        }
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "showPlateNumberView", sender: nil)
    }
    
    private var selectedState: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView(image: UIImage(named: "oneflare-ic"))

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlateNumberView" {
            if let destination = segue.destination as? PlateNumberViewController {
                destination.selectedState = selectedState
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
    
    @IBAction func checkBoxValueChanged(_ sender: CheckBox) {
        switch sender {
        case norCb:
            selectedState = "NT"
            norCb.isChecked = true
            saCb.isChecked = false
            wesCb.isChecked = false
            tasCb.isChecked = false
            vicCb.isChecked = false
            qldCb.isChecked = false
            nswCb.isChecked = false
        case saCb:
            selectedState = "SA"
            norCb.isChecked = false
            saCb.isChecked = true
            wesCb.isChecked = false
            tasCb.isChecked = false
            vicCb.isChecked = false
            qldCb.isChecked = false
            nswCb.isChecked = false
        case wesCb:
            selectedState = "WA"
            norCb.isChecked = false
            saCb.isChecked = false
            wesCb.isChecked = true
            tasCb.isChecked = false
            vicCb.isChecked = false
            qldCb.isChecked = false
            nswCb.isChecked = false
        case tasCb:
            selectedState = "TAS"
            norCb.isChecked = false
            saCb.isChecked = false
            wesCb.isChecked = false
            tasCb.isChecked = true
            vicCb.isChecked = false
            qldCb.isChecked = false
            nswCb.isChecked = false
        case vicCb:
            selectedState = "VIC"
            norCb.isChecked = false
            saCb.isChecked = false
            wesCb.isChecked = false
            tasCb.isChecked = false
            vicCb.isChecked = true
            qldCb.isChecked = false
            nswCb.isChecked = false
        case qldCb:
            selectedState = "QLD"
            norCb.isChecked = false
            saCb.isChecked = false
            wesCb.isChecked = false
            tasCb.isChecked = false
            vicCb.isChecked = false
            qldCb.isChecked = true
            nswCb.isChecked = false
        case nswCb:
            selectedState = "NSW"
            norCb.isChecked = false
            saCb.isChecked = false
            wesCb.isChecked = false
            tasCb.isChecked = false
            vicCb.isChecked = false
            qldCb.isChecked = false
            nswCb.isChecked = true
        default:
            break
        }
        
        nextButton(shouldEnable: true)
    }
    
}
