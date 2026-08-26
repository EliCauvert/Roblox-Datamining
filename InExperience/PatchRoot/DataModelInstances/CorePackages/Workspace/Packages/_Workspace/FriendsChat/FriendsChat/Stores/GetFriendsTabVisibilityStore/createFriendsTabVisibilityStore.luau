local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local textChatService = game:GetService("TextChatService")
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), textChatService (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagExpChatCanShowFriendsTab (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref)
	local var2 = getFriendsChatSettingsStoreModule(false)
	local createDefaultTextChannels = textChatService.CreateDefaultTextChannels
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagExpChatCanShowFriendsTab (copy), var2 (ref), fFlagExpChatFriendsTabRequireDefaultChannels (copy), createDefaultTextChannels (ref)
			local var3 = not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()
			
			return fFlagExpChatCanShowFriendsTab and (var3 and (var2.getChatEnabled(p1) and (var2.getChatUserMessagesEnabled(p1) ~= false and (not fFlagExpChatFriendsTabRequireDefaultChannels or createDefaultTextChannels))))
		end)
	}
end