//
//  ViewController.swift
//  Fast&Furios
//
//  Created by Jade Lapuz on 4/15/21.
//

import UIKit
import Vision
import VisionKit
import Kingfisher

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

class PlateNumberViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var carMakeLabel: UILabel! {
        didSet {
            carMakeLabel.text = ""
        }
    }
    
    @IBOutlet weak var modelLabel: UILabel! {
        didSet {
            modelLabel.text = ""
        }
    }
    
    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            bodyLabel.text = ""
        }
    }
    
    @IBOutlet weak var engineLabel: UILabel! {
        didSet {
            engineLabel.text = ""
        }
    }
    
    @IBOutlet weak var yearLabel: UILabel! {
        didSet {
            yearLabel.text = ""
        }
    }
    @IBOutlet weak var transmissionLabel: UILabel! {
        didSet {
            transmissionLabel.text = ""
        }
    }
    
    @IBOutlet weak var licensePlateTextField: UITextField! {
        didSet {
            addDoneButtonOnKeyboard()
        }
    }
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    @IBOutlet weak var backButton: UIButton! {
        didSet {
        }
    }
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton(shouldEnable: false)
        }
    }
    
    private var imagePicker: UIImagePickerController!
    
    private var car: CarModel!
    
    var selectedState: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        licensePlateTextField.addTarget(self, action: #selector(PlateNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
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
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let documentCameraViewController = VNDocumentCameraViewController()
            documentCameraViewController.delegate = self
            present(documentCameraViewController, animated: true)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
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
    
    private func processImage(image: UIImage?) {
        
        // Get the CGImage on which to perform requests.
        guard let cgImage = image?.cgImage else {
            return
        }
        
        // Create a new image-request handler.
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        
        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations =
                    request.results as? [VNRecognizedTextObservation] else {
                return
            }
            
            let recognizedStrings = observations.compactMap { observation in
                // Return the string of the top VNRecognizedText instance.
                return observation.topCandidates(1).first?.string
            }
            
            guard !recognizedStrings.isEmpty else {
                let alert = UIAlertController(title: "Error", message: "No text was recognized on the image", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                }))
                
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard let result = recognizedStrings.first else {
                return
            }
            
            DispatchQueue.main.async {
                self.licensePlateTextField.text = result
                self.getCarDetails(result: result)
            }
        }
        
        
        request.recognitionLevel = .accurate
        
        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    private func nextButton(shouldEnable: Bool) {
        if shouldEnable {
            nextButton.backgroundColor = UIColor.white
            nextButton.setTitleColor(.black, for: .normal)
        } else {
            nextButton.backgroundColor = UIColor(rgb: 0xEBEBEB)
            nextButton.setTitleColor(.lightGray, for: .normal)
        }
        
        nextButton.isEnabled = shouldEnable
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        licensePlateTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        guard let text = licensePlateTextField.text, !text.isEmpty else {
            let error = UIAlertController(title: "Oops!", message: "Plate number is empty", preferredStyle: .alert)
            
            error.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            DispatchQueue.main.async {
                self.present(error, animated: true, completion: nil)
            }
            return
        }
        
        licensePlateTextField.resignFirstResponder()
        self.getCarDetails(result: text)
    }
    
    
    private func getCarDetails(result: String) {
        self.loadingView.startAnimating()
        
        CarParser.shared.requestCarDetails(plateNumber: result, state: selectedState) { (car, error) in
            defer {
                DispatchQueue.main.async {
                    self.loadingView.stopAnimating()
                }
            }
            
            guard error == nil else {
                let error = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                
                error.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                DispatchQueue.main.async {
                    self.present(error, animated: true, completion: nil)
                }
                return
            }
            
            //process here
            guard let carString = car, let data = carString.jsonString.data(using: .utf8) else {
                return
            }
            
            guard let carModel = try? JSONDecoder().decode(CarModel.self, from: data) else {
                return
            }
            
            self.car = carModel
            self.showCarDetails(carModel: carModel)
            self.nextButton(shouldEnable: true)
        }
    }
    
    private func showCarDetails(carModel: CarModel) {
        containerView.isHidden = false
        carMakeLabel.text = carModel.carMake?.currentTextValue
        modelLabel.text = carModel.modelDescription?.currentTextValue
        bodyLabel.text = carModel.bodyStyle?.currentTextValue
        engineLabel.text = carModel.engine
        yearLabel.text = carModel.extended?.year
        transmissionLabel.text = carModel.extended?.transmissionType
        imageView.kf.setImage(
            with: URL(string: carModel.imageUrl ?? "")!,
            placeholder: UIImage(named: "placeholder-image"),
            options: [],
            progressBlock: { receivedSize, totalSize in
                // Progress updated
            },
            completionHandler: { result in
                // Done
            }
        )
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {

    }
    
    @IBAction func backTapped(_ sender: Any) {
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMechanic", sender: nil)
    }
}

extension PlateNumberViewController: UIImagePickerControllerDelegate, VNDocumentCameraViewControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let pickedImage = info[.originalImage] as? UIImage else {
            return
        }
        
        DispatchQueue.main.async {
            self.processImage(image: pickedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        controller.dismiss(animated: true) {
            DispatchQueue.global(qos: .userInitiated).async {
                let image = scan.imageOfPage(at: scan.pageCount - 1)
                self.processImage(image: image)
            }
        }
    }
}
