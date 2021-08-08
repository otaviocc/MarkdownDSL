# Markdown

This Swift Package implements a Markdown DSL in Swift, using [Result Builders](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md) and [Callable Types](https://github.com/apple/swift-evolution/blob/main/proposals/0253-callable.md).

```swift
let markdown = document {
    section("Section") {
        paragraph {
            "This is a sentence."
            "And this is another sentence."
        }
    }

    section("Another Section") {
        section("Subsection") {
            quote {
                "This is a quote in italic."
                    .textStyle(.italic)
            }

            paragraph {
                "While the example below is a code block:"
            }

            code("swift") {
                #"""
                print("hello world!")
                """#
            }
        }
    }
}
```

## Sections

Sections are one of the most important features in a Markdown file. When writing a Markdown file it's quite easy to misuse `#`, `##`, etc... without thinking of the document hierarchy. This DSL simplifies it by removing from the syntax the section level. Sections are automatically set based on the level they are in the document. Nesting sections creates subsections.

The example below

```swift
section("Title") {
    // ...
}
```

results in

```markdown
# Title
```

while nested sections

```swift
section("Title") {
    section("Subtitle") {
        // ...
    }
}
```

result in

```markdown
# Title
## Subtitle
```

## Paragraphs

Paragraphs are sequences of sentences. The example below

```swift
paragraph {
    "This is a sentence."
    "This is another sentence."
}
```

results in

```markdown
This is a sentence. This is another sentence.
```

## Lists

Another important element in a Markdown is a list. The example below shows a simple list

```swift
list {
    "This is an item"
    "This is another item"
}
```

which, when rendered, results in

```markdown
* This is an item
* This is another item
```

## Quote

```swift
quote {
    "This is something someone said."
}
```

results in

```markdown
> This is something someone said.
```

## Code

Code blocks take an additional parameter used to specify the programming language used in the block

```swift
code("swift") {
    #"""
    func yTown() -> String { "Berlin" }
    """#
}
```

results in

~~~
```swift
func yTown() -> String { "Berlin" }
```
~~~

## Text modifiers

Markdown supports bold and italic texts. These can be set using the `textStyle(:)` modifier.

```swift
"bold text"
    .textStyle(.bold)
```

results in

```markdown
**bold text**
```

while

```swift
"italic text"
    .textStyle(.italic)
```

results in

```markdown
*italic text*
```

### Links

Links are also set via text modifier:

```swift
"this link"
    .link("https://github.com")
```

results in

```markdown
[this link]("https://github.com")
```

## Combining modifiers

Modifiers can be combined to achieve the desired behavior

```swift
"this is a bold link"
    .textStyle(.bold)
    .link("https://github.com")
```

results in

```markdown
[**this is a bold link**]("https://github.com")
```

## Conditionals

Conditionals can be used to decide which Markdown element to display.

```swift
document {
    if showShowCode {
        code("swift") {
            #"""
            func yTown() -> String { "Berlin" }
            """#
        }
    } else {
        paragraph {
            "let's omit the code example instead"
        }
    }
}
```

## Loops

For loops can be used to set a sequence of strings or Markdown elements:

```swift
document {
    for value in (0..<5) {
        paragraph {
            "Paragraph \(value)."
        }
    }

     paragraph {
        for value in (0..<5) {
            "Sentence \(value)."
        }
    }
}
```

## Additional examples

The implementation is covered by Unit Tests, which provide [additional examples](https://github.com/otaviocc/Markdown/tree/main/Tests/MarkdownTests) on how to use and what to expect from this Swift Package.

## Recommendation

This Package isn't supposed to be used in production. This is a simple experiment on how to use [Result Builders](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md) and [Callable Types](https://github.com/apple/swift-evolution/blob/main/proposals/0253-callable.md). I don't have plans to maintain it, but contributions are welcomed.
