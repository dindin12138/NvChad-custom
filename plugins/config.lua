local M = {}

M.ui = {
    tabufline = {
        lazyload = false -- to show tabufline by default
    }
}

M.catppuccin = function()
    require("catppuccin").setup()
end

M.mason = {
    ensure_installed = {
        -- language server
        "lua-language-server",
        "clangd",
        "rust-analyzer",
        "pyright",
        "bash-language-server",
        -- formatter
        "clang-format",
        "stylua"
    }
}

M.null_ls = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
        return
    end
    local b = null_ls.builtins
    local sources = {
        b.formatting.stylua,
        b.formatting.clang_format
    }
    null_ls.setup {
        debug = true,
        sources = sources
    }
end

M.cmp = function()
    local cmp = require "cmp"
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
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
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
            })
        }
    }
end

M.dashboard = function()
    local db = require('dashboard')
    db.custom_header = {
        [[]],
        [[]],
        [[]],
        [[]],
        [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
        [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
        [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        [[]],
        [[]],
        [[]],
        [[]],
    }
    db.custom_center = {
        {
            icon = '  ',
            desc = 'Projects                                ',
            action = 'Telescope projects',
            shortcut = 'SPC f p'
        },
        {
            icon = '  ',
            desc = 'Recently Files                          ',
            action = 'Telescope oldfiles',
            shortcut = 'SPC f o'
        },
        {
            icon = '  ',
            desc = 'Find Files                              ',
            action = 'Telescope find_files',
            shortcut = 'SPC f f'
        },
        {
            icon = '  ',
            desc = 'Update Plugins                          ',
            action = 'PackerSync',
            shortcut = 'SPC l s'
        },
        {
            icon = '  ',
            desc = 'Edit Config                             ',
            action = 'edit ~/.config/nvim/lua/custom/chadrc.lua',
            shortcut = 'SPC x x'
        },
        {
            icon = '  ',
            desc = 'Edit Projects                           ',
            action = 'edit ~/.local/share/nvim/project_nvim/project_history',
            shortcut = 'SPC x x'
        },
    }
    db.custom_footer = { 'Talk is cheap. Show me the code.' }
end

M.nvim_tree = {
    disable_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    hijack_cursor = true,
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    git = { enable = false, ignore = false },
    filters = { dotfiles = true },
    view = {
        width = 25,
        hide_root_folder = true,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "o", "<CR>" }, action = "edit" },
                { key = "v", action = "vsplit" },
                { key = "h", action = "split" },
                { key = "i", action = "toggle_git_ignored" },
                { key = ".", action = "toggle_dotfiles" },
                { key = "<F5>", action = "refresh" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "r", action = "rename" },
                { key = "x", action = "cut" },
                { key = "y", action = "copy" },
                { key = "p", action = "paste" }
            }
        }
    }
}

M.telescope = {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<Down>"] = "move_selection_next",
                ["<Up>"] = "move_selection_previous",
                ["<C-n>"] = "cycle_history_next",
                ["<C-p>"] = "cycle_history_prev",
                ["<C-c>"] = "close",
                ["<C-u>"] = "preview_scrolling_up",
                ["<C-d>"] = "preview_scrolling_down"
            }
        }
    },
    extensions_list = { "themes", "terms", "projects" }
}

M.treesitter = {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>"
        }
    }
}

M.notify = function()
    require("notify").setup({
        stages = "slide"
    })
    vim.notify = require "notify"
end

M.hop = function()
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
end

M.project = function()
    require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = {
            "README.md",
            "Cargo.toml",
            ".sln",
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
        },
        exclude_dirs = { "~/.local/*" }
    }
end

M.lspconfig = function()
    require "plugins.configs.lspconfig"
    require "custom.plugins.lsp"
end

M.lsp_signature = function()
    require("lsp_signature").setup()
end

M.symbols_outline = function()
    require("symbols-outline").setup()
end

M.trouble = function()
    require("trouble").setup()
end

return M
