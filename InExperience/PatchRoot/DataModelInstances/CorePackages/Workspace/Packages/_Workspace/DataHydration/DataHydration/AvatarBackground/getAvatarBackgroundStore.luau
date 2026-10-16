local CreateAvatarBackgroundStoreModule = require(script.Parent.createAvatarBackgroundStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateAvatarBackgroundStoreModule (copy)
	return CreateAvatarBackgroundStoreModule()
end)