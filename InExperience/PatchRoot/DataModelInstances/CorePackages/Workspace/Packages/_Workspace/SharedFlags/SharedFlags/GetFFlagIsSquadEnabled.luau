local luaAppEnableSquadPage4 = game:DefineFastFlag("LuaAppEnableSquadPage4", false)
local forceEnableSquad = game:DefineFastFlag("ForceEnableSquad", false)
local squadEnabled = game:DefineFastFlag("SquadEnabled", false)

return function() --[[ line: 5 ]]
	-- upvalues: squadEnabled (ref), luaAppEnableSquadPage4 (ref), forceEnableSquad (ref)
	return squadEnabled or luaAppEnableSquadPage4 and forceEnableSquad
end