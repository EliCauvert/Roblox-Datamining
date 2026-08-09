local interventionShared = script:FindFirstAncestor("InterventionShared")
local interventionPlacementModule = require(interventionShared.Contexts.InterventionPlacement)
local reactModule = require(interventionShared.Parent.React)

return function() --[[ line: 7 ]]
	-- upvalues: reactModule (ref), interventionPlacementModule (ref)
	return reactModule.useContext(interventionPlacementModule)
end