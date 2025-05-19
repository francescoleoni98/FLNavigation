//
//  NavigationEnvironmentKey.swift
//  FLShared
//
//  Created by Francesco Leoni on 18/05/25.
//

import SwiftUI

public typealias NavigationScreenAction = (NavigationAction) -> Void

private struct NavigationEnvironmentKey: EnvironmentKey {

	static let defaultValue: NavigationScreenAction = { _ in }
}

public extension EnvironmentValues {

	var navigation: NavigationScreenAction {
		get { self[NavigationEnvironmentKey.self] }
		set { self[NavigationEnvironmentKey.self] = newValue }
	}
}
