return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx and jsx files
      prehook = ts_context_commentstring.create_pre_hook(),
      toggler = {
        line = "<leader>/",
        block = "gbc",
      },
      opleader = {
        line = "<leader>/",
        block = "gb",
      },
    })
  end,
}
