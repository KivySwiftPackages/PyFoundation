// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PyFoundation",
	platforms: [.iOS(.v13)],
	products: [
		.library(name: "PyFoundation", targets: ["PyFoundation"])
	],
	dependencies: [
        .package(url: "https://github.com/PythonSwiftLink/KivySwiftLink", from: .init(310, 0, 0)),
        .package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 0))
	],
	targets: [
		.target(
			name: "PyFoundation",
			dependencies: [
                .product(name: "PythonSwiftCore", package: "KivySwiftLink"),
                .product(name: "PySwiftObject", package: "KivySwiftLink"),
				//"SwiftOpenCV",

			],
			plugins: [ .plugin(name: "Swiftonize", package: "SwiftonizePlugin") ]
		),

	]
)
