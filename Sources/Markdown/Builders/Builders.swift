//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

@resultBuilder
public struct StringsBuilder {

    public static func buildBlock(
        _ components: String...
    ) -> [String] {
        components
    }
}

@resultBuilder
public struct StringBuilder {

    public static func buildBlock(
        _ components: String...
    ) -> String {
        components
            .joined(separator: " ")
    }
}

@resultBuilder
public struct DocumentBuilder {

    public static func buildBlock(
        _ components: MarkdownElement...
    ) -> MarkdownElement {
        .elements(components)
    }
}
