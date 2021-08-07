//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public struct CodeElement {

    public func callAsFunction(
        _ language: String,
        @StringBuilder content: () -> String
    ) -> MarkdownElement {
        .code(
            language: language,
            sourceCode: content()
        )
    }
}

public let code = CodeElement()
