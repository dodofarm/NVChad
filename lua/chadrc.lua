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
  transparency = true,
  theme = "yoru",
  integrations = {
    "flash",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    SpecialComment = { italic = true },
  },
}

local ascii_headers = require "ascii-headers"
M.nvdash = {
  load_on_startup = true,
  header = ascii_headers.get_random_header(),
}
-- M.plugins = "./plugins/init.lua"
return M
