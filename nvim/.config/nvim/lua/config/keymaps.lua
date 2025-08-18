-- Keymap settings --
local map = require('utils.map').map
local builtin = require('telescope.builtin')

-- Basic
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('n', ';', ':', { desc = 'Command mode' })
map({ 'n', 'i', 'v', 'x' }, '<C-w>', '<CMD>w<CR>', { desc = 'Write buffer' })
map({ 'n', 'i', 'v', 'x' }, '<C-q>', '<CMD>q<CR>', { desc = 'Quit buffer' })

-- U to Redo
map('n', '<S-u>', '<C-r>', { desc = 'Redo' })

-- Y to EOL
map('n', 'Y', 'y$', { desc = 'Yank to the end of the line' })

-- jj to normal mode
map('i', 'jj', '<ESC>', { desc = 'Normal mode' })

-- Screen centering
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Buffer navigation
map('n', '<leader>bn', '<CMD>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bN', '<CMD>bprevious<CR>', { desc = 'Previous buffer' })

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Tab navigation (more intuitive)
map('n', '<leader>tn', '<CMD>tabnew<CR>', { desc = 'New tab' })
map('n', '<leader>tx', '<CMD>tabclose<CR>', { desc = 'Close tab' })
map('n', '<S-h>', '<CMD>tabprevious<CR>', { desc = 'Previous tab' })
map('n', '<S-l>', '<CMD>tabnext<CR>', { desc = 'Next tab' })

-- Tab moving
map('n', '<leader>tm', '<CMD>tabmove<CR>', { desc = 'Move tab' })
map('n', '<leader>t>', '<CMD>tabmove +1<CR>', { desc = 'Move tab right' })
map('n', '<leader>t<', '<CMD>tabmove -1<CR>', { desc = 'Move tab left' })


-- Splitting & Resizing
map('n', '<leader>sv', '<CMD>vsplit<CR>', { desc = 'Split window vertically' })
map('n', '<leader>sh', '<CMD>split<CR>', { desc = 'Split window horizontally' })
map('n', '<C-Up>', '<CMD>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<CMD>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<CMD>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<CMD>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Move lines up/down
map('n', '<A-j>', '<CMD>m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', '<CMD>m .-2<CR>==', { desc = 'Move line up' })
map({ 'v', 'x' }, '<A-j>', '<CMD>m >+1<CR>gv=gv', { desc = 'Move selection down' })
map({ 'v', 'x' }, '<A-k>', '<CMD>m <-2<CR>gv=gv', { desc = 'Move selection up' })

-- Indetnting multiple lines
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Telescope
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
map('n', '<leader>fts', builtin.treesitter, { desc = 'Telescope tresitter' })
map('n', '<leader>dd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
map('n', '<leader>rc', '<CMD>Explore ~/.config/nvim<CR>', { desc = 'Open neovim config' })
