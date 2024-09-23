local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local f = ls.function_node

local filename_to_classname = function()
    local filename = vim.fn.expand('%:t:r')
    return filename
end

local filepath_to_namespace = function()
    local filepath = vim.fn.expand('%:p')
    local project_root = vim.fn.getcwd()
    local relative_path = filepath:sub(#project_root + 2)
    local namespace = relative_path:match('app[/\\](.*)[/\\][^/\\]*%.php$')
    if namespace then
        namespace = namespace:gsub('[/\\]', '\\')
        namespace = 'App\\' .. namespace
    else
        namespace = 'App'
    end
    return namespace
end

ls.add_snippets('php', {
    s('class', fmt([[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
    {}
}}
]], {
        f(function() return filepath_to_namespace() end),
        f(function() return filename_to_classname() end),
        i(0)
    }))
})
