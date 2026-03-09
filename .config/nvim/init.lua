vim.notify = function(msg, log_level)
    if log_level == vim.log.levels.ERROR then return end
end

require("core.options")
require("core.keymaps")
require("core.autocommands")
require("plugins")
require("cp.logic")
