// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "swift-pocket-bell-two-touch-parser",
  platforms: [
    .iOS(.v16),
  ],
  products: [
    .library(name: "TwoTouchParser", targets: ["TwoTouchParser"]),
  ],
  targets: [
    .target(name: "TwoTouchParser"),
    .testTarget(name: "TwoTouchParserTests", dependencies: ["TwoTouchParser"]),
  ]
)
