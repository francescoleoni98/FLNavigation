//
//  ModalScreen.swift
//  FLShared
//
//  Created by Francesco Leoni on 18/05/25.
//

import Foundation

public protocol ModalScreen {

	var style: ModalStyle { get }
	var displayName: String { get }
}

public extension ModalScreen {

	var displayName: String {
		String(describing: self)
	}
}
