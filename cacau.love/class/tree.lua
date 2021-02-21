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
    self.scale_x = GLOBAL.SCALE.FACTOR
    self.scale_y = GLOBAL.SCALE.FACTOR
    self.offset_x = self.image:getWidth() / 2
    self.offset_y = self.image:getHeight() / 2
end

function Tree:draw(x, y)
    love.graphics.draw(self.image, self.x, self.y, 0, self.scale_x, self.scale_y, self.offset_x)
end
