return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'wellle/targets.vim',
      'nvim-treesitter/nvim-treesitter-textobjects',

      -- Automatically close and rename HTML tags
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    opts = {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        'bash',
        'c',
        'c_shap',
        'cmake',
        'cpp',
        'css',
        'dockerfile',
        'fish',
        'git_config',
        'gitattributes',
        'gitignore',
        'go',
        'godot_resource',
        'gomod',
        'gosum',
        'html',
        'java',
        'javascript',
        'json',
        'julia',
        'kotlin',
        'latex',
        'lua',
        'make',
        'markdown',
        'nix',
        'perl',
        'php',
        'python',
        'rust',
        'scss',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },

      -- Autoinstall languages that are not installed.
      auto_install = true,

      -- Modules that enhance Neovim's default features
      -- See `:help nvim-treesitter-modules`
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
  },
}