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
        GREEN_TEXT = "green",
        YELLOW = 2,
        YELLOW_TEXT = "yellow",
        RED = 3,
        RED_TEXT = "red",
        ROTTEN = 4,
        ROTTEN_TEXT = "rotten",
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

    if love.filesystem.getInfo("data.sav", "file")  then
        print("'data.sav' exists")
        local file = love.filesystem.newFile("data.sav")
        file:open("r")
        data = file:read()
        print("loaded hi score is "..data)
        scene.hi_score.value = tonumber(data)
        file:close()
    else
        print("'data.sav' not exists")
        local file = love.filesystem.newFile("data.sav")
        file:open("w")
        file:write(scene.hi_score.value)
        file:close()
        print("new hi score file created")
    end

end

function love.keypressed(key)
    if key == "escape" then
        print("'esc' pressed")
        love.event.quit(0)
    end

    if key == "r" then
        print("'r' pressed") 
        love.event.quit("restart")
    end

    if key == "s" then
        print("'s' pressed")
        scene:start_game()
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
