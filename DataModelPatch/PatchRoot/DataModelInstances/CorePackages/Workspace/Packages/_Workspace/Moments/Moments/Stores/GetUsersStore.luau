local CreateUsersStoreModule = require(script.createUsersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateUsersStoreModule (copy)
	return CreateUsersStoreModule()
end)