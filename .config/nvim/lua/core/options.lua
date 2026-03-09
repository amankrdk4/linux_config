local opt = vim.opt
opt.termguicolors = true
opt.syntax = "on"
opt.number = true
opt.relativenumber = true 
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.smartindent = true 
opt.shiftwidth = 4
opt.tabstop = 4
opt.swapfile = false
opt.undofile = true 
opt.autowriteall = true
opt.updatetime = 300 

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.guicursor = "n-v-c-i-ci-ve-r-cr-o:block-CursorNormal,i-ci:block-CursorInsert,v:block-CursorVisual"
opt.shortmess:append("IAcsW")

vim.diagnostic.config({ virtual_text = false, signs = false, underline = false, update_in_insert = false })
