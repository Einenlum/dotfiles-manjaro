local autogroups = require('einenlum.autogroups')

require('einenlum.neovide')
require('einenlum.plug')
require('einenlum.plugins')
require('einenlum.set')
require('einenlum.bindings')
require('einenlum.colors')

local autocmds = require'einenlum.autocmds'.setup(autogroups)
