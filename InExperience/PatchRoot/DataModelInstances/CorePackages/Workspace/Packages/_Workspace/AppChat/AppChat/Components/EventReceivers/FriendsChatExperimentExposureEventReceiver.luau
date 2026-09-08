local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local fStringAppChatFriendsTabIxpLayerModule = require(appChat.Flags.FStringAppChatFriendsTabIxpLayer)
local getFriendsChatSettingsStoreModule = require(appChat.Stores.GetFriendsChatSettingsStore)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local fFlagFriendsChatHasFriendsGate = sharedFlagsModule.FFlagFriendsChatHasFriendsGate
local playersService = game:GetService("Players")
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var2 = if fFlagFriendsChatHasFriendsGate then require(parent.DataHydration).Friends.FriendsStore.get() else nil
local var3 = IXPNavigationUtilsModule.createExposureHandler(fStringAppChatFriendsTabIxpLayerModule)

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagFriendsChatHasFriendsGate (ref), playersService (ref), var2 (write), fFlagExpChatFriendsTabRequireDefaultChannels (ref), signalsReactModule (ref), var3 (ref)
	local var4 = getFriendsChatSettingsStoreModule(false)
	local var5 = reactModule.useMemo(function()
		return game:GetService("TextChatService").CreateDefaultTextChannels
	end, {})
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagFriendsChatHasFriendsGate (copy), playersService (copy), var2 (copy), var4 (ref), fFlagExpChatFriendsTabRequireDefaultChannels (copy), var5 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagFriendsChatHasFriendsGate (copy), playersService (copy), var2 (copy), var4 (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), var5 (copy)
			local var7 = not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local var8 = true
			
			if fFlagFriendsChatHasFriendsGate then
				var8 = false
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer then
					local friendsCountByUserId = var2.GetFriendsCountByUserId(tostring(localPlayer.UserId))
					local var9 = if friendsCountByUserId then friendsCountByUserId.data(p1) else nil
					var8 = var9 ~= nil and var9 > 0
				end
			end
			return var7 and (var8 and (var4.getChatEnabled(p1) and (var4.getChatUserMessagesEnabled(p1) ~= false and (not fFlagExpChatFriendsTabRequireDefaultChannels or var5))))
		end)
	end, { var4, var5 }))
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var3 (copy)
		if var6 then
			var3()
		end
	end, { var6 })
	
	return nil
end