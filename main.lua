-- io.stdout:setvbuf("no")
require("example")
local Entry = require("entry")
local EnemyBase = require("enemy_base")
local num = 0
print(7)

function love.load()
	love.graphics.setLineStyle( "rough" )


    --    image = love.graphics.newImage("cake.jpg")
    local f = love.graphics.newFont(12)
    love.graphics.setFont(f)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setBackgroundColor(1, 1, 1)

    listOfRectangles = {}
    myImage = love.graphics.newImage("assets/images/sheep.png")

    player = Entry(100, 200)
    enemy = EnemyBase(300, 300)
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        num = num + 100 * dt -- this would increment num by 100 per second
        print("up key is down")
    else
        num = num - 100 * dt
    end
    -- print("tttt")
    for index, value in ipairs(listOfRectangles) do
        value.x = value.x + value.speed * dt
    end

    enemy:update(dt)
end

function love.draw()
    love.graphics.line (0,0, 200, 50)
	love.graphics.line (0,0, 200, 100)
	love.graphics.line (0,0, 200, 150)
	love.graphics.line (0,0, 200, 200)
	love.graphics.line (0,0, 200, 250)

    love.graphics.print("Hello love" .. num, 400, 300)
    love.graphics.translate(110,110)
    for index, value in ipairs(listOfRectangles) do
        love.graphics.rectangle("line",value.x,value.y,value.width,value.height)
    end

    love.graphics.draw(myImage,100,100)

    enemy:draw()
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
