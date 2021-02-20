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
    love.graphics.draw(bg, 0, 0, 0, G_SCALE, G_SCALE)
    love.graphics.draw(tree, love.graphics.getWidth()/2, 115, 0, G_SCALE, G_SCALE, tree:getWidth()/2)
    love.graphics.draw(chest, love.graphics.getWidth()/2, 650, 0, G_SCALE, G_SCALE, chest:getWidth()/2)
    love.graphics.draw(cocoa, 460,235, 0, G_SCALE, G_SCALE, cocoa:getWidth()/2)
    love.graphics.draw(cocoa, 470,385, 0, G_SCALE, G_SCALE, cocoa:getWidth()/2)
    love.graphics.draw(cocoa, 550,355, 0, -G_SCALE, G_SCALE, cocoa:getWidth()/2)
    love.graphics.draw(cocoa, 550,245, 0, -G_SCALE, G_SCALE, cocoa:getWidth()/2)
end
