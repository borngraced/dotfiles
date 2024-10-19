return {
  dir = "~/Dev/rustaceanvim/",
  name = "rustaceanvim",
  version = "^4",
  ft = { "rust" },

  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })

        vim.keymap.set("n", "<leader>rd", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })

        vim.keymap.set("n", "<leader>rl", function()
          vim.cmd.RustLsp("runnables")
        end, { desc = "Rust Runnables", buffer = bufnr })

        vim.keymap.set("n", "<leader>rr", function()
          vim.cmd.RustLsp("run")
        end, { desc = "Rust Run", buffer = bufnr })

        vim.keymap.set("n", "<leader>rs", function()
          vim.cmd.RustLsp("testables")
        end, { desc = "Rust Testables", buffer = bufnr })

        vim.keymap.set("n", "<leader>ro", function()
          vim.cmd.RustLsp("openDocs")
        end, { desc = "Rust OpenDocs", buffer = bufnr })

        vim.keymap.set("n", "<leader>rf", function()
          vim.cmd.RustLsp("flyCheck")
        end, { desc = "Rust FlyCheck", buffer = bufnr })

        vim.keymap.set("n", "<leader>rd", function()
          vim.cmd.RustLsp("renderDiagnostic")
        end, { desc = "Rust Render Diagnostics", buffer = bufnr })

        vim.keymap.set("n", "<leader>rdd ", function()
          vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
        end, { desc = "Rust Diagnostics All", buffer = bufnr })

        vim.keymap.set("n", "<leader>rdc ", function()
          vim.cmd.RustLsp({ "renderDiagnostic", "current" })
        end, { desc = "Rust Diagnostic Current", buffer = bufnr })
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
          inlayHints = {
            enabled = false,
          },
          diagnostics = {
            disabled = { "inactive-code" },
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
