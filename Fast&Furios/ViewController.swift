//
//  ViewController.swift
//  Fast&Furios
//
//  Created by Jade Lapuz on 4/15/21.
//

import UIKit
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    @IBAction func checkTextImage(_ sender: UIButton) {
        
          // Get the CGImage on which to perform requests.
          guard let cgImage = sender.backgroundImage(for: .normal)?.cgImage else { return }

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
              
            self.label.text = recognizedStrings.joined(separator: "\n")
            print(recognizedStrings)
          }

          do {
              // Perform the text-recognition request.
              try requestHandler.perform([request])
          } catch {
              print("Unable to perform the requests: \(error).")
          }
    }
}

