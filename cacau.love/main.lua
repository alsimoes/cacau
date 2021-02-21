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
    },
    COCOA = {
        GREEN = 1,
        YELLOW = 2,
        RED = 3,
        PURPLE = 4,
    }
}

function love.load()
    Object = require("lib.classic")
    require "class.scene"
    require "class.player"
    require "class.tree"
    require "class.chest"
    require "class.cocoa"

    scene = Scene()
    love.mouse.setVisible(false)
    player = Player(love.mouse.getPosition())
    tree  = Tree(GLOBAL.SCREEN.HCENTER, 115)
    chest = Chest(GLOBAL.SCREEN.HCENTER, 650)
    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit(0)
    end

    if key == "r" then
        love.event.quit("restart")
    end

    if key == "s" then
        -- #TODO: #13 Implement start game.
    end

    if key == "c" then
        
    end

end

function love.mousepressed(x, y, button, istouch)
    if scene:get_list_of_cocoas() ~= nil then
        for i,cocoa in ipairs(scene:get_list_of_cocoas()) do
            cocoa:mouse_pressed(x, y, button, istouch)
        end
    end

end

function love.mousereleased(x, y, button)
    if scene:get_cocoas_list() ~= nil then
        for i,cocoa in ipairs(scene:get_list_of_cocoas()) do
            cocoa:mouse_released(x, y, button)
        end
    end
end

function love.update()
    
    if scene:get_cocoas_list() ~= nil then
        for i,cocoa in ipairs(scene:get_list_of_cocoas()) do
            cocoa:update(dt)
            cocoa:check_collision(chest)
            cocoa:update_collision_shape()
            -- #FIXME: #11 Implement "cocoa:checkCollision(player)"
            -- bullet:checkMissedShot()
            if cocoa.was_harvested then
                scene:remove_cocoa_from_list(i)
            end
        end
    end

end

function love.draw()
    scene:draw()
    tree:draw()
    if scene:get_list_of_cocoas() ~= nil then
        for i,cocoa in ipairs(scene:get_list_of_cocoas()) do
            cocoa:draw()
        end
    end
    chest:draw()
end
