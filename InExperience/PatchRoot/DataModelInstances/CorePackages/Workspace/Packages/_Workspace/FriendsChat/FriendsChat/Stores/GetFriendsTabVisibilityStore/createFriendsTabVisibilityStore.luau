local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagExpChatCanShowFriendsTab (ref)
	local var2 = getFriendsChatSettingsStoreModule(false)
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagExpChatCanShowFriendsTab (copy), var2 (ref)
			return fFlagExpChatCanShowFriendsTab and ((not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()) and (var2.getChatEnabled(p1) and var2.getChatUserMessagesEnabled(p1) ~= false))
		end)
	}
end