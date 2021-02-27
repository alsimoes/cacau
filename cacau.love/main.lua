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
    love.mouse.setVisible(false)
    player = Player(love.mouse.getPosition())
    scene = Scene(player)
    tree  = Tree(GLOBAL.SCREEN.HCENTER, 115)
    chest = Chest(GLOBAL.SCREEN.HCENTER, 650)
    
end

function love.keypressed(key, dt)
    if key == "escape" then
        love.event.quit(0)
    end

    if key == "r" then
        print("[[[[[[[[[[[[[[-- RESTART --]]]]]]]]]]]]]]")
        love.event.quit("restart")
    end

    if key == "s" then
        print("[[[[[[[[[[[[[[-- GAME START --]]]]]]]]]]]]]]")
        scene:is_game_over(false)
        scene:add_cocoa_to_list(dt)
    end

end

function love.mousepressed(x, y, button, istouch)
    player:mouse_pressed(x, y, button, istouch)
    scene:mouse_pressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button)
    player:mouse_released(x, y, button)
    scene:mouse_released(x, y, button)
end

function love.update(dt)
    player:update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
    player:draw()
end
