local mini = {}

local c = require("nord.colors").palette

function mini.highlights()
  return {
    MiniIndentscopeSymbol = { fg = c.frost.artic_ocean },
    MiniIndentscopePrefix = { nocombine = true },
    MiniPickNormal = { fg = c.snow_storm.origin, bg = c.polar_night.origin },
    MiniFilesNormal = { fg = c.snow_storm.origin, bg = c.polar_night.origin },
  }
end

return mini
