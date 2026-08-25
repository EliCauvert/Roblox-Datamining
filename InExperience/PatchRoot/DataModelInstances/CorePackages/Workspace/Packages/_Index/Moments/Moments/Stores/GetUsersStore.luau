local createUsersStoreModule = require(script.createUsersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createUsersStoreModule (ref)
	return createUsersStoreModule()
end)