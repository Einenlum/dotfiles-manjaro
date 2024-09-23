local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local f = ls.function_node

local filename_to_classname = function()
    local filename = vim.fn.expand('%:t:r')
    return filename
end

-- Cache for PSR-4 mappings
local psr4_mappings_cached = nil

local filepath_to_namespace = function()
    local filepath = vim.fn.expand('%:p')
    local project_root = vim.fn.getcwd()

    -- Use cached PSR-4 mappings if available
    if psr4_mappings_cached == nil then
        -- Read composer.json
        local composer_file = project_root .. '/composer.json'
        local composer_content = ''
        if vim.fn.filereadable(composer_file) == 1 then
            composer_content = table.concat(vim.fn.readfile(composer_file), '\n')
        else
            -- Return nil to indicate an error
            return nil
        end

        -- Parse JSON content
        local success, composer_json = pcall(vim.fn.json_decode, composer_content)
        if not success then
            -- Return nil to indicate an error
            return nil
        end

        -- Get PSR-4 mappings
        local psr4 = {}
        if composer_json['autoload'] and composer_json['autoload']['psr-4'] then
            for namespace, path in pairs(composer_json['autoload']['psr-4']) do
                psr4[namespace] = path
            end
        end
        if composer_json['autoload-dev'] and composer_json['autoload-dev']['psr-4'] then
            for namespace, path in pairs(composer_json['autoload-dev']['psr-4']) do
                psr4[namespace] = path
            end
        end

        -- Cache the PSR-4 mappings
        psr4_mappings_cached = psr4
    end

    local psr4 = psr4_mappings_cached

    -- Normalize file paths
    local relative_path = filepath:sub(#project_root + 2)  -- +2 to skip the '/' character
    relative_path = relative_path:gsub('\\', '/')

    for namespace, path in pairs(psr4) do
        -- Ensure path ends with '/'
        if not path:match('/$') then
            path = path .. '/'
        end

        local mapping_path = path:gsub('\\', '/')
        -- Check if the file is within the mapping path
        if relative_path:sub(1, #mapping_path) == mapping_path then
            -- Get the subpath after the base path
            local subpath = relative_path:sub(#mapping_path + 1)

            -- Remove the filename from subpath
            subpath = subpath:gsub('/[^/]+$', '')  -- Remove '/filename'

            -- Convert to namespace separators
            subpath = subpath:gsub('/', '\\')

            local full_namespace = namespace .. subpath
            -- Remove trailing backslash
            full_namespace = full_namespace:gsub('\\$', '')
            return full_namespace
        end
    end

    -- Default to global namespace if no match found
    return ''
end

-- Condition function to check if composer.json can be read and parsed
local function composer_json_available()
    local project_root = vim.fn.getcwd()
    local composer_file = project_root .. '/composer.json'
    if vim.fn.filereadable(composer_file) == 1 then
        local composer_content = table.concat(vim.fn.readfile(composer_file), '\n')
        local success, _ = pcall(vim.fn.json_decode, composer_content)
        return success
    else
        return false
    end
end

ls.add_snippets('php', {
    s('class',
        fmt([[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
    {}
}}
]], {
                f(function()
                    local namespace = filepath_to_namespace()
                    if namespace == nil then
                        -- Return empty string if an error occurred
                        return ''
                    else
                        return namespace
                    end
                end),
                f(function() return filename_to_classname() end),
                i(0)
            }),
            {
                -- Only expand the snippet if composer.json is available
                condition = composer_json_available
            }
        )
})
