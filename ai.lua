local _={}

_.basic=require "ai/basic"
_.space_invader=require "ai/space_invader"
_.move_from_wall_to_wall=require "ai/move_from_wall_to_wall"

_.attach=function(ai,entity)
	if ai.init~=nil then
		ai.init(entity)
	end
	
	entity.ai=ai
	
end


return _