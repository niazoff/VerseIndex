// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "VerseIndex",
  products: [
    .library(
      name: "VerseIndex",
      targets: ["VerseIndex"]),
  ],
  targets: [
    .target(
      name: "VerseIndex"),
    .testTarget(
      name: "VerseIndexTests",
      dependencies: ["VerseIndex"]),
  ]
)
