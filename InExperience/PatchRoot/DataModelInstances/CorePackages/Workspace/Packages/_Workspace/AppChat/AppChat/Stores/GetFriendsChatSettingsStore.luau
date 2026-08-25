local createFriendsChatSettingsStoreModule = require(script.createFriendsChatSettingsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function()
	-- upvalues: createFriendsChatSettingsStoreModule (ref)
	return createFriendsChatSettingsStoreModule()
end)