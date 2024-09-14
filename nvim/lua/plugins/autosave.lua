return {
  "pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" }, -- Auto-load plugin on these events
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      events = { "InsertLeave", "TextChanged" }, -- Triggers auto-save on these events
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      debounce_delay = 135,
    })
  end,
}
