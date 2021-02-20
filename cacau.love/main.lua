--! file: main.lua
--
-- Main file: Let't begin to play
--

GLOBAL = {
    SCALE = 0.375,
    CENTER = {
        WITH = love.graphics.getWidth() / 2,
        HEIGHT = love.graphics.getHeight() / 2
    },
    DIRECTION = {
        LEFT = 1,
        RIGHT = -1
    }
}

function love.load()
    Object = require("lib.classic")
    require "class.scene"
    require "class.tree"
    require "class.chest"
    require "class.cocoa"

    scene = Scene()
    tree  = Tree(GLOBAL.CENTER.WITH, 115)
    chest = Chest(GLOBAL.CENTER.WITH, 650)

    listOfCocoas = {}
    table.insert(listOfCocoas, Cocoa(460, 235, GLOBAL.DIRECTION.LEFT))
    table.insert(listOfCocoas, Cocoa(470, 385, GLOBAL.DIRECTION.LEFT))
    table.insert(listOfCocoas, Cocoa(550, 285, GLOBAL.DIRECTION.RIGHT))
    table.insert(listOfCocoas, Cocoa(550, 385, GLOBAL.DIRECTION.RIGHT))    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

end

function love.mousepressed(x, y, button, istouch)
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:mousepressed(x, y, button, istouch)
    end
end

function love.mousereleased(x, y, button)
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:mousereleased(x, y, button)
    end
end

function love.update()
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:update(dt)
        -- bullet:checkCollision(enemy)
        -- bullet:checkMissedShot()
        if cocoa.rotten then
            table.remove(listOfCocoas, i)
        end
    end
end

function love.draw()
    scene:draw()
    tree:draw()
    chest:draw()
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:draw()
    end
end
