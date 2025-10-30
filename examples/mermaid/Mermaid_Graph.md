# Example: Graphs in GFM (GitHub Flavored Markdown)

## Mermaid UML

```mermaid
classDiagram
direction LR
  class User {
    -UUID id
    -string name
    -string email
    -Date createdAt
    -Date updatedAt
    +getId(): UUID
    +setId(id: UUID): void
    +getName(): string
    +setName(name: string): void
    +getEmail(): string
    +setEmail(email: string): void
    +getCreatedAt(): Date
    +setCreatedAt(createdAt: Date): void
    +getUpdatedAt(): Date
    +setUpdatedAt(updatedAt: Date): void
    +createPost(title: string, body: string): Post
    +getPosts(): Post[]
  }

  class Post {
    +UUID id
    +UUID userId
    +string title
    +string body
    +Date publishedAt
    +boolean published
    +publish(): void
  }

  User "1" --> "0..*" Post : authors
```

## Mermaid: K5

```mermaid
graph LR
  A((A))
  B((B))
  C((C))
  D((D))
  E((E))
  A --- B
  A --- C
  A --- D
  A --- E
  B --- C
  B --- D
  B --- E
  C --- D
  C --- E
  D --- E
```

## Mermaid: K8

```mermaid
graph LR
  A((A))
  B((B))
  C((C))
  D((D))
  E((E))
  F((F))
  G((G))
  H((H))

  A --- B
  A --- C
  A --- D
  A --- E
  A --- F
  A --- G
  A --- H

  B --- C
  B --- D
  B --- E
  B --- F
  B --- G
  B --- H

  C --- D
  C --- E
  C --- F
  C --- G
  C --- H

  D --- E
  D --- F
  D --- G
  D --- H

  E --- F
  E --- G
  E --- H

  F --- G
  F --- H

  G --- H
```

## Mermaid: ER Diagram (Generiert von Prisma)

```mermaid
erDiagram

  "Airplane" {
    String id "🗝️"
    String name
    }


  "Flight" {
    String id "🗝️"
    DateTime when
    }


  "Airport" {
    String id "🗝️"
    String name
    }


  "Passenger" {
    String id "🗝️"
    String email
    String fullname
    }

    "Flight" o{--}o "Passenger" : "bookings"
    "Flight" o|--|| "Airport" : "fromAirport"
    "Flight" o|--|| "Airport" : "toAirport"
    "Flight" o|--|| "Airplane" : "Airplane"
```

## Mermaid: Undirected and Styled

```mermaid
graph LR
  A[Alpha] --- B[Beta]
  B -- weight: 3 --> C[Gamma]
  C -. dashed .-> D[Delta]

  %% Node shapes
  A((Circle))
  B{{Hexagon}}
  C([Round Rect])
  D>Asymmetric]

  %% Styling classes
  classDef highlight fill:#ffe0b2,stroke:#e65100,stroke-width:2px;
  classDef muted fill:#f5f5f5,stroke:#9e9e9e,color:#616161;

  A:::highlight
  D:::muted
```

## Mermaid: Subgraphs and Links

```mermaid
graph TB
  subgraph "Cluster 1"
    A1[Parser] --> A2[AST]
  end

  subgraph "Cluster 2"
    B1[Analyzer] --> B2[IR]
  end

  A2 -. passes .-> B1
  B2 --> C[Codegen]

  click A1 "https://en.wikipedia.org/wiki/Parsing" "Parsing"
  click C "https://en.wikipedia.org/wiki/Code_generation" "Code generation"
```

## Mermaid: ER Diagram (alternative for relationships)

```mermaid
erDiagram
  USER ||--o{ ORDER : places
  ORDER ||--|{ LINE_ITEM : contains
  PRODUCT ||--o{ LINE_ITEM : "listed in"
  USER {
    int id
    string email
  }
  ORDER {
    int id
    date placed_at
  }
  PRODUCT {
    int id
    string name
    float price
  }
```

## Fallback: Embed a pre-rendered Graphviz SVG

If you prefer DOT syntax, render locally and commit the SVG.

Example DOT file (`graph.dot`):

```text
digraph G {
  rankdir=LR;
  node [shape=rectangle, style=rounded];
  Start -> "Parse Input";
  "Parse Input" -> "Validate" [label="ok"];
  "Parse Input" -> "Error" [label="fail"];
  "Validate" -> "Execute";
  "Execute" -> End;
  "Error" [shape=ellipse, color=red];
}
```

Render to SVG:

```bash
dot -Tsvg graph.dot -o graph.svg
```

Then reference it in Markdown:

![Graphviz Diagram](./graph.svg)

Notes:

- GitHub renders Mermaid blocks directly in `.md` files and PRs.
- Graphviz/DOT does not render on GitHub; pre-render to SVG/PNG.
- Keep diagrams small and focused for readability in README views.
