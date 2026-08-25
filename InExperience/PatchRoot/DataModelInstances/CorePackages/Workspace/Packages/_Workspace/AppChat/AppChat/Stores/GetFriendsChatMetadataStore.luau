local createFriendsChatMetadataStoreModule = require(script.createFriendsChatMetadataStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function()
	-- upvalues: createFriendsChatMetadataStoreModule (ref)
	return createFriendsChatMetadataStoreModule()
end)