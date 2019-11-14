local _={}

_.entity_name="enemy"

local max_y=220
local min_y=60

_.draw=function(enemy)
	love.graphics.draw(enemy.sprite, enemy.x, enemy.y,enemy.orientation,
		enemy.scale, enemy.scale)
end

_.update=function(enemy,dt)
	enemy.ai.update(enemy)
	Collision.moved(enemy)
	if enemy.y>Game_height+100 then
		Entity.remove(enemy)
	end

	
end


local _sprite=Res.enemy1
local _w=_sprite:getWidth()
local _h=_sprite:getHeight()


_.new=function(parent)
	local result=Base_entity.new(_.entity_name,parent)
	result.x=110
	result.y=40
	result.scale=1
	result.speed=1
	result.sprite=_sprite
	result.w=_w
	result.h=_h
	result.orientation=0
	result.hp=4
	
	result.ai=Ai.basic
	result.is_collision=true
	
	Base_entity.init_collision(result)
	result.code=_
	
	
	return result
end

_.take_damage=function(enemy, amount)
	enemy.hp=enemy.hp-amount
	if enemy.hp<=0 then
		Entity.remove(enemy)
	end
end


Entity.addCode(_.entity_name,_)

return _

