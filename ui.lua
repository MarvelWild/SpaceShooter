-- player is node
local _={}

_.entity_name="ui"


_.draw=function(ui)
end

_.update=function(ui,dt)
end



_.new=function(node_name,parent)
	local result=node.new(node_name,parent,_.entity_name)
	
	return result
end

entity.addCode(_.entity_name,_)

return _

