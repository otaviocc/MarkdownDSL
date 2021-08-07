//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
//

import XCTest
import Markdown

final class MarkdownTests: XCTestCase {

    func testExample() {
        let markdown = document {
            section("Title") {
                paragraph {
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    "Nam id tincidunt odio."
                        .textStyle(.bold)
                }

                quote {
                    "Aenean ligula arcu, rutrum vel mattis id, porta non ligula."
                        .textStyle(.italic)
                }

                list {
                    "Morbi at ex eros."
                    "Quisque a " + "gravida".link("https://lipsum.com") + " eros."
                }

                section("Subtitle") {
                    code("swift") {
                        #"""
                        func yTown() -> String { "Berlin" }
                        """#
                    }

                    paragraph {
                        "Sed quis sapien nec augue bibendum congue vitae et metus."
                    }
                }
            }

            section("Another title") {
                quote {
                    "Aenean ligula arcu, rutrum vel mattis id, porta non ligula."
                        .textStyle(.italic)
                }
            }

            section("Another title") {
                section("Another title") {
                    quote {
                        "Aenean ligula arcu, rutrum vel mattis id, porta non ligula."
                            .textStyle(.italic)
                    }
                }
            }
        }

        XCTAssertEqual(
            markdown,
            #"""
            # Title

            Lorem ipsum dolor sit amet, consectetur adipiscing elit. **Nam id tincidunt odio.**

            > *Aenean ligula arcu, rutrum vel mattis id, porta non ligula.*

            * Morbi at ex eros.
            * Quisque a [gravida](https://lipsum.com) eros.

            ## Subtitle

            ```swift
            func yTown() -> String { "Berlin" }
            ```

            Sed quis sapien nec augue bibendum congue vitae et metus.

            # Another title

            > *Aenean ligula arcu, rutrum vel mattis id, porta non ligula.*

            # Another title

            ## Another title

            > *Aenean ligula arcu, rutrum vel mattis id, porta non ligula.*
            """#
        )
    }

    func testExampleWithConditionalOptional() {
        let markdown = document {
            if true {
                paragraph {
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                }
            }
        }

        XCTAssertEqual(
            markdown,
            #"""
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            """#
        )
    }

    func testExampleWithConditionalTrue() {
        let markdown = document {
            if true {
                paragraph {
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                }
            } else {
                // ...
            }
        }

        XCTAssertEqual(
            markdown,
            #"""
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            """#
        )
    }

    func testExampleWithConditionalFalse() {
        let markdown = document {
            if false {
                // ...
            } else {
                paragraph {
                    "Sed quis sapien nec augue bibendum congue vitae et metus."
                }
            }
        }

        XCTAssertEqual(
            markdown,
            #"""
            Sed quis sapien nec augue bibendum congue vitae et metus.
            """#
        )
    }
}
