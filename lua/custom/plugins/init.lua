-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function make_python_pretty()
  vim.api.nvim_set_hl(0, '@type.python', {
    fg = '#4EC9B0',
  })
  vim.api.nvim_set_hl(0, '@constructor.python', {
    fg = '#4EC9B0',
  })
  vim.api.nvim_set_hl(0, '@type.builtin.python', {
    fg = '#4EC9B0',
  })
  -- constants (string literals)
  vim.api.nvim_set_hl(0, '@constant.python', {
    fg = '#4FC1FF',
  })
  -- variables
  vim.api.nvim_set_hl(0, '@variable.python', {
    fg = '#9CDCFE',
  })
  -- variables (function)parameter
  vim.api.nvim_set_hl(0, '@variable.parameter.python', {
    fg = '#9CDCFE',
  })
  -- "@"function wrapper
  vim.api.nvim_set_hl(0, '@attribute.python', {
    fg = '#DCDCAA',
  })
  vim.api.nvim_set_hl(0, '@function.python', {
    fg = '#DCDCAA',
  })
  -- class property
  vim.api.nvim_set_hl(0, '@variable.member.python', {
    fg = '#9CDCFE',
  })
  vim.api.nvim_set_hl(0, '@string.python', {
    fg = '#CE9178',
  })
  vim.api.nvim_set_hl(0, '@string.documentation.python', {
    fg = '#CE9178',
  })
  vim.api.nvim_set_hl(0, '@comment.python', {
    fg = '#6A9955',
  })
  -- return statement / await:
  vim.api.nvim_set_hl(0, '@keyword.coroutine.python', {
    fg = '#C586C0',
  })
  -- return statement / import:
  vim.api.nvim_set_hl(0, '@keyword.import.python', {
    fg = '#C586C0',
  })
  -- for-loop for
  vim.api.nvim_set_hl(0, '@keyword.repeat.python', {
    fg = '#C586C0',
  })
  -- "def"
  vim.api.nvim_set_hl(0, '@keyword.function.python', {
    fg = '#569CD6',
  })
  -- function call
  vim.api.nvim_set_hl(0, '@function.call.python', {
    fg = '#DCDCAA',
  })
  vim.api.nvim_set_hl(0, '@function.builtin.python', {
    fg = '#DCDCAA',
  })
  -- numbers / ints etc
  vim.api.nvim_set_hl(0, '@number.python', {
    fg = '#B5CEA8',
  })
  -- bracket [ ]
  vim.api.nvim_set_hl(0, '@punctuation.bracket.python', {
    fg = '#CCCCCC',
  })
end
return {
  make_python_pretty(),
  -- make python look pretty
}
