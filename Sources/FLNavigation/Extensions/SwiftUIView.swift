//
//  SwiftUIView.swift
//  FLNavigation
//
//  Created by Francesco Leoni on 19/05/25.
//

import SwiftUI

extension View {

	@ViewBuilder
	func conditionalSheetOrFullScreenCover<Content: View, Item: Identifiable>(item: Binding<Item?>, @ViewBuilder content: @escaping (Item) -> Content) -> some View {
#if os(iOS)
		if UIDevice.current.userInterfaceIdiom == .phone {
			fullScreenCover(item: item, content: content)
		} else {
			sheet(item: item, content: content)
		}
#else
		sheet(item: item, content: content)
#endif
	}
}
