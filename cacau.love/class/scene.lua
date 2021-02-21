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
    self.sx = G.REF.SCALE
    self.sy = G.REF.SCALE
    self.font = love.graphics.newFont("assets/GloriaHallelujah-Regular.ttf")
    self.hi_score = {
        label_color = {0, 0, 0},
        label_size = 20,
        label_text = "Hi-Score",
        label_x = 15,
        label_y = 15,
        value_color = {0, 0, 1},
        value_size = 32,
        value_x = 15,
        value_y = 35,
        value = 0
    }
    self.score = {
        label_color = {0, 0, 0},
        label_size = 20,
        label_text = "Score",
        label_x = G.SCR.WIDTH - 100,
        label_y = 15,
        value_color = {0, 0, 1},
        value_size = 32,
        value_x = G.SCR.WIDTH - 100,
        value_y = 35,
        value = 0
    }
    
    self.timer_text = "Time"
end

function Scene:draw()
    love.graphics.draw(self.image, 0, 0, 0, self.sx, self.sy)

    -- Display hi-score
    love.graphics.setColor(self.hi_score.label_color)
    love.graphics.setFont(love.graphics.newFont(self.hi_score.label_size))
    love.graphics.print(self.hi_score.label_text, self.hi_score.label_x, self.hi_score.label_y)
    love.graphics.setColor(self.hi_score.value_color)
    love.graphics.setFont(love.graphics.newFont(self.hi_score.value_size))
    love.graphics.print(self.hi_score.value, self.hi_score.value_x, self.hi_score.value_y)
    love.graphics.setColor(255, 255, 255)

    -- Display score
    love.graphics.setColor(self.score.label_color)
    love.graphics.setFont(love.graphics.newFont(self.score.label_size))
    love.graphics.print(self.score.label_text, self.score.label_x, self.score.label_y)
    love.graphics.setColor(self.score.value_color)
    love.graphics.setFont(love.graphics.newFont(self.score.value_size))
    love.graphics.print(self.score.value, self.score.value_x, self.score.value_y)
    love.graphics.setColor(255, 255, 255)
end
