return {
  {
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    module = false,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
          if client ~= nil and client.name == "Firenvim" then
            vim.o.guifont = "VictorMono Nerd Font:h13"
            vim.o.laststatus = 1
            vim.o.ruler = false
            vim.keymap.set("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<Cr>", {})
            vim.keymap.set("n", "<C-z>", "<Cmd>call firenvim#hide_frame()<Cr>", {})
          end
        end,
      })
      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            filename = "/tmp/{hostname}_{pathname%10}.txt",
          },
          ["https?://leetcode\\.com"] = {
            filename = "/tmp/{hostname}_{pathname%10}.java",
          },
        },
      }
      -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      --   nested = true,
      --   command = "write",
      -- })
    end,
  },
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
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    -- config = function(_, opts)
    -- require("core.utils").load_mappings "dap"
    -- end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings "dap_python"
    end,
  },
  -- might want to figure out lateer how to use nvim-java with DAP, Lombok etc.
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "pyright",
        "prettier",
        "clangd",
        "clang-format",
        "mypy",
        "ruff",
        "debugpy",
        "isort",
        "black",
        "jdtls",
      },
    },
  },
  --
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
  -- { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-path" },
}
