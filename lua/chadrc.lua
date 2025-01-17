-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- size of vertical terminal
M.term = {
  sizes = {
    vsp = 0.35,
    ["bo vsp"] = 0.35,
  },
}

M.base46 = {
  theme = "solarized_osaka",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    SpecialComment = { italic = true },
  },
}
-- M.plugins = "./plugins/init.lua"
return M
