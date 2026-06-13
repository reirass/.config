require "nvchad.options"
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- vim.opt.termguicolors = true
vim.opt.guicursor = ""
