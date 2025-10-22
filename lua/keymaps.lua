-- Move lines up and down with Alt-j/k
vim.keymap.set('n', '<M-j>', '<CMD>:m+1<CR>', { desc = 'Move line down' })
vim.keymap.set('n', '<M-k>', '<CMD>:m-2<CR>', { desc = 'Move line up' })
-- Visual mode mappings
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
-- Ruff linter mappings
-- vim.keymap.set('n', '<leader>rl', require('custom.plugins.ruff_telescope').run_ruff_and_show_in_telescope, { noremap = true, silent = true })
-- Close buffer
vim.keymap.set('n', '<leader>x', '<CMD>bd<CR>', { desc = '[X] Buffer Close' })
-- Put latest yank mappings
vim.keymap.set('n', '<leader>p', '"0p', { desc = '[P]ut latest Yank' })
vim.keymap.set('v', '<leader>p', '"0p', { desc = '[P]ut latest Yank' })
-- save file
vim.keymap.set('n', '<C-S>', '<CMD>w<CR>', { desc = '[s]ave file' })
vim.keymap.set('i', '<C-S>', '<Esc><Esc><CMD>w<CR>', { desc = '[s]ave file' })
-- go to definiton with F12
vim.keymap.set('n', '<F12>', '<CMD>lua vim.lsp.buf.definition()<CR>', { desc = '[G]oto [D]efinition' })

vim.keymap.set('i', '<F12>', '<Esc><CMD>lua vim.lsp.buf.definition()<CR>', { desc = '[G]oto [D]efinition' })
-- make life easier with ; and : in normal mode
vim.keymap.set('n', ';', ':', { desc = '<cmd>' })
vim.keymap.set('n', '<enter>', ':<up>', { desc = 'Previous command' })
