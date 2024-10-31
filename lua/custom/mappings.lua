---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>lj"] = {
      function()
        require("flash").jump()
      end,
      "Flash jump",
    },
    ["<leader>lt"] = {
      function()
        require("flash").treesitter()
      end,
      "Flash treesitter",
    },
    ["<leader>lr"] = {
      function()
        require("flash").remote()
      end,
      "Flash remote",
    },
    ["<leader>ls"] = {
      function()
        require("flash").search()
      end,
      "Flash search",
    },
    ["<leader>lT"] = {
      function()
        require("flash").toggle()
      end,
      "Flash toggle",
    },
    ["<leader>cs"] = {
      "<cmd>SymbolsOutline<cr>",
      "Symbols Outline",
    },
    ["<leader>tr"] = {
      "<cmd>Trouble<cr>",
      "Trouble Toggle",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- M.flash = {
--   plugin = true,
--
--   n = {
--     -- Flash jump
--     ["<leader>lj"] = {
--       function()
--         require("flash").jump()
--       end,
--       "Flash jump",
--       opts = { expr = true },
--     },
--   },
-- }
--
-- require("core.utils").load_mappings "flash"

-- more keybinds!

return M
