require("mason-nvim-dap").setup({
    ensure_installed = {"php", "python"}
})
local dap = require("dap")

local xdebug_port = 9003
local xdebug_path_server = os.getenv('NVIM_XDEBUG_PATH_SERVER')
local xdebug_path_local = '${workspaceFolder}'

if (xdebug_port and xdebug_path_server and xdebug_path_local) then
	dap.adapters.php = {
		type = 'executable',
		command = 'node',
		args = { vim.fn.stdpath('data') .. '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
	}

	dap.configurations.php = {
		{
			type = 'php',
			request = 'launch',
			name = 'Listen for Xdebug',
			port = xdebug_port,
			pathMappings = {
				[xdebug_path_server] = xdebug_path_local,
			},
		},
	}
end

vim.keymap.set('n', '<F2>', dap.step_over)
vim.keymap.set('n', '<F3>', dap.step_into)
vim.keymap.set('n', '<F4>', dap.step_out)
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F6>', dap.terminate)
vim.keymap.set('n', '<F10>', dap.toggle_breakpoint)
vim.keymap.set('n', '<F11>', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)

local dapui = require('dapui')
dapui.setup({
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
	layouts = {
		{
			elements = {
				'stacks',
				'scopes',
			},
			size = 0.25,
			position = 'bottom',
		},
		{
			elements = {
				'watches',
				'breakpoints',
			},
			size = 40,
			position = 'left',
		},
	}
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.disconnect["dapui_config"] = function()
	dapui.close()
end
