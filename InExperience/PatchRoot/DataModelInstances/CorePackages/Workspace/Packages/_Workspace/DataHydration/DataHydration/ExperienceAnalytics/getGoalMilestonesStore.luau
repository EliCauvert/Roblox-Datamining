local CreateGoalMilestonesStoreModule = require(script.Parent.createGoalMilestonesStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateGoalMilestonesStoreModule (copy)
	return CreateGoalMilestonesStoreModule()
end)