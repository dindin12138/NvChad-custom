local M = {}

M.ui = {
    tabufline = {
        lazyload = false, -- to show tabufline by default
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "clangd",
    },
}

M.nvim_tree = {
    ignore_ft_on_setup = { "dashboard" },
    view = {
        mappings = {
            custom_only = false,
            list = {
                -- Open a file or folder
                { key = { "l", "o", "<CR>" }, action = "edit" },
                -- Open the file in split screen
                { key = "v", action = "vsplit" },
                { key = "h", action = "split" },
                -- Show hidden files
                { key = "i", action = "toggle_git_ignored" },
                { key = ".", action = "toggle_dotfiles" },
                -- File operations
                { key = "<F5>", action = "refresh" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "r", action = "rename" },
                { key = "x", action = "cut" },
                { key = "y", action = "copy" },
                { key = "p", action = "paste" },
            },
        },
    },
}

M.telescope = {
    defaults = {
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
                -- Move up and down
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<Down>"] = "move_selection_next",
                ["<Up>"] = "move_selection_previous",
                -- The historical record
                ["<C-n>"] = "cycle_history_next",
                ["<C-p>"] = "cycle_history_prev",
                -- Close the window
                ["<C-c>"] = "close",
                -- The preview window scrolls up and down
                ["<C-u>"] = "preview_scrolling_up",
                ["<C-d>"] = "preview_scrolling_down",
            }
        }
    },
    extensions_list = { "themes", "terms", "projects" },
}

M.treesitter = {
    ensure_installed = "all",
    ignore_install = { 'phpdoc' },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
}

return M
