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

    -- Keep this at end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
