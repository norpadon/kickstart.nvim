-- Molten is a fork of Magma -- a plugin for interactive development using Jupyter.
local function new_jupyter_cell()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.fn.MoltenDefineCell(row, row + 1)
end

return {
  'benlubas/molten-nvim',
  dependencies = {
    '3rd/image.nvim',
    'echasnovski/mini.nvim', -- For status line
    'folke/which-key.nvim', -- For keybindings
  },
  build = ':UpdateRemotePlugins',
  init = function()
    require('which-key').register {
      ['<S-CR>'] = { ':MoltenReevaluateCell<CR>', 'Reevaluate Jupyter cell' },
      ['<localleader>Ja'] = { new_jupyter_cell, '[A]dd [J]upyter cell' },
      ['<localleader>J'] = { name = '+[J]upyter' },
      ['<localleader>Ji'] = { ':MoltenInit<CR>', '[I]int [J]upyter' },
    }
  end,
}
