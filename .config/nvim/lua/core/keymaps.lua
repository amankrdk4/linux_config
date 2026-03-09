vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "jj", "<Esc>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>h", ":nohlsearch<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<F1>", "mj:%y+<CR>`j")
map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>i", "iios_base::sync_with_stdio(false); cin.tie(NULL);<Esc>")

for i = 1, 9 do 
    map("n", "<leader>" .. i, ":" .. i .. "b<CR>", opts) 
end

map("n", "<F7>", function()
    local clipboard_content = vim.fn.getreg('+')
    local dir = vim.fn.expand("%:p:h")
    local file = io.open(dir .. "/inp.txt", "w")
    if file then 
        file:write(clipboard_content) 
        file:close() 
        vim.api.nvim_echo({{"inp.txt updated in " .. dir, "String"}}, false, {}) 
    end
end)
