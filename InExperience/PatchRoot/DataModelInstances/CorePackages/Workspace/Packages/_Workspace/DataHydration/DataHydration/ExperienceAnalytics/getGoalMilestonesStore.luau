local createGoalMilestonesStoreModule = require(script.Parent.createGoalMilestonesStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createGoalMilestonesStoreModule (ref)
	return createGoalMilestonesStoreModule()
end)