// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "FLNavigation",
	platforms: [
		.iOS(.v16),
		.macOS(.v13),
		.tvOS(.v16),
		.visionOS(.v1),
		.watchOS(.v9)
	],
	products: [
		.library(
			name: "FLNavigation",
			targets: ["FLNavigation"]),
	],
	targets: [
		.target(
			name: "FLNavigation"),
		.testTarget(
			name: "FLNavigationTests",
			dependencies: ["FLNavigation"]
		),
	]
)
