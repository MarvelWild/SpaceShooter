-- basic gun, shoots bullets

-- todo: merge cooldown logic of all guns

local _={}

_.entity_name="gun1"

_.fire=function(gun)
	local frame=Pow.getFrame()
	
	local cooldown=gun.cooldown
	local cooldown_ends=gun.cooldown_ends
	
	-- todo: >1 player
	local player=gun.parent
	
	
	if frame > cooldown_ends then
		gun.cooldown_ends=frame+cooldown
		
		-- fire faster over time, make it a tech
		-- cooldown=cooldown-1
		if cooldown<1 then 
			cooldown=1 
		end
		
		gun.cooldown=cooldown
	
		local bullet=Bullet_code.new(player)
		bullet.x=player.x+8
		bullet.y=player.y
		Entity.add(bullet)
	end
	
	gun.cooldown=cooldown
end

_.new=function(parent)
	local result=Base_entity.new(_.entity_name,nil)
	result.cooldown=64
	result.cooldown_ends=0
	result.code=_
  result.parent=parent
	
	result.fire=function()
		_.fire(result)
	end
		
	
	return result
end




return _