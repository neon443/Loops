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
	@State var selectedSound: Sound = .clap
	
	var body: some View {
		VStack {
			HStack {
				Button() {
					audioEngine.startStop()
				} label: {
					Image(systemName: audioEngine.timer == nil ? "play.fill" : "pause.fill")
						.resizable().scaledToFit()
				}
				.frame(width: 30, height: 30)
			}
			
			HStack {
				ForEach(Sound.allCases, id: \.self) { soundType in
					ZStack {
						if selectedSound == soundType {
							RoundedRectangle(cornerRadius: 5)
								.foregroundStyle(.gray)
						}
						soundType.image
							.resizable().scaledToFit()
						if soundType == .silence {
							Image(systemName: "circle.slash.fill")
								.resizable().scaledToFit()
						}
					}
					.frame(width: 50, height: 50)
					.onTapGesture {
						withAnimation { selectedSound = soundType }
					}
				}
			}
			
			Spacer()
			
			HStack {
				ForEach(0...7, id: \.self) { i in
					ZStack {
						RoundedRectangle(cornerRadius: 5)
							.foregroundStyle(.gray)
							.opacity(audioEngine.step == i+1 ? 0.8 : 1)
						audioEngine.sequence[i].image
							.resizable().scaledToFit()
					}
					.onTapGesture {
						withAnimation { audioEngine.sequence[i] = selectedSound }
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
