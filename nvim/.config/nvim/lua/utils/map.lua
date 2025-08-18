-- vim.keymap.set wrapper --
local M = {}

local default_opts = { noremap = true, silent = true }

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend('force', default_opts, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
