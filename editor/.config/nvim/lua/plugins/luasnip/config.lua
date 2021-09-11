local M = {}

local map = require('utils').new_map
local ls = require('luasnip')
local wk = require('which-key').register

function M.luasnip_jump(dir)
  if ls.jumpable(dir) then
    ls.jump(dir)
  else
    return ""
  end
end

function M.setup()
  ls.config.set_config {history = true, updateevents = "TextChanged,TextChangedI"}
  require('luasnip.loaders.from_vscode').lazy_load {}

  map('i', '<C-h>', '<cmd>lua require("plugins.luasnip.config").luasnip_jump(-1)<CR>')
  map('i', '<C-l>', '<cmd>lua require("plugins.luasnip.config").luasnip_jump(1)<CR>')
  map('s', '<C-h>', '<cmd>lua require("plugins.luasnip.config").luasnip_jump(-1)<CR>')
  map('s', '<C-l>', '<cmd>lua require("plugins.luasnip.config").luasnip_jump(1)<CR>')
  map('i', '<C-e>',
      '<cmd>lua require("luasnip").choice_active() and require("luasnip").change_choice(1)<CR>')
  map('s', '<C-e>',
      '<cmd>lua require("luasnip").choice_active() and require("luasnip").change_choice(1)<CR>')

  wk({
    ['<leader>s'] = {
      name = 'snippet',
      d = {'<Plug>lua-snip-delete-check', 'check snippet deletion'}
    }
  })
end

return M