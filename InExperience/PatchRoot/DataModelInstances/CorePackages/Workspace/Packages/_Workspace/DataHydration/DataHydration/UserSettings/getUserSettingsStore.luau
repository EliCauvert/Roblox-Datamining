local CreateUserSettingsStoreModule = require(script.Parent.createUserSettingsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUserSettingsStoreModule (copy)
	return CreateUserSettingsStoreModule()
end)