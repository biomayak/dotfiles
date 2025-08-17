-- Behaviour settings --
local osc52 = require("osc52")

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.o.path = vim.o.path .. ",**"
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = osc52.copy,
    ["*"] = osc52.copy,
  },
  paste = {
    ["+"] = osc52.paste,
    ["*"] = osc52.paste,
  },
}
