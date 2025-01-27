return {
  -- {
  --   "glacambre/firenvim",
  --   lazy = not vim.g.started_by_firenvim,
  --   module = false,
  --   build = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  --   config = function()
  --     vim.api.nvim_create_autocmd("UIEnter", {
  --       callback = function()
  --         local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
  --         if client ~= nil and client.name == "Firenvim" then
  --           vim.o.guifont = "VictorMono Nerd Font:h13"
  --           vim.o.laststatus = 1
  --           vim.o.ruler = false
  --           vim.keymap.set("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<Cr>", {})
  --           vim.keymap.set("n", "<C-z>", "<Cmd>call firenvim#hide_frame()<Cr>", {})
  --         end
  --       end,
  --     })
  --     vim.g.firenvim_config = {
  --       localSettings = {
  --         [".*"] = {
  --           filename = "/tmp/{hostname}_{pathname%10}.txt",
  --         },
  --         ["https?://leetcode\\.com"] = {
  --           filename = "/tmp/{hostname}_{pathname%10}.java",
  --         },
  --       },
  --     }
  --     -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  --     --   nested = true,
  --     --   command = "write",
  --     -- })
  --   end,
  -- },
  -- Need to figure out later how to implement noice with nvchad
  -- {
  --   "folke/noice.nvim",
  --   lazy = false,
  --   opts = {},
  --   config = function()
  --     require("noice").setup {
  --       presets = {
  --         -- command_palette = true,
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- "williamboman/mason.nvim",
      -- "jay-babu/mason-nvim-dap.nvim", -- disabled since not working
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    -- potentially load with "cond" + "keys" so that the debugger is launched
    -- only when the debug keys are hit AND it's a python file
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- currently using mason-nvim-dap doesn't work
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java", -- same as above for nvim-dap-python
  },
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("lint").linters_by_ft = {
        python = { "mypy" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
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
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "python",
        "markdown",
        "java",
      },
    },
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
      min_horizontal_distance_smear = 10,
      min_vertical_distance_smear = 2,
      -- faster animations: -- Default  Range
      -- stiffness = 0.8, -- 0.6      [0, 1]
      -- trailing_stiffness = 0.5, -- 0.3      [0, 1]
      -- distance_stop_animating = 0.5, -- 0.1      > 0
      -- hide_target_hack = false, -- true     boolean
    },
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "folke/flash.nvim",
    opts = {},
    config = function()
      require("base46").get_integration "flash"
      dofile(vim.g.base46_cache .. "flash")
    end,
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if `nvim-treesitter` installed
    cmd = "Leet", -- only load plugin for this command
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
  {
    -- TODO: potentially add lowercase version and also remove the need to add a ":"
    "folke/todo-comments.nvim",
    event = "VeryLazy", -- potentially instead of always loading add a toggle command
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("base46").get_integration "todo"
      dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup()
    end,
  },
  {
    "marcussimonsen/let-it-snow.nvim",
    cmd = "LetItSnow", -- Wait with loading until command is run
    opts = {},
  },
  -- { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-path" },
}
