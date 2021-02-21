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
    self.sx = G.REF.SCALE
    self.sy = G.REF.SCALE
    self.sw = self.width * self.sx -- scaled width
    self.sh = self.height * self.sy -- scaled height
    self.ox = self.image:getWidth() / 2
    self.oy = self.image:getHeight() / 2
    self.side = direcion
    self.rotten = false
    self.handling = {
        active = false,
        distx  = 0,
        disty  = 0
    }
    self.cs = { -- collision shape/rectangle
        mode = "line",
        x = self.x - (self.sw/2),
        y = self.y,
        width = self.sw,
        height = self.sh,
        color = {255,255,0,0}
    }
end

function Cocoa:mousepressed(x, y, button, istouch)
    if button == 1 and x > self.cs.x and x < self.cs.x + self.sw and y > self.y and y < self.y + self.sh then
        self.handling.active = true
        self.handling.distx = x - self.x
        self.handling.disty = y - self.y
        scene.score.value = scene.score.value + 1
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
    -- love.graphics.rectangle(self.cs.mode, self.cs.x, self.cs.y, self.cs.width, self.cs.height)
    -- love.graphics.setColor(self.cs.color)
end