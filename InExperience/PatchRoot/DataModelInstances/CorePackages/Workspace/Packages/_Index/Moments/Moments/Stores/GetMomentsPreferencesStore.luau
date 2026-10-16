local CreateMomentsPreferencesStoreModule = require(script.createMomentsPreferencesStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ Line: 14 ]]
	-- upvalues: CreateMomentsPreferencesStoreModule (copy)
	return CreateMomentsPreferencesStoreModule()
end)