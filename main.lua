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
function love.load()
    position = {
        x = 100,
        y = 50
    }
    ent.init()
    ent.echo(position.x .. (",") .. position.y)
end
function love.draw()
    love.graphics.rectangle("line", position.x, position.y, 200, 150)
end
function love.update(dt)
    if direction.x >= 1 then
        direction.x = 1
        move(true, false, 1 * 50, dt)
    end

    if direction.x <= -1 then
        direction.x = -1
        move(true, false, -1 * 50, dt)
    end

    if direction.y >= 1 then
        direction.y = 1
        move(false, true, 1 * 50, dt)
        
    end
    if direction.y <= -1 then
        direction.y = -1
        move(false, true, -1 * 50, dt)
    end
    

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
    ent.echo(tostring(direction.x) .. "," .. tostring(direction.y))

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

    print(tostring(direction.x) .. "," .. tostring(direction.y))
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