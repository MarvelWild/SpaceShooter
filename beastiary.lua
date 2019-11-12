local _={}


_.alien_1={
	name="alien_1",
	--ai=
	code=Enemy_code
}

_.alien_2={
	name="alien_2",
	--ai=
	code=Enemy2_code
}

_.space_invader={
	name="Space invader",
	code=Space_invader_code
}

_.all={}
local _all=_.all

table.insert(_all, _.alien_1)
table.insert(_all, _.alien_2)
table.insert(_all, _.space_invader)


return _