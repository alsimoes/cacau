--! file: scene.lua
--
-- Scene file: Class to define the backgroud.
--

Scene = Object:extend()

function Scene:new(player)
    self.font = love.graphics.newFont("assets/GloriaHallelujah-Regular.ttf")
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
    
    self.harvesting = {
        timer = { -- #FIXME: #12 Implamente the timer.
            label_color = {0, 0, 0},
            label_size = 20,
            label_text = "Timer",
            label_x = GLOBAL.SCREEN.WIDTH / 2,
            label_y = 15,
            value_color = {0, 0, 1},
            value_size = 32,
            value_x = GLOBAL.SCREEN.WIDTH /2 ,
            value_y = 35,
            value = 0,
            start_time = 60,
            remaining_time = 0
        },
        game_over = true
    }

    self.spot = {}

    table.insert(self.spot, {id = 1, x = 460, y = 235, direction = GLOBAL.SCALE.NORMAL})
    table.insert(self.spot, {id = 2, x = 470, y = 385, direction = GLOBAL.SCALE.NORMAL})
    table.insert(self.spot, {id = 3, x = 550, y = 285, direction = GLOBAL.SCALE.INVERTED})
    table.insert(self.spot, {id = 4, x = 555, y = 388, direction = GLOBAL.SCALE.INVERTED})  

    self.respawn_timer = 3

    self.list_of_cocoas = {}
    self.number_of_cocoas = 0
    self.player = player

end


function Scene:respawn_cocoas(dt)
    print("76: Scene:respawn_cocoas(dt)")
    for x=1, 4 do
        print("78: for x=1, 4 do")
        -- table.insert(self.list_of_cocoas, Cocoa(self.spot[x].id, self.spot[x].x, self.spot[x].y, self.spot[x].direction))
        table.insert(self.list_of_cocoas, Cocoa(unpack(self.spot[x])))
    end
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

function Scene:is_game_over(bol)
    self.harvesting.game_over = bol
    self.score.value = 0
end

function Scene:is_game_started()
    is_game_started = self.harvesting.game_over
end

function Scene:update(dt)
    if self.harvesting.game_over == false and self.harvesting.timer.remaining_time <= 0 then
        self.harvesting.timer.remaining_time = self.harvesting.timer.start_time
    end
    if self.harvesting.game_over == false and self.harvesting.timer.remaining_time > 0 then
        self.harvesting.timer.remaining_time = self.harvesting.timer.remaining_time - dt
        self.harvesting.timer.value = self.harvesting.timer.remaining_time
        self.respawn_cocoas()
    end
    if self.harvesting.timer.remaining_time <= 0 then 
        self.harvesting.game_over = true
        for i,cocoa in ipairs(self.list_of_cocoas) do
            table.remove(self.list_of_cocoas, i)
        end
        if self.score.value > self.hi_score.value then
            self.hi_score.value = self.score.value
        end
    end
    for i,cocoa in ipairs(self.list_of_cocoas) do
        cocoa:update(dt)
        cocoa:check_collision(chest)
        cocoa:check_collision(self.player)
        cocoa:update_collision_shape()
        if cocoa.was_harvested or cocoa.is_rotten then
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

    -- self.update_display_hud(self.hi_score)
    love.graphics.setColor(self.hi_score.label_color)
    love.graphics.setFont(love.graphics.newFont(self.hi_score.label_size))
    love.graphics.print(self.hi_score.label_text, self.hi_score.label_x, self.hi_score.label_y)
    love.graphics.setColor(self.hi_score.value_color)
    love.graphics.setFont(love.graphics.newFont(self.hi_score.value_size))
    love.graphics.print(self.hi_score.value, self.hi_score.value_x, self.hi_score.value_y)
    love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)

    -- self.update_display_hud(self.score)
    love.graphics.setColor(self.score.label_color)
    love.graphics.setFont(love.graphics.newFont(self.score.label_size))
    love.graphics.print(self.score.label_text, self.score.label_x, self.score.label_y)
    love.graphics.setColor(self.score.value_color)
    love.graphics.setFont(love.graphics.newFont(self.score.value_size))
    love.graphics.print(self.score.value, self.score.value_x, self.score.value_y)
    love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)

    -- self.update_display_hud(self.harvesting.timer)
    love.graphics.setColor(self.harvesting.timer.label_color)
    love.graphics.setFont(love.graphics.newFont(self.harvesting.timer.label_size))
    love.graphics.print(self.harvesting.timer.label_text, self.harvesting.timer.label_x, self.harvesting.timer.label_y)
    love.graphics.setColor(self.harvesting.timer.value_color)
    love.graphics.setFont(love.graphics.newFont(self.harvesting.timer.value_size))
    love.graphics.print(string.format("%3.1f",self.harvesting.timer.value), self.harvesting.timer.value_x, self.harvesting.timer.value_y)
    love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)
    
end

