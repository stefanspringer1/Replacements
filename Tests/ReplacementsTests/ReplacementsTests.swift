import Testing
@testable import Replacements
import RegexTemplates
import RegexTemplatesWithEntities

@Suite struct Tests {
    
    @Test func testReplacementOf2GroupsRegexWithTemplate() async throws {
        let replacement: any Replacement = ReplacementOf2GroupsRegex<String>(search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1")
        }
        #expect(replacement.replacing(in: "Hello") == "Hello ello")
    }
    
    @Test func testReplacementOf2GroupsRegexWithTemplateWithEntities() async throws {
        let replacement: any Replacement = ReplacementOf2GroupsRegex<String>(search: /([a-z]+)/) {
            #replacingWithTemplateWithEntities(in: $0, replacing: $1, withTemplate: "$1&hyphen;$1")
        }
        #expect(replacement.replacing(in: "Hello") == "Hello-ello")
    }
    
    @Test func testReplacementOfCodepointsWithTexts() async throws {
        let replacement = ReplacementOfCodepointsWithTexts<String>([
            0x65: "a",
        ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
    }
    
    @Test func testReplacementOfCodepointsWithCodepoints() async throws {
        let replacement = ReplacementOfCodepointsWithCodepoints<String>([
            0x65: 0x61,
        ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
    }
    
    @Test func testReplacementOfScalarsWithTexts() async throws {
        let replacement = ReplacementOfScalarsWithScalars<String>([
            UnicodeScalar("e"): "a",
        ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
    }
    
    @Test func testReplacementOfScalarsWithScalars() async throws {
        let replacement = ReplacementOfScalarsWithScalars<String>([
            UnicodeScalar("e"): UnicodeScalar("a"),
        ])
        #expect(replacement.replacing(in: "Hello") == "Hallo")
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
