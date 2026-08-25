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
local var8 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var9 = IXPNavigationUtilsModule.createExposureHandler(fStringAppChatFriendsTabIxpLayerModule)

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var8 (write), signalsReactModule (ref), var9 (ref)
	local var10 = getFriendsChatSettingsStoreModule(false)
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagExpChatFriendsTabUsePolicy (copy), var8 (copy), var10 (ref)
		return signalsModule.createComputed(function(p0)
			-- upvalues: fFlagExpChatFriendsTabUsePolicy (copy), var8 (copy), var10 (copy)
			return (not fFlagExpChatFriendsTabUsePolicy or var8(false).getAppPolicy(p0).getCanSeeFriendsTab()) and (var10.getChatEnabled(p0) and var10.getChatUserMessagesEnabled(p0) ~= false)
		end)
	end, { var10 }))
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var9 (copy)
		if var11 then
			var9()
		end
	end, { var11 })
	
	return nil
end