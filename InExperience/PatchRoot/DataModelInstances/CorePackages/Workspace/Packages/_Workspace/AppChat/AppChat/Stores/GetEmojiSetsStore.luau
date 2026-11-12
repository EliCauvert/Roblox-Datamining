local CreateEmojiSetsStoreModule = require(script.createEmojiSetsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateEmojiSetsStoreModule (copy)
	return CreateEmojiSetsStoreModule()
end)