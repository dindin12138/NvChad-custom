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

M.cmp = function()
    local cmp = require 'cmp'
    return {
        mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        }
    }
end

M.alpha = function()
    local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

        local opts = {
            position = "center",
            text = txt,
            shortcut = sc,
            cursor = 5,
            width = 36,
            align_shortcut = "right",
            hl = "AlphaButtons",
        }

        if keybind then
            opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
        end

        return {
            type = "button",
            val = txt,
            on_press = function()
                local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
                vim.api.nvim_feedkeys(key, "normal", false)
            end,
            opts = opts,
        }
    end

    return {
        header = {
            val = {
                [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
                [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
                [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
                [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
                [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
                [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
            }
        },
        buttons = {
            val = {
                button("SPC f p", "  Find Projects  ", ":Telescope projects<CR>"),
                button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
                button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
                button("SPC p s", "  Update Plugins  ", ":PackerSync<CR>"),
                button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
            }
        }
    }
end

M.nvim_tree = {
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
