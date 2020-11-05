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

class ViewController: UIViewController {

    @IBOutlet weak var FakeButton: UIButton!
    
    @IBAction func ButtonPressed(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: "Bonjour!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

