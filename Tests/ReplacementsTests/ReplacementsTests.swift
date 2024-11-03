import Testing
@testable import Replacements
import RegexTemplates
import RegexTemplatesWithEntities

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

@Test func testReplacementOfCodepointsWithCodepoints() async throws {
    let replacement = ReplacementOfCodepointsWithCodepoints([
        0x65: 0x61,
    ])
    #expect(replacement.replacing(in: "Hello") == "Hallo")
}

@Test func testReplacementOfScalarsWithTexts() async throws {
    let replacement = ReplacementOfScalarsWithScalars([
        UnicodeScalar("e"): "a",
    ])
    #expect(replacement.replacing(in: "Hello") == "Hallo")
}

@Test func testReplacementOfScalarsWithScalars() async throws {
    let replacement = ReplacementOfScalarsWithScalars([
        UnicodeScalar("e"): UnicodeScalar("a"),
    ])
    #expect(replacement.replacing(in: "Hello") == "Hallo")
}
