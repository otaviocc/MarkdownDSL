//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct ParagraphElement {

    public func callAsFunction(
        @StringBuilder content: () -> String
    ) -> MarkdownElement {
        .paragraph(
            text: content()
        )
    }
}

public let paragraph = ParagraphElement()
