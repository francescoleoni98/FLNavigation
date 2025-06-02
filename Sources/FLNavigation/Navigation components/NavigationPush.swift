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
	var showDisclosureIndicator: Bool
	@ViewBuilder var content: () -> Content

	public init(destination: ModalScreen, showDisclosureIndicator: Bool = false, @ViewBuilder content: @escaping () -> Content) {
		self.destination = destination
		self.showDisclosureIndicator = showDisclosureIndicator
		self.content = content
	}

	public var body: some View {
		Button {
			navigation(.push(destination))
		} label: {
			if showDisclosureIndicator {
				HStack {
					content()
						.frame(maxWidth: .infinity)

					Image(systemName: "chevron.right")
						.foregroundStyle(.quaternary)
						.font(.footnote.bold())
				}
			} else {
				content()
			}
		}
	}
}
