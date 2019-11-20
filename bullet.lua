local _={}

_.entity_name="bullet"


_.draw=function(bullet)
	love.graphics.draw(bullet.sprite, bullet.x, bullet.y,bullet.orientation,
		bullet.scale, bullet.scale)
end

-- todo: generic way
local destroy=function(entity_)
	-- коллизия внутри удаляется
	Entity.remove(entity_)
end



local hit_enemy=function(bullet,enemy)
	Enemy_code.take_damage(enemy,bullet.damage,bullet.parent)
	Entity.remove(bullet)
end

local destroy_out_of_screen=function(bullet)
	if bullet.y<0 or bullet.x<0 or bullet.x>Game_width or bullet.y>Game_height then
		destroy(bullet)
	end
end


_.update=function(bullet,dt)
	bullet.x=bullet.x+bullet.speed_x
	bullet.y=bullet.y+bullet.speed_y
	
	Collision.moved(bullet)
	
	local colliding=Collision.getAtEntity(bullet)
	
	if colliding~=nil then
		for k,colliding_entity in pairs(colliding) do
			-- log("bullet colliding with:"..entity.toString(colliding_info))
			
			local entity_name=colliding_entity.entity_name
			if entity_name=="enemy" then
				hit_enemy(bullet, colliding_entity)
			end
		end
	end
	
	-- opt destoy off-screen on slow update
	
	destroy_out_of_screen(bullet)
	
	
end


local _sprite=Res.bullet
local _w=_sprite:getWidth()
local _h=_sprite:getHeight()

_.new=function(parent)
	local result=Base_entity.new(_.entity_name,parent)
	
	result.sprite=_sprite
	result.x=110
	result.y=40
	result.w=_w
	result.h=_h
	result.scale=1
	result.speed_x=0
	
	-- fly top by default
	result.speed_y=-1
	result.damage=2
	result.orientation=0
	result.is_player=parent.entity=="player"
	
	result.is_collision=true
	result.code=_
	
	return result
end

Entity.addCode(_.entity_name,_)

return _

