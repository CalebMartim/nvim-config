-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disables the space key's default behaviour in Normal and Visual mode 
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- Options
local opts = { noremap = true, silent = true }

-- In this configuration, 'y' and 'p' work independently inside nvim, with no 
-- communication with the system clipboard, but, '<leader> + y' will copy the
-- selected text to the system clipboard. Pasting the content of the system clipboard
-- can be done with 'crtl + v'
vim.o.clipboard = 'unnamed'
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)

-- Delete single character without copying into register 
vim.keymap.set('n',  'x', '"_x', opts)
-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<PageDown>', '<C-d>zz', opts)
vim.keymap.set('n', '<PageUp>', '<C-u>zz', opts)

-- Find and center 
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- Navigate through buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- Close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew<CR>', opts) -- New buffer

-- Tabs
--vim.keymap.set('n', '<C-n>', '<cmd> enew<CR>', opts) -- open new bu
--vim.keymap.set('n', '<C-t>', '<cmd> enew<CR>', opts) -- open new tab
--vim.keymap.set('n', '<C-q>', ':Bdelete!<CR>', opts) -- close current tab
--vim.keymap.set('n', '<C-w>', ':tabclose<CR>', opts) -- close current tab
--vim.keymap.set('n', '<M-Right>', ':bnext<CR>', opts) --  go to next tab
--vim.keymap.set('n', '<M-Left>', ':bprevious<CR>', opts) --  go to previous tab
--vim.keymap.set('n', '<C-PageUp>', ':bnext<CR>', opts) --  go to next tab
--vim.keymap.set('n', '<C-PageDown>', ':bprevious<CR>', opts) --  go to previous tab

-- TODO:
-- Map Alt+1 .. Alt+9 to go to tab 1 .. tab 9
-- for i = 1, 9 do
--  vim.keymap.set("n", "<M-" .. i .. ">", function()
--    vim.cmd("buffer " .. i)
--  end, opts)
--end

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
-- My additions:
vim.keymap.set('n', '<C-Up>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>', opts)

-- Tabs
--vim.keymap.set('n', '<C-n>', ':tabnew<CR>', opts) -- open new tab
--vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts) -- open new tab
--vim.keymap.set('n', '<C-q>', ':tabclose<CR>', opts) -- close current tab
----vim.keymap.set('n', '<C-w>', ':tabclose<CR>', opts) -- close current tab
--vim.keymap.set('n', '<M-Right>', ':tabn<CR>', opts) --  go to next tab
--vim.keymap.set('n', '<M-Left>', ':tabp<CR>', opts) --  go to previous tab
--vim.keymap.set('n', '<C-PageUp>', ':tabn<CR>', opts) --  go to next tab
--vim.keymap.set('n', '<C-PageDown>', ':tabp<CR>', opts) --  go to previous tab
---- Map Alt+1 .. Alt+9 to go to tab 1 .. tab 9
--for i = 1, 9 do
--  vim.keymap.set(
--    "n",
--    "<M-" .. i .. ">",
--    i .. "gt",
--    { noremap = true, silent = true, desc = "Go to tab " .. i }
--  )
--end

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Open or close Neotree 
vim.keymap.set('n', '<C-e>', ':Neotree toggle position=left<CR>', opts)
