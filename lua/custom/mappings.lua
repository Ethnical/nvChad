local M = {}

M.general = {
  n = {
    ["<leader>fc"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
}

M.Sessions = {
  plugin = true,
  n = {
    ["<leader>qs"] = { "<cmd>SessionStart<cr>", "Start", opts = { silent = true } },
    ["<leader>qo"] = { "<cmd>SessionStop<cr>", "Stop", opts = { silent = true } },
    ["<leader>qt"] = { "<cmd>SessionToggle<cr>", "Toggle", opts = { silent = true } },
    ["<leader>ql"] = { "<cmd>SessionLoad<cr>", "Load", opts = { silent = true } },
    ["<leader>qd"] = { "<cmd>SessionDelete<cr>", "Delete", opts = { silent = true } },
  },
}

M.navigation = {
  plugin = true,
  n = {
    ["<C-h>"] = {
      "<cmd> TmuxNavigateLeft<CR>",
      "window left",
      opts = {
        silent = true,
        nowait = true,
      },
    },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    -- ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"}, seems that for remapping is better to use the vim.api.nvim_set_keymap than this somehow it's works better or maybe a wider overwrite of mappings?
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window Up" },
    ["<A-h>"] = { "<C-w>>", "resize window left" },
    ["<A-l>"] = { "<C-w><", "resize window right" },
    ["<A-j>"] = { "<C-w>+", "resize window down" },
    ["<A-k>"] = { "<C-w>-", "resize window Up" },

    ["<C-t>"] = { "<cmd> ls <CR>", "resize window Up" },
    ["<C-y>"] = {
      "<cmd> TmuxNavigateDown<CR>",
      "windows Down",
      opts = {
        silent = true,
        nowait = true,
      },
    },
    -- vim.api.nvim_set_keymap("n", "<C-y>", "<cmd> TmuxNavigateDown<CR>", { noremap = true}), -- Need to add this because of the collision with '\x0A' with ctrl+j. So now the tab+j = <C-y>
    -- ["<A-=>"] = { "<C-w>=", "equalise windows"},
    -- ["<A-v>"] = { "<cmd> :vsp<CR>", "Vertical split"},
    ["<leader>tv"] = { "<C-b>n", "split a new tab with tmux" },
  },
}

M.dap = {
  plugin = true,
  n = { -- Normal mode because the  `n` value.
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}
-- Your custom mappings
M.explorer = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" }, -- Toggle the explorer.
    ["<leader>qq"] = { ":q <CR>", "quit the window" }, -- Toggle the explorer.
    -- ["<C-s>"] = {":Telescope Files <CR>", "Telecope Files"}
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    -- ...
  },
}
M.telescope = {
  n = {
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "LSP references",
    },
    ["gd"] = {
      function()
        require("telescope.builtin").lsp_definitions() -- Remove the `builtin` keyword because this not matching all of the cases.
      end,
      "LSP references",
    },
    ["<leader>sg"] = {
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      "Search Text Into Files",
    },
  },
  -- ["<leader>sg"] = {":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>","Search Text Into Files"}
}

-- M.nvimtree = {
--   n = {
--   ["<C-w>v"] = require("nvim-tree.api").node.open.vertical(),
--   },
-- }

M.path_location = {
  n = {
    ["<leader>sc"] = {
      ":let @+=expand('%') .. ':' .. line('.') | echo 'Location Copied:'@\n",
      "Get the path_location with the lines.",
    },
  },
}

return M
