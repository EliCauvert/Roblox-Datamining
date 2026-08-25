local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "SetUniverseId action expects gameIds to be a table")
	
	return { universeId = p0.universeId, placeId = p0.placeId }
end)