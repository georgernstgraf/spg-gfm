# Example: Graphs in GFM (GitHub Flavored Markdown)

## Mermaid: Undirected Graph

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

## Mermaid: ER Diagram (Generiert von Prisma)

```mermaid
erDiagram

  "OrderDetails" {
    Int OrderDetailID "🗝️"
    Int Quantity "❓"
    }


  "categories" {
    Int CategoryID "🗝️"
    String CategoryName "❓"
    String Description "❓"
    }


  "customers" {
    Int CustomerID "🗝️"
    String CustomerName "❓"
    String ContactName "❓"
    String Address "❓"
    String City "❓"
    String PostalCode "❓"
    String Country "❓"
    }


  "employees" {
    Int EmployeeID "🗝️"
    String LastName "❓"
    String FirstName "❓"
    DateTime BirthDate "❓"
    String Photo "❓"
    String Notes "❓"
    }


  "orders" {
    Int OrderID "🗝️"
    DateTime OrderDate "❓"
    }


  "products" {
    Int ProductID "🗝️"
    String ProductName "❓"
    String Unit "❓"
    Float Price "❓"
    }


  "shippers" {
    Int ShipperID "🗝️"
    String ShipperName "❓"
    String Phone "❓"
    }


  "suppliers" {
    Int SupplierID "🗝️"
    String SupplierName "❓"
    String ContactName "❓"
    String Address "❓"
    String City "❓"
    String PostalCode "❓"
    String Country "❓"
    String Phone "❓"
    }

    "OrderDetails" o|--|o "products" : "products"
    "OrderDetails" o|--|o "orders" : "orders"
    "categories" o{--}o "products" : ""
    "customers" o{--}o "orders" : ""
    "employees" o{--}o "orders" : ""
    "orders" o|--|o "shippers" : "shippers"
    "orders" o|--|o "employees" : "employees"
    "orders" o|--|o "customers" : "customers"
    "products" o|--|o "suppliers" : "suppliers"
    "products" o|--|o "categories" : "categories"
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
