vim.g.mapleader = ' '
vim.g.localleader = ' '

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- explorer
keymap('n', '<leader>e', ':Ex<CR>', opts)

-- navigate terminals
keymap('t', '<C-w>h', "<C-\\><C-N><C-w>h", opts)
keymap('t', '<C-w>j', "<C-\\><C-N><C-w>j", opts)
keymap('t', '<C-w>k', "<C-\\><C-N><C-w>k", opts)
keymap('t', '<C-w>l', "<C-\\><C-N><C-w>l", opts)

-- split
keymap('n', '<leader>hts', ":split | terminal<CR>", opts) -- horizontal terminal
keymap('n', '<leader>vts', ":vsplit | terminal<CR>", opts) -- vertical terminal

keymap('n', '<leader>hs', ":split<CR>", opts) -- horizontal buffer
keymap('n', '<leader>vs', ":vsplit<CR>", opts) -- vertical buffer

keymap('n', '<leader>he', ":Sexplore<CR>", opts) -- horizontal explorer
keymap('n', '<leader>ve', ":Vexplore<CR>", opts) -- vertical explorer

-- navigate buffers
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- close all buffers except the one in focus
keymap('n', '<C-c>b',
       ':silent let save_pos = getpos(".") | silent wa | silent %bd | silent edit# | silent bd# | silent call setpos(".", save_pos)<CR>',
       opts)

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

-- insert closing brace
keymap('i', '(', '()<Left>', opts)
keymap('i', '[', '[]<Left>', opts)
keymap('i', '{', '{}<Left>', opts)
keymap('i', '"', '""<Left>', opts)
keymap('i', "'", "''<Left>", opts)

-- normal mode in terminal mode
keymap('t', '<C-c>', '<C-\\><C-n>', opts)
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- surround selected text with bracktes
vim.surround_with = function(start_char, end_char)
    local line_start = vim.fn.getpos("'<")[2]
    local line_end = vim.fn.getpos("'>")[2]
    local col_start = vim.fn.getpos("'<")[3]
    local col_end = vim.fn.getpos("'>")[3]

    -- adjust column end if in visual line mode
    if vim.fn.visualmode() == "V" then
        col_end = #vim.fn.getline(line_end)
    end

    -- if it's a multi-line selection
    if line_start ~= line_end then
        vim.cmd(string.format('call setline(%d, "%s" . getline(%d))', line_start, start_char, line_start))
        vim.cmd(string.format('call setline(%d, getline(%d) . "%s")', line_end, line_end, end_char))
    else
        -- for single line selection
        local line_content = vim.fn.getline(line_start)
        local before = line_content:sub(1, col_start - 1)
        local middle = line_content:sub(col_start, col_end)
        local after = line_content:sub(col_end + 1)
        vim.cmd(string.format('call setline(%d, "%s%s%s%s%s")', line_start, before, start_char, middle, end_char, after))
    end

    -- move the cursor to the closing bracket
    vim.api.nvim_win_set_cursor(0, {line_end, col_end + 1})
end

keymap('v', '<leader>(', ':lua vim.surround_with("(", ")")<CR>', opts)
keymap('v', '<leader>{', ':lua vim.surround_with("{", "}")<CR>', opts)
keymap('v', '<leader>[', ':lua vim.surround_with("[", "]")<CR>', opts)
keymap('v', '<leader><', ':lua vim.surround_with("<", ">")<CR>', opts)

