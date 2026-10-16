local Home = script:FindFirstAncestor("Home")
local CreateHomePageAutoRefreshStoreModule = require(Home.createHomePageAutoRefreshStore)

return require(Home.Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateHomePageAutoRefreshStoreModule (copy)
	return CreateHomePageAutoRefreshStoreModule()
end)