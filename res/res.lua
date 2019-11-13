local _={}

_.ship1={}
_.ship1.ship1=love.graphics.newImage("res/ship1/ship3.png")

_.bg=love.graphics.newImage("res/space1.png")
_.bg2=love.graphics.newImage("res/image/space2.png")
_.bg3=love.graphics.newImage("res/image/space3.png")
_.bg4=love.graphics.newImage("res/image/space4.png")

_.all_bg={
		_.bg,
		_.bg2,
		_.bg3,
		_.bg4,
	}
-- todo: automate this
--_.bg:setFilter("nearest", "nearest")
--_.ship1.ship1:setFilter("nearest", "nearest")



_.dot=love.graphics.newImage("res/dot_white.png")

_.music={}


local load_music=function(path)
	local info=love.filesystem.getInfo(path)
	if info==nil then return end
	return love.audio.newSource(path,"stream")
end


_.music.track1=load_music("res/unlicensed/track1.mp3")
_.enemy1=love.graphics.newImage("res/image/enemy1/enemy1.png")
_.enemy2=love.graphics.newImage("res/image/enemy2.png")
_.bullet=love.graphics.newImage("res/image/bullet.png")
_.space_invader=love.graphics.newImage("res/image/space_invader.png")

return _