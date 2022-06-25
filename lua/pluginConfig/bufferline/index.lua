local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
  return
end
-- vim.opt.termguicolors = true
bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics ="nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer" ,  highlight = "Directory",text_align = "left" }},
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true ,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true ,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    enforce_regular_tabs = false,
    always_show_bufferline = true,
   },
   groups = {
     options = {
       toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
     },
     items = {
       {
         name = "Tests", -- Mandatory
         highlight = {gui = "underline", guisp = "blue"}, -- Optional
         priority = 2, -- determines where it will appear relative to other groups (Optional)
         icon = "", -- Optional
         matcher = function(buf) -- Mandatory
           return buf.name:match('%_test') or buf.name:match('%_spec')
         end,
       },
       {
         name = "Docs",
         highlight = {gui = "undercurl", guisp = "green"},
         auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
         matcher = function(buf)
           return buf.name:match('%.md') or buf.name:match('%.txt')
         end,
         separator = { -- Optional
           style = require('bufferline.groups').separator.tab
         },
       }
     }
   }
}


