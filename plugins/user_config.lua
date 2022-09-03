local config = {}

function config.dashboard()
    local home = os.getenv('HOME')
    local db = require('dashboard')
    db.session_directory = home .. '/.cache/nvim/sessions'
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
            action = 'Telescope find_files find_command=rg,--hidden,--files',
            shortcut = 'SPC f f'
        },
        {
            icon = '  ',
            desc = 'Update Plugins                          ',
            action = 'PackerSync',
            shortcut = 'SPC p s'
        },
        {
            icon = '  ',
            desc = 'Edit Keybindings                        ',
            action = 'edit ~/.config/nvim/lua/custom/mappings.lua',
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

function config.notify()
    require("notify").setup({
        ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
        stages = "slide",
        ---@usage Function called when a new window is opened, use for changing win settings/config
        on_open = nil,
        ---@usage Function called when a window is closed
        on_close = nil,
        ---@usage timeout for notifications in ms, default 5000
        timeout = 2000,
        -- Render function for notifications. See notify-render()
        render = "default",
        ---@usage highlight behind the window for stages that change opacity
        background_colour = "Normal",
        ---@usage minimum width for notification windows
        minimum_width = 50,
        ---@usage Icons for the different levels
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    })

    vim.notify = require("notify")
end

function config.hop()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
end

function config.project()
    require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
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

return config
