// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMobileAdsInstreamWrapper",
    products: [
        .library(
            name: "YandexMobileAdsInstreamWrapper",
            targets: ["YandexMobileAdsInstreamWrapper", "YandexMobileAdsInstream"]
        ),
    ],
    dependencies: [
        .package(name: "YandexMobileAdsWrapper", url: "https://github.com/AlexanderKadyrov/YandexMobileAdsWrapper.git", .branch("4.4.2"))
    ],
    targets: [
        .binaryTarget(
            name: "YandexMobileAdsInstream",
            url: "https://github.com/AlexanderKadyrov/YandexMobileAdsInstreamStorage/raw/master/0.7.0/YandexMobileAdsInstream.zip",
            checksum: "16b649168723ba65a07a7da13f71a7557f66f485628735ab25c525b74b0dcc51"
        ),
        .target(
            name: "YandexMobileAdsInstreamWrapper",
            dependencies: [
                .target(name: "YandexMobileAdsInstream", condition: .when(platforms: .some([.iOS]))),
                "YandexMobileAdsWrapper"
            ]
        )
    ]
)
