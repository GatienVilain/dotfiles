return {
  {
    -- Display tree structures in a sidebar, floating window, or in a split.
    "nvim-neo-tree/neo-tree.nvim",
    -- See `:help neo-tree.txt`
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { '<leader>st', "<cmd>Neotree toggle reveal<cr>", desc = '[S]how file[T]ree' },
      { '<leader>sb', "<cmd>Neotree source=buffers toggle reveal<cr>", desc = '[S]how [B]uffers' },
      { '<leader>ss', "<cmd>Neotree source=git_status toggle reveal<cr>", desc = '[S]how Git [S]tatus' },
    },
    opts = {
      window = {
        -- Change keybindings to be more easy to use with bépo layout
        -- See `:help neo-tree-mappings`
        mappings = {
          ["c"] = "none",
          ["Y"] = "copy", -- move "copy" command (not to clipboard)
          ["t"] = "none",
          ["T"] = "open_tabnew", -- provide new tab command in the same way
          ["s"] = "none",
          ["n"] = "open_vsplit", -- vertical split as "[n]earby"
          ["r"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
}