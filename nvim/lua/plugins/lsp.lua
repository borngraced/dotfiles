return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  opts = {
    inlay_hints = { enabled = false },
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<leader>dr", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })
      end,
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = false,
          procMacro = {
            enable = true,
            ignored = {
              ["napi-derive"] = { "napi" },
            },
          },
          inlayHintos = {
            typeHints = { enable = false },
            chainingHints = { enable = false },
            parameterHints = { enable = false },
            closingBraceHints = { enable = false },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable("rust-analyzer") == 0 then
      LazyVim.error(
        "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
        { title = "rustaceanvim" }
      )
    end
  end,
}
