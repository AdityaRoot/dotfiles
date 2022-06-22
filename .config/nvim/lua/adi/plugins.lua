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
    use "nvim-lua/plenary.nvim"
    use {"kyazdani42/nvim-web-devicons"}

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Base snippet engine
    use "rafamadriz/friendly-snippets" -- A set of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"             -- Enables LSP
    use "williamboman/nvim-lsp-installer"   -- LSP server installer
    use "j-hui/fidget.nvim"                 -- Shows a lil thing in the corner showing progress of LSP

    -- LaTeX
    use {"lervag/vimtex", ft = "tex"}
    -- Misc
    use "nvim-telescope/telescope.nvim"     -- Telescope
    use "folke/tokyonight.nvim"         -- Colorscheme
    use "nvim-lualine/lualine.nvim"     -- Powerline
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- Treesitter...
    use "windwp/nvim-autopairs"          -- Autopairs
    use "kyazdani42/nvim-tree.lua"      -- Nvim tree
    use "akinsho/bufferline.nvim"       -- Bufferline plugin
    use "moll/vim-bbye"                 -- Adds :Bdelete command (as opposed to :bdelete)
    use "lewis6991/impatient.nvim"      -- Makes nvim start up faster by doing some lua plugin loading magic
    use "goolord/alpha-nvim"            -- Adds the fancy greeter when just opening 'nvim'
    use "RRethy/vim-illuminate"         -- Gives the cool highlight thingy
    use "folke/which-key.nvim"          -- Cute lil menu at bottom for leader keybindings
    use "numToStr/Comment.nvim"         -- Makes bulk/inline commenting easier
    use "rcarriga/nvim-notify"          -- Neat notification at the top of window, not sure if any program uses it though...
    use "godlygeek/tabular" -- Quickly align text by pattern
    use {
      "alec-gibson/nvim-tetris",
      cmd = "Tetris",
    }
    use {
        'glacambre/firenvim',           -- Lets me use vim in text fields on web
        run = function() vim.fn['firenvim#install'](0) end
    }
    use {
      "AckslD/nvim-neoclip.lua",        -- Improves clipboard, access through telescope
      config = function()
        require("neoclip").setup()
      end,
    }

    use {
      "folke/lsp-trouble.nvim",         -- Just do :Trouble and it tells you all the error spots its p pog, maybe look into more features later
      cmd = "Trouble",
      config = function()
        -- Can use P to toggle auto movement
        require("trouble").setup {
          auto_preview = false,
          auto_fold = true,
        }
      end,
    }

    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end
    }
    use "junegunn/goyo.vim"
    -- Plugins that I want to install but haven't been bothered to yet
    -- use "jose-elias-alvarez/null-ls.nvim"    -- Need to look into it in detail, adds linting n prettier n shit
    -- AndrewRadev/splitjoin.vim

    -- Plugins that I mihgt find useful at some point but not right now
    -- use "tjdevries/pastery.vim"      -- Adds some extra cute pasting features
    -- use "norcalli/nvim-terminal.lua"
    -- use "tjdevries/vim-inyoface"
    -- tpope/vim-abolish
    -- vigoux/architext.nvim
    -- danymat/neogen
    -- tjdevries/edit_alternate.vim
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
