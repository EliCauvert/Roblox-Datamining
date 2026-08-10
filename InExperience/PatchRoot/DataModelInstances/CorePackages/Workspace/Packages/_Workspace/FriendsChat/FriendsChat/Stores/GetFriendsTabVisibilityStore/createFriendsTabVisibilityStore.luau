local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local fFlagExpChatFriendsTabUsePolicy = require(parent.SharedFlags).FFlagExpChatFriendsTabUsePolicy
local var2 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil

return function() --[[ line: 20 | named "createFriendsTabVisibilityStore" ]]
	-- upvalues: getFriendsChatSettingsStoreModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var2 (write)
	local var3 = getFriendsChatSettingsStoreModule(false)
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p0) --[[ line: 23 ]]
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var2 (copy), var3 (ref)
			return (not fFlagExpChatFriendsTabUsePolicy or var2(false).getAppPolicy(p0).getCanSeeFriendsTab()) and (var3.getChatEnabled(p0) and var3.getChatUserMessagesEnabled(p0) ~= false)
		end)
	}
end