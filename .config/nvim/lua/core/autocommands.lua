vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#ff0000", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#ffffff", fg = "#000000" })
vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#ff0000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#0000ff", fg = "#ffffff" })

vim.api.nvim_create_autocmd("TextYankPost", { 
    callback = function() vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 }) end 
})

vim.api.nvim_create_autocmd("InsertEnter", { callback = function() vim.opt.hlsearch = false end })
vim.api.nvim_create_autocmd("InsertLeave", { callback = function() vim.opt.hlsearch = true end })

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, { 
    callback = function() 
        if vim.bo.modified and vim.bo.buftype == "" then 
            vim.cmd("silent! w") 
        end 
    end 
})
