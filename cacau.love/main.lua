--! file: main.lua
--
-- Main file: Let't begin to play
--

function love.load()
    bg    = love.graphics.newImage("assets/dummy_bg.png")
    tree  = love.graphics.newImage("assets/dummy_tree.png")
    chest = love.graphics.newImage("assets/dummy_chest.png")
    cocoa = love.graphics.newImage("assets/dumm_cocoa.png")
end

function love.update()
    
end

function love.draw()
    love.graphics.draw(bg, 0, 0, 0, _SCALE, _SCALE)
    love.graphics.draw(tree, 135, 135, 0, _SCALE, _SCALE)
    love.graphics.draw(tree, 700, 175, 0, _SCALE, _SCALE)
    love.graphics.draw(tree, 415, 135, 0, _SCALE, _SCALE)
    love.graphics.draw(tree, -95, 180, 0, _SCALE, _SCALE)
    love.graphics.draw(chest, love.graphics.getWidth()/2, 650, 0, _SCALE, _SCALE, chest:getWidth()/2)
    love.graphics.draw(cocoa, 35,300, 0, _SCALE, _SCALE)
    love.graphics.draw(cocoa, 45,425, 0, _SCALE, _SCALE)
end
