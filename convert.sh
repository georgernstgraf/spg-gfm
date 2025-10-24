pandoc Mermaid_Graph.md -f gfm -t html5 -s \
  --include-in-header mermaid-header.html \
  --lua-filter mermaid-codeblock.lua \
  -o out.html
