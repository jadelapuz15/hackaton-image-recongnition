//
//  PageSixViewController.swift
//  Fast&Furios
//
//  Created by Aldwin David on 4/15/21.
//

import UIKit

class PageSixViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.backgroundColor = UIColor(rgb: 0x3D9EA0)
            nextButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBOutlet weak var textField: UITextView!
    @IBAction func onRequestQuoteClicked(_ sender: Any) {
        let error = UIAlertController(title: "Success!", message: "Your request to qoute has been submitted.", preferredStyle: .alert)
        
        error.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        DispatchQueue.main.async {
            self.present(error, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            stackView.layer.borderWidth = 1
        }
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    private var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "oneflare-ic"))
        textField.layer.borderWidth = 1.0;
        textField.layer.cornerRadius = 8.0;
        textField.layer.borderColor = UIColor.lightGray.cgColor;
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access camera.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension PageSixViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let pickedImage = info[.originalImage] as? UIImage else {
            return
        }
        
        DispatchQueue.main.async {
            if self.secondImage.image == nil {
                self.secondImage.image = pickedImage
            } else if self.thirdImage.image == nil {
                self.thirdImage.image = pickedImage
            } else {
                
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
