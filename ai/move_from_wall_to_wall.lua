local _={}

_.init=function(entity)
	entity.ai_dx=1
end


_.update=function(entity)
	entity.x=entity.x+entity.ai_dx
	local new_x=entity.x
	if new_x>=Game_width-16 then
		entity.x=Game_width-16
		entity.ai_dx=-entity.ai_dx
	elseif new_x<0 then
		entity.x=0
		entity.ai_dx=-entity.ai_dx
	end
end


return _