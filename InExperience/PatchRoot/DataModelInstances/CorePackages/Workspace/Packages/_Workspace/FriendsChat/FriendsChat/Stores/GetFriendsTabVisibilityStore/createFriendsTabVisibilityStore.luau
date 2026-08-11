local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)

return function() --[[ line: 12 | named "createFriendsTabVisibilityStore" ]]
	-- upvalues: getFriendsChatSettingsStoreModule (ref), signalsModule (ref)
	local var2 = getFriendsChatSettingsStoreModule(false)
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p0) --[[ line: 15 ]]
			-- upvalues: var2 (ref)
			return var2.getChatEnabled(p0) and var2.getChatUserMessagesEnabled(p0) ~= false
		end)
	}
end