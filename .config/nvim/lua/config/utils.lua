local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap

-- opt helps apply functions to the given scopes.
-- @param o - option key eg. `tabstop`
-- @param v - option value eg. `2`
-- @param scopes - the scope to be set eg. `{vim.o, vim.bo, vim.wo}`
-- @usage opt('number', true, {vim.o, vim.wo})
local function opt(o, v, scopes)
  scopes = scopes or {o_s}
  for _, s in ipairs(scopes) do s[o] = v end
end

local function autocmd(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = {cmds} end
  cmd('augroup ' .. group)
  if clear then cmd [[au!]] end
  for _, c in ipairs(cmds) do cmd('autocmd ' .. c) end
  cmd [[augroup END]]
end

-- map helps to map keys to an action
-- @param modes - mode to be applied in eg. `n` or `i`
-- @param lhs - keys to be mapped eg. `<leader>q`
-- @param rhs - actions to be performed eg. `<cmd>qa<cr>`
-- @param opts - options passed to the action eg. `silent`
-- @usage map('n', '<leader>q', '<cmd>qa<cr>', silent)
local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then modes = {modes} end
  for _, mode in ipairs(modes) do map_key(mode, lhs, rhs, opts) end
end

return {opt = opt, autocmd = autocmd, map = map}
