--
-- Entry
--
-- Simple game entity with position
--

local Object = require("libs.classic")

local Entry = Object:extend()

function Entry:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

return Entry