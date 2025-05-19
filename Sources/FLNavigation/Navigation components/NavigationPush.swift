//
//  NavigationPush.swift
//  FLShared
//
//  Created by Francesco Leoni on 19/05/25.
//

import SwiftUI

public struct NavigationPush<Content: View>: View {

	@Environment(\.navigation) var navigation

	var destination: ModalScreen
	@ViewBuilder var content: () -> Content

	public init(destination: ModalScreen, @ViewBuilder content: @escaping () -> Content) {
		self.destination = destination
		self.content = content
	}

	public var body: some View {
		Button {
			navigation(.push(destination))
		} label: {
			content()
		}
	}
}
