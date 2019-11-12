local _={}

_.ship1={}
_.ship1.ship1=love.graphics.newImage("res/ship1/ship3.png")

_.bg=love.graphics.newImage("res/space1.png")
_.bg2=love.graphics.newImage("res/image/space2.png")
_.bg3=love.graphics.newImage("res/image/space3.png")
_.bg4=love.graphics.newImage("res/image/space4.png")
-- todo: automate this
--_.bg:setFilter("nearest", "nearest")
--_.ship1.ship1:setFilter("nearest", "nearest")



_.dot=love.graphics.newImage("res/dot_white.png")

_.music={}
_.music.track1=love.audio.newSource("res/music/track1.mp3","stream")
_.enemy1=love.graphics.newImage("res/image/enemy1/enemy1.png")
_.enemy2=love.graphics.newImage("res/image/enemy2.png")
_.bullet=love.graphics.newImage("res/image/bullet.png")
_.space_invader=love.graphics.newImage("res/image/space_invader.png")

return _