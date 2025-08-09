//
//  Sound.swift
//  Loops
//
//  Created by neon443 on 09/08/2025.
//

import Foundation

enum Sound: CustomStringConvertible, CaseIterable {
	case drum
	case snare
	case hihat
	case clap
	case silence
	
	var description: String {
		switch self {
		case .drum:
			"drum"
		case .snare:
			"snare"
		case .hihat:
			"hihat"
		case .clap:
			"clap"
		case .silence:
			"silence"
		}
	}
}
