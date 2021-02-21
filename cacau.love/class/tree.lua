--! file: tree.lua
--
-- Scene file: Class to define the trees.
--

Tree = Object:extend()

function Tree:new(x, y)
    self.image = love.graphics.newImage("assets/dummy_tree.png")
    self.x = x
    self.y = y
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.sx = G.REF.SCALE
    self.sy = G.REF.SCALE
    self.ox = self.image:getWidth() / 2
    self.oy = self.image:getHeight() / 2
end

function Tree:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.sx, self.sy, self.ox)
end
