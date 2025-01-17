ent = require "ent"

function love.load()
    ent.init()
end
function love.draw()
    love.graphics.print("Hello World", 400, 400)
end
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
function love.focus(f)
    if not f then
        print("NOT FOCUSED")
    else
        print("FOCUSED")
    end
end