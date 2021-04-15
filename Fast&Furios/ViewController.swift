
//
//  ViewController.swift
//  Fast&Furios
//
//  Created by Jade Lapuz on 4/15/21.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    @IBOutlet var cb1: CheckBox!
    @IBOutlet var cb2: CheckBox!
    @IBOutlet var cb3: CheckBox!
    @IBOutlet var cb4: CheckBox!
    let dataSource = ["Page One", "Page Two", "Page Three", "Page Four", ]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cb1?.style = .square
        cb2?.style = .cross
        cb3?.style = .circle
        cb4?.style = .tick
        
        cb1?.borderStyle = .rounded
        cb2?.borderStyle = .square
        cb3?.borderStyle = .roundedSquare(radius: 8)
        cb4?.borderStyle = .roundedSquare(radius: 12)
        
//        let cb5 = CheckBox.init()
//        cb5.frame = CGRect(x: 25, y: 25, width: 35, height: 35)
//        cb5.style = .tick
//        cb5.borderStyle = .roundedSquare(radius: 5)
//        cb5.addTarget(self, action: #selector(onCheckBoxValueChange(_:)), for: .valueChanged)
//        view.addSubview(cb5)
    }
    @objc func onCheckBoxValueChange(_ sender: CheckBox) {
        
        print(sender.isChecked)
    }
    //    func setupPageViewController () {
    //
    //        guard let pageViewController = storyboard?.instantiateViewController(identifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else {
    //            return
    //        }
    //        pageViewController.delegate = self
    //        pageViewController.dataSource = self
    //
    //        addChild(pageViewController)
    //        pageViewController.didMove(toParent: self)
    //        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    //        contentView.addSubview(contentView)
    //        let views: [String : Any] = ["pageView" : pageViewController.view!]
    //        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
    //
    //        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "L:|-0-[pageView]-0-|",
    //                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
    //                                                                  metrics: nil, views: views))
    //    }
    
}

