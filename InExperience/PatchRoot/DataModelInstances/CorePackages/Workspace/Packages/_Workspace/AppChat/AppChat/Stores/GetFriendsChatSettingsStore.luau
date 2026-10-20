local CreateFriendsChatSettingsStoreModule = require(script.createFriendsChatSettingsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function()
	-- upvalues: CreateFriendsChatSettingsStoreModule (copy)
	return CreateFriendsChatSettingsStoreModule()
end)