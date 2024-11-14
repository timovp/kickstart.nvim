local M = {}

M.run_ruff_and_show_in_telescope = function()
  -- local filepath = vim.api.nvim_buf_get_name(0)
  -- if filepath == '' then
  --   print 'No file selected.'
  --   return
  -- end
  --
  local cmd = { 'ruff', 'check', '.', '--output-format', 'json' }

  local json_output = ''

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        json_output = table.concat(data, '\n')
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then
        print('Ruff linting' .. table.concat(data, '\n'))
      end
    end,
    on_exit = function(_, exit_code)
      if exit_code ~= 0 and exit_code ~= 1 then -- Ruff returns 1 if issues are found
        print('Ruff exited with code ' .. exit_code)
        return
      end

      if json_output == '' then
        print 'No issues found by Ruff.'
        return
      end

      local success, results = pcall(vim.fn.json_decode, json_output)
      if not success then
        print 'Failed to parse Ruff JSON output.'
        return
      end

      if #results == 0 then
        print 'No issues found by Ruff.'
        return
      end

      local items = {}
      for _, result in ipairs(results) do
        table.insert(items, {
          filename = result.filename,
          lnum = result.location.row,
          col = result.location.column,
          code = result.code,
          message = result.message,
          display = nil, -- We'll define a custom display function
          ordinal = result.code .. ' ' .. result.message,
        })
      end

      local pickers = require 'telescope.pickers'
      local finders = require 'telescope.finders'
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'
      local conf = require('telescope.config').values
      local previewers = require 'telescope.previewers'
      local entry_display = require 'telescope.pickers.entry_display'

      -- Define custom highlight groups
      vim.api.nvim_set_hl(0, 'RuffCode', { fg = '#00ffff', bold = true }) -- For error codes
      vim.api.nvim_set_hl(0, 'RuffMessage', { fg = '#FFFFFF' }) -- For messages

      local displayer = entry_display.create {
        separator = ' ',
        items = {
          { width = 10 }, -- For the code
          { remaining = true }, -- For the message
        },
      }

      local function make_display(entry)
        return displayer {
          { entry.code, 'RuffCode' }, -- Highlight the code
          { entry.message, 'RuffMessage' }, -- Highlight the message
        }
      end

      pickers
        .new({}, {
          prompt_title = 'Ruff Lint Results',
          finder = finders.new_table {
            results = items,
            entry_maker = function(entry)
              return {
                value = entry,
                code = entry.code,
                message = entry.message,
                ordinal = entry.ordinal,
                display = make_display,
              }
            end,
          },
          sorter = conf.generic_sorter {},
          previewer = previewers.new_buffer_previewer {
            define_preview = function(self, entry, status)
              local filename = entry.value.filename
              local lnum = entry.value.lnum

              -- Set the filetype for syntax highlighting
              vim.bo[self.state.bufnr].filetype = vim.filetype.match { filename = filename } or 'python'

              -- Load the file content
              local lines = vim.fn.readfile(filename)
              vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

              -- Enable syntax highlighting in the preview buffer
              vim.api.nvim_buf_call(self.state.bufnr, function()
                vim.cmd 'syntax enable'
              end)

              -- Ensure that lnum is within the buffer's line count
              local line_count = vim.api.nvim_buf_line_count(self.state.bufnr)
              local cursor_line = math.min(lnum, line_count)

              -- Highlight the issue line
              vim.api.nvim_buf_add_highlight(self.state.bufnr, -1, 'Visual', cursor_line - 1, 0, -1)

              -- Move cursor to the issue line after buffer is ready
              vim.schedule(function()
                if vim.api.nvim_win_is_valid(status.preview_win) then
                  pcall(vim.api.nvim_win_set_cursor, status.preview_win, { cursor_line, 0 })
                end
              end)
            end,
          },
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              if selection then
                local filename = selection.value.filename
                local lnum = selection.value.lnum
                local col = selection.value.col
                vim.cmd('edit ' .. vim.fn.fnameescape(filename))
                vim.api.nvim_win_set_cursor(0, { lnum, col - 1 })
              end
            end)
            return true
          end,
        })
        :find()
    end,
  })
end
return M
