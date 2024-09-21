require('fzf-lua').setup {
    keymap = {
        fzf = {
            ["home"] = "first",
            ["end"]  = "last",
        },
    },
    colorschemes = {
        ignore_patterns = {
            "^blue$",
            "^darkblue$",
            "^default$",
            "^delek$",
            "^desert$",
            "^elflord$",
            "^evening$",
            "^habamax$",
            "^industry$",
            "^koehler$",
            "^lunaperche$",
            "^morning$",
            "^murphy$",
            "^pablo$",
            "^peachpuff$",
            "^quiet$",
            "^ron$",
            "^shine$",
            "^slate$",
            "^torte$",
            "^zellner$",
        }
    }
}
