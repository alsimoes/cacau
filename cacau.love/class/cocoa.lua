--! file: cocoa.lua
--
-- Scene file: Class to define the cocoas.
--

Cocoa = Object:extend()

function Cocoa:new(x, y, direction)
    self.image = love.graphics.newImage("assets/dummy_cocoa_green.png")
    self.cocoa_images = {
        yellow = love.graphics.newImage("assets/dummy_cocoa_yellow.png"),
        red = love.graphics.newImage("assets/dummy_cocoa_red.png"),
        purple = love.graphics.newImage("assets/dummy_cocoa_purple.png")
    }
    self.x = x
    self.y = y
    self.original_position_x = x 
    self.original_position_y = y 
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.scale_x = GLOBAL.SCALE.FACTOR
    self.scale_y = GLOBAL.SCALE.FACTOR
    self.scaled_width = self.width * self.scale_x 
    self.scaled_height = self.height * self.scale_y
    self.offset_x = self.image:getWidth() / 2
    self.offset_y = self.image:getHeight() / 2
    self.side = direction
    self.was_harvested = false
    self.handling = {
        active = false,
        distx  = 0,
        disty  = 0
    }
    self.collision_shape = { 
        show = GLOBAL.SCREEN.DISPLAY_COLLISION_SHAPES,
        mode = "line",
        x = self.x - (self.scaled_width/2),
        y = self.y,
        width = self.scaled_width,
        height = self.scaled_height,
        color = {255,0,0},
        collision_color = {0, 0, 255}
    }
    self.is_rotten = false
    self.state = GLOBAL.COCOA.GREEN
    self.state_timer = 3
end

function Cocoa:update_collision_shape()
    self.collision_shape.x = self.x - (self.scaled_width/2)
    self.collision_shape.y = self.y
end

function Cocoa:mouse_pressed(x, y, button, istouch)
    if button == 1 
      and x > self.collision_shape.x
      and x < self.collision_shape.x + self.scaled_width
      and y > self.collision_shape.y
      and y < self.collision_shape.y + self.scaled_height then
        self.handling.active = true
        self.handling.distx = x - self.x
        self.handling.disty = y - self.y
    end
end

function Cocoa:mouse_released(x, y, button)
    if button == 1 then
        self.handling.active = false
        self.x = self.original_position_x
        self.y = self.original_position_y
    end
end

function Cocoa:check_collision(obj)
    local has_collided = false
    local self_left = self.collision_shape.x
    local self_right = self.collision_shape.x + self.collision_shape.width
    local self_top = self.collision_shape.y
    local self_botton = self.collision_shape.y + self.collision_shape.height
    
    local obj_left = obj.collision_shape.x
    local obj_right = obj.collision_shape.x + obj.collision_shape.width
    local obj_top = obj.collision_shape.y
    local obj_botton = obj.collision_shape.y + obj.collision_shape.height

    if self_right > obj_left and 
       self_left < obj_right and
       self_botton > obj_top and
       self_top < obj_botton then
        has_collided = true
        if has_collided and obj.type == "chest" then
            scene.score.value = scene.score.value + 1
            self.was_harvested = true
        end
    end
end

function Cocoa:update(dt)
    self.state_timer = self.state_timer - dt
    if self.state_timer <= 0 then
        if self.state == GLOBAL.COCOA.GREEN then
            self.state = GLOBAL.COCOA.YELLOW
            self.image = self.cocoa_images.yellow
            self.state_timer = 4
        elseif self.state == GLOBAL.COCOA.YELLOW then
            self.state = GLOBAL.COCOA.RED
            self.image = self.cocoa_images.red
            self.state_timer = 6
        elseif self.state == GLOBAL.COCOA.RED then
            self.state = GLOBAL.COCOA.PURPLE
            self.image = self.cocoa_images.purple
            self.state_timer = 3
        elseif self.state == GLOBAL.COCOA.PURPLE then
            self.is_rotten = true
        end
    end 
    if self.handling.active then
        self.x = love.mouse.getX() - self.handling.distx
        self.y = love.mouse.getY() - self.handling.disty
    end
end

function Cocoa:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.side * self.scale_x, self.scale_y, self.offset_x)
    if self.collision_shape.show then
        love.graphics.setColor(self.collision_shape.color)
        love.graphics.rectangle(self.collision_shape.mode, self.collision_shape.x, self.collision_shape.y, self.collision_shape.width, self.collision_shape.height)
        love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)
    end
end
