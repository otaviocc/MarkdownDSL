//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct QuoteElement {

    public func callAsFunction(
        @StringBuilder content: () -> String
    ) -> MarkdownElement {
        .quote(content())
    }
}

public let quote = QuoteElement()
