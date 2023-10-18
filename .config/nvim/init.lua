--[[

If you don't know anything about Lua, I recommend taking some time to read through
a guide. One possible example:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`

Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

--]]


-- Basic configuration
require('config.options')
require('config.mappings')


-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Bépo layout
  'michamos/vim-bepo',

  -- EditorConfig plugin for Vim
  'editorconfig/editorconfig-vim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Provides mappings to easily delete, change and add such surroundings in pairs
  'tpope/vim-surround',

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'plugins.kickstart.autoformat',
  -- require 'plugins.kickstart.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/plugins/*.lua`
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'plugins' },
}, {})


-- Additional Configuration
require('config.autocmds')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et