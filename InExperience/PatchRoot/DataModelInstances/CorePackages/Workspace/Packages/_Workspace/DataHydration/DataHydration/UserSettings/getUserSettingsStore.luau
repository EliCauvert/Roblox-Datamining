local createUserSettingsStoreModule = require(script.Parent.createUserSettingsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createUserSettingsStoreModule (ref)
	return createUserSettingsStoreModule()
end)