--! file: cocoa.lua
--
-- Scene file: Class to define the cocoas.
--

Cocoa = Object:extend()

function Cocoa:new(x, y, direcion)
    self.image = love.graphics.newImage("assets/dumm_cocoa.png")
    self.x = x
    self.y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.sx = GLOBAL.SCALE
    self.sy = GLOBAL.SCALE
    self.ox = self.image:getWidth() / 2
    self.oy = self.image:getHeight() / 2
    self.side = direcion
end

function Cocoa:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.side * self.sx, self.sy, self.ox)
end