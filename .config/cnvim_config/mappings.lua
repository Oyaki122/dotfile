---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Y"] = { "y$", "", opts = {nowait = true}},
    ["M"] = { "%", opts={nowait=true} },
    ["p"] = {"]p`]", opts = {nowait = true}},
    ["P"] = {"]P`]", opts = {nowait = true}},
    ["F<cr>"] = {"{"},
    ["f<cr>"] = {"}"},
  },
  i = {},
  x = {
    ["y"] = { "mzy`z"},
    ["p"] = {"P"},
    [">"] = {">gv"},
    ["<"] = {"<gv"}
  }
}

-- more keybinds!

return M
