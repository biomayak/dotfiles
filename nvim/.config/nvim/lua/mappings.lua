require "nvchad.mappings"


-- add yours here

local map = vim.keymap.set

map({ "n", "i", "v" }, "<C-Q>", "<cmd> q <cr>", { desc = "General Quit" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "General Save" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Debugger Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Debugger Start or continue the debugger" })

-- moving text blocks
map("v", "<C-j>", ":m '>+1<CR>gv=gv")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")

map("t", "<Esc>", "<C-\\><C-n>")
map("t", "jj", "<C-\\><C-n>")

map({"n", "v"}, "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "LSP Preview and execute code actions" })

map({ "n", "v" }, "J", "10j")
map({ "n", "v" }, "K", "10k")
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

map("n", "<space>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Telescope File browser" })
map("n", "<leader>cfg", ":Telescope file_browser path=~/.config/nvim/lua/ select_buffer=true<CR>", { desc = "Config Open config folder" })
