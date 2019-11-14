-- WW:global BaseEntity
-- родитель всех сущностей. содержит функции для работы с одиночной сущностью

local _={}

local _pow
local _new_id


_.init=function(pow)
	_pow=pow
	_new_id=pow.id.new
end

-- todo: check is name used
-- options.is_service означает одиночный инстанс, без ид
_.new=function(entity_name,parent,options)
	assert(entity_name)
	local result={}
	
	if not is_service then
		result.id=_new_id(entity_name)
	end
	
	result.parent=parent
	result.children={}
	
	if parent~=nil then
		table.insert(parent.children, result)
	end
	
	result.is_service=options~=nil and options.is_service
	result.entity_name=entity_name
	result.drawLayer=0
	
	return result
end

-- light reference
-- reverse: Db.getByRef
_.getReference=function(entity)
	local result={}
	
	result.id=entity.id
	-- result.login=entity.login no local ent/thin client
	result.entity_name=entity.entity_name
	result.levelName=entity.levelName
	
	return result
end

_.referenceEquals=function(ref1,ref2)
	if ref1.id~=ref2.id then return false end
	
	if ref1.entity_name~=ref2.entity_name then return false end
	
	return true
end




_.draw=function(entity)
	-- log('drawing:'..Entity.toString(entity))
	love.graphics.draw(entity.sprite,entity.x,entity.y)
end


_.isReferencedBy=function(entity,ref)
	local ref2=_.getReference(entity)
	local result=_.referenceEquals(ref,ref2)
	return result
end
_.refToSting=function(entityRef)
	if entityRef==nil then return "nil" end
	return entityRef.id..":"..entityRef.entity_name
end

-- calc w,h from sprite
_.init_collision=function(entity)
	local entity_sprite
	if entity.w==nil or entity.h==nil then
		entity_sprite=entity.sprite
		if entity_sprite~=nil then
			local w,h=entity_image:getDimensions()
			
			if entity.w==nil then
				entity.w=w
			end
			
			if entity.h==nil then
				entity.h=h
			end
		end
	end
end

return _