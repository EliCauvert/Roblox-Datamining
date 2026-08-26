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
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var2 = IXPNavigationUtilsModule.createExposureHandler(fStringAppChatFriendsTabIxpLayerModule)

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagExpChatFriendsTabRequireDefaultChannels (ref), signalsReactModule (ref), var2 (ref)
	local var3 = getFriendsChatSettingsStoreModule(false)
	local var4 = reactModule.useMemo(function()
		return game:GetService("TextChatService").CreateDefaultTextChannels
	end, {})
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), var3 (ref), fFlagExpChatFriendsTabRequireDefaultChannels (copy), var4 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), var3 (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), var4 (copy)
			return (not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()) and (var3.getChatEnabled(p1) and (var3.getChatUserMessagesEnabled(p1) ~= false and (not fFlagExpChatFriendsTabRequireDefaultChannels or var4)))
		end)
	end, { var3, var4 }))
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var2 (copy)
		if var5 then
			var2()
		end
	end, { var5 })
	
	return nil
end