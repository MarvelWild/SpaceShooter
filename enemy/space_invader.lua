local _={}




_.draw=Enemy_code.draw
_.update=Enemy_code.update
_.new=function()
	local result=Enemy_code.new()
	
	result.ai=Ai.space_invader
	Entity.set_sprite(result, Res.space_invader)
	
	result.code=_
	
	return result
end


return _