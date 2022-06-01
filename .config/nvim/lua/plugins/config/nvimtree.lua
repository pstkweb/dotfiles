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
  },
  renderer = {
    icons = {
      show = {
        git = false,
        folder = true,
        file = true,
        folder_arrow = false,
      }
    }
  }
}
