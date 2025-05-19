//
//  ModalScreenEnvironmentKey.swift
//  FLShared
//
//  Created by Francesco Leoni on 18/05/25.
//

import SwiftUI

private struct PresentedScreenEnvironmentKey: EnvironmentKey {

	static let defaultValue: Binding<ModalScreen?> = .constant(nil)
}

public extension EnvironmentValues {

	var screen: Binding<ModalScreen?> {
		get { self[PresentedScreenEnvironmentKey.self] }
		set { self[PresentedScreenEnvironmentKey.self] = newValue }
	}
}
