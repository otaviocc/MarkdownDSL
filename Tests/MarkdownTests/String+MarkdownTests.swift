//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
//

import XCTest
import Markdown

final class StringMarkdownTests: XCTestCase {

    func testTextStyleBold() throws {
        XCTAssertEqual(
            "bold".textStyle(.bold),
            "**bold**",
            "It should return the correct syntax for bold"
        )
    }

    func testTextStyleItalic() throws {
        XCTAssertEqual(
            "italic".textStyle(.italic),
            "*italic*",
            "It should return the correct syntax for italic"
        )
    }

    func testLink() throws {
        XCTAssertEqual(
            "GitHub".link("https://github.com"),
            "[GitHub](https://github.com)",
            "It should return the correct link"
        )
    }

    func testBoldLink() throws {
        XCTAssertEqual(
            "GitHub"
                .textStyle(.bold)
                .link("https://github.com"),
            "[**GitHub**](https://github.com)",
            "It should return the correct link"
        )
    }
}
