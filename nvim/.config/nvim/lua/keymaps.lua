-- Keymap settings --
local map = require("utils.map").map

-- Basic
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", ";", ":", { desc = "Command mode" })
map({"n","i","v","x"}, "<C-w>", "<CMD>w<CR>", { desc = "Write buffer" })
map({"n","i","v","x"}, "<C-q>", "<CMD>q<CR>", { desc = "Quit buffer" })

-- Y to EOL
map("n", "Y", "y$", { desc = "Yank to the end of the line" })

-- jj to normal mode
map("i", "jj", "<ESC>", { desc = "Normal mode" })

-- Screen centering
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
map("n", "<leader>bh", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bl", "<CMD>bprevious<CR>", { desc = "Previous buffer" })

-- Move lines up/down
map("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move line up" })
map({"v","x"}, "<A-j>", "<CMD>m '>+1<CR>gv=gv", { desc = "Move selection down" })
map({"v","x"}, "<A-k>", "<CMD>m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Indetnting multiple lines
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- File navigation
map("n", "<leader>e", "<CMD>Explore<CR>", { desc = "Open file explorer" })
map("n", "<leader>ff", ":find ", { desc = "Find file" })
map("n", "<leader>rc", "<CMD>Explore ~/.config/nvim<CR>", { desc = "Open neovim config" })
