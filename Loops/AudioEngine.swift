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
	@Published var step = 0
	@Published var sequence: [Sound] = Array(repeating: .silence, count: 8)
	
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
	
	func startStop() {
		if timer == nil {
			startLoop()
		} else {
			stopLoop()
		}
	}
	
	func startLoop() {
		stopLoop()
		step = 0
		
//		let interval = TimeInterval(60 / bpm / 4)
		timer = Timer(timeInterval: 0.25, repeats: true) { [weak self] _ in
			guard let self else { return }
			
			if step < self.sequence.count {
				play(sound: sequence[step])
				self.step += 1
				if step >= sequence.count {
					step = 0
				}
			}
		}
		
		RunLoop.main.add(timer!, forMode: .common)
	}
	
	func stopLoop() {
		timer?.invalidate()
		timer = nil
		step = 0
	}
}
