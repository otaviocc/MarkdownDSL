//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct ListElement {

    public func callAsFunction(
        @StringsBuilder content: () -> [String]
    ) -> MarkdownElement {
        .list(items: content())
    }
}

public let list = ListElement()
