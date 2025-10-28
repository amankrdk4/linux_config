-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- C++ Compile and Run mappings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- F5: compile and run with input from inp.txt
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>",
      ":w <bar> !g++ -std=c++17 -O2 -DLOCAL % -o %:r && ./%:r < ./inp.txt<CR>",
      { noremap = true, silent = true }
    )

    -- F6: compile and run without input redirection
    vim.api.nvim_buf_set_keymap(0, "n", "<F6>",
      ":w <bar> !g++ -std=c++17 -O2 -DLOCAL % -o %:r && ./%:r<CR>",
      { noremap = true, silent = true }
    )

    -- F7: overwrite inp.txt with clipboard content (cross-platform)
    vim.api.nvim_buf_set_keymap(0, "n", "<F7>",
      ":lua vim.fn.writefile(vim.fn.split(vim.fn.getreg('+'), '\\n'), 'inp.txt')<CR>",
      { noremap = true, silent = true }
    )

    -- F8: run existing executable with inp.txt (no recompilation)
    vim.api.nvim_buf_set_keymap(0, "n", "<F8>",
      ":!./%:r < ./inp.txt<CR>",
      { noremap = true, silent = true }
    )

    -- F9: run and save output to out.txt
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>",
      ":!./%:r < ./inp.txt > out.txt && echo 'Output written to out.txt'<CR>",
      { noremap = true, silent = true }
    )

    -- F10: clean executable
    vim.api.nvim_buf_set_keymap(0, "n", "<F10>",
      ":!rm -f %:r && echo 'Cleaned executable'<CR>",
      { noremap = true, silent = true }
    )
  end,
})

-- Disable all built-in LSPs
lvim.lsp.installer.setup.automatic_installation = false
lvim.lsp.automatic_servers_installation = false

-- Colorscheme
lvim.colorscheme = "koehler"

-- Relative line numbers
vim.opt.relativenumber = true

-- Enable simple cursorline (underline only)
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.termguicolors = true
vim.cmd [[
  highlight CursorLine guibg=NONE guifg=NONE gui=underline
]]

-- Disable autocompletion (manual mode only)
lvim.builtin.cmp.active = false

-- Insert-mode escape with jj
vim.keymap.set("i", "jj", "<Esc>")

-- Indentation preferences for C++
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable automatic comment continuation
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]


