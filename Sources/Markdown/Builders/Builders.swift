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

    public static func buildArray(
        _ components: [String]
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

    public static func buildOptional(
        _ component: MarkdownElement?
    ) -> MarkdownElement {
        component ?? .paragraph(text: "")
    }

    public static func buildEither(
        first: MarkdownElement
    ) -> MarkdownElement {
        first
    }

    public static func buildEither(
        second: MarkdownElement
    ) -> MarkdownElement {
        second
    }

    public static func buildArray(
        _ components: [MarkdownElement]
    ) -> MarkdownElement {
        .elements(components)
    }
}
