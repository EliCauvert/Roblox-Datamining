local createMomentsPreferencesStoreModule = require(script.createMomentsPreferencesStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsPreferencesStoreModule (ref)
	return createMomentsPreferencesStoreModule()
end)