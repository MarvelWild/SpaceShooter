local isDebug=arg[#arg] == "-debug"
if isDebug then require("mobdebug").start() end

Res=require "res.res"
Options=require "options"
Pow=require "lib/powlov/pow"
Pow.setup({})
Base_entity=Pow.baseEntity
Entity=Pow.entity
Id=Pow.id
Node=require "node"
Player_code=require "player"
Enemy_code=require "enemy"
Bullet_code=require "bullet"
Bg_code=require "bg"
local debug_x=require "dbg"
Cscreen=require "lib/CScreen/cscreen"

Collision=Pow.newCollision()
debug_x.pow=Pow
log=debug_x.log

-- wip
-- collision=pow.

Root_node=Node.new("root")
Game_node=Node.new("game",Root_node)
Player=Player_code.new(Game_node)
local enemy=Enemy_code.new(Game_node)
local enemy2=Enemy_code.new(Game_node)
local enemy3=Enemy_code.new(Game_node)
Bg=Bg_code.new(Game_node)

Game_width=320
Game_height=240


--love.graphics.setDefaultFilter( "nearest", "nearest" )

love.load=function()
	
	Cscreen.init(Game_width, Game_height, true)
	
	Entity.add(Bg)
	Entity.add(Player)
	Entity.add(enemy)
	-- todo: apply scale to collision model
--	enemy2.scale=2
--	enemy2.x=enemy.x+60
--	enemy3.x=enemy2.x+60
--	entity.add(enemy2)
--	entity.add(enemy3)
	Pow.load()
	
	if Options.music then
		Res.music.track1:play()
	end
	
end

love.draw=function()
	-- root_node.draw()
	Cscreen.apply()
	-- Draw all of your objects here!
	
	Pow.draw()
	
	local game_x,game_y=Pow.getMouseXY()
	

	Cscreen.cease()
	love.graphics.print("mouse at:"..game_x..","..game_y)
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