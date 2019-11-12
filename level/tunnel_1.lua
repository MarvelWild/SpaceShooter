local _=Base_entity.new("tunnel_1",true)

local _spawn_cooldown=100
local _spawn_after=0

-- todo: implement multiple spawners?
local spawner={}

local parts={}

local part1={}
local part_start={}
parts.start=part_start
parts.part1=part1

local _current_part
_.start_part=function(part)
	_current_part=part
end

_.start_part(part_start)

local _spawn=function()
	-- todo: beastiary get enemy with conditions
	-- todo: mutator
	
	local all=Beastiary.all
	local random=Pow.lume.randomchoice(all)
	local enemy=random.code.new(Game_node)
	enemy.y=0
	enemy.x=enemy.x+love.math.random(-100, 200)
	Entity.add(enemy)
end

local _spawn_random=function()
	local frame=Pow.getFrame()
	
	if frame>_spawn_after then
		_spawn()
		_spawn_after=frame+_spawn_cooldown
	end
end

part_start.update=function()
	-- todo: goto part1 after dialog
	local frame=Pow.getFrame()
	if (frame>30) then
		_.start_part(part1)
	end
	
	
end


part1.update=function()
	_spawn_cooldown=_spawn_cooldown-0.03
	if _spawn_cooldown<2 then _spawn_cooldown=2 end

	_spawn_random()
end


table.insert(parts,part1)



_.update=function()
	_current_part.update()
end






return _