local paddle = {}
paddle.__index = paddle


function paddle:new(x, y, w, h)
    self = {}
    self.x = x
    self.y = y
    self.Width = w
    self.Height = h
    self.color = {r = 1, g = 1, b = 1}
    self.score = 0
    setmetatable(self, paddle)
    return self
end

function paddle:setColor(r, g, b)
    self.color.r = r
    self.color.g = g
    self.color.b = b
end

function paddle:draw() 
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.rectangle("fill", self.x, self.y, self.Width, self.Height)
end

return paddle