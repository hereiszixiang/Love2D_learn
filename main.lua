
local num = 0

function love.load()
    --    image = love.graphics.newImage("cake.jpg")
    local f = love.graphics.newFont(12)
    love.graphics.setFont(f)
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setBackgroundColor(255, 255, 255)
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        num = num + 100 * dt -- this would increment num by 100 per second
    else
        num = num - 100 * dt
    end
end

function love.draw()
    love.graphics.print("Hello love" .. num, 400, 300)
end
