//
//  AudioPlayer.swift
//  Restart App
//
//  Created by Medhat Mebed on 12/21/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        } catch {
            print("couldn't play the sound file")
        }
    }
}
