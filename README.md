# Replacements

This package might be used to organise your textual replacements.

The package defines the defintion of the protocol `Replacement` with several implementations to define replacements in texts. The `contexts` and `contextsNot` are optional arrays of the generic parameter that can be used by an application, they are not used in this package.

E.g. together with the [RegexTemplates](https://github.com/stefanspringer1/RegexTemplates) package and with `String` as the generic parameter `Context` you could write:

```swift
let replacement: Replacement = ReplacementOf2GroupsRegex<String>(search: /([a-z]+)/) { 
    #replacingWithTemplate(in: $0, replacing: $1, withTemplate: "$1 $1")
}
print(replacement.replacing(in: "Hello")) // prints "Hello ello"
```

A context in the lists `contexts` and `contextsNot` might be `nil`, and you can also initialize a `Replacement` with optional lists of optional contexts (using arguments `contextLists` and `contextNotLists` instead).

For any `Replacement` for a certain context type you can get another `Replacement` with another context type by using a `ContextRewriter<Context,NewContext>` with has a function `rewritingContexts<NewContext>(with contextRewriter: any ContextRewriter<Context,NewContext>) throws -> any Replacement<NewContext>` (see the test `testRewritingContexts`).

All regular expression used should be (unchecked) sendable!

In an analogous way you can also use [RegexTemplatesWithEntities](https://github.com/stefanspringer1/RegexTemplatesWithEntities).

The [FastReplace](https://github.com/stefanspringer1/FastReplace) package is used to be able to define efficient replacements of Unicode scalars and `UInt32` code points.

To get a `UnicodeScalar` for a letter, you simply write e.g. `UnicodeScalar("a")`, and to get the `UInt32` codepoint you can use the [CodepointMacro](https://github.com/stefanspringer1/CodepointMacro) package to write e.g. `#codepoint("a")`.
