import Testing
@testable import Replacements
import RegexTemplates
import RegexTemplatesWithEntities

@Suite struct Tests {
    
    @Test func testReplacementOf2GroupsRegexWithTemplate() async throws {
        let replacement: any Replacement = ReplacementOf2GroupsRegex<String>(search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        #expect(replacement.replacing(in: "Hello") == "Hello ello")
        
        // check compilation of variants:
        
        // without context, but with description:
        let _ = ReplacementOf2GroupsRegex<String>("description", search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        
        // with `nil` contexts:
        let _ = ReplacementOf2GroupsRegex<String>(contexts: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contexts: nil, contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: nil, contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        
        // with non-`nil` contexts:
        let _ = ReplacementOf2GroupsRegex<String>(contexts: ["context1"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contexts: ["context1"], contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: ["context1"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: ["context1"], contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        
        // with `nil` context lists:
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: nil, contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: nil, contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        
        // with non-`nil` context lists:
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: [["context1"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: [["context1"]], contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: [["context1"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: [["context1"]], contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        
        // with mixed contexts / contexts lists:
        let _ = ReplacementOf2GroupsRegex<String>(contexts: ["context1"], contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contexts: nil, contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: ["context1"], contextsNot: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contexts: nil, contextsNot: ["context2"], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: [["context1"]], contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>(contextLists: nil, contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: [["context1"]], contextNotLists: nil, search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
        let _ = ReplacementOf2GroupsRegex<String>("description", contextLists: nil, contextNotLists: [["context2"]], search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1") }
    }
    
    @Test func testReplacementOf2GroupsRegexWithTemplateWithEntities() async throws {
        let replacement: any Replacement = ReplacementOf2GroupsRegex<String>(search: /([a-z]+)/) { #replacingWithTemplateWithEntities(in: $0, replacing: $1, withTemplate: "$1&hyphen;$1") }
        #expect(replacement.replacing(in: "Hello") == "Hello-ello")
    }
    
    @Test func testReplacementOfCodepointsWithTexts() async throws {
        let replacement = ReplacementOfCodepointsWithTexts<String>([ 0x65: "a", ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
        
        // check compilation of variants:
        
        // without context, but with description:
        let _ = ReplacementOfCodepointsWithTexts<String>("description", [ 0x65: "a", ])
        
        // with `nil` contexts:
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextsNot: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: nil, contextsNot: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextsNot: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: nil, contextsNot: nil, [ 0x65: "a", ])
        
        // with non-`nil` contexts:
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: ["context1"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextsNot: ["context2"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: ["context1"], contextsNot: ["context2"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: ["context1"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextsNot: ["context2"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: ["context1"], contextsNot: ["context2"], [ 0x65: "a", ])
        
        // with `nil` context lists:
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextNotLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: nil, contextNotLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextNotLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: nil, contextNotLists: nil, [ 0x65: "a", ])
        
        // with non-`nil` context lists:
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: [["context1"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextNotLists: [["context2"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: [["context1"]], contextNotLists: [["context2"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: [["context1"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextNotLists: [["context2"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: [["context1"]], contextNotLists: [["context2"]], [ 0x65: "a", ])
        
        // with mixed contexts / contexts lists:
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: ["context1"], contextsNot: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contexts: nil, contextsNot: ["context2"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: ["context1"], contextsNot: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contexts: nil, contextsNot: ["context2"], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: [["context1"]], contextNotLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>(contextLists: nil, contextNotLists: [["context2"]], [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: [["context1"]], contextNotLists: nil, [ 0x65: "a", ])
        let _ = ReplacementOfCodepointsWithTexts<String>("description", contextLists: nil, contextNotLists: [["context2"]], [ 0x65: "a", ])
    }
    
    @Test func testReplacementOfCodepointsWithCodepoints() async throws {
        let replacement = ReplacementOfCodepointsWithCodepoints<String>(contexts: nil, [ 0x65: 0x61, ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
        
        // check compilation of variants:
        
        // without context, but with description:
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", [ 0x65: 0x61, ])
        
        // with `nil` contexts:
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextsNot: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: nil, contextsNot: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextsNot: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: nil, contextsNot: nil, [ 0x65: 0x61, ])
        
        // with non-`nil` contexts:
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: ["context1"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextsNot: ["context2"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: ["context1"], contextsNot: ["context2"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: ["context1"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextsNot: ["context2"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: ["context1"], contextsNot: ["context2"], [ 0x65: 0x61, ])
        
        // with `nil` context lists:
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextNotLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: nil, contextNotLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextNotLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: nil, contextNotLists: nil, [ 0x65: 0x61, ])
        
        // with non-`nil` context lists:
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: [["context1"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextNotLists: [["context2"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: [["context1"]], contextNotLists: [["context2"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: [["context1"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextNotLists: [["context2"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: [["context1"]], contextNotLists: [["context2"]], [ 0x65: 0x61, ])
        
        // with mixed contexts / contexts lists:
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: ["context1"], contextsNot: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contexts: nil, contextsNot: ["context2"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: ["context1"], contextsNot: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contexts: nil, contextsNot: ["context2"], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: [["context1"]], contextNotLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>(contextLists: nil, contextNotLists: [["context2"]], [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: [["context1"]], contextNotLists: nil, [ 0x65: 0x61, ])
        let _ = ReplacementOfCodepointsWithCodepoints<String>("description", contextLists: nil, contextNotLists: [["context2"]], [ 0x65: 0x61, ])
    }
    
    @Test func testReplacementOfScalarsWithTexts() async throws {
        let replacement = ReplacementOfScalarsWithTexts<String>([ UnicodeScalar("e"): "a", ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
        
        // check compilation of variants:

        // without context, but with description:
        let _ = ReplacementOfScalarsWithTexts<String>("description", [ UnicodeScalar("e"): "a", ])
        
        // with `nil` contexts:
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: nil, contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: nil, contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        
        // with non-`nil` contexts:
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: ["context1"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: ["context1"], contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: ["context1"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: ["context1"], contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        
        // with `nil` context lists:
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: nil, contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: nil, contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        
        // with non-`nil` context lists:
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: [["context1"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: [["context1"]], contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: [["context1"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: [["context1"]], contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
        
        // with mixed contexts / contexts lists:
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: ["context1"], contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contexts: nil, contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: ["context1"], contextsNot: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contexts: nil, contextsNot: ["context2"], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: [["context1"]], contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>(contextLists: nil, contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: [["context1"]], contextNotLists: nil, [ UnicodeScalar("e"): "a", ])
        let _ = ReplacementOfScalarsWithTexts<String>("description", contextLists: nil, contextNotLists: [["context2"]], [ UnicodeScalar("e"): "a", ])
    }
    
    @Test func testReplacementOfScalarsWithScalars() async throws {
        let replacement = ReplacementOfScalarsWithScalars<String>([ UnicodeScalar("e"): UnicodeScalar("a"), ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
        
        // check compilation of variants:

        // without context, but with description:
        let _ = ReplacementOfScalarsWithScalars<String>("description", [ UnicodeScalar("e"): UnicodeScalar("a"), ])

        // with `nil` contexts:
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: nil, contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: nil, contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])

        // with non-`nil` contexts:
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: ["context1"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: ["context1"], contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: ["context1"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: ["context1"], contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])

        // with `nil` context lists:
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: nil, contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: nil, contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])

        // with non-`nil` context lists:
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: [["context1"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: [["context1"]], contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: [["context1"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: [["context1"]], contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])

        // with mixed contexts / contexts lists:
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: ["context1"], contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contexts: nil, contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: ["context1"], contextsNot: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contexts: nil, contextsNot: ["context2"], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: [["context1"]], contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>(contextLists: nil, contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: [["context1"]], contextNotLists: nil, [ UnicodeScalar("e"): UnicodeScalar("a"), ])
        let _ = ReplacementOfScalarsWithScalars<String>("description", contextLists: nil, contextNotLists: [["context2"]], [ UnicodeScalar("e"): UnicodeScalar("a"), ])
    }
    
    @Test func testRewritingContexts() async throws {
        let replacement = ReplacementOfTextWithText<String>(
            contexts: ["paragraph"],
            search: "H",
            replacement: "HH"
        )
        
        struct StringToIntContextRewriter: ContextRewriter<String, Int> {
            func rewrite(_ context: String) -> Int {
                switch context {
                case "paragraph": 1
                default: 0
                }
            }
        }
        
        let newReplacement: any Replacement<Int> = try replacement.rewritingContexts(with: StringToIntContextRewriter())
        
        #expect(newReplacement.replacing(in: "Hello") == "HHello")
    }
    
}
