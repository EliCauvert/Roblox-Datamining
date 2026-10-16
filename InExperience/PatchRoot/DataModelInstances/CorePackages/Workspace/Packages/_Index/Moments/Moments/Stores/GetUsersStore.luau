local CreateUsersStoreModule = require(script.createUsersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ Line: 7 ]]
	-- upvalues: CreateUsersStoreModule (copy)
	return CreateUsersStoreModule()
end)