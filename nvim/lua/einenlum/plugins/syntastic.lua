vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
-- let g:syntastic_check_on_open = 1
vim.g.syntastic_check_on_open = 0
vim.g.syntastic_check_on_wq = 0

-- Syntastic configuration for PHP
vim.g.syntastic_php_checkers = {'php', 'phpcs'}
vim.g.syntastic_php_phpcs_exec = './vendor/bin/phpcs'
vim.g.syntastic_php_phpcs_args = '--standard=psr12'

-- Syntastic configuration for Python
vim.g.syntastic_python_checkers = {'pylint'}
vim.g.syntastic_python_pylint_args = "--load-plugins pylint_django --disable=C0111"

-- Disable syntastic for twig
vim.g.syntastic_filetype_map = {['html.twig'] = 'twig'}

-- Set smaller height for syntastic 
vim.g.syntastic_loc_list_height = 5
