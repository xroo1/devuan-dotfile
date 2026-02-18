-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"


if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Sair com 'q'
vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S'
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preecg .sh
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- Auto preenchimento C++
vim.cmd([[
  function! AutoCpp()
    call append(0, '#include <iostream>')
    call append(1, '')
    call append(2, 'int main( int argc , char **argv ){')
    call append(3, "  std::cout << \"Olá, Mundo!\" << '\\n';")
    call append(4, '  return 0;')
    call append(5, '}')
    call cursor(4, 17)
  endfunction
  autocmd BufNewFile *.cpp :call AutoCpp()
]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ============ MAPEAMENTOS CORRIGIDOS ============ --
-- Use comandos NATIVOS do Neovim em vez de Buffer*

-- Move to previous/next (CORRIGIDO)
map('n', '<A-,>', '<cmd>bprevious<CR>', opts)
map('n', '<A-.>', '<cmd>bnext<CR>', opts)

-- -- Goto buffer in position... (CORRIGIDO)
-- map('n', '<A-1>', '<cmd>b1<CR>', opts)
-- map('n', '<A-2>', '<cmd>b2<CR>', opts)
-- map('n', '<A-3>', '<cmd>b3<CR>', opts)
-- map('n', '<A-4>', '<cmd>b4<CR>', opts)
-- map('n', '<A-5>', '<cmd>b5<CR>', opts)
-- map('n', '<A-6>', '<cmd>b6<CR>', opts)
-- map('n', '<A-7>', '<cmd>b7<CR>', opts)
-- map('n', '<A-8>', '<cmd>b8<CR>', opts)
-- map('n', '<A-9>', '<cmd>b9<CR>', opts)
-- map('n', '<A-0>', '<cmd>blast<CR>', opts)
--
-- Close buffer (CORRIGIDO)
map('n', '<A-c>', '<cmd>bdelete<CR>', opts)

-- Mapeamentos de copiar para clipboard
vim.cmd([[ vnoremap <leader>y "+y ]])
vim.cmd([[ nnoremap <leader>y "+yy ]])

vim.cmd([[ lua vim.diagnostic.config({virtual_text = false}) ]])

return {
  -- Configuração do LSP
  lsp = {
    servers = {
      "phpactor",
    },
    diagnostics = {
      virtual_text = false, -- Desativa o texto flutuante
    },
    config = {
      phpactor = function()
        return {
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git", ".phpactor.json"),
        }
      end,
    }
  },

  -- Ensure que o LSP é instalado automaticamente
  plugins = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "phpactor" }
      }
    }
  }
}


 
