//
// Copyright © 2021 Otavio Cordeiro. All rights reserved.
// 

public enum TextStyle {
    case bold
    case italic
}

public extension String {

    func textStyle(
        _ style: TextStyle
    ) -> String {
        switch style {
        case .bold: return "**\(self)**"
        case .italic: return "*\(self)*"
        }
    }

    func link(
        _ url: String
    ) -> String {
        "[\(self)](\(url))"
    }
}
