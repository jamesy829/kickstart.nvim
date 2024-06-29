return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_enabled = true
    -- vim.keymap.set('i', '<Tab>', function()
    --   return vim.fn['codeium#Accept']()
    -- end, { expr = true, silent = true })
    vim.keymap.set('i', '<Enter>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    -- vim.keymap.set('i', '<C-;>', function()
    --   return vim.fn['codeium#CycleCompletions'](1)
    -- end, { expr = true, silent = true })
    vim.keymap.set('i', '<Tab>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })
    -- vim.keymap.set('i', '<C-,>', function()
    --   return vim.fn['codeium#CycleCompletions'](-1)
    -- end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
  end,
}
