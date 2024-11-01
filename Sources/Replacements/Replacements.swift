import FastReplace

public protocol Replacement {
    var description: String? { get }
    var contexts: [String]? { get }
    var contextsNot: [String]? { get }
    func replacing(in text: String) -> String
}

public struct ReplacementOfTextWithText: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: String
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: String, replacement: String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in text: String) -> String {
        text.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfRegexWithText: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: any RegexComponent
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: any RegexComponent, replacement: String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfScalarWithScalar: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: UnicodeScalar
    let replacement: UnicodeScalar
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: UnicodeScalar, replacement: UnicodeScalar) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfScalarWithText: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: UnicodeScalar
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: UnicodeScalar, replacement: String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfCodepointWithCodepoint: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: UInt32
    let replacement: UInt32
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: UInt32, replacement: UInt32) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfCodepointWithText: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: UInt32
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: UInt32, replacement: String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfTwoGroupsRegexWithText: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    let search: any RegexComponent
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: any RegexComponent, replacement: String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.replacement = replacement
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOf1GroupRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring)>
    private let operation: (String, Regex<(Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring)>, operation: @escaping (String, Regex<(Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf2GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf3GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf4GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf5GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf6GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf7GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf8GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf9GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf10GroupsRegex: Replacement {
    
    public let description: String?
    public let contexts: [String]?
    public let contextsNot: [String]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [String]? = nil, contextsNot: [String]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts
        self.contextsNot = contextsNot
        self.search = search
        self.operation = operation
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}
