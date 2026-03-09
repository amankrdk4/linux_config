local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() vim.cmd.colorscheme("tokyonight-night") end },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },
    { "mbbill/undotree", cmd = "UndotreeToggle" },
    { "folke/flash.nvim", event = "VeryLazy", opts = {}, keys = { { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" } } },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" }, scope = { enabled = true } } },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = { options = { theme = "auto", globalstatus = true } } },
    { "christoomey/vim-tmux-navigator", lazy = false },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "windwp/nvim-autopairs", opts = {} },
    { "echasnovski/mini.comment", opts = { mappings = { comment = '<leader>/', comment_line = '<leader>/', comment_visual = '<leader>/' } } },
    { "neovim/nvim-lspconfig", config = function() require('lspconfig').clangd.setup({ cmd = { "clangd", "--std=c++17", "--header-insertion=never" } }) end },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function() 
        require("nvim-treesitter.configs").setup({ ensure_installed = { "lua", "cpp", "c" }, highlight = { enable = true } }) 
    end },
})
