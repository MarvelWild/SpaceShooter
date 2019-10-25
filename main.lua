local isDebug=arg[#arg] == "-debug"
if isDebug then require("mobdebug").start() end

res=require "res.res"
options=require "options"
pow=require "lib/powlov/pow"
pow.setup({})
base_entity=pow.baseEntity
entity=pow.entity
id=pow.id
node=require "node"
player_code=require "player"
enemy_code=require "enemy"
bullet_code=require "bullet"
bg_code=require "bg"
local debug_x=require "dbg"

collision=pow.newCollision()
debug_x.pow=pow
log=debug_x.log

-- wip
-- collision=pow.

root_node=node.new("root")
game_node=node.new("game",root_node)
player=player_code.new(game_node)
local enemy=enemy_code.new(game_node)
local enemy2=enemy_code.new(game_node)
local enemy3=enemy_code.new(game_node)
bg=bg_code.new(game_node)

game_width=320
game_height=240


--love.graphics.setDefaultFilter( "nearest", "nearest" )

love.load=function()
	
	entity.add(bg)
	entity.add(player)
	entity.add(enemy)
	enemy2.scale=2
	enemy2.x=enemy.x+60
	enemy3.x=enemy2.x+60
	entity.add(enemy2)
	entity.add(enemy3)
	pow.load()
	
	if options.music then
		res.music.track1:play()
	end
	
end

love.draw=function()
	-- root_node.draw()
	love.graphics.draw(res.dot,0,0)
	pow.draw()
	
	local game_x,game_y=pow.getMouseXY()
	


	-- love.graphics.print("mouse at:"..game_x..","..game_y)
end

love.update=function()

	-- раз нода это и сущность то обновляется она энтити менеджером
	pow.update()
	-- pow.cam:setPosition(player.x, player.y-500)	
	-- root_node.update()
	
end


love.resize=function(width, height)
	pow.resize(width, height)
end