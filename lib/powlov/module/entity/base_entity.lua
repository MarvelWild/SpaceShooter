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
_.new=function(entityName,isService)
	assert(entityName)
	local result={}
	
	if not isService then
		result.id=_new_id(entityName)
	end
	
	result.isService=isService
	result.entityName=entityName
	result.drawLayer=0
	
	
	return result
end

-- light reference
-- reverse: Db.getByRef
_.getReference=function(entity)
	local result={}
	
	result.id=entity.id
	-- result.login=entity.login no local ent/thin client
	result.entityName=entity.entityName
	result.levelName=entity.levelName
	
	return result
end

_.referenceEquals=function(ref1,ref2)
	if ref1.id~=ref2.id then return false end
	
	if ref1.entityName~=ref2.entityName then return false end
	
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
	return entityRef.id..":"..entityRef.entityName
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