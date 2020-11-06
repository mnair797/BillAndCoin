//
//  ViewController.swift
//  BillAndCoin
//
//  Created by Nisha Narayanakurup on 11/3/20.
//  Copyright © 2020 Meenakshi Nair. All rights reserved.
//

import UIKit
import AVFoundation
import Speech
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var takephoto: UIButton!
    
    @IBOutlet weak var pickimage: UIButton!
    
    @IBOutlet weak var instructions: UIButton!
    
    @IBOutlet weak var audiototext: UIButton!
    
    @IBAction func ButtonPressed(_ sender: Any) {
        
    }
    @IBAction func pickimagepressed(_ sender: Any) {
        print("Button pressed")
        let vc = UIImagePickerController()
        //vc.sourceType = .camera
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)

    }
    @IBAction func takephotopressed(_ sender: Any) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)

            guard let image = info[.editedImage] as? UIImage else {
                print("An error occured: no image found")
                return
            }

            // print out the image size as a test
            print(image.size)
            let imageJPG = image.jpegData(compressionQuality: 0.0034)
            processFile(image:imageJPG!)
            //buttonMain.isHidden = false
            //buttonSecond.isHidden = false
            
        }

        
        func processFile(image: Data) {
            let imageB64 = Data(image).base64EncodedData()
            //let uploadURL = "https://3h6ys7t373.execute-api.us-east-1.amazonaws.com/Predict/03378121-5f5b-4e24-8b5b-7a029003f2a4"
            let uploadURL = "https://svexr6i4fi.execute-api.us-east-1.amazonaws.com/Predict/93396303-c75a-49d0-9736-c540ca073768"
            
            AF.upload(imageB64, to: uploadURL).responseJSON { response in
                
                debugPrint(response)
                switch response.result {
                   case .success(let responseJsonStr):
                       print("\n\n Success value and JSON: \(responseJsonStr)")
                       let myJson = JSON(responseJsonStr)
                       let predictedValue = myJson["predicted_label"].string
                       print("Saw predicted value \(String(describing: predictedValue))")
                       let predictionMessage = predictedValue!
                        let utterance = AVSpeechUtterance(string: predictionMessage)
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        utterance.rate = 0.5

                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
                   case .failure(let error):
                       print("\n\n Request failed with error: \(error)")
                  

                   }
                
                
            }
            
        }

        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

