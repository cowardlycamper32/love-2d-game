ent = require "ent"
direction = {
    x = 0,
    y = 0
}
function love.load()
    ent.init()
end
function love.draw()
    love.graphics.print("Hello World", 400, 400)
end
function love.update()
    if direction.x > 1 then
        direction.x = 1
    elseif direction.x < -1 then
        direction.x = -1
    elseif direction.y > 1 then
        direction.y = 1
    elseif direction.y < -1 then
        direction.y = -1
    end

end
function love.keypressed(key)
    ent.info(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "left" or key == "a" then
        direction.x = direction.x + 1
    elseif key == "right" or key == "d" then
        direction.x = direction.x + -1
    elseif key == "up" or key == "w" then
        direction.y = direction.y + 1
    elseif key == "down" or key == "s" then
        direction.y = direction.y + -1
    end
    ent.echo(tostring(direction.x) .. "," .. tostring(direction.y))

end
function love.keyreleased(key)
    if key == "left" or key == "a" then
        direction.x = direction.x - 1
    elseif key == "right" or key == "d" then
        direction.x = direction.x - -1
    elseif key == "up" or key == "w" then
        direction.y = direction.y - 1
    elseif key == "down" or key == "s" then
        direction.y = direction.y - -1
    end
    ent.echo(tostring(direction.x) .. "," .. tostring(direction.y))
end
function love.focus(f)
    if not f then
        print("NOT FOCUSED")
    else
        print("FOCUSED")
    end
end

function love.quit()
    ent.warn("quitstate Initiated")
    ent.close()
end