local _={}

_.entity_name="bg"

_.draw=function(bg)
	love.graphics.draw(res.bg, bg.x, bg.y)
end

_.update=function(entity,dt)
	entity.y=entity.y+entity.speed
end



_.new=function(node_name,parent)
	local result=node.new(node_name,parent,_.entity_name)
	result.x=0
	result.y=-3880
	result.speed=0.2
	
	return result
end

entity.addCode(_.entity_name,_)

return _

