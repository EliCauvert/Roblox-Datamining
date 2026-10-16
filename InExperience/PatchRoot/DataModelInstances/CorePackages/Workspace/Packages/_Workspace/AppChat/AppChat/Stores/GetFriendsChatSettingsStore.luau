local CreateFriendsChatSettingsStoreModule = require(script.createFriendsChatSettingsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function() --[[ Line: 9 ]]
	-- upvalues: CreateFriendsChatSettingsStoreModule (copy)
	return CreateFriendsChatSettingsStoreModule()
end)