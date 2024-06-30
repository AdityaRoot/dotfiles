local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
    defaults = {
        lazy = true,
    }
}

local plugins = {
    -- Plugin Setup and Common Dependancies
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",

    -- Telescope plugins (more to be added)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            -- "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-symbols.nvim"
        }
    }, -- Telescope

    -- cmp plugins
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
        }
    },
    -- 'rcarriga/cmp-dap',
    {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        dependencies = {
            "zbirenbaum/copilot-cmp",
        },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
            require("copilot_cmp").setup()
        end,
    },

    -- Snippets
    -- LSP
    {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim", -- LSP server management
        "williamboman/mason-lspconfig.nvim",
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            -- 'nvim-tree/nvim-web-devicons'  -- optional
        },
        event = "LspAttach"
    },
    {
        "danymat/neogen", -- Generates docstrings
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        version = "*"
    },


    -- {                                      --- Debugging
    -- {'mfussenegger/nvim-dap', lazy = true},           -- General debugging adapter protocol plugin
    --     'theHamsta/nvim-dap-virtual-text', -- Works with treesitter to show useful virtual text
    --     'rcarriga/nvim-dap-ui',            -- Shows neat UI making nvim dap easy to use
    --     'mfussenegger/nvim-dap-python',    -- nvim dap handler for python
    -- },
    --- LaTeX
    { "lervag/vimtex",                   ft = "tex" },


    { --- Colorschemes
        'aktersnurra/no-clown-fiesta.nvim',
        'savq/melange-nvim',
        'sam4llis/nvim-tundra',
        "folke/tokyonight.nvim",
        {
            "catppuccin/nvim", name = "catppuccin"
        },
        "ellisonleao/gruvbox.nvim",
        {
            "rebelot/kanagawa.nvim",
            lazy = true,
            priority = 1000, -- Add line for main colorscheme
        },
        ({
            'rose-pine/neovim',
            name = 'rose-pine',
        }),
        'kvrohit/mellow.nvim',
        'Yazeed1s/oh-lucy.nvim',
    },




    -- Misc - Visual
    "lewis6991/gitsigns.nvim", -- Buffer git integration
    "mbbill/undotree",         -- Shows a tree of all the changes in the current buffer",
    "narutoxy/silicon.lua",    -- Take pretty screenshots
    -- { 'krivahtoo/silicon.nvim', build = './install.sh' }, -- brokener and uglier version of silicon.lua
    -- "connordeckers/silicon.lua",
    -- {
    --     "michaelrommel/nvim-silicon",
    --     lazy = true,
    --     cmd = "Silicon",
    -- },
    "nvim-lualine/lualine.nvim",           -- Powerline
    'Bekaboo/dropbar.nvim',                -- Adding navigation dropbar at top
    "RRethy/vim-illuminate",               -- Highlights all instances of the word under the cursor
    "lukas-reineke/indent-blankline.nvim", -- Adds the indentation lines that are very cool
    "folke/todo-comments.nvim",            -- Intelligent comment highlighting
    -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Virtual lines to show errors and other messages
    "petertriho/nvim-scrollbar",           -- Adds the scroll bar
    "folke/paint.nvim",                    -- Allows for making certain strings highlighted
    {
        "winston0410/range-highlight.nvim",
        dependencies = {
            "winston0410/cmd-parser.nvim", -- Dependency for range-highlight.nvim
        }
    },                                     -- highlight lines being used in commands
    -- 'sunjon/shade.nvim', -- dims window not in use // BREAKING //
    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            "rcarriga/nvim-notify",
        }
    },


    -- Misc - Functional
    -- "echasnovski/mini.nvim", -- Mini
    {
        'nacro90/numb.nvim', -- Allows peaking with ':{number}'
        lazy = false,
        config = function()
            require("numb").setup()
        end
    },
    -- "junegunn/vim-easy-align",                                  -- A good easy align, maps defined in options.lua,  Unused
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Treesitter...
    "windwp/nvim-autopairs",                                    -- Autopairs
    "kyazdani42/nvim-tree.lua",                                 -- Nvim tree
    "akinsho/bufferline.nvim",                                  -- Bufferline plugin.input
    {
        "moll/vim-bbye",                                        -- Buffer removal
        cmd = "Bdelete"
    },                                                          -- Adds :Bdelete command (as opposed to :bdelete)
    {
        "uga-rosa/ccc.nvim",
        cmd = "CccPick"
    },                                                          -- Adds :CccPick command and highlights colors
    'norcalli/nvim-colorizer.lua',                              -- Using this plugin to highlight colors intead
    --    "folke/twilight.nvim",                                                    -- Focus plugin, done with :Twilight
    --   "folke/zen-mode.nvim",                                                    -- Zen mode plugin, done with :ZenMode
    -- "chrisgrieser/nvim-spider",                                               -- Better navigation with w, e, and b keys
    --    'christoomey/vim-tmux-navigator',                                         -- Navigation between vim and tmux
    "goolord/alpha-nvim",                                                     -- Adds fancy greeter
    "folke/which-key.nvim",                                                   -- Cute lil menu at bottom for leader keybindings
    -- "mrjones2014/legendary.nvim",                                             -- Intergration with whichkey to do some cool stuff
    "numToStr/Comment.nvim",                                                  -- Makes bulk/inline commenting easier
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }, -- Makes folds better
    {
        "airblade/vim-rooter",
        lazy = false
    }, -- Auto cds into project dir
    {
        "andymass/vim-matchup",
        lazy = true
    },                   -- Enables better % matchup
    "ggandor/flit.nvim", -- same as leap but for f-movement, same mentality and dev
    "ggandor/leap.nvim", -- Leap.nvim, better naivigation
    -- "PatschD/zippy.nvim",                                                     -- zippy, automate variable outputs
    -- "AndrewRadev/splitjoin.vim",                                              -- Allows splitting and combining multi-line statements easily
    {
        "SmiteshP/nvim-navbuddy", -- Breadcrumbs pop up
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic", -- Breadcrumbs in statusline
            "MunifTanjim/nui.nvim"
        },
        -- opts = { lsp = { auto_attach = true } }
    },
    {
        "kevinhwang91/nvim-hlslens", -- Shows jumping command to search results (e.g. shows 4N, 2n)
        config = function()
            require("hlslens").setup()
        end,
    },
    {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
        lazy = false,
    },
    {
        "folke/lsp-trouble.nvim", -- Just do :Trouble and it tells you all the error spots its p pog, maybe look into more features later
        cmd = "Trouble",
        config = function()
            require("trouble").setup {
                auto_preview = false,
                -- auto_fold = true,
            }
        end,
        lazy = true
    },
    {
        "akinsho/toggleterm.nvim", -- Allows a summonable terminal from anywhere (done through whichkey)
        version = '*',
        config = function()
            require("toggleterm").setup()
        end,
        cmd = { "TermExec", "ToggleTerm" },
        lazy = true,
    },


    { -- Useless plugins
        "letieu/hacker.nvim",
        {
            "Eandrju/cellular-automaton.nvim",
            lazy = true,
            cmd = "CellularAutomaton",
        },
        'andweeb/presence.nvim', -- Discord rich presence
    }
    -- use {
    --     'chipsenkbeil/distant.nvim',
    --     config = function()
    --         require('distant').setup {
    --             -- Applies Chip's personal settings to every machine you connect to
    --             --
    --             -- 1. Ensures that distant servers terminate with no connections
    --             -- 2. Provides navigation bindings for remote directories
    --             -- 3. Provides keybinding to jump into a remote file's parent directory
    --             ['*'] = require('distant.settings').chip_default()
    --         }
    --     end
    -- }

    -- Plugins that I want to install but haven't been bothered to yet
    -- "jose-elias-alvarez/null-ls.nvim",    -- Need to look into it in detail, adds linting n prettier n shit
    -- -- nvim-recorder
    --

    -- Plugins that I might find useful at some point but not right now
    -- "phaazon/hop.nvim",
    -- "norcalli/nvim-terminal.lua",
    -- "tjdevries/vim-inyoface",
    -- tpope/vim-abolish
    -- vigoux/architext.nvim
    -- danymat/neogen
    -- tjdevries/edit_alternate.vim
    --gorbit99/codewindow.nvim
    --pechorin/any-jump.vim
    -- tpope/vim-repeat
    -- Plugins to check out that I havent looked at yet
    -- local_use("nvim-telescope", "telescope.nvim")
    --    local_use("nvim-telescope", "telescope-rs.nvim")
    --    local_use("nvim-telescope", "telescope-fzf-writer.nvim")
    --    local_use("nvim-telescope", "telescope-packer.nvim")
    --    local_use("nvim-telescope", "telescope-fzy-native.nvim")
    --    local_use("nvim-telescope", "telescope-github.nvim")
    --
    --    use { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    --    use { "nvim-telescope/telescope-hop.nvim" }
    --    use { "nvim-telescope/telescope-file-browser.nvim" }
    --      use { "nvim-telescope/telescope-smart-history.nvim" }
    --      "nvim-telescope/telescope-frecency.nvim",
    --      "nvim-telescope/telescope-cheat.nvim",
    --      use { "nvim-telescope/telescope-arecibo.nvim" }
    --      use { "nvim-telescope/telescope-ui-select.nvim" }
    --  "monaqa/dial.nvim",
    --
    -- Keep this at end after all plugins
}

require('lazy').setup(plugins, opts)
