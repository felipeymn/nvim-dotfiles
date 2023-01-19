local Bufferline = {"akinsho/bufferline.nvim"}
Bufferline.event = "BufReadPre"

function Bufferline.config()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  bufferline.setup({
    options = {
      numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      --[[ indicator_icon = "▎", ]]
      --[[ indicator_icon = "", ]]
      -- buffer_close_icon = " ",
      buffer_close_icon = " ",

      modified_icon = "●",
      -- close_icon = " ",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 22,
      diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          highlight = "NvimTreeTitle",
          padding = "1",
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      --[[ separator_style = { "▎", "▎" }, -- | "thick" | "thin" | { 'any', 'any' }, ]]
      --[[ separator_style = { "|", "|" }, -- | "thick" | "thin" | { 'any', 'any' }, ]]
      separator_style = { "", "" }, -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
    highlights = {
      fill = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      buffer_selected = {
        fg = {
          attribute = "fg",
          highlight = "FloatBorder",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      background = {
        fg = {
          attribute = "fg",
          highlight = "Comment",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      close_button_selected = {
        fg = {
          attribute = "fg",
          highlight = "Function",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      close_button = {
        fg = "#5A4440",
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      indicator_selected = {
        fg = {
          attribute = "fg",
          highlight = "Function",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      modified = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      error = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      error_selected = {
        fg = {
          attribute = "fg",
          highlight = "ErrorMsg",
        },
        bg = {
          attribute = "bg",
          highlight = "ErrorMsg",
        },
        --[[ sp = { ]]
        --[[ 	attribute = "bg", ]]
        --[[ 	highlight = "Normal", ]]
        --[[ }, ]]
        bold = true,
        italic = true,
      },
      warning = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      warning_selected = {
        fg = {
          attribute = "fg",
          highlight = "LspDiagnosticsDefaultWarning",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
        --[[ sp = { ]]
        --[[ 	attribute = "bg", ]]
        --[[ 	highlight = "Normal", ]]
        --[[ }, ]]
        bold = true,
        italic = true,
      },
      info = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },
      info_selected = {
        fg = {
          attribute = "fg",
          highlight = "LspDiagnosticsDefaultInformation",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
        --[[ sp = { ]]
        --[[ 	attribute = "bg", ]]
        --[[ 	highlight = "Normal", ]]
        --[[ }, ]]
        bold = true,
        italic = true,
      },
      hint = {
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
      },

      hint_selected = {
        fg = {
          attribute = "fg",
          highlight = "LspDiagnosticsDefaultHint",
        },
        bg = {
          attribute = "bg",
          highlight = "Normal",
        },
        --[[ sp = { ]]
        --[[ 	attribute = "bg", ]]
        --[[ 	highlight = "Normal", ]]
        --[[ }, ]]
        bold = true,
        italic = true,
      },

      --[[ separator = { ]]
      --[[ 	fg = { ]]
      --[[ 		attribute = "fg", ]]
      --[[ 		highlight = "Comment", ]]
      --[[ 	}, ]]
      --[[ 	bg = { ]]
      --[[ 		attribute = "bg", ]]
      --[[ 		highlight = "Normal", ]]
      --[[ 	}, ]]
      --[[ }, ]]
    },
  })
end

return Bufferline
