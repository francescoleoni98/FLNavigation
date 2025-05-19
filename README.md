<div align="center">
  <img width="100" height="100" src="/Assets/icon.png" alt="FLNavigation Logo">
  <h1><b>FLNavigation</b></h1>
  <p>
		FLNavigation is a lightweight and modern Swift package that simplifies navigation management in SwiftUI applications. Built with clarity and flexibility in mind, FLNavigation enables clean and scalable routing.
    <br>
  </p>
</div>

<div align="center">
  <a href="https://swiftpackageindex.com">
    <img src="https://img.shields.io/badge/SPM-Compatible-success.svg" alt="SPM Compatible">
  </a>
  <a href="https://developer.apple.com/ios">
    <img src="https://img.shields.io/badge/iOS-16+-blue.svg" alt="iOS 16+">
  </a>
  <a href="https://developer.apple.com/macos">
    <img src="https://img.shields.io/badge/macOS-13+-lightgrey.svg" alt="macOS 13+">
  </a>
  <a href="https://developer.apple.com/visionos">
    <img src="https://img.shields.io/badge/visionOS-1+-purple.svg" alt="visionOS 1+">
  </a>
  <a href="https://developer.apple.com/watchos">
    <img src="https://img.shields.io/badge/watchOS-9+-green.svg" alt="watchOS 9+">
  </a>
  <a href="https://developer.apple.com/tvos">
    <img src="https://img.shields.io/badge/tvOS-16+-orange.svg" alt="tvOS 16+">
  </a>
</div>

<div align="center">
  <h3><b>Apps Using FLNavigation</b></h3>

	<div align="center">
		<a href="https://apps.apple.com/us/app/brain-dump-notes-writing/id6448230631" target="_blank">
			<img src="/Assets/brain-dump" alt="RouteFinder" width="40" height="40">
		</a>
		&nbsp;&nbsp;
		<a href="https://apps.apple.com/us/app/brain-dump-notes-writing/id6448230631" target="_blank">
			<img src="/Assets/brain-dump" alt="RouteFinder" width="40" height="40">
		</a>
	</div>
</div>

<p align="center">
  <em>Are you using FLNavigation in your app? <a href="mailto:leonifrancesco98@gmail.com">Tell me</a>!</em>
</p>

## Installation

FLNavigation is distributed using the Swift Package Manager (SPM).

### Using Xcode

1. Go to your project’s settings.
2. Select the `Package Dependencies` tab.
3. Click the `+` button.
4. Enter the URL of the FLNavigation repository: https://github.com/francescoleoni98/FLNavigation
5. Choose the latest version and add the package to your project.

### Using `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/francescoleoni98/FLNavigation.git", from: "1.0.0")
]
```

Then add "FLNavigation" to the dependencies of your target.

## Supported actions

| Action          | Description                                  | Example                                         |
|-----------------|----------------------------------------------|-------------------------------------------------|
| `present(_:)`   | Presents a new screen                        | `navigation(.present(AppScreen.onboarding))`    |
| `push(_:)`      | Pushes a new screen onto the navigation stack| `navigation(.push(AppScreen.detail(id: 1)))`             |
| `pop`           | Pops the top screen off the navigation stack | `navigation(.pop)`                              |
| `popToRoot`     | Pops all screens and returns to the root     | `navigation(.popToRoot)`                        |
| `setScreens(_:)`| Replaces the entire navigation stack         | `navigation(.setScreens([AppScreen.onboarding])`|
| `dismiss`       | Dismisses the current screen                 | `navigation(.dismiss)`                          |

## Usage

### Import

```swift
import FLNavigation
```

### Declare your screens

```swift
enum AppScreen: ModalScreen {
	
	case onboarding
	case home(tab: Int)
	
	var style: ModalStyle {
		switch self {
		case .onboarding:
			return .modal

		default:
			return .fullScreen
		}
	}
}
```

### Navigate

```swift
struct ContentView: View {

	@Environment(\.navigation) var navigation

	var body: some View {
		Button("Push") {
			navigation(.push(AppScreen.home(tab: 1)
		}
	}
}
```

#### Using `NavigationPush` component

```swift
struct ContentView: View {

	var body: some View {
		NavigationPush(AppScreen.home(tab: 1)) {
			Text("Push")
		}
	}
}
```

## Author

**Francesco Leoni**  
iOS Developer & SwiftUI Enthusiast

- [GitHub](https://github.com/francescoleoni98)
- [Twitter](https://twitter.com/franceleonidev)
- [LinkedIn](https://it.linkedin.com/in/francescoleoni1998)
- [Website](https://leonifrancesco.com)
- [Apps](https://apps.apple.com/it/developer/francesco-leoni/id1484190257)

If you find this package helpful, feel free to ⭐️ the repo and share feedback!
