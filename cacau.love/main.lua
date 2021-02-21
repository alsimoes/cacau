--! file: main.lua
--
-- Main file: Let't begin to play
--

G = {
    REF = {
        SCALE = 0.375,
        LEFT = 1,
        RIGHT = -1
    },
    SCR = {
        WIDTH = love.graphics.getWidth(),
        HEIGHT = love.graphics.getHeight(),
        HCENTER = love.graphics.getWidth() / 2,
        VCENTER = love.graphics.getHeight() / 2,
    },
    PLAYER = {
        HI_SCORE = 0
    }
}

function love.load()
    Object = require("lib.classic")
    require "class.scene"
    require "class.tree"
    require "class.chest"
    require "class.cocoa"

    Font = love.graphics.newFont("assets/GloriaHallelujah-Regular.ttf")

    scene = Scene()
    tree  = Tree(G.SCR.HCENTER, 115)
    chest = Chest(G.SCR.HCENTER, 650)

    listOfCocoas = {}
    table.insert(listOfCocoas, Cocoa(460, 235, G.REF.LEFT))
    table.insert(listOfCocoas, Cocoa(470, 385, G.REF.LEFT))
    table.insert(listOfCocoas, Cocoa(550, 285, G.REF.RIGHT))
    table.insert(listOfCocoas, Cocoa(550, 385, G.REF.RIGHT))    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit(0)
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
