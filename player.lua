-- player is node
local _={}

_.entity_name="player"

_.draw=function(player)
	love.graphics.draw(res.ship1.ship1, player.x, player.y)
end

_.update=function(player_,dt)
	-- todo: call update on all nodes
	local is_left=love.keyboard.isDown("a")
	local is_right=love.keyboard.isDown("d")
	
	if is_left then
		local new_x=player_.x-player_.speed
		player_.x=new_x
	end
	
	if is_right then
		local new_x=player_.x+player_.speed
		player_.x=new_x
	end
	
	if player_.x<0 then player_.x=0 end
	local max_w=game_width-16 -- p.w
	if player_.x>max_w then player_.x=max_w end
	
end



_.new=function(node_name,parent)
	local result=node.new(node_name,parent,_.entity_name)
	result.x=110
	result.y=220
	result.speed=1
	
	return result
end

entity.addCode(_.entity_name,_)

return _

