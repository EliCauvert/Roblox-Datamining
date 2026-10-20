local Home = script:FindFirstAncestor("Home")
local CreateHomePageAutoRefreshStoreModule = require(Home.createHomePageAutoRefreshStore)

return require(Home.Parent.Signals).createComputed(function()
	-- upvalues: CreateHomePageAutoRefreshStoreModule (copy)
	return CreateHomePageAutoRefreshStoreModule()
end)