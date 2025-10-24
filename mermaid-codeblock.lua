-- Convert ```mermaid code fences into <div class="mermaid">...</div>
local function has_class(el, class)
  for _, c in ipairs(el.classes) do
    if c == class then return true end
  end
  return false
end

function CodeBlock(block)
  if has_class(block, "mermaid") then
    return pandoc.RawBlock("html", '<div class="mermaid">\n' .. block.text .. '\n</div>')
  end
end
