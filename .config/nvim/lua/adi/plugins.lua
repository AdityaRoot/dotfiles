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


-- Install plugins
require('lazy').setup({
    -- Plugin Setup and Common Dependancies
    "kyazdani42/nvim-web-devicons",

    -- Telescope plugins (more to be added)
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-symbols.nvim"
        }
    }, -- Telescope
    -- 'stevearc/dressing.nvim', -- Dressing to make it look nicer

    -- cmp plugins
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    'rcarriga/cmp-dap',
    {
        "jcdickinson/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },
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
    "rafamadriz/friendly-snippets", -- A set of snippets to use

    -- LSP
    {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    "j-hui/fidget.nvim", -- Shows a lil thing in the corner showing progress of LSP

    -- Debugging
    'mfussenegger/nvim-dap',           -- General debugging adapter protocol plugin
    'theHamsta/nvim-dap-virtual-text', -- Works with treesitter to show useful virtual text
    'rcarriga/nvim-dap-ui',            -- Shows neat UI making nvim dap easy to use
    'mfussenegger/nvim-dap-python',    -- nvim dap handler for python

    -- LaTeX
    { "lervag/vimtex",                   ft = "tex" },

    -- Colorschemes

    {
        'aktersnurra/no-clown-fiesta.nvim',
        lazy = true
    },
    {
        'savq/melange-nvim',
        lazy = true
    },
    {
        'sam4llis/nvim-tundra',
        lazy = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = true
    }, -- Colorscheme
    {
        "catppuccin/nvim", name = "catppuccin", lazy = true
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000, -- Add line for main colorscheme
    },
    ({
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
    }),
    {
        'kvrohit/mellow.nvim',
        lazy = true,
    },
    {
        'Yazeed1s/oh-lucy.nvim',
        lazy = true,
    },

    -- Useless plugins

    "letieu/hacker.nvim",
    "Eandrju/cellular-automaton.nvim",
    -- "tamton-aquib/zone.nvim",
    -- {
    --     'tamton-aquib/duck.nvim',
    --     config = function()
    --         vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
    --         vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    --     end
    -- },
    {
        "giusgad/pets.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
    },
    'andweeb/presence.nvim', -- Discord rich presence

    -- Misc - Visual
    -- "lewis6991/gitsigns.nvim", -- Buffer git integration
    "mbbill/undotree",                     -- Shows a tree of all the changes in the current buffer",
    "narutoxy/silicon.lua",                -- Take pretty screenshots
    "nvim-lualine/lualine.nvim",           -- Powerline
    "RRethy/vim-illuminate",               -- Gives the cool highlight thingy
    "lukas-reineke/indent-blankline.nvim", -- Adds the indentation lines that are very cool
    "folke/todo-comments.nvim",            -- Intelligent comment highlighting
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    "petertriho/nvim-scrollbar",           -- Adds the scroll bar
    "folke/paint.nvim",                    -- Allows for making certain strings highlighted
    "winston0410/range-highlight.nvim",    -- highlight lines being used in commands
    "winston0410/cmd-parser.nvim",         -- Dependency for range-highlight.nvim
    -- 'sunjon/shade.nvim', -- dims window not in use // BREAKING //
    ({
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            "rcarriga/nvim-notify",
        }
    }),

    -- Misc - Functional
    -- "echasnovski/mini.nvim", -- Mini
    {
        'nacro90/numb.nvim', -- Allows peaking with ':{number}'
        config = function()
            require("numb").setup()
        end
    },
    "junegunn/vim-easy-align",                                                -- A good easy align, maps defined in options.lua
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },               -- Treesitter...
    "windwp/nvim-autopairs",                                                  -- Autopairs
    "kyazdani42/nvim-tree.lua",                                               -- Nvim tree
    "akinsho/bufferline.nvim",                                                -- Bufferline plugin.input
    "moll/vim-bbye",                                                          -- Adds :Bdelete command (as opposed to :bdelete)

    "uga-rosa/ccc.nvim",                                                      -- Adds :CccPick command and highlights colors
    'norcalli/nvim-colorizer.lua',                                            -- Using this plugin to highlight colors intead

    "folke/twilight.nvim",                                                    -- Focus plugin, done with :Twilight
    "folke/zen-mode.nvim",                                                    -- Zen mode plugin, done with :ZenMode
    'christoomey/vim-tmux-navigator',                                         -- Navigation between vim and tmux
    "goolord/alpha-nvim",                                                     -- Adds fancy greeter
    "folke/which-key.nvim",                                                   -- Cute lil menu at bottom for leader keybindings
    -- "mrjones2014/legendary.nvim",                                             -- Intergration with whichkey to do some cool stuff
    "numToStr/Comment.nvim",                                                  -- Makes bulk/inline commenting easier
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }, -- Makes folds better
    "airblade/vim-rooter",                                                    -- Auto cds into project dir
    "andymass/vim-matchup",                                                   -- Enables better % matchup
    "ggandor/flit.nvim",                                                      -- same as leap but for f-movement, same mentality and dev
    "ggandor/leap.nvim",                                                      -- Leap.nvim, better naivigation
    -- "PatschD/zippy.nvim",                                                     -- zippy, automate variable outputs
    -- "AndrewRadev/splitjoin.vim",                                              -- Allows splitting and combining multi-line statements easily
    {
        "SmiteshP/nvim-navbuddy", -- Breadcrumbs pop up
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic", -- Breadcrumbs in statusline
            "MunifTanjim/nui.nvim"
        }
    },
    "kevinhwang91/nvim-hlslens", -- Makes / and ? searching better
    {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
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
    },
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        config = function() -- Allows a summonable terminal from anywhere (done through whichkey)
            require("toggleterm").setup()
        end
    },

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
})
