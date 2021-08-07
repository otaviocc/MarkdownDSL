//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct SeparatorElement {

    public func callAsFunction(
    ) -> MarkdownElement {
        .separator
    }
}

public let separator = SeparatorElement()
