--! file: scene.lua
--
-- Scene file: Class to define the backgroud.
--

Scene = Object:extend()

function Scene:new(player)
    self.image = love.graphics.newImage("assets/dummy_bg.png")
    self.x = love.graphics.getWidth() / 2 - (self.image:getWidth()/2)
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.scale_x = GLOBAL.SCALE.FACTOR
    self.scale_y = GLOBAL.SCALE.FACTOR
    self.font = love.graphics.newFont("assets/GloriaHallelujah-Regular.ttf")
    self.hi_score = {
        label_color = {0, 0, 0},
        label_size = 20,
        label_text = "Hi-Score",
        label_x = 15,
        label_y = 15,
        value_color = {0, 0, 1},
        value_size = 32,
        value_x = 15,
        value_y = 35,
        value = 0
    }
    self.score = { -- #FIXME #7
        label_color = {0, 0, 0},
        label_size = 20,
        label_text = "Score",
        label_x = GLOBAL.SCREEN.WIDTH - 100,
        label_y = 15,
        value_color = {0, 0, 1},
        value_size = 32,
        value_x = GLOBAL.SCREEN.WIDTH - 100,
        value_y = 35,
        value = 0
    }
    self.timer = { -- #FIXME: #12 Implamente the timer.
        label_color = {0, 0, 0},
        label_size = 20,
        label_text = "Timer",
        label_x = GLOBAL.SCREEN.WIDTH - 100,
        label_y = 15,
        value_color = {0, 0, 1},
        value_size = 32,
        value_x = GLOBAL.SCREEN.WIDTH - 100,
        value_y = 35,
        value = 0
    }
    self.font = love.graphics.newFont("assets/GloriaHallelujah-Regular.ttf")

    self.list_of_cocoas = {}

    self.start_game = false

    self.player = player

end

function Scene:get_list_of_cocoas()
    get_cocoas_list = self.list_of_cocoas
end

function Scene:remove_cocoa_from_list(i)
    table.remove(self.list_of_cocoas, i)
end

function Scene:total_of_cocoas()
    local cont = 0
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cont = cont + 1
    end
    print("Total de cacaus: "..cont)
    total_of_cocoas = cont
end

function Scene:add_cocoa_to_list()
    table.insert(self.list_of_cocoas, Cocoa(460, 235, GLOBAL.SCALE.NORMAL, GLOBAL.COCOA.GREEN))
    table.insert(self.list_of_cocoas, Cocoa(470, 385, GLOBAL.SCALE.NORMAL, GLOBAL.COCOA.YELLOW))
    table.insert(self.list_of_cocoas, Cocoa(550, 285, GLOBAL.SCALE.INVERTED, GLOBAL.COCOA.RED))
    table.insert(self.list_of_cocoas, Cocoa(550, 385, GLOBAL.SCALE.INVERTED, GLOBAL.COCOA.PURPLE))

end

function Scene:mouse_pressed(x, y, button, istouch)
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cocoa:mouse_pressed(x, y, button, istouch)
    end
end

function Scene:mouse_released(x, y, button)
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cocoa:mouse_released(x, y, button)
    end
end

function Scene:make_game_begin(bol)
    self.start_game = bol
end

function Scene:is_game_started()
    is_game_started = self.start_game
end

function Scene:update(dt)
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cocoa:update(dt)
        cocoa:check_collision(chest)
        cocoa:check_collision(self.player)
        cocoa:update_collision_shape()
        if cocoa.was_harvested then
            table.remove(self.list_of_cocoas, i)
        end
    end    
end

function Scene:draw()
    love.graphics.draw(self.image, 0, 0, 0, self.scale_x, self.scale_y)
    tree:draw()
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cocoa:draw()
    end

    chest:draw()

    if self.start_game then
        -- Display hi-score
        love.graphics.setColor(self.hi_score.label_color)
        love.graphics.setFont(love.graphics.newFont(self.hi_score.label_size))
        love.graphics.print(self.hi_score.label_text, self.hi_score.label_x, self.hi_score.label_y)
        love.graphics.setColor(self.hi_score.value_color)
        love.graphics.setFont(love.graphics.newFont(self.hi_score.value_size))
        love.graphics.print(self.hi_score.value, self.hi_score.value_x, self.hi_score.value_y)
        love.graphics.setColor(255, 255, 255)

        -- Display score
        love.graphics.setColor(self.score.label_color)
        love.graphics.setFont(love.graphics.newFont(self.score.label_size))
        love.graphics.print(self.score.label_text, self.score.label_x, self.score.label_y)
        love.graphics.setColor(self.score.value_color)
        love.graphics.setFont(love.graphics.newFont(self.score.value_size))
        love.graphics.print(self.score.value, self.score.value_x, self.score.value_y)
        love.graphics.setColor(255, 255, 255)
    end

    -- #FIXME: #12 Implamente the timer.

end
