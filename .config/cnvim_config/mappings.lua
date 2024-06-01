---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    -- ["F14"] = {"C-[", "insert to normal", opts = { nowait = true}},
  }
}

-- more keybinds!

return M
