local M = {}
local conf = require "custom.plugins.config"

M.ui = { theme = "catppuccin" }

M.plugins = {
    ["NvChad/ui"] = { override_options = conf.ui },
    ["catppuccin/nvim"] = { as = "catppuccin", config = conf.catppuccin },
    ["kyazdani42/nvim-tree.lua"] = { override_options = conf.nvim_tree },
    ["nvim-telescope/telescope.nvim"] = { override_options = conf.telescope },
    ["nvim-treesitter/nvim-treesitter"] = { override_options = conf.treesitter },
    ["williamboman/mason.nvim"] = { override_options = conf.mason },
    ["hrsh7th/nvim-cmp"] = { override_options = conf.cmp },
    ["goolord/alpha-nvim"] = { disable = true },
    ["glepnir/dashboard-nvim"] = { config = conf.dashboard },
    ["folke/which-key.nvim"] = { disable = false },
    ["rcarriga/nvim-notify"] = { config = conf.notify },
    ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
    ["phaazon/hop.nvim"] = { branch = "v2", cmd = { "HopChar2" }, config = conf.hop },
    ["neovim/nvim-lspconfig"] = { config = conf.lspconfig },
    ["ahmedkhalf/project.nvim"] = { config = conf.project },
    ["ray-x/lsp_signature.nvim"] = { after = "nvim-lspconfig", config = conf.lsp_signature },
    ["simrat39/symbols-outline.nvim"] = { cmd = "SymbolsOutline", config = conf.symbols_outline },
    ["jose-elias-alvarez/null-ls.nvim"] = { after = "nvim-lspconfig", config = conf.null_ls },
    ["folke/trouble.nvim"] = { cmd = 'TroubleToggle', requires = "kyazdani42/nvim-web-devicons", config = conf.trouble }
}

M.mappings = require "custom.mappings"

return M
