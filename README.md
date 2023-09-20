# DimensionsProposedLayout

An implementation of SwiftUI `Layout` protocol that arrange a view’s size and alignment in its own coordinate space.

## Requirements

- iOS 16.0+, macOS 13.0+, tvOS 16.0+, watchOS 9.0+

## Installation
### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/wlgemini/DimensionsProposedLayout.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

```swift
var body: some View {
    // Text size is expand to it's container
    Text("Hello")
        .dimensionsProposed(width: .container(0), height: .container(0))
}
```

### For size

There are 3 type of proposal: 

- `.container`: size is equal to container.
- `.proposed`: size is proposed.
- `.sizeThatFits`: size that fits.

```graph
┌ <ContainerView> ────────────────────────────┐
│                                             │
│ width = .container                          │
│⇠┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄(200)┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄⇢│
│                                             │
│ width = .proposed(150)                      │
│⇠┄┄┄┄┄┄┄┄┄┄┄┄(150)┄┄┄┄┄┄┄┄┄┄┄┄┄⇢             │
│                                             │
│ width = .sizeThatFits                       │
│⇠┄┄┄┄┄┄┄(100)┄┄┄┄┄┄┄┄⇢                       │
│                                             │
│┏ <ContentView> ━━━━━┓                       │
│┃                    ┃                       │
│┃                    ┃                       │
│┗━━━━━━━━━━━━━━━━━━━━┛                       │
└─────────────────────────────────────────────┘
```

### For alignment

There are many combination with alignment & anchor.

horizontal:

- `.center`
- `.leading`
- `.trailing`

vertical:

- `.center`
- `.top`
- `.bottom`

anchor:

- `.zero`
- `.center`
- `.leading`
- `.trailing`
- `.top`
- `.bottom`
- `.topLeading`
- `.topTrailing`
- `.bottomLeading`
- `.bottomTrailing`
- `init(x: CGFloat, y: CGFloat)` for customizing

```graph
┌ <ContainerView> ──────────────────────────────────┐
│                                    ⇡              │
│                                    ┆              │
│                                <vertical>         │
│                                    ┆              │
│                  ┏ <ContentView> ━━┆━━━━┓         │
│                  ┃                 ┆    ┃         │
│                  ┃                 ⇣    ┃         │
│⇠┄ <horizontal> ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄⇢+    ┃         │
│                  ┃                      ┃         │
│                  ┗━━━━━━━━━━━━━━━━━━━━━━┛         │
│                                                   │
└───────────────────────────────────────────────────┘
```

Examples:

```graph
┌ <ContainerView> ──────────────────────────────────┐
│                                                   │
│ horizontal = .leading(100)                        │
│ anchor = .center                                  │
│                                                   │
│             ┏ <ContentView> ━━┓                   │
│             ┃                 ┃                   │
│⇠┄┄┄┄┄┄┄(100)┄┄┄┄┄┄┄┄⇢+        ┃                   │
│             ┃                 ┃                   │
│             ┗━━━━━━━━━━━━━━━━━┛                   │
└───────────────────────────────────────────────────┘

┌ <ContainerView> ──────────────────────────────────┐
│                                                   │
│ horizontal = .leading(100)                        │
│ anchor = .leading                                 │
│                                                   │
│                      ┏ <ContentView> ━━┓          │
│                      ┃                 ┃          │
│⇠┄┄┄┄┄┄┄(100)┄┄┄┄┄┄┄┄⇢+                 ┃          │
│                      ┃                 ┃          │
│                      ┗━━━━━━━━━━━━━━━━━┛          │
└───────────────────────────────────────────────────┘

┌ <ContainerView> ──────────────────────────────────┐
│                                                   │
│ horizontal = .trailing(-100)                      │
│ anchor = .trailing                                │
│                                                   │
│          ┏ <ContentView> ━━┓                      │
│          ┃                 ┃                      │
│          ┃                 +⇠┄┄┄┄┄┄┄(100)┄┄┄┄┄┄┄┄⇢│
│          ┃                 ┃                      │
│          ┗━━━━━━━━━━━━━━━━━┛                      │
└───────────────────────────────────────────────────┘
```

### For constant

Every proposal has a `constant` for adjustment.

## Author

wlgemini, wangluguang@live.com

## License

DimensionsProposedLayout is available under the MIT license. See the LICENSE file for more info.
