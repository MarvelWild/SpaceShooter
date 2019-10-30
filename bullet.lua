local _={}

_.entity_name="bullet"


_.draw=function(bullet)
	love.graphics.draw(bullet.sprite, bullet.x, bullet.y,bullet.orientation,
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


local _sprite=res.bullet
local _w=_sprite:getWidth()
local _h=_sprite:getHeight()

_.new=function(node_name,parent)
	local result=node.new(node_name,parent,_.entity_name)
	
	result.sprite=_sprite
	result.x=110
	result.y=40
	result.w=_w
	result.h=_h
	result.scale=1
	result.speed=1
	result.orientation=0
	
	result.is_collision=true
	
	return result
end

entity.addCode(_.entity_name,_)

return _

