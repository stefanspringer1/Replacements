import FastReplace

protocol Replacement {
    var description: String? { get }
    func replacing(in text: String) -> String
}

struct ReplacementOfTextWithText: Replacement {
    
    let description: String?
    let search: String
    let replacement: String
    
    init(_ description: String? = nil, search: String, replacement: String) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in text: String) -> String {
        text.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfRegexWithText: Replacement {
    
    let description: String?
    let search: any RegexComponent
    let replacement: String
    
    init(_ description: String? = nil, search: any RegexComponent, replacement: String) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfScalarWithScalar: Replacement {
    
    let description: String?
    let search: UnicodeScalar
    let replacement: UnicodeScalar
    
    init(_ description: String? = nil, search: UnicodeScalar, replacement: UnicodeScalar) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfScalarWithText: Replacement {
    
    let description: String?
    let search: UnicodeScalar
    let replacement: String
    
    init(_ description: String? = nil, search: UnicodeScalar, replacement: String) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfCodepointWithCodepoint: Replacement {
    
    let description: String?
    let search: UInt32
    let replacement: UInt32
    
    init(_ description: String? = nil, search: UInt32, replacement: UInt32) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfCodepointWithText: Replacement {
    
    let description: String?
    let search: UInt32
    let replacement: String
    
    init(_ description: String? = nil, search: UInt32, replacement: String) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOfTwoGroupsRegexWithText: Replacement {
    
    let description: String?
    let search: any RegexComponent
    let replacement: String
    
    init(_ description: String? = nil, search: any RegexComponent, replacement: String) {
        self.description = description
        self.search = search
        self.replacement = replacement
    }
    
    func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

struct ReplacementOf1GroupRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring)>
    private let operation: (String, Regex<(Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring)>, _ operation: @escaping (String, Regex<(Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf2GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf3GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf4GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf5GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf6GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf7GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf8GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf9GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}

struct ReplacementOf10GroupsRegex: Replacement {
    
    let description: String?
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    init(_ description: String? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, _ operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.search = search
        self.operation = operation
    }
    
    func replacing(in s: String) -> String {
        operation(s, search)
    }
}
