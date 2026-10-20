local CreateFriendsChatMetadataStoreModule = require(script.createFriendsChatMetadataStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function()
	-- upvalues: CreateFriendsChatMetadataStoreModule (copy)
	return CreateFriendsChatMetadataStoreModule()
end)