--! file: cocoa.lua
--
-- Scene file: Class to define the cocoas.
--

Cocoa = Object:extend()

function Cocoa:new(x, y, direcion)
    self.image = love.graphics.newImage("assets/dumm_cocoa.png")
    self.x = x
    self.y = y
    self.opx = x -- orginal position X
    self.opy = y -- orginal position Y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.sx = GLOBAL.SCALE
    self.sy = GLOBAL.SCALE
    self.ox = self.image:getWidth() / 2
    self.oy = self.image:getHeight() / 2
    self.side = direcion
    self.rotten = false
    self.handling = {
        active = false,
        distx  = 0,
        disty  = 0
    }
end

function Cocoa:mousepressed(x, y, button, istouch)
    if button == 1 and x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
        self.handling.active = true
        self.handling.distx = x - self.x
        self.handling.disty = y - self.y
    end
end

function Cocoa:mousereleased(x, y, button)
    if button == 1 then
        self.handling.active = false
        self.x = self.opx
        self.y = self.opy
    end
end

function Cocoa:update(dt)
    if self.handling.active then
        self.x = love.mouse.getX() - self.handling.distx
        self.y = love.mouse.getY() - self.handling.disty
    end
end

function Cocoa:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.side * self.sx, self.sy, self.ox)
end