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
  -- TODO: eventually use ruff/pyright instead of mypy for typechecking?
  -- Also maybe disable mypys non typechecking features since this overlaps with LSP
  -- Also pylint currently overlaps partially with ruff - disable those errors globally!
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    ft = "python",
    config = function()
      require("lint").linters_by_ft = {
        python = { "mypy", "pylint" },
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
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    -- should create "ftplugin" dirs
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "xml",
      "markdown",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
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
    opts = {
      lang = "python3",
      injector = {
        -- ["python3"] = {
        --   before = true,
        -- },
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          after = "int main() {}",
        },
        ["java"] = {
          before = true,
        },
      },
      storage = {
        home = vim.loop.os_homedir() .. "/LC",
      },
      plugins = {
        non_standalone = true,
      },
    },
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
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "yetone/avante.nvim",
    -- event = "VeryLazy",
    -- lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  -- stylua: ignore
    keys = { -- only load plugin on opening the sidebar
      { "<leader>aa", mode = { "n", "v", "o" }, function() require("avante.api").ask() end, desc = "avante: ask" },
    },

    opts = {},
    build = "make BUILD_FROM_SOURCE=true",
    -- build = "make", --to avoid building from source
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- {
      --   -- support for image pasting
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
        config = {
          -- behavior = {
          -- auto_suggestions = true,
          -- },
        },
      },
    },
  },
  {
    "marcussimonsen/let-it-snow.nvim",
    cmd = "LetItSnow", -- Wait with loading until command is run
    opts = {},
  },
  -- { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-path" },
}
