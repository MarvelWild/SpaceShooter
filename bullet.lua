local _={}

_.entity_name="bullet"


_.draw=function(bullet)
	love.graphics.draw(res.bullet, bullet.x, bullet.y,bullet.orientation,
		bullet.scale, bullet.scale)
end

-- todo: generic way
local destroy=function(entity_)
	-- коллизия внутри удаляется
	entity.remove(entity_)
end


_.update=function(bullet,dt)
	bullet.x=bullet.x-love.math.random()+0.5
	bullet.y=bullet.y-love.math.random()-1
	
	-- wip collision model
	
	-- wip destoy off-screen on slow update
	
	if bullet.y<0 then
		destroy(bullet)
	end
	
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

