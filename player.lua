local _={}

_.entity_name="player"

local max_y=220
local min_y=60

_.draw=function(player)
	if player.invulnerable then
		love.graphics.setColor(0.8,1,1,0.5)
	end
	love.graphics.draw(Res.ship1.ship1, player.x, player.y)
	if player.invulnerable then
		love.graphics.setColor(1,1,1,1)
	end
end

_.drawUnscaledUi=function(player)
	love.graphics.print("score:"..player.score,0, 32)
	love.graphics.print("hp:"..player.hp,0,16)
end



local apply_invulnerability=function(player)
	local frame=Pow.getFrame()
	player.invulnerability_ends=frame+60
	player.invulnerable=true
end

local die=function()
	log("player dead")
	-- wip
end

local take_damage=function(player, amount)
	player.hp=player.hp-amount
	if player.hp<=0 then
		die()
	end
end


local collide_enemy=function(player,enemy)
	if player.invulnerable then return end
	apply_invulnerability(player)
	take_damage(player,1)
	Enemy_code.take_damage(enemy,6,player)
end


local update_collisions=function(player)
	Collision.moved(player)
	
		local colliding=Collision.getAtEntity(player)
	
	if colliding~=nil then
		for k,colliding_entity in pairs(colliding) do
			local entity_name=colliding_entity.entity_name
			if entity_name=="enemy" then
				collide_enemy(player, colliding_entity)
			end
		end
	end
end

local do_fire=function(player)
	local is_fire=Options.autofire or love.keyboard.isDown("space")
	
	if is_fire then
		for k,gun in pairs(player.guns) do
			gun.fire()
		end
	end
end



_.update=function(player_,dt)
	
	
	
	-- todo: call update on all nodes
	local is_left=love.keyboard.isDown("a")
	local is_right=love.keyboard.isDown("d")
	local is_up=love.keyboard.isDown("w")
	local is_down=love.keyboard.isDown("s")
	
	local is_any_input=is_left or is_right or is_up or is_down
	
	if not is_any_input then
		player_.ai.update(player_)
	else
		log("ai skip")
	end
	
	local dx=0
	local dy=0
	
	if is_left then
		dx=dx-player_.speed
	end
	
	if is_right then
		dx=dx+player_.speed
	end
	
	if is_down then
		dy=dy+player_.speed
	end
	
	if is_up then
		dy=dy-player_.speed
	end
	
	if math.abs(dx)>0.1 and math.abs(dy)>0.1 then
		dy=dy/1.4
		dx=dx/1.4
	end
	
	player_.x=player_.x+dx
	player_.y=player_.y+dy
	
	if player_.x<0 then player_.x=0 end
	if player_.y<min_y then player_.y=min_y end
	if player_.y>max_y then player_.y=max_y end
	local max_w=Game_width-16 -- p.w
	if player_.x>max_w then player_.x=max_w end
	
	do_fire(player_)
	update_collisions(player_)

	if player_.invulnerable then
		local frame=Pow.getFrame()
		if frame>player_.invulnerability_ends then
			player_.invulnerable=false
		end
		
	end
	
end

_.new=function()
	local result=Base_entity.new(_.entity_name,nil)
	result.x=110
	result.y=220
	result.w=16
	result.h=16
	result.speed=1
	result.hp=5
	result.invulnerable=false
	result.score=0
	
	result.is_collision=true
	local gun1=Gun1.new()
	local side_gun=Side_gun.new()
	result.guns={
		gun1,
		side_gun
	}
	
	
	return result
end

-- todo : think generic
_.is=function(entity)
	return entity~=nil and entity.entity_name==_.entity_name
end


Entity.addCode(_.entity_name,_)

return _

