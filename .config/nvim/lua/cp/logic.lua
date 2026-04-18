-- 1. Modified to include inp.txt preview
local function display_side_by_side()
    local dir = vim.fn.expand("%:p:h")
    local view_cmd = "cd " .. dir .. " && " ..
                     "printf \"\\n--- INPUT (inp.txt) ---\\n\" && cat inp.txt 2>/dev/null && " ..
                     "printf \"\\n\\n%-40s | %-40s\\n\" '--- OUTPUT ---' '--- ERR LOG ---' && " ..
                     "printf '%.s-' {1..80} && echo '' && " ..
                     "pr -m -t -w 80 out.txt err.txt 2>/dev/null && " ..
                     "printf \"\\n--- STATS ---\\n\" && cat stats.txt 2>/dev/null"
    vim.cmd("!" .. view_cmd)
end

-- 2. Define utility for timestamps
local function get_mtime(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.mtime.sec or 0
end

-- 3. The main logic function
local function run_cpp_logic(force_input)
    local dir = vim.fn.expand("%:p:h")
    local file_full = vim.fn.expand("%:t")
    local file_no_ext = vim.fn.expand("%:t:r")
    local binary_path = dir .. "/" .. file_no_ext
    local source_path = vim.fn.expand("%:p")
    local script_path = vim.fn.expand("~/.config/nvim/script/run_cpp.sh")

    vim.cmd("silent! wa")

    if force_input then
        local clipboard = vim.fn.getreg("+")
        local f = io.open(dir .. "/inp.txt", "w")
        if f then f:write(clipboard) f:close() end
    end

    local last_src_change = get_mtime(source_path)
    local last_bin_change = get_mtime(binary_path)

    local run_cmd
    local pch_dir = os.getenv("CPP_PCH_DIR") or "/tmp/cppheaders"
    
    if last_src_change > last_bin_change or last_bin_change == 0 then
        run_cmd = string.format("%s %s %s %s %s %s %s %s %s", 
              script_path, dir, file_full, file_no_ext, 
              "inp.txt", "out.txt", "err.txt", "stats.txt", pch_dir)
    else
        run_cmd = string.format("cd %s && /usr/bin/time -f 'Time: %%es\\nMemory: %%MKB' -o stats.txt timeout 6.9s ./%s < inp.txt > out.txt 2> err.txt", 
                  dir, file_no_ext)
    end

    vim.cmd("!" .. run_cmd)
    display_side_by_side()
end

-- 4. Updated Autocmd with <C-F6>
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        local map = vim.keymap.set
        map("n", "<F5>", function() run_cpp_logic(false) end, { buffer = true })
        -- Changed from <F6> to <C-F6>
        map("n", "<F6>", function() run_cpp_logic(true) end, { buffer = true })
    end
})
