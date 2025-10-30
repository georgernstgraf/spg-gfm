pandoc Mermaid_Graph.md -f gfm -t html5 -s \
  --include-in-header ~/svn/georg/EDV/spg-gfm/mermaid-header.html \
  --lua-filter ~/svn/georg/EDV/spg-gfm/mermaid-codeblock.lua \
  -o out.html
