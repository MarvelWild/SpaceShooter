local _={}

local draw=function(player)
	love.graphics.draw(res.ship1.ship1, player.x, player.y)
end


_.new=function(parent)
	local result=node.new("player",parent)
	result.draw=draw
	result.x=x
	result.y=y
	
	return result
end


return _