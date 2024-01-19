local nvimtree = require "custom.configs.nvimtree"
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "stylua",
        "prettier",
        "nomicfoundation-solidity-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {   "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle", },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "custom.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

--   { "nvim-tree/nvim-tree.lua", -- opts = nvimtree.nvimtree, cmd = { "NvimTreeToggle", "NvimTreeFocus" }, on_attach=nvimtree.my_on_attach,
--   config = function()
--   require("nvim-tree").setup({
--   on_attach = nvimtree.my_on_attach},{
--   filters = {
--     dotfiles = true,
--     exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
--   },
--   disable_netrw = true,
--   hijack_netrw = true,
--   hijack_cursor = true,
--   hijack_unnamed_buffer_when_opening = false,
--   sync_root_with_cwd = true,
--   update_focused_file = {
--     enable = true,
--     update_root = false,
--   },
--   view = {
--     adaptive_size = false,
--     side = "left",
--     width = 30,
--     preserve_window_proportions = true,
--   },
--   git = {
--     enable = false,
--     ignore = true,
--   },
--   filesystem_watchers = {
--     enable = true,
--   },
--   actions = {
--     open_file = {
--       resize_window = true,
--     },
--   },
--   renderer = {
--     root_folder_label = false,
--     highlight_git = false,
--     highlight_opened_files = "none",
--
--     indent_markers = {
--       enable = false,
--     },
--
--     icons = {
--       show = {
--         file = false,
--         folder = false,
--         folder_arrow = true,
--         git = false,
--       },
--
--       glyphs = {
--         default = "󰈚",
--         symlink = "",
--         folder = {
--           default = "",
--           empty = "",
--           empty_open = "",
--           open = "",
--           symlink = "",
--           symlink_open = "",
--           arrow_open = "",
--           arrow_closed = "",
--         },
--         git = {
--           unstaged = "✗",
--           staged = "✅",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "✅",
--           deleted = "",
--           ignored = "◌",
--         },
--       },
--     },
--   },
-- })
-- end,
-- },

  -- -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  --   -- init = function()
  --     -- require("core.utils").load_mappings "nvimtree"
  --   -- end,
  --   -- keys = function()
  --       -- ["<C-w>v"] = require("nvim-tree.api").node.open.vertical(),
  --       -- ["<leader>oo"] = require("nvim-tree.api").node.open.horizontal(),
  --       -- ["<C-w>s"] = require("nvim-tree.api").node.open.horizontal(),
  --   -- end,
  --   opts = function()
  --     return require "custom.configs.nvimtree" --load our config
  --   end,
  --
  --   require("nvimtree").setup {
  --     on_attach = require("plugins.configs.nvimtree").my_on_attach,
  --   }
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. "nvimtree")
  --     require("nvim-tree").setup(opts)
  --   end,
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go", --trigger only a file with go format.
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "plugins.configs.cmp"
      local cmp = require "cmp"

      opts.completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      }
      -- opts.mapping["<C-k>"] = cmp.mapping.select_next_item{ behavior = cmp.SelectBehavior.Insert }
      -- opts.mapping["<C-j>"] = cmp.mapping.select_prev_item{ behavior = cmp.SelectBehavior.Insert }
      opts.mapping["<CR>"] = cmp.mapping.confirm { select = true } -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      opts.mapping["<ESC>"] = cmp.mapping.abort() -- abort when the selection is not the correct one.
      opts.mapping["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }

      return opts
    end,
  },

  -- {
  --   "aserowy/tmux.nvim",
  --   lazy = false,
  -- },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    priority = 100,
    config = function()
      require("core.utils").load_mappings "navigation"
    end,
  },
  { -- neoscroll
    "karb94/neoscroll.nvim",
    lazy = false,
    priority = 75,
    -- keys = { "<C-d>", "<C-u>" },
    config = function()
      require "custom.configs.neoscroll"
    end,
  },
  {
    "diegoulloao/nvim-file-location",
    lazy = false,

    -- custom config
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSInstallInfo",
      "TSUpdate",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
      "TSToggle",
      "TSBufToggle",
    },
    opts = require "custom.configs.treesitter",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {

      {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },
        -- cmd = {"TSContextToggle"},
        keys = {
          { "<leader>ut", "<cmd>TSContextToggle<cr>", desc = "TSContextToggle" },
        },
      },
      -- "JoosepAlviste/nvim-ts-context-commentstring",
      -- "windwp/nvim-ts-autotag",
      -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  -- Sessions
  {
    "olimorris/persisted.nvim",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "Sessions"
    end,
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
      silent = false, -- silent nvim message when sourcing session file
      use_git_branch = true, -- create session files based on the branch of the git enabled repository
      autosave = true, -- automatically save session files when exiting Neovim
      should_autosave = nil, -- function to determine if a session should be autosaved
      autoload = false, -- automatically load the session for the cwd on Neovim startup
      on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
      follow_cwd = true, -- change session file name to match current working directory if it changes
      allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
      ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
      telescope = { -- options for the telescope extension
        reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- auto_quoting = true, -- enable/disable auto-quoting,

        version = "^1.0.0",
      },
    },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      -- require("telescope").load_extension("live_grep_args")
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
}
return plugins
