---@type ChadrcConfig
local M = {}



M.ui = { theme = 'everforest',
 statusline = {
  theme = 'minimal',
  separator_style = 'round'
  },



}


vim.opt.relativenumber = true --enable the relativenumber.
vim.api.nvim_set_hl(0, "Comment", { fg = "#74985D"})
vim.api.nvim_set_hl(0, "@comment", { link = "Comment"}) -- both lines are needed to ensure the colors is setup.
--
M.plugins = "custom.plugins" -- this is for importing the plugins.lua file
M.mappings = require "custom.mappings" -- this is for importing the mappings.lua
return M
