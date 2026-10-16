local Parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 7 ]]
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(p1, "table", "SetUniverseId action expects gameIds to be a table")
	
	return { universeId = p1.universeId, placeId = p1.placeId }
end)