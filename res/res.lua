local _={}

_.ship1={}
_.ship1.ship1=love.graphics.newImage("res/ship1/ship1.png")

_.ship1.ship1:setFilter("nearest", "nearest")


-- todo: automate this
_.dot=love.graphics.newImage("res/dot_white.png")

return _