-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local override_conf = require('custom.plugins.override_config')
local user_conf = require('custom.plugins.user_config')

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = { theme = "onedark" }

M.plugins = {
    -- Override default config of a plugin
    override = {
        ["NvChad/ui"] = override_conf.ui,
        ["kyazdani42/nvim-tree.lua"] = override_conf.nvim_tree,
        ["nvim-telescope/telescope.nvim"] = override_conf.telescope,
        ["nvim-treesitter/nvim-treesitter"] = override_conf.treesitter,
        ["williamboman/mason.nvim"] = override_conf.mason,
        ["hrsh7th/nvim-cmp"] = override_conf.cmp,
        ["goolord/alpha-nvim"] = override_conf.alpha
    },
    -- Remove plugins
    remove = {},
    -- Modify plugin definition options
    user = {
        ["folke/which-key.nvim"] = { disable = false, },
        ["goolord/alpha-nvim"] = { disable = false },
        -- ["glepnir/dashboard-nvim"] = { config = user_conf.dashboard },
        ["rcarriga/nvim-notify"] = { config = user_conf.notify },
        ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
        ["phaazon/hop.nvim"] = {
            branch = 'v2',
            cmd = { "HopWord", "HopLine", "HopChar1" },
            config = user_conf.hop
        },
        ["neovim/nvim-lspconfig"] = {
            config = function()
                require "plugins.configs.lspconfig"
                require "custom.plugins.lsp"
            end,
        },
        ["ahmedkhalf/project.nvim"] = { cmd = "Telescope", config = user_conf.project },
    }
}

M.mappings = require("custom.mappings")

return M
