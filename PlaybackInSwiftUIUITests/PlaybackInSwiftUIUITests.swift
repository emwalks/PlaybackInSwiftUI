//
//  PlaybackInSwiftUIUITests.swift
//  PlaybackInSwiftUIUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//

import XCTest

import XCTest

// https://developer.apple.com/videos/play/wwdc2023/10035/
// https://www.polpiella.dev/xcode-15-automated-accessibility-audits
// https://www.youtube.com/watch?app=desktop&v=h2cbFNAgc28

final class AccessibilityAuditsUITests: XCTestCase {
    
    func testAccessibilityAudits() throws {
        let app = XCUIApplication()
        app.launch()

        if #available(iOS 17.0, *) {
            try app.performAccessibilityAudit()
        } else {
            // Fallback on earlier versions
        }
    }
}
