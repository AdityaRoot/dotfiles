local fn = vim.fn
-- Auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Install packer, restart neovim please"
    vim.cmd [[packadd packer.nvim]]
end


-- Auto reload neovim when writing to this file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so no errors on first usage
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end


-- Install plugins
return packer.startup(function(use)
    -- Plugin Setup and Common Dependancies
    use "wbthomason/packer.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Telescope plugins (more to be added)
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim" -- Telescope
    use 'nvim-telescope/telescope-dap.nvim' -- Telescope integration for dap
    -- use 'stevearc/dressing.nvim' -- Dressing to make it look nicer

    -- cmp plugins
    use "L3MON4D3/LuaSnip"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use 'rcarriga/cmp-dap'
    use {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    -- Snippets
    use "rafamadriz/friendly-snippets" -- A set of snippets to use

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    use "j-hui/fidget.nvim" -- Shows a lil thing in the corner showing progress of LSP

    -- Debugging
    use 'mfussenegger/nvim-dap' -- General debugging adapter protocol plugin
    use 'theHamsta/nvim-dap-virtual-text' -- Works with treesitter to show useful virtual text
    use 'rcarriga/nvim-dap-ui' -- Shows neat UI making nvim dap easy to use
    use 'mfussenegger/nvim-dap-python' -- nvim dap handler for python

    -- LaTeX
    use { "lervag/vimtex", ft = "tex" }

    -- Colorschemes
    use 'sam4llis/nvim-tundra' -- Colorscheme
    use "folke/tokyonight.nvim" -- Colorscheme
    use {
        "catppuccin/nvim", as = "catppuccin"
    }
    use { "ellisonleao/gruvbox.nvim" }
    use "rebelot/kanagawa.nvim"
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use 'kvrohit/mellow.nvim'
    use 'Yazeed1s/oh-lucy.nvim'

    -- Useless plugins
    use "Eandrju/cellular-automaton.nvim"
    -- use "tamton-aquib/zone.nvim"
    use {
        'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        end
    }
    use 'andweeb/presence.nvim' -- Discord rich presence
    -- Misc - Visual
    -- use "lewis6991/gitsigns.nvim" -- Buffer git integration
    use "mbbill/undotree" -- Shows a tree of all the changes in the current buffer"
    use "narutoxy/silicon.lua" -- Take pretty screenshots
    use "nvim-lualine/lualine.nvim" -- Powerline
    use "RRethy/vim-illuminate" -- Gives the cool highlight thingy
    use "lukas-reineke/indent-blankline.nvim" -- Adds the indentation lines that are very cool
    use "folke/todo-comments.nvim" -- Intelligent comment highlighting
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    use "petertriho/nvim-scrollbar" -- Adds the scroll bar
    use "folke/paint.nvim" -- Allows for making certain strings highlighted
    use "winston0410/range-highlight.nvim" -- highlight lines being used in commands
    use "winston0410/cmd-parser.nvim" -- Dependency for range-highlight.nvim
    -- use 'sunjon/shade.nvim' -- dims window not in use // BREAKING //
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            "rcarriga/nvim-notify",
        }
    })

    -- Misc - Functional
    -- use "echasnovski/mini.nvim" -- Mini
    use "junegunn/vim-easy-align" -- A good easy align, maps defined in options.lua
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Treesitter...
    use "windwp/nvim-autopairs" -- Autopairs
    use "kyazdani42/nvim-tree.lua" -- Nvim tree
    use "akinsho/bufferline.nvim" -- Bufferline plugin.input
    use "moll/vim-bbye" -- Adds :Bdelete command (as opposed to :bdelete)
    --use "lewis6991/impatient.nvim" -- Makes nvim start up faster by doing some lua plugin loading magic, breaks whichkey

    use "uga-rosa/ccc.nvim" -- Adds :CccPick command and highlights colors
    use 'norcalli/nvim-colorizer.lua' -- Using this plugin to highlight colors intead

    use "folke/twilight.nvim" -- Focus plugin, done with :Twilight
    use "folke/zen-mode.nvim" -- Zen mode plugin, done with :ZenMode
    use 'christoomey/vim-tmux-navigator' -- Navigation between vim and tmux
    use "goolord/alpha-nvim" -- Adds fancy greeter
    use "folke/which-key.nvim" -- Cute lil menu at bottom for leader keybindings
    use "mrjones2014/legendary.nvim" -- Intergration with whichkey to do some cool stuff
    use "numToStr/Comment.nvim" -- Makes bulk/inline commenting easier
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- Makes folds better
    use "airblade/vim-rooter" -- Auto cds into project dir
    use "andymass/vim-matchup" -- Enables better % matchup
    use "ggandor/flit.nvim" -- same as leap but for f-movement, same mentality and dev
    use "ggandor/leap.nvim" -- Leap.nvim, better naivigation
    use "PatschD/zippy.nvim" -- zippy, automate variable outputs
    use "AndrewRadev/splitjoin.vim" -- Allows splitting and combining multi-line statements easily
    use "kevinhwang91/nvim-hlslens" -- Makes / and ? searching better
    use {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
    }
    use {
        'phaazon/mind.nvim',
        branch = 'v2.2',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require 'mind'.setup()
        end
    }
    use {
        "folke/lsp-trouble.nvim", -- Just do :Trouble and it tells you all the error spots its p pog, maybe look into more features later
        cmd = "Trouble",
        config = function()
            require("trouble").setup {
                auto_preview = false,
                auto_fold = true,
            }
        end,
    }
    use { "akinsho/toggleterm.nvim", tag = '*',
        config = function() -- Allows a summonable terminal from anywhere (done through whichkey)
            require("toggleterm").setup()
        end }

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
    -- use "jose-elias-alvarez/null-ls.nvim"    -- Need to look into it in detail, adds linting n prettier n shit
    -- use "SmiteshP/nvim-navic"
    --

    -- Plugins that I might find useful at some point but not right now
    -- use "phaazon/hop.nvim"
    -- use "norcalli/nvim-terminal.lua"
    -- use "tjdevries/vim-inyoface"
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
    --    local_use("nvim-telescope", "telescope-symbols.nvim")
    --
    --    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    --    use { "nvim-telescope/telescope-hop.nvim" }
    --    use { "nvim-telescope/telescope-file-browser.nvim" }
    --      use { "nvim-telescope/telescope-smart-history.nvim" }
    --      use "nvim-telescope/telescope-frecency.nvim"
    --      use "nvim-telescope/telescope-cheat.nvim"
    --      use { "nvim-telescope/telescope-arecibo.nvim" }
    --      use { "nvim-telescope/telescope-ui-select.nvim" }
    --  use "monaqa/dial.nvim"
    --
    -- Keep this at end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
