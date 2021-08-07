//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct SectionElement {

    public func callAsFunction(
        _ title: String,
        @DocumentBuilder content: () -> MarkdownElement
    ) -> MarkdownElement {
        .section(
            title: title,
            content: content()
        )
    }
}

public let section = SectionElement()
