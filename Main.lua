paddleClass = require("Paddle")
ballClass = require("Ball")

function love.load()
    love.window.setTitle("Ping Pong")
    love.window.setMode(1400, 600)
    paddle1 = paddleClass:new(25,250,20,100)
    paddle2 = paddleClass:new(1350,250,20,100)
    ball = ballClass:new(700,300,10)
    paddle1:setColor(1,1,0)
    paddle2:setColor(0,0,1)
    ball:setColor(1,0,1)
end

function checkCollision(a, b)
    return a.x < b.x + b.Width and
           a.x + a.r > b.x and
           a.y < b.y + b.Height and
           a.y + a.r > b.y
end


function love.update(dt)
    
    -- Move paddle1 up and down
    if love.keyboard.isDown("w") and paddle1.y > 0 then
        paddle1.y = paddle1.y - 300 * dt
    elseif love.keyboard.isDown("s") and paddle1.y + paddle1.Height < love.graphics.getHeight() then
        paddle1.y = paddle1.y + 300 * dt
    end

    -- Move paddle2 up and down
    if love.keyboard.isDown("up") and paddle2.y > 0 then
        paddle2.y = paddle2.y - 300 * dt
    elseif love.keyboard.isDown("down") and paddle2.y + paddle2.Height < love.graphics.getHeight() then
        paddle2.y = paddle2.y + 300 * dt
    end
    -- Move the ball
    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt

    -- Check for collisions with the paddles
    if checkCollision(ball, paddle1) or checkCollision(ball, paddle2) then
        ball.dx = -ball.dx
    end

    if ball.y < 0 or ball.y > love.graphics.getHeight() then
        ball.dy = -ball.dy
    end

    if ball.x < 0 then
        paddle2.score = paddle2.score + 1
        ball.x = love.graphics.getWidth() / 2
        ball.y = love.graphics.getHeight() / 2
        ball.dx = 400
        ball.dy = 400
    elseif ball.x > love.graphics.getWidth() then
        paddle1.score = paddle1.score + 1
        ball.x = love.graphics.getWidth() / 2
        ball.y = love.graphics.getHeight() / 2
        ball.dx = -400
        ball.dy = -400
    end
end

function love.draw()
    -- Draw the paddles
    paddle1:draw()
    paddle2:draw()

    -- Draw the ball
    ball:draw()

    -- Draw the scores
    love.graphics.print("Player 1: " .. paddle1.score, 50, 50)
    love.graphics.print("Player 2: " .. paddle2.score, 1250, 50)
end