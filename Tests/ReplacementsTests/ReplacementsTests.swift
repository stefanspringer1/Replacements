import Testing
@testable import Replacements
import RegexTemplates
import RegexTemplatesWithEntities

@Test func xxx() async throws {
    
    func test1(_ text: String? = nil) {}
    test1() // OK
    
    func test2(_ text: String? = nil, _ array: [Int]) {}
    
    test2("hello", [1, 2, 3]) // OK
    test2([1, 2, 3]) // OK
    
}

@Test func testReplacementOf2GroupsRegexWithTemplate() async throws {
    let replacement: Replacement = ReplacementOf2GroupsRegex(search: /([a-z]+)/) { #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1")
    }
    #expect(replacement.replacing(in: "Hello") == "Hello ello")
}

@Test func testReplacementOf2GroupsRegexWithTemplateWithEntities() async throws {
    let replacement: Replacement = ReplacementOf2GroupsRegex(search: /([a-z]+)/) {
        #replacingWithTemplateWithEntities(in: $0, replacing: $1, withTemplate: "$1&hyphen;$1")
    }
    #expect(replacement.replacing(in: "Hello") == "Hello-ello")
}

@Test func testReplacementOfCodepointsWithTexts() async throws {
    let replacement = ReplacementOfCodepointsWithTexts([
        0x65: "a",
    ])
    #expect(replacement.replacing(in: "Hello") == "Hallo")
}

ReplacementOfScalarsWithScalars

@Test func testReplacementOfCodepointsWithCodepoints() async throws {
    let replacement = ReplacementOfCodepointsWithTexts([
        0x65: 0x62,
    ])
    #expect(replacement.replacing(in: "Hello") == "Hallo")
}
