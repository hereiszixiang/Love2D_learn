require("example")
local num = 0
print(7)

function love.load()
    --    image = love.graphics.newImage("cake.jpg")
    local f = love.graphics.newFont(12)
    love.graphics.setFont(f)
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setBackgroundColor(255, 255, 255)

    listOfRectangles = {}
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        num = num + 100 * dt -- this would increment num by 100 per second
    else
        num = num - 100 * dt
    end
    print("tttt")
    for index, value in ipairs(listOfRectangles) do
        value.x = value.x + value.speed * dt
    end
end

function love.draw()
    love.graphics.print("Hello love" .. num, 400, 300)
    for index, value in ipairs(listOfRectangles) do
        love.graphics.rectangle("line",value.x,value.y,value.width,value.height)
    end
end



function createRect()
    rect = {}
    rect.x = 100
    rect.y = 100
    rect.width = 70
    rect.height = 90
    rect.speed = 100

    -- Put the new rectangle in the list
    table.insert(listOfRectangles, rect)
end

function love.keypressed(key)
    if key == "space" then
        createRect()
    end
end
-- ttt
