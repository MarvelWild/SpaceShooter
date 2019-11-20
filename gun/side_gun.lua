-- basic gun, shoots bullets

local _={}

_.entity_name="side_gun"

_.fire=function(gun)
	local frame=Pow.getFrame()
	
	local cooldown=gun.cooldown
	local cooldown_ends=gun.cooldown_ends
	
	-- todo: >1 player
	local player=Player
	
	
	if frame > cooldown_ends then
		gun.cooldown_ends=frame+cooldown
		
		-- fire faster over time, make it a tech
		-- cooldown=cooldown-1
		if cooldown<1 then 
			cooldown=1 
		end
		
		gun.cooldown=cooldown
	
		local bullet1=Bullet_code.new(player)
		bullet1.x=player.x+8
		bullet1.y=player.y
		bullet1.speed_x=1
		bullet1.speed_y=0
		Entity.add(bullet1)
		
		local bullet2=Bullet_code.new(player)
		bullet2.x=player.x
		bullet2.y=player.y
		bullet2.speed_x=-1
		bullet2.speed_y=0
		Entity.add(bullet2)
	end
	
	gun.cooldown=cooldown
end

_.new=function()
	local result=Base_entity.new(_.entity_name,nil)
	result.cooldown=64
	result.cooldown_ends=0
	result.code=_
	
	result.fire=function()
		_.fire(result)
	end
		
	
	return result
end




return _