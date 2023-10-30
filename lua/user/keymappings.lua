vim.g.mapleader = ' '
vim.g.localleader = ' '

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- explorer
keymap('n', '<leader>e', ':Ex<CR>', opts)

-- navigate windows
keymap('n', 'gh', '<C-w>h', opts)
keymap('n', 'gj', '<C-w>j', opts)
keymap('n', 'gk', '<C-w>k', opts)
keymap('n', 'gl', '<C-w>l', opts)

-- navigate terminals
keymap('t', 'gh', "<C-\\><C-N><C-w>h", opts)
keymap('t', 'gj', "<C-\\><C-N><C-w>j", opts)
keymap('t', 'gk', "<C-\\><C-N><C-w>k", opts)
keymap('t', 'gl', "<C-\\><C-N><C-w>l", opts)

-- split
keymap('n', '<leader>hts', ":split | terminal<CR>", opts) -- horizontal terminal
keymap('n', '<leader>vts', ":vsplit | terminal<CR>", opts) -- vertical terminal

keymap('n', '<leader>hs', ":split<CR>", opts) -- horizontal buffer
keymap('n', '<leader>vs', ":vsplit<CR>", opts) -- vertical buffer

keymap('n', '<leader>he', ":Sexplore<CR>", opts) -- horizontal explorer
keymap('n', '<leader>ve', ":Vexplore<CR>", opts) -- vertical explorer

-- navigate buffers
keymap('n', '<C-l>', ':bnext<CR>', opts)
keymap('n', '<C-h>', ':bprevious<CR>', opts)

-- resize window
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up/down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- dont yank when pasting
keymap('v', 'p', '"_dP', opts)

-- insert closed brace
keymap('i', '(', '()<Left>', opts)
keymap('i', '[', '[]<Left>', opts)
keymap('i', '{', '{}<Left>', opts)

-- normal mode in terminal mode
keymap('t', '<C-w>h', '<C-\\><C-n>', opts)
