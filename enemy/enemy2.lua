local _={}

-- todo: better inheritance
_.draw=Enemy_code.draw
_.update=Enemy_code.update

_.new=function()
	local result=Enemy_code.new()
	
	Entity.set_sprite(result, Res.enemy2)
	
	result.code=_
	
	return result
end


return _