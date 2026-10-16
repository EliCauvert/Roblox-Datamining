local CreateFriendsChatMetadataStoreModule = require(script.createFriendsChatMetadataStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function() --[[ Line: 9 ]]
	-- upvalues: CreateFriendsChatMetadataStoreModule (copy)
	return CreateFriendsChatMetadataStoreModule()
end)