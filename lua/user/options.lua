local opt = vim.opt

-- Display settings
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Text editing settings
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true
opt.mouse = ""

-- File and backup settings
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.clipboard = "unnamedplus"

-- Popup menu settings
opt.pumheight = 10

-- Session settings
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"

-- Split settings
opt.splitbelow = true
opt.splitright = true

-- Path settings
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.path:append("**")
