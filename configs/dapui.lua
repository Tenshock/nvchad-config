local M = {}

M.controls = {
  element = "repl",
  enabled = true,
  icons = {
    disconnect = "",
    pause = "",
    play = "",
    run_last = "",
    step_back = "",
    step_into = "",
    step_out = "",
    step_over = "",
    terminate = ""
  }
}

M.element_mappings = {}

M.expand_lines = true

M.floating = {
  border = "single",
  mappings = {
    close = { "q", "<Esc>" }
  }
}

M.force_buffers = true

M.icons = {
  collapsed = "",
  current_frame = "",
  expanded = ""
}

M.layouts = {
  {
    elements = {
      {
        id = "scopes",
        size = 0.25
      },
      {
        id = "breakpoints",
        size = 0.25
      },
      {
        id = "stacks",
        size = 0.25
      },
      {
        id = "watches",
        size = 0.25
      }
    },
    position = "left",
    size = 40
  },
  {
    elements = {
      {
        id = "repl",
        size = 0.5
      },
      {
        id = "console",
        size = 0.5
      }
    },
    position = "bottom",
    size = 10
  }
}

M.mappings = {
  edit = "e",
  expand = { "<CR>", "<2-LeftMouse>" },
  open = "o",
  remove = "d",
  repl = "r",
  toggle = "t"
}

M.render = {
  indent = 1,
  max_value_lines = 100
}

return M
