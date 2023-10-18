return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        native_lsp = {
          enabled = true,
        },
        mason = true,
        neotree = true,
        telescope = true,
        treesitter = true,
      }
    },
    config = function ()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        globalstatus = true,
        -- ignore_focus = {
        --   'neo-tree',
        -- },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = ''} },
        },
        lualine_c = {
          { 'filename', file_status = true, path = 1 },
        },
        lualine_x = {
          'encoding',
          { 'fileformat', icons_enabled = false },
          'filetype'
        },
        lualine_z = {
          { 'location', separator = { right = '' }, padding = { left = 2 } },
        },
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            mode = 1,
            max_length = vim.o.columns,
            tabs_color = { inactive = 'lualine_b_normal' },
            separator = { left = '', right = ''}
          },
        },
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      use_treesitter = true,
      show_end_of_line = true,
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
    -- config = function ()
    --   vim.o.list = true
    --   vim.opt.listchars = {
    --     eol = '↲',
    --     space = '·'
    --   }
    -- end,
  },

  -- Useful plugin to show you pending keybinds.
  -- {
  --   'folke/which-key.nvim',
  --    opts = {
  --     window = { border = 'single' },
  --     triggers_nowait = {
  --       "c",
  --     },
  --    },
  -- }, -- TODO: Resolve conflicts with vim-bepo
  -- INFO: As the functions to fix the problem are currently not working
  -- (a bug has been opened in the repository)
  -- use instead to find the keybinding `:Telescope keymaps`

  {
    -- Manages windows with terminal buffers
    -- allowing us to toggle them with one keybinding.
    'akinsho/toggleterm.nvim',
    -- See `:help toggleterm.nvim`
    opts = {
      open_mapping = '<C-g>',
      direction = 'horizontal',
      shade_terminals = true
    },
  }

}
