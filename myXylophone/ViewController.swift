//
//  ViewController.swift
//  myXylophone
//
//  Created by Ururu on 03.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
 
    func playSound(soundName : String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true) 
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
