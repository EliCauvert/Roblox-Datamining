local CreateBuildCreatorCreditRefreshStoreModule = require(script.createBuildCreatorCreditRefreshStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: CreateBuildCreatorCreditRefreshStoreModule (copy)
	return CreateBuildCreatorCreditRefreshStoreModule()
end)