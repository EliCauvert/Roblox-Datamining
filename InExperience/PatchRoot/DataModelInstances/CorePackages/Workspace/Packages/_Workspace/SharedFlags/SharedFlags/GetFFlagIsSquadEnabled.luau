local LuaAppEnableSquadPage4 = game:DefineFastFlag("LuaAppEnableSquadPage4", false)
local ForceEnableSquad = game:DefineFastFlag("ForceEnableSquad", false)
local SquadEnabled = game:DefineFastFlag("SquadEnabled", false)

return function() --[[ Line: 5 ]]
	-- upvalues: SquadEnabled (copy), LuaAppEnableSquadPage4 (copy), ForceEnableSquad (copy)
	return SquadEnabled or LuaAppEnableSquadPage4 and ForceEnableSquad
end