-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Check if we are in an SSH session
local is_ssh = vim.env.SSH_TTY ~= nil
-- Check if +clipboard is available
local no_clipboard = vim.g.clipboard == nil

-- Only define OSC52 clipboard if in SSH and no system clipboard
if is_ssh and no_clipboard then
  local function osc52_copy(lines)
    local text = table.concat(lines, "\n")
    local b64 = vim.fn.system("base64 | tr -d '\n'", text)
    local osc = string.format("\x1b]52;c;%s\x07", b64)
    vim.fn.chansend(vim.v.stderr, osc)
  end

  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = osc52_copy,
      ["*"] = osc52_copy,
    },
    paste = {
      ["+"] = function() return { vim.fn.getreg("+") } end,
      ["*"] = function() return { vim.fn.getreg("*") } end,
    },
  }
end

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.termguicolors = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
