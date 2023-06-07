-- nohkeys
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Center in search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Split Right
vim.keymap.set({ 'n' }, '<leader>v', ':vsplit<cr>', { silent = true })
-- Split Down
-- vim.keymap.set({ 'n' }, '<leader>sh', ':split<cr>', { silent = true })

--Exit
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q<cr>', { silent = true })
--Duplicate Line
vim.keymap.set({ 'n' }, '<A-d>', 'yyp', { silent = true })

vim.keymap.set({ 'n' }, '<leader>cs', ':source<cr>', { silent = true })

-- Move in  splits
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { silent = true })

vim.keymap.set({ 'n', }, '<C-f>',
  function()
    vim.lsp.buf.format()
  end
  , { silent = true }
)


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


