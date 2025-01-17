ent = require "ent"
direction = {
    x = 0,
    y = 0
}
moving = false

function move(x, y, speed, dt)
    if x == true then
        position.x = position.x + speed * dt
    elseif y == true then
        position.y = position.y + speed * dt
    end
end

function vectnorm(xx, yy)
    local length = math.sqrt(xx^2 + yy^2)
    ent.warn(length)
    if length > 0 then
        xx = xx / length
        yy = yy / length
        ent.error(xx)
        ent.error(yy)
    end
    return {
        x = xx,
        y = yy
    }
end

function keycheck(xx, yy) --trying to fix the input delay ffs 
    
    if love.keyboard.isDown("w") then
        xx = 1
    end
    if love.keyboard.isDown("s") then
        xx = -1
    end
    if love.keyboard.isDown("a") then
        yy = -1
    end
    if love.keyboard.isDown("d") then
        yy = 1
    end
    return vectnorm(xx,yy)
end

function capthing(vect)
    if true then
        
    end
end

function love.load()
    platformdim = {
    width = love.graphics.getWidth(),
    height = love.graphics.getHeight()
    }
    position = {
        x = platformdim.width / 2,
        y = platformdim.height / 2
    }
    x = 0
    y = 0
    ent.init()
    
    --ent.echo(position.x .. (",") .. position.y)
end
function love.draw()
    love.graphics.rectangle("line", position.x, position.y, 100, 100)
end
function love.update(dt)
    
    capthing(keycheck(x, y))

end
function love.keypressed(key)
    
    if key == "escape" then
        love.event.quit()
    end
    if key == "left" or key == "a" then
        direction.x = direction.x + -1
        moving = true
    end
    if key == "right" or key == "d" then
        direction.x = direction.x + 1
        moving = true
    end
    if key == "up" or key == "w" then
        direction.y = direction.y + -1
        moving = true
    end
    if key == "down" or key == "s" then
        direction.y = direction.y + 1
        moving = true
    end
    direction = vectnorm(direction.x, direction.y)
    --ent.echo(tostring(direction.x) .. "," .. tostring(direction.y))

end
function love.keyreleased(key)
    if (key == "left" or key == "a") and moving then
        direction.x = 0
    end
    if (key == "right" or key == "d") and moving then
        direction.x = 0
    end
    if (key == "up" or key == "w") and moving then
        direction.y = 0
    end
    if (key == "down" or  key == "s") and moving then
        direction.y = 0
    end
    if direction.x == 0 and direction.y == 0 then
        moving = false
    end
    

    --ent.warn(tostring(direction.x) .. "," .. tostring(direction.y) .. "," .. tostring(moving))
end
function love.focus(f)
    if not f then
        print("NOT FOCUSED")
    else
        print("FOCUSED")
    end
end

function love.quit()
    print("quitstate Initiated")
end