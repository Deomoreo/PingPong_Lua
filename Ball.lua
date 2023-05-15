local ball = {}
ball.__index = ball

function ball:new(x, y, r)
    self = {}
    self.x = x
    self.y = y
    self.r = r
    self.color = {r = 1, g = 1, b = 1}
    self.dx = 400
    self.dy = 400
    setmetatable(self, ball)
    return self
end

function ball:setColor(r, g, b)
    self.color.r = r
    self.color.g = g
    self.color.b = b
end

function ball:draw() 
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.circle("fill", self.x, self.y, self.r)
end

return ball
