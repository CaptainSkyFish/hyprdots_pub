return {
  "nvim-lua/plenary.nvim",
  {
    "nvchad/base46",
    lazy = false,
    priority = 1000,
    config = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {},
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("undotree").setup {
        float_diff = true,
        position = "right",
        layout = "right_bottom",
      }
      vim.opt.undofile = true
      vim.opt.undodir = vim.fn.stdpath "data" .. "/undo//"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use latest version
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- config = function()
    --   require "configs.noice"
    -- end,
    opts = {
      -- add any options here
      cmdline = { view = "cmdline_popup" },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "black",
        "prettier",
        "biome",
        "pyright",
        -- "black",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "rust_analyzer",
          "ts_ls",
          "html",
          "emmet_ls",
          "pyright",
          "cssls",
          "tailwindcss",
          "clangd",
          "lua_ls",
          "marksman",
          "prismals",
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
          require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/custom/snippets/" }
        end,
      },
    },
    opts = function()
      return require "nvchad.configs.cmp"
    end,
  },

  -- autopairing of (){}[] etc
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    lazy = false,
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = { enable = false }, -- Disable lightbulb icon if you don't like it
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "nvimtools/none-ls.nvim", -- (renamed from null-ls)
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require "configs.none-ls"
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup {
        ensure_installed = { "biome", "prettier", "black" },
        automatic_installation = true,
      }
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
