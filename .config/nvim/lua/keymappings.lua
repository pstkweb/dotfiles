-- Global
vim.api.nvim_set_keymap('n', '<Leader>/', ':noh<CR>', { noremap = true, silent = true })

-- Buffer nav
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':BD<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bc', ':BufOnly<CR>', { noremap = true, silent = true })

-- Nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('fzf-lua').files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', [[<Cmd>lua require('fzf-lua').grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', [[<Cmd>lua require('fzf-lua').builtin()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>h', [[<Cmd>lua require'hop'.hint_words()<CR>]], { noremap = true, silent = true })

-- Trouble
vim.api.nvim_set_keymap('n', '<Leader>T', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })

-- Spectre
vim.api.nvim_set_keymap('n', '<Leader>S', [[<Cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', [[<Cmd>lua require('spectre').open_visual()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sp', [[<Cmd>lua require('spectre').open_file_search()<CR>]], { noremap = true, silent = true })

-- Phpactor
vim.api.nvim_set_keymap('n', '<Leader><Space>', ':PhpactorContextMenu<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':PhpactorGotoDefinition e<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':PhpactorTransform<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':PhpactorClassExpand<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':PhpactorNavigate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cl', ':PhpactorClassNew<CR>', { noremap = true, silent = true })
