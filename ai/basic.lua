local _={}

_.update=function(entity)
	entity.x=entity.x-love.math.random()+0.5
	entity.y=entity.y-love.math.random()+0.5+1
end


return _