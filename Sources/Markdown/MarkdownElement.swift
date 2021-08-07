//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
//

public indirect enum MarkdownElement {
    case code(language: String, sourceCode: String)
    case list(items: [String])
    case paragraph(text: String)
    case quote(String)
    case elements([MarkdownElement])
    case section(title: String, content: MarkdownElement)
    case separator
}

extension MarkdownElement {

    func convert(
        level: Int = 1
    ) -> String {
        switch self {
        case .elements(let components):
            return components
                .map { $0.convert(level: level) }
                .joined(separator: "\n\n")

        case .paragraph(let text):
            return text

        case .quote(let text):
            return "> \(text)"

        case .list(let items):
            return items
                .map { "* \($0)" }
                .joined(separator: "\n")

        case .separator:
            return "---"

        case .code(let language, let sourceCode):
            return
                """
                ```\(language)
                \(sourceCode)
                ```
                """

        case .section(let title, let content):
            return String(
                repeating: "#",
                count: level
            )
            + " \(title)\n\n"
            + content.convert(
                level: level + 1
            )
        }
    }
}
