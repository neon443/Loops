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
	
	var body: some View {
		VStack {			
			Button("", systemImage: audioEngine.timer == nil ? "play.fill" : "pause.fill") {
				audioEngine.startStop()
			}
			
			HStack {
				ForEach(0...7, id: \.self) { i in
					Menu() {
						ForEach(Sound.allCases, id: \.self) { soundType in
							Button(soundType.description) {
								audioEngine.sequence[i] = soundType
							}
						}
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 5)
								.foregroundStyle(.gray)
								.opacity(audioEngine.step == i+1 ? 0.8 : 1)
							switch audioEngine.sequence[i] {
							case .clap:
								Image(systemName: "hands.clap.fill")
									.resizable().scaledToFit()
							case .drum:
								Image("drum")
									.resizable().scaledToFit()
							case .hihat:
								Image("hihat")
									.resizable().scaledToFit()
							case .snare:
								Image("snare")
									.resizable().scaledToFit()
							case .silence:
								Image(systemName: "circle.slash.fill")
									.resizable().scaledToFit()
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
