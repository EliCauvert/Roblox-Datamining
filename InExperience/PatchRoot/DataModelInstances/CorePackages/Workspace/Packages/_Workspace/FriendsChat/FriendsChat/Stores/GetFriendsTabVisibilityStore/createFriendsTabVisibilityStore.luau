local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local getLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local fFlagFriendsChatHasFriendsGate = sharedFlagsModule.FFlagFriendsChatHasFriendsGate
local textChatService = game:GetService("TextChatService")
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var2 = if fFlagFriendsChatHasFriendsGate then require(parent.DataHydration).Friends.FriendsStore.get() else nil

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), textChatService (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagFriendsChatHasFriendsGate (ref), fFlagExpChatCanShowFriendsTab (ref), getLocalUserIdModule (ref), var2 (write), fFlagExpChatFriendsTabRequireDefaultChannels (ref)
	local var3 = getFriendsChatSettingsStoreModule(false)
	local createDefaultTextChannels = textChatService.CreateDefaultTextChannels
	
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagFriendsChatHasFriendsGate (copy), fFlagExpChatCanShowFriendsTab (copy), getLocalUserIdModule (copy), var2 (copy), var3 (ref), fFlagExpChatFriendsTabRequireDefaultChannels (copy), createDefaultTextChannels (ref)
			local var4 = not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local var5 = true
			
			if fFlagFriendsChatHasFriendsGate and fFlagExpChatCanShowFriendsTab then
				var5 = false
				local var6 = getLocalUserIdModule()
				
				if var6 ~= nil then
					local friendsCountByUserId = var2.GetFriendsCountByUserId(tostring(var6))
					local var7 = if friendsCountByUserId then friendsCountByUserId.data(p1) else nil
					var5 = var7 ~= nil and var7 > 0
				end
			end
			return fFlagExpChatCanShowFriendsTab and (var4 and (var5 and (var3.getChatEnabled(p1) and (var3.getChatUserMessagesEnabled(p1) ~= false and (not fFlagExpChatFriendsTabRequireDefaultChannels or createDefaultTextChannels)))))
		end)
	}
end