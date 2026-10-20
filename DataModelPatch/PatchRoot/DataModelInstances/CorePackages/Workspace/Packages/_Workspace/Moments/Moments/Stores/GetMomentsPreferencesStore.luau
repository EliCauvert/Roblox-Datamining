local CreateMomentsPreferencesStoreModule = require(script.createMomentsPreferencesStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsPreferencesStoreModule (copy)
	return CreateMomentsPreferencesStoreModule()
end)