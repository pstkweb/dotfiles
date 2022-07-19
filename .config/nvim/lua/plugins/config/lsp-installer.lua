local lsp_installer = require'nvim-lsp-installer'
local nvim_lsp = require'lspconfig'

lsp_installer.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local required_servers = {
  "bashls",
  "cssls",
  "diagnosticls",
  "dockerls",
  "eslint",
  "graphql",
  "html",
  "jedi_language_server",
  "jsonls",
  "phpactor",
  "sumneko_lua",
  "svelte",
  "tsserver",
  "volar",
  "yamlls"
}

for _, name in pairs(required_servers) do
  local server_found, server = lsp_installer.get_server(name)

  if server_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local on_attach = function ()
  vim.api.nvim_set_keymap('n', 'gD', [[<Cmd> lua vim.lsp.buf.declaration()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'gd', [[<Cmd> lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'gs', [[<Cmd> lua vim.lsp.buf.signature_help()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'K', [[<Cmd> lua vim.lsp.buf.hover()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'gr', [[<Cmd> lua vim.lsp.buf.references()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>ca', [[<Cmd> lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })
end

nvim_lsp.bashls.setup{
  on_attach = on_attach
}

nvim_lsp.cssls.setup{
  on_attach = on_attach
}

nvim_lsp.dockerls.setup{
  on_attach = on_attach
}

nvim_lsp.graphql.setup{
  on_attach = on_attach
}

nvim_lsp.html.setup{
  on_attach = on_attach
}

nvim_lsp.jedi_language_server.setup{
  on_attach = on_attach
}

nvim_lsp.jsonls.setup{
  on_attach = on_attach
}

nvim_lsp.phpactor.setup{
  on_attach = on_attach
}

nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
}

nvim_lsp.svelte.setup{
  on_attach = on_attach
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach
}

nvim_lsp.volar.setup{
  on_attach = on_attach
}

nvim_lsp.yamlls.setup{
  on_attach = on_attach
}

nvim_lsp.diagnosticls.setup {
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end
  end,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { 'package.json', 'tsconfig.json', '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { 'package.json', 'tsconfig.json', '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

