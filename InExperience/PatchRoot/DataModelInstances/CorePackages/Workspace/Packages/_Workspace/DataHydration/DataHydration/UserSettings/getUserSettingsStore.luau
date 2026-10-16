local CreateUserSettingsStoreModule = require(script.Parent.createUserSettingsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateUserSettingsStoreModule (copy)
	return CreateUserSettingsStoreModule()
end)