//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
//

import XCTest
@testable import Markdown

final class MarkdownElementTests: XCTestCase {

    var element: MarkdownElement?

    func testElements() throws {
        let paragraph1 = paragraph {
            "foo"
            "bar"
        }

        let paragraph2 = paragraph {
            "foo"
            "bar"
        }

        element = .elements(
            [paragraph1, paragraph2]
        )

        XCTAssertEqual(
            element?.convert(),
            "foo bar\n\nfoo bar"
        )
    }

    func testParagraph() throws {
        element = .paragraph(
            text: "Foo bar"
        )

        XCTAssertEqual(
            element?.convert(),
            "Foo bar"
        )
    }

    func testQuote() throws {
        element = .quote(
            "Foo bar"
        )

        XCTAssertEqual(
            element?.convert(),
            "> Foo bar"
        )
    }

    func testList() throws {
        element = .list(
            items: [
                "foo",
                "bar",
                "toto"
            ]
        )

        XCTAssertEqual(
            element?.convert(),
            #"""
            * foo
            * bar
            * toto
            """#
        )
    }

    func testSeparator() throws {
        element = .separator

        XCTAssertEqual(
            element?.convert(),
            "---"
        )
    }

    func testCode() throws {
        element = .code(
            language: "swift",
            sourceCode: #"func yTown() -> String { "Berlin" }"#
        )

        XCTAssertEqual(
            element?.convert(),
            #"""
            ```swift
            func yTown() -> String { "Berlin" }
            ```
            """#
        )
    }

    func testSection() throws {
        element = .section(title: "Foo bar", content: .separator)

        XCTAssertEqual(
            element?.convert(),
            #"""
            # Foo bar

            ---
            """#
        )
    }

    func testNestedSections() throws {
        element = .section(
            title: "Foo",
            content: .section(
                title: "Bar",
                content: .section(
                    title: "Toto",
                    content: .separator
                )
            )
        )

        XCTAssertEqual(
            element?.convert(),
            #"""
            # Foo

            ## Bar

            ### Toto

            ---
            """#
        )
    }
}
