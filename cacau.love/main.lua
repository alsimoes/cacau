--! file: main.lua
--
-- Main file: Let't begin to play
--

GLOBAL = {
    SCALE = {
        FACTOR = 0.375,
        INVERTED = -1,
        NORMAL = 1
    },
    SCREEN = {
        WIDTH = love.graphics.getWidth(),
        HEIGHT = love.graphics.getHeight(),
        HCENTER = love.graphics.getWidth() / 2,
        VCENTER = love.graphics.getHeight() / 2,
        COLOR_RESET = {255, 255, 255},
        DISPLAY_COLLISION_SHAPES = false
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
    tree  = Tree(GLOBAL.SCREEN.HCENTER, 115)
    chest = Chest(GLOBAL.SCREEN.HCENTER, 650)

    listOfCocoas = {}
    table.insert(listOfCocoas, Cocoa(460, 235, GLOBAL.SCALE.NORMAL))
    table.insert(listOfCocoas, Cocoa(470, 385, GLOBAL.SCALE.NORMAL))
    table.insert(listOfCocoas, Cocoa(550, 285, GLOBAL.SCALE.INVERTED))
    table.insert(listOfCocoas, Cocoa(550, 385, GLOBAL.SCALE.INVERTED))    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit(0)
    end

    if key == "r" then
        love.event.quit("restart")
    end
end

function love.mousepressed(x, y, button, istouch)
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:mouse_pressed(x, y, button, istouch)
    end
end

function love.mousereleased(x, y, button)
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:mouse_released(x, y, button)
    end
end

function love.update()
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:update(dt)
        cocoa:check_collision(chest)
        cocoa:update_collision_shape()
        -- #FIXME: #11 Implement "cocoa:checkCollision(player)"
        -- bullet:checkMissedShot()
        if cocoa.harvested then
            table.remove(listOfCocoas, i)
        end
    end
end

function love.draw()
    scene:draw()
    tree:draw()
    for i,cocoa in ipairs(listOfCocoas) do
        cocoa:draw()
    end
    chest:draw()
end
