vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

-- vim.g.nvim_tree_follow = 1

require'nvim-tree'.setup {
  disable_netrw = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  filters = {
    custom = {'.git', 'node_modules'},
  },
  git = {
    ignore = true
  },
  update_focused_file = {
    update_cwd = true,
  },
  hijack_directories = {
    auto_open = false,
  }
}