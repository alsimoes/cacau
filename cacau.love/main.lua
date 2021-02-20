--! file: main.lua
--
-- Main file: Let't begin to play
--

GLOBAL = {
    SCALE = 0.375,
    CENTER_WITH = love.graphics.getWidth() / 2,
    CENTER_HEIGHT = love.graphics.getHeight() / 2,
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
    tree  = Tree(GLOBAL.CENTER_WITH, 115)
    chest = Chest(GLOBAL.CENTER_WITH, 650)

    -- listOfCocoas = {}
    cocoa = Cocoa(460, 235, GLOBAL.DIRECTION.LEFT)
    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

end

function love.update()
    
end

function love.draw()
    scene:draw()
    tree:draw()
    chest:draw()
    cocoa:draw()
    
    -- love.graphics.draw(cocoa, 460,235, 0, GLOBAL.SCALE, GLOBAL.SCALE, cocoa:getWidth()/2)
    -- love.graphics.draw(cocoa, 470,385, 0, GLOBAL.SCALE, GLOBAL.SCALE, cocoa:getWidth()/2)
    -- love.graphics.draw(cocoa, 550,355, 0, -GLOBAL.SCALE, GLOBAL.SCALE, cocoa:getWidth()/2)
    -- love.graphics.draw(cocoa, 550,245, 0, -GLOBAL.SCALE, GLOBAL.SCALE, cocoa:getWidth()/2)
end
