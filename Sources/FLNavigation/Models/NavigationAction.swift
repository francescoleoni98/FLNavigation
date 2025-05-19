//
//  NavigationAction.swift
//  FLShared
//
//  Created by Francesco Leoni on 18/05/25.
//

import SwiftUI

public enum NavigationAction {

	case present(ModalScreen)
	case push(ModalScreen)
	case pop
	case popToRoot
	case setScreens([ModalScreen])
	case dismiss
}
