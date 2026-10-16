local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local CreateMusicStoreModule = require(MomentsCreation.Stores.createMusicStore)

return require(MomentsCreation.Parent.Signals).createComputed(function() --[[ Line: 15 ]]
	-- upvalues: CreateMusicStoreModule (copy)
	return CreateMusicStoreModule()
end)