local createFriendsChatSettingsStoreModule = require(script.createFriendsChatSettingsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createFriendsChatSettingsStoreModule (ref)
	return createFriendsChatSettingsStoreModule()
end)