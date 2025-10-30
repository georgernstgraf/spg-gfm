pandoc "$1" -f gfm -t html5 -s \
    --no-highlight \
    --include-in-header ~/svn/georg/EDV/spg-gfm/mermaid-header.html \
    --lua-filter ~/svn/georg/EDV/spg-gfm/mermaid-codeblock.lua \
    --css=file:///home/georg/svn/georg/EDV/spg-gfm/print.css \
    -o out.html
