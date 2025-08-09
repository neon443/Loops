//
//  ContentView.swift
//  Loops
//
//  Created by neon443 on 09/08/2025.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var audioEngine: AudioEngine = AudioEngine()
	
	@State var sound: Sound = .clap
	@State var soundBar: [Sound] = Array(repeating: .silence, count: 16)
	@State var playing: Bool = false
	
	var body: some View {
		VStack {
			Picker("Sound", selection: $sound) {
				ForEach(Sound.allCases, id: \.self) { soundType in
					Text(soundType.rawValue).tag(soundType)
				}
			}
			Button("Go") {
				audioEngine.play(sound: sound)
			}
			
			Button("Play/Pause") {
				playing.toggle()
				
			}
			
			HStack {
				ForEach(0..<16, id: \.self) { i in
					Menu() {
						ForEach(Sound.allCases, id: \.self) { soundType in
							Text(soundType.rawValue).tag(soundType)
						}
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 5)
							switch soundBar[i] {
							case .clap:
								Image(systemName: "hands.clap.fill")
							case .drum:
								Image("drum")
							case .hihat:
								Image("hihat")
							case .snare:
								Image("snare")
							case .silence:
								Image(systemName: "circle.slash.fill")
							}
						}
					}
				}
			}
		}
		.padding()
	}
}

#Preview {
	ContentView()
}
