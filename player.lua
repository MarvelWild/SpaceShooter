-- player is node
local _={}

_.entity_name="player"

local max_y=220
local min_y=60

_.draw=function(player)
	love.graphics.draw(Res.ship1.ship1, player.x, player.y)
end

local _cooldown=64
local _cooldown_ends=0

_.update=function(player_,dt)
	-- todo: call update on all nodes
	local is_left=love.keyboard.isDown("a")
	local is_right=love.keyboard.isDown("d")
	local is_up=love.keyboard.isDown("w")
	local is_down=love.keyboard.isDown("s")
	
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
	
	local is_fire=love.keyboard.isDown("space")
	if is_fire then
		local frame=Pow.getFrame()
		if frame > _cooldown_ends then
			_cooldown_ends=frame+_cooldown
		
			local bullet=Bullet_code.new(Game_node)
			bullet.x=Player.x+8
			bullet.y=Player.y
			Entity.add(bullet)
		end
	
	end
	
	
end



_.new=function(node_name,parent)
	local result=Node.new(node_name,parent,_.entity_name)
	result.x=110
	result.y=220
	result.w=16
	result.h=16
	result.speed=1
	
	result.is_collision=true
	
	return result
end

Entity.addCode(_.entity_name,_)

return _

