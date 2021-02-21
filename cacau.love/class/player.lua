--! file: player.lua
--
-- Player file: Class to define the little hand of the player.
--

Player = Object:extend() -- #FIXME: #10 Implement the player little hand completely.

function Player:new(x, y, direcion)
    self.type = "player"
    self.image = love.graphics.newImage("...")
    self.x = x
    self.y = y
    self.orginal_position_x = x
    self.orginal_position_y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.scale_x = GLOBAL.SCALE.FACTOR
    self.scale_y = GLOBAL.SCALE.FACTOR
    self.scaled_width = self.width * self.scale_x 
    self.scaled_height = self.height * self.scale_y
    self.offset_x = self.image:getWidth() / 2
    self.offset_y = self.image:getHeight() / 2
    self.side = direcion
    self.rotten = false
    self.handling = {
        active = false,
        distx  = 0,
        disty  = 0
    }
    self.collision_shape = { 
        mode = "line",
        x = self.x - (self.scaled_width/2),
        y = self.y,
        width = self.scaled_width,
        height = self.scaled_height,
        color = {255,255,0,0}
    }
end

function Player:update(dt)
    
end

function Player:draw(x, y)

end