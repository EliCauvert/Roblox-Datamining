local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local var3 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var3 (write), fFlagExpChatCanShowFriendsTab (ref)
	local var4 = getFriendsChatSettingsStoreModule(false)
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p0)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var3 (copy), fFlagExpChatCanShowFriendsTab (copy), var4 (ref)
			return fFlagExpChatCanShowFriendsTab and ((not fFlagExpChatFriendsTabUsePolicy or var3(false).getAppPolicy(p0).getCanSeeFriendsTab()) and (var4.getChatEnabled(p0) and var4.getChatUserMessagesEnabled(p0) ~= false))
		end)
	}
end