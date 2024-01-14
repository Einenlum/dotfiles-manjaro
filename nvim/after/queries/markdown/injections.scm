; extends
; ((inline) @_inline (#match? @_inline "^\(import\|export\)")) @tsx

(
 (
    (paragraph) @p (#match? @p "\s*\<")
    .
    (block_quote) @b (#match? @b "\s*\>")
 ) @p_b
) @tsx
