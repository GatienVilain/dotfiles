return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Enable telescope fzf native, if installed
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
    keys = {
      -- See `:help telescope.builtin`
      {'<leader>?', "<cmd>Telescope oldfiles<cr>", desc = '[?] Find recently opened files'},
      {'<leader><space>', "<cmd>Telescope buffers<cr>", desc = '[ ] Find existing buffers'},
      {
        '<leader>/',
        function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer'
      },
      {'<leader>gf', "<cmd>Telescope git_files<cr>", desc = 'Search [G]it [F]iles' },
      {'<leader>sf', "<cmd>Telescope find_files<cr>", desc = '[S]earch [F]iles' },
      {'<leader>sh', "<cmd>Telescope help_tags<cr>", desc = '[S]earch [H]elp' },
      {'<leader>sw', "<cmd>Telescope grep_string<cr>", desc = '[S]earch current [W]ord' },
      {'<leader>sg', "<cmd>Telescope live_grep<cr>", desc = '[S]earch by [G]rep' },
      {'<leader>sd', "<cmd>Telescope diagnostics<cr>", desc = '[S]earch [D]iagnostics' },
    }
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    cmd = "Telescope",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}