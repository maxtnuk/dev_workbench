return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "AstroNvim/astrolsp", opts = {} },
      {
        "williamboman/mason-lspconfig.nvim", -- MUST be set up before `nvim-lspconfig`
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          -- use AstroLSP setup for mason-lspconfig
          handlers = { function(server) require("astrolsp").lsp_setup(server) end },
        },
        config = function(_, opts)
          -- Optionally tell AstroLSP to register new language servers before calling the `setup` function
          -- this enables the `mason-lspconfig.servers` option in the AstroLSP configuration
          -- require("astrolsp.mason-lspconfig").register_servers()
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
    config = function()
      -- set up servers configured with AstroLSP
      vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
    end,
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
