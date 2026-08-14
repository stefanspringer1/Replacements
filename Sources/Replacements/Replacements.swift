import FastReplace

public protocol Replacement<Context>: Sendable {
    
    associatedtype Context
    
    var description: String? { get }
    var contexts: [Context]? { get }
    var contextsNot: [Context]? { get }
    func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext>
    func replacing(in text: String) -> String
}

public protocol ContextRewriter<Context,NewContext> {
    
    associatedtype Context
    associatedtype NewContext
    
    func rewrite(_ context: Context) throws -> NewContext
    
}

public struct ReplacementOfTextWithText<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: String
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: String, replacement: String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfTextWithText<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in text: String) -> String {
        text.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfTextsWithTexts<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let searchAndReplacement: [(String,String)]
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, searchAndReplacement: [(String,String)]) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.searchAndReplacement = searchAndReplacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfTextsWithTexts<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            searchAndReplacement: searchAndReplacement
        )
    }
    
    public func replacing(in _text: String) -> String {
        var text = _text
        for (search,replacement) in searchAndReplacement {
            text.replace(search, with: replacement)
        }
        return text
    }
    
}

public struct ReplacementOfRegexWithText<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: any RegexComponent
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: any RegexComponent, replacement: String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfRegexWithText<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfScalarWithScalar<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: UnicodeScalar
    let replacement: UnicodeScalar
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: UnicodeScalar, replacement: UnicodeScalar) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfScalarWithScalar<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfScalarsWithScalars<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let map: [UnicodeScalar:UnicodeScalar]
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UnicodeScalar:UnicodeScalar]) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public init(contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UnicodeScalar:UnicodeScalar]) {
        self.description = nil
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfScalarsWithScalars<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            map
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(map)
    }
    
}

public struct ReplacementOfScalarsWithTexts<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let map: [UnicodeScalar:String]
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UnicodeScalar:String]) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public init(contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UnicodeScalar:String]) {
        self.description = nil
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfScalarsWithTexts<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            map
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(map)
    }
    
}

public struct ReplacementOfScalarWithText<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: UnicodeScalar
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: UnicodeScalar, replacement: String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfScalarWithText<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfCodepointWithCodepoint<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: UInt32
    let replacement: UInt32
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: UInt32, replacement: UInt32) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfCodepointWithCodepoint<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfCodepointWithText<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let search: UInt32
    let replacement: String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: UInt32, replacement: String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.replacement = replacement
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfCodepointWithText<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            replacement: replacement
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(search, with: replacement)
    }
    
}

public struct ReplacementOfCodepointsWithCodepoints<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let map: [UInt32:UInt32]
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UInt32:UInt32]) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public init(contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UInt32:UInt32]) {
        self.description = nil
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfCodepointsWithCodepoints<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            map
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(map)
    }
    
}

public struct ReplacementOfCodepointsWithTexts<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    let map: [UInt32:String]
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UInt32:String]) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public init(contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, _ map: [UInt32:String]) {
        self.description = nil
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.map = map
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOfCodepointsWithTexts<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            map
        )
    }
    
    public func replacing(in s: String) -> String {
        s.replacing(map)
    }
    
}

public struct ReplacementOf1GroupRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring)>
    private let operation: (String, Regex<(Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring)>, operation: @escaping (String, Regex<(Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf1GroupRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf2GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf2GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf3GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf3GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf4GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf4GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf5GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf5GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf6GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf6GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf7GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf7GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf8GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf8GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf9GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf9GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementOf10GroupsRegex<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>
    private let operation: (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, search: Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>, operation: @escaping (String, Regex<(Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring, Substring)>) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.search = search
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementOf10GroupsRegex<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            search: search,
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s, search)
    }
}

public struct ReplacementByOperation<Context>: Replacement<Context>, @unchecked Sendable {
    
    public let description: String?
    public let contexts: [Context]?
    public let contextsNot: [Context]?
    
    private let operation: (String) -> String
    
    public init(_ description: String? = nil, contexts: [Context?]? = nil, contextsNot: [Context?]? = nil, operation: @escaping (String) -> String) {
        self.description = description
        self.contexts = contexts?.compactMap{ $0 }
        self.contextsNot = contextsNot?.compactMap{ $0 }
        self.operation = operation
    }
    
    public func rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext> {
        ReplacementByOperation<NewContext>(
            description,
            contexts: try contexts?.map{ try contextRewriter.rewrite($0) },
            contextsNot: try contextsNot?.map{ try contextRewriter.rewrite($0) },
            operation: operation
        )
    }
    
    public func replacing(in s: String) -> String {
        operation(s)
    }
}
