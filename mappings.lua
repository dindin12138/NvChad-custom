local M = {}

-- Override default mappings
M.general = {
    n = {
        -- save
        ["<C-s>"] = { "<cmd> w <CR>", "save file" },
        ["W"] = { "<cmd> w <CR>", "save file" },
        -- quit
        ["Q"] = { "<cmd> qa! <CR>", "quit nvim" },
        -- yank
        -- Copy all
        ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "window left" },
        ["<C-l>"] = { "<C-w>l", "window right" },
        ["<C-j>"] = { "<C-w>j", "window down" },
        ["<C-k>"] = { "<C-w>k", "window up" },
        -- split
        ["sv"] = { ":vsp<CR>", "vertical split window" },
        ["sh"] = { ":sp<CR>", "horizontal split window" },
        ["sc"] = { ":close<CR>", "close this window" },
        ["so"] = { ":only<CR>", "close all but this window" },
        ["s="] = { "<C-w>=", "resize" },
        -- resize
        ["<C-Left>"] = { "<cmd> vertical resize -2 <CR>", "vertical resize -2" },
        ["<C-Right>"] = { "<cmd> vertical resize +2 <CR>", "vertical resize +2" },
        ["<C-Down>"] = { "<cmd> resize +2 <CR>", "resize +2" },
        ["<C-Up>"] = { "<cmd> resize -2 <CR>", "resize -2" },
        -- fast move
        ["H"] = { "5h", "fast move" },
        ["J"] = { "5j", "fast move" },
        ["K"] = { "5k", "fast move" },
        ["L"] = { "5l", "fast move" },
        -- update nvchad
        ["<leader>u"] = { "<cmd> :NvChadUpdate <CR>", "update nvchad" },
        -- close buffer + hide terminal buffer
        ["<leader>q"] = { function() require("core.utils").close_buffer() end, "close buffer", },
    },
    i = {
        -- go to  beginning and end
        ["<C-b>"] = { "<ESC>^i", "beginning of line" },
        ["<C-e>"] = { "<End>", "end of line" },

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "move left" },
        ["<C-l>"] = { "<Right>", "move right" },
        ["<C-j>"] = { "<Down>", "move down" },
        ["<C-k>"] = { "<Up>", "move up" },
    },
    v = {
        ["J"] = { ":m \'>+1<cr>gv=gv", "move down" },
        ["K"] = { ":m \'<-2<cr>gv=gv", "move up" },
        ["<"] = { "<gv", "move left" },
        [">"] = { ">gv", "move right" },
    },
    t = {
        -- terminal
        ["<Esc>"] = { "<C-\\><C-n>", "exit terminal" },
        ["<C-h>"] = { "<cmd> wincmd h<CR>", "move left" },
        ["<C-j>"] = { "<cmd> wincmd j<CR>", "move down" },
        ["<C-k>"] = { "<cmd> wincmd k<CR>", "move up" },
        ["<C-l>"] = { "<cmd> wincmd l<CR>", "move right" },
    }
}

M.packer = {
    n = {
        ["<leader>pc"] = { "<cmd> PackerCompile <CR>", "Compile" },
        ["<leader>pi"] = { "<cmd> PackerInstall <CR>", "Install" },
        ["<leader>ps"] = { "<cmd> PackerSync <CR>", "Sync" },
        ["<leader>pS"] = { "<cmd> PackerStatus <CR>", "Status" },
        ["<leader>pu"] = { "<cmd> PackerUpdate <CR>", "Update" },
    }
}

M.telescope = {
    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
        ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "show projects" },
        -- git
        ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>fs"] = { "<cmd> Telescope git_status <CR>", "git status" },
        -- theme switcher
        ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    },
}

