local isDebug=arg[#arg] == "-debug"
if isDebug then require("mobdebug").start() end

Res=require "res.res"
Audio=require "audio"
Options=require "options"
Pow=require "lib/powlov/pow"
Pow.setup({})
Base_entity=Pow.baseEntity
Entity=Pow.entity
Id=Pow.id

Gun1=require "gun/gun1"

Player_code=require "player"
Enemy_code=require "enemy"
Enemy2_code=require "enemy/enemy2"
Space_invader_code=require "enemy/space_invader"
Bullet_code=require "bullet"
Bg_code=require "bg"
local debug_x=require "dbg"
Cscreen=require "lib/CScreen/cscreen"
Random_spawner=require "system/random_spawner"
Ai=require "ai"
Beastiary=require "beastiary"

Collision=Pow.newCollision()




debug_x.pow=Pow
log=debug_x.log


Player=Player_code.new()
Bg=Bg_code.new()

Game_width=320
Game_height=240

Current_level=require "level/tunnel_1"


--love.graphics.setDefaultFilter( "nearest", "nearest" )

local _load_level=function(level)
	-- wip
		Entity.add(level)
end


love.load=function()
	
	Cscreen.init(Game_width, Game_height, true)
	
	Entity.add(Bg)
	Entity.add(Player)
	_load_level(Current_level)

	Pow.load()
	
	if Options.music then
		Audio.play_music(Res.music.track1)
	end
	
end

love.draw=function()
	-- root_node.draw()
	Cscreen.apply()
	-- Draw all of your objects here!
	
	Pow.draw()
	
	local game_x,game_y=Pow.getMouseXY()
	

	Cscreen.cease()
	--love.graphics.print("mouse at:"..game_x..","..game_y)
	love.graphics.print("hp:"..Player.hp,0,16)
end

love.update=function()

	-- раз нода это и сущность то обновляется она энтити менеджером
	Pow.update()
	-- pow.cam:setPosition(player.x, player.y-500)	
	-- root_node.update()
	
end


love.resize=function(width, height)
	Pow.resize(width, height)
	Cscreen.update(width, height)
end