--
-- EnemyBase
--
-- Base enemy class with triangle shape and left-right movement
--

local Object = require("libs.classic")
local Entry = require("entry")

local EnemyBase = Entry:extend()

function EnemyBase:new(x, y)
    Entry.new(self, x, y)  -- 直接调用父类new，传递self进行初始化

    -- Size
    self.width = 40
    self.height = 40

    -- Movement
    self.speed = 100
    self.direction = 1  -- 1 = right, -1 = left
    self.moveRange = 150  -- how far to move from spawn point

    -- Visual
    self.color = {1, 0, 0, 1}  -- red RGBA
    self.rotation = 0

    -- State
    self.alive = true
    self.spawnX = x or 0

    -- Animation
    self.flashTimer = 0
    self.flashDuration = 0.1
end

function EnemyBase:update(dt)
    -- Left-right movement
    self.x = self.x + self.speed * self.direction * dt

    -- Reverse direction at range limits
    if self.x > self.spawnX + self.moveRange then
        self.direction = -1
    elseif self.x < self.spawnX - self.moveRange then
        self.direction = 1
    end

    -- Update flash timer
    if self.flashTimer > 0 then
        self.flashTimer = self.flashTimer - dt
    end
end

function EnemyBase:draw()
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.rotate(self.rotation)
    
    -- Set color (white flash when hit)
    if self.flashTimer > 0 then
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(self.color)
    end
    
    -- Draw triangle (pointing up)
    local halfW = self.width / 2
    local halfH = self.height / 2
    love.graphics.polygon("fill", 
        0, -halfH,           -- top point
        -halfW, halfH,       -- bottom left
        halfW, halfH         -- bottom right
    )
    
    love.graphics.pop()
end

function EnemyBase:hit()
    self.flashTimer = self.flashDuration
end

function EnemyBase:destroy()
    self.alive = false
end

return EnemyBase