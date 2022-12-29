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
            hl = "AlphaButtons"
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
            opts = opts
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
            },
        },
        buttons = {
            val = {
                button("SPC f p", "  Find Projects  ", ":Telescope projects<CR>"),
                button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
                button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
                button("SPC p s", "  Update Plugins  ", ":PackerSync<CR>"),
                button("SPC e s", "  Settings", ":e ~/.config/nvim/lua/custom/chadrc.lua | :cd %:p:h <CR>"),
            }
        }
    }
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

return M
