//
//  PlaySound.swift
//  LearnByDoing
//
//  Created by Camila Campana on 30/05/22.
//

import Foundation
import AVFoundation

// MARK: - Audio Player

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error to load sound")
        }
    }
}
