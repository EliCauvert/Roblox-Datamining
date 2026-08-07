local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local createMusicStoreModule = require(momentsCreation.Stores.createMusicStore)

return require(momentsCreation.Parent.Signals).createComputed(function() --[[ line: 15 ]]
	-- upvalues: createMusicStoreModule (ref)
	return createMusicStoreModule()
end)