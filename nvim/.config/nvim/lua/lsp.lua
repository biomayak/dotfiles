local coq = require('coq') -- Теперь coq уже загружен в plugins.lua
local lspconfig = require('lspconfig')

-- Загружаем конфигурации отдельных LSP серверов
local function setup_server(server_name)
  local config_path = 'lsp.' .. server_name
  local ok, server_config = pcall(require, config_path)
  if ok then
    -- Применяем coq capabilities к конфигурации сервера
    lspconfig[server_name].setup(coq.lsp_ensure_capabilities(server_config))
  else
    -- Если нет отдельного конфига, используем базовую настройку
    lspconfig[server_name].setup(coq.lsp_ensure_capabilities({}))
  end
end

-- Настройка серверов
setup_server('lua_ls')
setup_server('ts_ls')
setup_server('clangd')

-- Общие LSP автокоманды
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end

    -- НЕ включаем встроенное автодополнение - coq_nvim обрабатывает это

    -- Auto-format on save
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