M.lspconfig = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
    n = {
        ["gD"] = { function() vim.lsp.buf.declaration() end, "lsp declaration" },
        ["gd"] = { function() vim.lsp.buf.definition() end, "lsp definition" },
        ["gh"] = { function() vim.lsp.buf.hover() end, "lsp hover" },
        -- ["gi"] = { function() vim.lsp.buf.implementation() end, "lsp implementation" },
        ["gs"] = { function() vim.lsp.buf.signature_help() end, "lsp signature_help" },
        -- ["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "lsp definition type" },
        ["ga"] = { function() vim.lsp.buf.code_action() end, "lsp code_action" },
        ["gr"] = { function() vim.lsp.buf.references() end, "lsp references" },
        ["ge"] = { function() vim.diagnostic.open_float() end, "floating diagnostic" },
        ["gj"] = { function() vim.diagnostic.goto_prev() end, "goto prev" },
        ["gk"] = { function() vim.diagnostic.goto_next() end, "goto_next" },
        -- ["<leader>lq"] = { function() vim.diagnostic.setloclist() end, "diagnostic setloclist" },
        -- ["<leader>la"] = { function() vim.lsp.buf.add_workspace_folder() end, "add workspace folder" },
        -- ["<leader>lr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "remove workspace folder" },
        -- ["<leader>ll"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "list workspace folders" },
        ["<leader>r"] = { function() require("nvchad_ui.renamer").open() end, "lsp rename" },
        ["<leader>lf"] = { function() vim.lsp.buf.formatting {} end, "lsp formatting" },
        ["<leader>li"] = { "<cmd> LspInfo <CR>", "LspInfo" },
        ["<leader>ll"] = { "<cmd> LspLog <CR>", "LspLog" },
        ["<leader>lr"] = { "<cmd> LspRestart <CR>", "LspRestart" },


    },
}

M.nvimtree = {
    n = { ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" } },
}

M.mason = {
    n = { ["<leader>m"] = { "<cmd> Mason <CR>", "Mason" } }
}

M.tabufline = {
    n = {
        -- cycle through buffers
        ["<TAB>"] = { function() require("core.utils").tabuflineNext() end, "goto next buffer", },
        ["<S-Tab>"] = { function() require("core.utils").tabuflinePrev() end, "goto prev buffer", },
    },
}

M.comment = {
    -- toggle comment in both modes
    n = { ["<leader>/"] = { function() require("Comment.api").toggle.linewise.current() end, "toggle comment" } },

    v = { ["<leader>/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        "toggle comment" } },
}

M.StartupTime = {
    n = { ["<leader>st"] = { "<cmd> StartupTime <CR>", "StartupTime" } },
}

M.hop = {
    n = {
        ["<leader>w"] = { "<cmd> HopWord <CR>", "HopWord" },
        ["<leader>j"] = { "<cmd> HopLine <CR>", "HopLine" },
        ["<leader>c"] = { "<cmd> HopChar1 <CR>", "HopChar1" }
    },
}

M.nvterm = {
    t = {
        -- toggle in terminal mode
        ["<leader>tf"] = { function() require("nvterm.terminal").toggle "float" end, "toggle floating term" },
        ["<leader>th"] = { function() require("nvterm.terminal").toggle "horizontal" end, "toggle horizontal term" },
        ["<leader>tv"] = { function() require("nvterm.terminal").toggle "vertical" end, "toggle vertical term" },
    },
    n = {
        -- toggle in normal mode
        ["<leader>tf"] = { function() require("nvterm.terminal").toggle "float" end, "toggle floating term" },
        ["<leader>th"] = { function() require("nvterm.terminal").toggle "horizontal" end, "toggle horizontal term" },
        ["<leader>tv"] = { function() require("nvterm.terminal").toggle "vertical" end, "toggle vertical term" },
        -- new
        ["<leader>h"] = { function() require("nvterm.terminal").new "horizontal" end, "new horizontal term" },
        ["<leader>v"] = { function() require("nvterm.terminal").new "vertical" end, "new vertical term" },
    },
}

-- add this table only when you want to disable default keys
-- disable all default keys
M.disabled = {
    n = {
        ["<ESC>"] = "",
        ["<C-h>"] = "",
        ["<C-l>"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
        ["<C-s>"] = "",
        ["<C-c>"] = "",
        ["<leader>n"] = "",
        ["<leader>rn"] = "",
        ["<leader>uu"] = "",
        ["<leader>tt"] = "",
        ["j"] = "",
        ["k"] = "",
        ["<Up>"] = "",
        ["<Down>"] = "",
        ["<leader>b"] = "",
        ["<leader>x"] = "",
        ["<TAB>"] = "",
        ["<S-Tab>"] = "",
        ["<Bslash>"] = "",
        ["<leader>/"] = "",
        ["gD"] = "",
        ["gd"] = "",
        ["K"] = "",
        ["gi"] = "",
        ["<leader>ls"] = "",
        ["<leader>D"] = "",
        ["<leader>ra"] = "",
        ["<leader>ca"] = "",
        ["gr"] = "",
        ["<leader>f"] = "",
        ["[d"] = "",
        ["d]"] = "",
        ["<leader>q"] = "",
        ["<leader>fm"] = "",
        ["<leader>wa"] = "",
        ["<leader>wr"] = "",
        ["<leader>wl"] = "",
        ["<C-n>"] = "",
        ["<leader>e"] = "",
        ["<leader>ff"] = "",
        ["<leader>fa"] = "",
        ["<leader>fw"] = "",
        ["<leader>fb"] = "",
        ["<leader>fh"] = "",
        ["<leader>fo"] = "",
        ["<leader>tk"] = "",
        ["<leader>cm"] = "",
        ["<leader>gt"] = "",
        ["<leader>pt"] = "",
        ["<leader>th"] = "",
        ["<A-i>"] = "",
        ["<A-h>"] = "",
        ["<A-v>"] = "",
        ["<leader>h"] = "",
        ["<leader>v"] = "",
        ["<leader>wK"] = "",
        ["<leader>wk"] = "",
        ["<leader>cc"] = "",
    },
    i = {
        ["<C-b>"] = "",
        ["<C-e>"] = "",
        ["<C-h>"] = "",
        ["<C-l>"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
    },
    v = {
        ["j"] = "",
        ["k"] = "",
        ["<Up>"] = "",
        ["<Down>"] = "",
        ["p"] = "",
        ["<leader>/"] = "",
    },
    t = {
        ["<C-x>"] = "",
        ["<A-i>"] = "",
        ["<A-h>"] = "",
        ["<A-v>"] = "",
        [""] = "",
    }
}

return M
