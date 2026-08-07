local createFriendsChatMetadataStoreModule = require(script.createFriendsChatMetadataStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createFriendsChatMetadataStoreModule (ref)
	return createFriendsChatMetadataStoreModule()
end)