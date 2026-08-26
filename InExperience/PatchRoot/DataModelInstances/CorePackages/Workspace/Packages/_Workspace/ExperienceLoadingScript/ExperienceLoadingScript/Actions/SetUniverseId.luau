local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "table", "SetUniverseId action expects gameIds to be a table")
	
	return { universeId = p1.universeId, placeId = p1.placeId }
end)