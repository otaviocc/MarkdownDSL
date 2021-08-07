//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
//

public struct DocumentElement {

    public func callAsFunction(
        @DocumentBuilder content: () -> MarkdownElement
    ) -> String {
        content().convert()
    }
}

public let document = DocumentElement()
