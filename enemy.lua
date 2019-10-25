local _={}

_.entity_name="enemy"

local max_y=220
local min_y=60

_.draw=function(enemy)
	love.graphics.draw(res.enemy1, enemy.x, enemy.y,enemy.orientation,
		enemy.scale, enemy.scale)
end

_.update=function(enemy,dt)
	enemy.x=enemy.x-love.math.random()+0.5
	enemy.y=enemy.y-love.math.random()+0.5
end



_.new=function(node_name,parent)
	local result=node.new(node_name,parent,_.entity_name)
	result.x=110
	result.y=40
	result.scale=1
	result.speed=1
	result.orientation=0
	
	return result
end

entity.addCode(_.entity_name,_)

return _

