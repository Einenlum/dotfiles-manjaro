local api = vim.api
local M = {}

local commands = {
    -- Import class
    "nmap <buffer> <Leader>u :call phpactor#UseAdd()<CR>",

    -- Invoke the context menu
    "nmap <buffer> <Leader>mm :call phpactor#ContextMenu()<CR>",

    -- Invoke the navigation menu
    "nmap <buffer> <Leader>an :call phpactor#Navigate()<CR>",

    -- Goto definition of class or class member under the cursor
    "nmap <buffer> <Leader>gt :call phpactor#GotoDefinition()<CR>",

    -- Show brief information about the symbol under the cursor
    "nmap <buffer> <Leader>K :call phpactor#Hover()<CR>",

    -- Transform the classes in the current file
    "nmap <buffer> <Leader>tt :call phpactor#Transform()<CR>",

    -- Extract expression (normal mode)
    "nmap <buffer> <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>",

    --Extract expression from selection
    "vmap <buffer> <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>",

    -- Extract method from selection
    "vmap <buffer> <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>",
}

local create_class_commands = {
    {"cc", "strict-class"},
    {"ci", "interface"},
    {"ct", "trait"},
}

function create_php_class_call(variant_name)
    return string.format(
        'call phpactor#rpc("class_new", { "current_path": phpactor#_path(), "variant": "%s", "new_path": phpactor#_path(), "overwrite_existing": 1 })',
        variant_name
    )
end

function M.setup(groups)
    for _, command in ipairs(commands) do
        api.nvim_create_autocmd("FileType php", {
            command = command,
            group = groups.php,
        })
    end

    for _, create_class_command in ipairs(create_class_commands) do
        local mapping = create_class_command[1]
        local variant_name = create_class_command[2]
        local full_command = string.format(
            "nmap <buffer> <Leader>%s :%s<CR>",
            mapping,
            create_php_class_call(variant_name)
        )

        api.nvim_create_autocmd("FileType php", {
            command = full_command,
            group = groups.php,
        })
    end
end

return M
