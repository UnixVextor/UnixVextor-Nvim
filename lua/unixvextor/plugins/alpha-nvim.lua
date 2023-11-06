return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- set header
    dashboard.section.header.val = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "   Toggle file explorer", "<cmd>Neotree<CR>"),
      dashboard.button("SPC ff", "󰱼   Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "   Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "   Quit NVIM", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = {
      "- UnixVextor 🚀 -",
    }

    dashboard.section.footer.opts.hl = "Constant"
    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
