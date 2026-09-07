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
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var2 = IXPNavigationUtilsModule.createExposureHandler(fStringAppChatFriendsTabIxpLayerModule)

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), signalsReactModule (ref), var2 (ref)
	local var3 = getFriendsChatSettingsStoreModule(false)
	local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), var3 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), var3 (copy)
			return (not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()) and (var3.getChatEnabled(p1) and var3.getChatUserMessagesEnabled(p1) ~= false)
		end)
	end, { var3 }))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var2 (copy)
		if var4 then
			var2()
		end
	end, { var4 })
	
	return nil
end