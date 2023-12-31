return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    require("project_nvim").setup({})
    telescope.load_extension("fzf")
    telescope.load_extension("projects")
    telescope.load_extension("media_files")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mapping = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- setkeymap
    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>p", "<cmd>Telescope projects<cr>", { desc = "Recent project" })
  end,
}
