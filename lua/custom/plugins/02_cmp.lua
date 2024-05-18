return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'onsails/lspkind.nvim' },
  opts = {
    sources = require('cmp').config.sources {
      { name = 'buffer', max_item_count = 2 },
      { name = 'codeium', max_item_count = 2 },
      { name = 'cmp_tabnine', max_item_count = 2 },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
    },
    mapping = require('cmp').mapping.preset.insert {
      ['<C-a>'] = require('cmp').mapping.complete(),
    },
    formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = require('lspkind').symbolic(vim_item.kind, { mode = 'symbol_text' })
        vim_item.menu = source_mapping[entry.source.name]

        if entry.source.name == 'codeium' then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ' Codeium'
          if detail and detail:find '.*%%.*' then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    },
  },
}
