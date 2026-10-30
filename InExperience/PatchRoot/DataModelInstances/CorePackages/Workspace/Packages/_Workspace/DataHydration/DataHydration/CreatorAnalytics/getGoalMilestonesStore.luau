local CreateGoalMilestonesStoreModule = require(script.Parent.createGoalMilestonesStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateGoalMilestonesStoreModule (copy)
	return CreateGoalMilestonesStoreModule()
end)