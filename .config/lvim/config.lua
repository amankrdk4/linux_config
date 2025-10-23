-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- C++ Compile and Run mappings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- F5: compile with input from inp.txt
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>",
      ":w <bar> !g++ -O2 % -o %:r && ./%:r < ./inp.txt<CR>",
      { noremap = true, silent = true }
    )
    -- F6: compile without input redirection
    vim.api.nvim_buf_set_keymap(0, "n", "<F6>",
      ":w <bar> !g++ -O2 % -o %:r && ./%:r<CR>",
      { noremap = true, silent = true }
    )
    -- F7: overwrite inp.txt with clipboard content
    vim.api.nvim_buf_set_keymap(0, "n", "<F7>",
      ":let @\" = system('xclip -o -selection clipboard') | call writefile(split(@\", '\\n'), 'inp.txt')<CR>",
      { noremap = true, silent = true }
    )
  end,
})

-- Disable all built-in LSPs
lvim.lsp.installer.setup.automatic_installation = false
lvim.lsp.automatic_servers_installation = false
-- colorscheme change 
lvim.colorscheme = "koehler"
-- relative number 
vim.opt.relativenumber = true

-- Enable only simple cursorline
vim.opt.cursorline = true       -- highlight current line
vim.opt.cursorcolumn = false    -- disable current column highlight
vim.opt.termguicolors = true    -- ensure colors work well

-- Underline the current line using the cursor highlight
vim.cmd [[
  highlight CursorLine guibg=NONE guifg=NONE gui=underline
]]
-- Disable autocompletion
lvim.builtin.cmp.active = false
-- jj remap
vim.keymap.set("i", "jj", "<Esc>")
