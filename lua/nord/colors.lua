local colors = {}

local defaults = {
  polar_night = {
    origin = "#2E3440",    -- nord0
    bright = "#3B4252",    -- nord1
    brighter = "#434C5E",  -- nord2
    brightest = "#4C566A", -- nord3
    light = "#616E88",     -- out of palette
  },
  snow_storm = {
    origin = "#D8DEE9",    -- nord4
    brighter = "#E5E9F0",  -- nord5
    brightest = "#ECEFF4", -- nord6
  },
  frost = {
    polar_water = "#8FBCBB", -- nord7
    ice = "#88C0D0",         -- nord8
    artic_water = "#81A1C1", -- nord9
    artic_ocean = "#5E81AC", -- nord10
  },
  aurora = {
    red = "#BF616A",    -- nord11
    orange = "#D08770", -- nord12
    yellow = "#EBCB8B", -- nord13
    green = "#A3BE8C",  -- nord14
    purple = "#B48EAD", -- nord15
  },
  none = "NONE",
}
colors.palette = defaults
colors.default_bg = "#2E3440" -- nord0

if vim.o.background == "light" then
  defaults = {
    polar_night = {
      origin = "#fdf6e3",    -- nord0// base3
      bright = "#eee8d5",    -- nord1// base2
      brighter = "#93a1a1",  -- nord2// base1
      brightest = "#073642", -- nord1/base 0
      light = "#073642",     -- out of palette// nord1
    },
    snow_storm = {
      origin = "#073642",    -- nord4 (most common color, least bright) // (most common color, least dark base02
      brighter = "#586e75",  -- nord5 // base01
      brightest = "#657b83", -- nord6 // base00
    },
    frost = {
      polar_water = "#2aa198", -- cyan
      ice = "#268bd2",         -- blue
      artic_water = "#002b36", -- base03
      artic_ocean = "#002b36", -- base03
    },
    aurora = {
      red = "#dc322f",    -- red
      orange = "#cb4b16", -- orange
      yellow = "#b58900", -- green
      green = "#859900",  -- yellow
      purple = "#d33682", -- magenta
    },
    none = "NONE",
  }
  colors.palette = defaults
  colors.default_bg = "#fdf6e3" -- nord0
end


function colors.daltonize(severity)
  local daltonize = require("nord.utils.colorblind").daltonize

  for group, color in pairs(defaults) do
    if type(color) == "table" then
      for sub_group, sub_color in pairs(color) do
        colors.palette[group][sub_group] = daltonize(sub_color, severity)
      end
    end
  end
end

return colors
