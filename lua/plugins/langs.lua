return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "vxpm/ferris.nvim",
  },
  {
    "jinzhongjia/LspUI.nvim",
    branch = "main",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        server = {
          cmd = function()
            local mason_registry = require "mason-registry"
            if mason_registry.is_installed "rust-analyzer" then
              -- This may need to be tweaked depending on the operating system.
              local ra = mason_registry.get_package "rust-analyzer"
              local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]
              return { ("%s/%s"):format(ra:get_install_path(), ra_filename or "rust-analyzer") }
            else
              -- global installation
              return { "rust-analyzer" }
            end
          end,
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                enable = true,
              },
              inlayHints = {
                typeHints = {
                  enable = false,
                },
              },
              cargo = {
                targetDir = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
    opts = {
      --   tools = {
      --     code_actions = {
      --       ui_select_fallback = true,
      --     },
      --   },
    },
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },
}
