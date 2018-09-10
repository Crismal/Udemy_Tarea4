//
//  FirstViewController.swift
//  UdemyInstrumentos
//
//  Created by Cristian Misael Almendro Lazarte on 9/9/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {

    
    var audioPlayer : AVAudioPlayer!
    
    let soundsArray = ["c1", "c1s", "d1", "d1s", "e1", "f1", "f1s", "g1", "g1s", "a1", "a1s", "b1", "c2"]
    
    @IBOutlet weak var average: UILabel!
    
    @IBOutlet weak var peak: UILabel!
    
    @IBOutlet weak var VolumenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        average.transform = CGAffineTransform(rotationAngle: .pi/2);
        peak.transform = CGAffineTransform(rotationAngle: .pi/2);
    }


    @IBAction func playSound(_ sender: UIButton) {
        
       
        let idKey = sender.tag
        let fileName = soundsArray[idKey-1]
        print("Hemos pulsado la tecla \(fileName) ")
        
        if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
            print(soundURL)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch{
                print(error)
            }
            
            audioPlayer.volume = VolumenSlider.value;
            audioPlayer.play()
            
            audioPlayer.isMeteringEnabled = true
            
            audioPlayer.updateMeters()
            
            average.text = "\(audioPlayer.averagePower(forChannel: 0))"
            peak.text = "\(audioPlayer.peakPower(forChannel: 0)))"
            
        }
    }
    
    @IBAction func CambioSlider(_ sender: UISlider) {
        
        audioPlayer.volume = sender.value;
    }
    
}

