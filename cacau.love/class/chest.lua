--! file: chest.lua
--
-- Scene file: Class to define the trees.
--

Chest = Object:extend()

function Chest:new(x, y)
    self.type = "chest"
    self.image = love.graphics.newImage("assets/dummy_chest.png")
    self.x = x
    self.y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.scale_x = GLOBAL.SCALE.FACTOR
    self.scale_y = GLOBAL.SCALE.FACTOR
    self.scaled_width = self.width * self.scale_x 
    self.scaled_height = self.height * self.scale_y
    self.offset_x = self.image:getWidth() / 2 
    self.offset_y = self.image:getHeight() / 2
    self.collision_shape = { 
        show = GLOBAL.SCREEN.DISPLAY_COLLISION_SHAPES,
        mode = "line",
        x = (self.x - (self.scaled_width/2))+((self.x - (self.scaled_width/2))*0.16),
        y = self.y + (self.y*0.07),
        width = self.scaled_width - (self.scaled_width * 0.5),
        height = self.scaled_height - (self.scaled_height * 0.7),
        color = {255,0,0},
        collision_color = {0, 0, 255}
    }
end

function Chest:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.scale_x, self.scale_y, self.offset_x)
    if self.collision_shape.show then
        love.graphics.setColor(self.collision_shape.color)
        love.graphics.rectangle(self.collision_shape.mode, self.collision_shape.x, self.collision_shape.y, self.collision_shape.width, self.collision_shape.height)
        love.graphics.setColor(GLOBAL.SCREEN.COLOR_RESET)
    end
end