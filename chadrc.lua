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
    ["goolord/alpha-nvim"] = { disable = false, override_options = conf.alpha },
    ["folke/which-key.nvim"] = { disable = false },
    ["rcarriga/nvim-notify"] = { config = conf.notify },
    ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
    ["phaazon/hop.nvim"] = { branch = "v2", cmd = { "HopWord", "HopLine", "HopChar1" }, config = conf.hop },
    ["neovim/nvim-lspconfig"] = { config = conf.lspconfig },
    ["ahmedkhalf/project.nvim"] = { cmd = "Telescope", config = conf.project },
    ["ray-x/lsp_signature.nvim"] = { after = "nvim-lspconfig", config = conf.lsp_signature },
    ["stevearc/aerial.nvim"] = { cmd = "AerialToggle", config = conf.aerial },
    ["jose-elias-alvarez/null-ls.nvim"] = { after = "nvim-lspconfig", config = conf.null_ls },
}

M.mappings = require "custom.mappings"

return M
