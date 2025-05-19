//
//  ShowScreenModifier.swift
//  BrainDump
//
//  Created by Francesco Leoni on 28/04/25.
//

import SwiftUI

struct ShowScreenModifier<Screen: View>: ViewModifier {

	struct PathElement: Identifiable, Hashable {

		var id: UUID = UUID()
		var screen: ModalScreen

		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}

		static func == (lhs: ShowScreenModifier<Screen>.PathElement, rhs: ShowScreenModifier<Screen>.PathElement) -> Bool {
			lhs.id == rhs.id
		}
	}

	@Environment(\.dismiss) var dismiss

	@State private var fullScreenToShow: PathElement?
	@State private var modalScreenToShow: PathElement?

	var screenContent: (ModalScreen) -> Screen

	@State private var path: [PathElement] = []

	public func body(content: Content) -> some View {
		let screen = Binding {
			fullScreenToShow?.screen ?? modalScreenToShow?.screen
		} set: { screen in
			if let screen {
				modalScreenToShow = PathElement(screen: screen)
			}
		}

		NavigationStack(path: $path) {
			content
				.navigationDestination(for: PathElement.self) { element in
					screenContent(element.screen)
				}
		}
		.environment(\.screen, screen)
		.environment(\.navigation) { action in
#if os(iOS)
			UIImpactFeedbackGenerator().impactOccurred(intensity: 0.8)
#endif

			switch action {
			case .present(let screen):
				switch screen.style {
				case .modal:
					print("[Navigation] Present modal:", screen.displayName)
					modalScreenToShow = PathElement(screen: screen)

				case .fullScreen:
					print("[Navigation] Present full screen:", screen.displayName)
					fullScreenToShow = PathElement(screen: screen)
				}

			case .push(let screen):
				print("[Navigation] Push:", screen.displayName)
				path.append(PathElement(screen: screen))

			case .pop:
				print("[Navigation] Pop")
				path.removeLast()

			case .popToRoot:
				print("[Navigation] Pop to root")
				path = []

			case .setScreens(let screens):
				print("[Navigation] Set screens:", screens.map(\.displayName))
				path = screens.map { PathElement(screen: $0) }

			case .dismiss:
				print("[Navigation] Dismiss")
				dismiss()
			}
		}
		.sheet(item: $modalScreenToShow) { screen in
			screenContent(screen.screen)
				.showScreen(screenContent)
		}
		.conditionalSheetOrFullScreenCover(item: $fullScreenToShow) { screen in
			screenContent(screen.screen)
				.showScreen(screenContent)
		}
	}
}

public extension View {

	func showScreen<S: View>(@ViewBuilder _ screenContent: @escaping (ModalScreen) -> S) -> some View {
		modifier(ShowScreenModifier(screenContent: screenContent))
	}
}
