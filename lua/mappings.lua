require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Neovim Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Menu UI and Shader colors
map("n", "<C-d>", "<cmd>Shades<CR>", { desc = "Color Shades" })
map("n", "<leader>p", "<cmd>Huefy<CR>", { desc = "Color pick" })

map({ "n" }, "<leader>m", function()
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options)
end, { desc = "Menu UI" })

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Menu UI" })

-- Lazygit Term
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "nvimtree focus window" })

-- Telescope ssh
map({ "n", "v" }, "<leader>fc", "<cmd>Telescope ssh-config<CR>", { desc = "Open an ssh extension" })

map("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- Opencode keymaps
vim.keymap.set({ "n", "x" }, "<C-a>", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<C-x>", function()
  require("opencode").select()
end, { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<C-o>", function()
  require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go", function()
  return require("opencode").operator "@this "
end, { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "goo", function()
  return require("opencode").operator "@this " .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<S-C-u>", function()
  require("opencode").command "session.half.page.up"
end, { desc = "Scroll opencode up" })
vim.keymap.set("n", "<S-C-d>", function()
  require("opencode").command "session.half.page.down"
end, { desc = "Scroll opencode down" })

-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
