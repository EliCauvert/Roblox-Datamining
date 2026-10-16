local InterventionShared = script:FindFirstAncestor("InterventionShared")
local InterventionPlacementModule = require(InterventionShared.Contexts.InterventionPlacement)
local ReactModule = require(InterventionShared.Parent.React)

return function() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), InterventionPlacementModule (copy)
	return ReactModule.useContext(InterventionPlacementModule)
end