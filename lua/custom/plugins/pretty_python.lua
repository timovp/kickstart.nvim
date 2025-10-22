local function make_python_pretty()
  ---------------------------------------------------------------------------
  -- #4EC9B0 — types and constructors
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@type.python', { fg = '#4EC9B0' })
  vim.api.nvim_set_hl(0, '@constructor.python', { fg = '#4EC9B0' })
  vim.api.nvim_set_hl(0, '@type.builtin.python', { fg = '#4EC9B0' })

  ---------------------------------------------------------------------------
  -- #4FC1FF — constants (string literals)
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@constant.python', { fg = '#4FC1FF' })

  ---------------------------------------------------------------------------
  -- #9CDCFE — variables
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@variable.python', { fg = '#9CDCFE' })
  vim.api.nvim_set_hl(0, '@variable.parameter.python', { fg = '#9CDCFE' })
  vim.api.nvim_set_hl(0, '@variable.builtin.python', { fg = '#9CDCFE' })
  vim.api.nvim_set_hl(0, '@variable.member.python', { fg = '#9CDCFE' })

  ---------------------------------------------------------------------------
  -- #DCDCAA — functions and attributes
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@attribute.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@function.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@function.call.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@function.builtin.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@function.method.call.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@function.method.python', { fg = '#DCDCAA' })
  vim.api.nvim_set_hl(0, '@constructor.python', { fg = '#DCDCAA' })

  ---------------------------------------------------------------------------
  -- #CE9178 — strings
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@string.python', { fg = '#CE9178' })
  vim.api.nvim_set_hl(0, '@string.documentation.python', { fg = '#CE9178' })

  ---------------------------------------------------------------------------
  -- #6A9955 — comments
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@comment.python', { fg = '#6A9955' })

  ---------------------------------------------------------------------------
  -- #C586C0 — keywords (control, import, coroutine, etc.)
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@keyword.coroutine.python', { fg = '#C586C0' })
  vim.api.nvim_set_hl(0, '@keyword.operator.python', { fg = '#C586C0' })
  vim.api.nvim_set_hl(0, '@keyword.import.python', { fg = '#C586C0' })
  vim.api.nvim_set_hl(0, '@keyword.repeat.python', { fg = '#C586C0' })

  ---------------------------------------------------------------------------
  -- #569CD6 — function definitions (“def”) and None
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@keyword.function.python', { fg = '#569CD6' })
  vim.api.nvim_set_hl(0, '@constant.builtin.python', { fg = '#569CD6' })

  ---------------------------------------------------------------------------
  -- #B5CEA8 — numbers
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@number.python', { fg = '#B5CEA8' })

  ---------------------------------------------------------------------------
  -- #CCCCCC — punctuation
  ---------------------------------------------------------------------------
  vim.api.nvim_set_hl(0, '@punctuation.bracket.python', { fg = '#CCCCCC' })
end

return { make_python_pretty() }
