--! file: scene.lua
--
-- Scene file: Class to define the backgroud.
--

Scene = Object:extend()

function Scene:new()
    self.image = love.graphics.newImage("assets/dummy_bg.png")
    self.x = love.graphics.getWidth() / 2 - (self.image:getWidth()/2)
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.sx = GLOBAL.SCALE
    self.sy = GLOBAL.SCALE
end

function Scene:draw()
    love.graphics.draw(self.image, 0, 0, 0, self.sx, self.sy)
end
