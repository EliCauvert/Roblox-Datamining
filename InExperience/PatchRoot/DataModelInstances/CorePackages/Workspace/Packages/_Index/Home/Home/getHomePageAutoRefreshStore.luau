local home = script:FindFirstAncestor("Home")
local createHomePageAutoRefreshStoreModule = require(home.createHomePageAutoRefreshStore)

return require(home.Parent.Signals).createComputed(function()
	-- upvalues: createHomePageAutoRefreshStoreModule (ref)
	return createHomePageAutoRefreshStoreModule()
end)