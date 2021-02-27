--! file: player.lua
--
-- Player file: Class to define the little hand of the player.
--

Player = Object:extend() -- #FIXME: #10 Implement the player little hand completely.

function Player:new(x, y)
    self.type = "player"
    self.image = love.graphics.newImage("assets/dummy_hand_open.png")
    self.x = x-10
    self.y = y
    self.orginal_position_x = x
    self.orginal_position_y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.scale_x = GLOBAL.SCALE.FACTOR * 0.65
    self.scale_y = GLOBAL.SCALE.FACTOR * 0.65
    self.scaled_width = self.width * self.scale_x 
    self.scaled_height = self.height * self.scale_y
    self.offset_x = (self.image:getWidth() / 2)
    self.offset_y = (self.image:getHeight() / 2)
    self.collision_shape = { 
        mode = "line",
        x = self.x - (self.scaled_width/2),
        y = self.y,
        width = self.scaled_width,
        height = self.scaled_height,
        color = {255,0,0}
    }
    self.handling = {
        grabbing = false,
        grab_image = love.graphics.newImage("assets/dummy_hand_close.png"),
        distx  = 0,
        disty  = 0
    }
end

function Player:is_grabbing()
    is_grabbing = self.handling.grabbing
end

function Player:mouse_pressed(x, y, button, istouch)
    if button == 1 then
        self.handling.grabbing = true
    end
    --if button == 1 
    --  and x > self.collision_shape.x
    --  and x < self.collision_shape.x + self.scaled_width
    --  and y > self.collision_shape.y
    --  and y < self.collision_shape.y + self.scaled_height then
    --    self.handling.distx = x - self.x
    --    self.handling.disty = y - self.y
    --end

end

function Player:mouse_released(x, y, button)
    if button == 1 then
        self.handling.grabbing = false
    end
end

function Player:update(dt)
    self.x = love.mouse.getX()
    self.y = love.mouse.getY()
    self.collision_shape.x = self.x - (self.scaled_width/2)
    self.collision_shape.y = self.y
end

function Player:draw(x, y)
    if self.handling.grabbing then
        love.graphics.draw(self.handling.grab_image, self.x-10, self.y-55, 0, self.scale_x, self.scale_y, self.offset_x)
    else
        love.graphics.draw(self.image, self.x-10, self.y-55, 0, self.scale_x, self.scale_y, self.offset_x)
    end
    if self.collision_shape.show then
        love.graphics.setColor(self.collision_shape.color)
        love.graphics.rectangle(self.collision_shape.mode, self.collision_shape.x, self.collision_shape.y, self.collision_shape.width, self.collision_shape.height)
        love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)
    end
end