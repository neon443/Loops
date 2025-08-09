//
//  AudioEngine.swift
//  Loops
//
//  Created by neon443 on 09/08/2025.
//

import Foundation
import AVFoundation

class AudioEngine: ObservableObject {
	var hihat: AVAudioPlayer?
	var timer: Timer?
	var bpm = 120
	var step = 0
	var sequence: [Sound] = []
	
	init() {}
	
	func play(sound: Sound) {
		var url: URL
		
		switch sound {
		case .drum:
			let path = Bundle.main.path(forResource: "drum.m4a", ofType: nil)!
			url = URL(fileURLWithPath: path)
		case .snare:
			let path = Bundle.main.path(forResource: "snare.m4a", ofType: nil)!
			url = URL(fileURLWithPath: path)
		case .hihat:
			let path = Bundle.main.path(forResource: "hihat.m4a", ofType: nil)!
			url = URL(fileURLWithPath: path)
		case .clap:
			let path = Bundle.main.path(forResource: "clap.m4a", ofType: nil)!
			url = URL(fileURLWithPath: path)
		case .silence:
			return
		}
		
		do {
			hihat = try AVAudioPlayer(contentsOf: url)
			hihat?.play()
		} catch {
			print("aaagh")
		}
	}
	
	func playSeq(sounds: [Sound]) {
		for sound in sounds {
			play(sound: sound)
			
		}
	}
}
