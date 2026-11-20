local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local FStringAppChatFriendsTabIxpLayerModule = require(AppChat.Flags.FStringAppChatFriendsTabIxpLayer)
local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local FFlagExpChatFriendsTabRequireDefaultChannels = SharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local Players = game:GetService("Players")
local GetAppPolicyStoreFunction = require(Parent.UniversalAppPolicy).GetAppPolicyStore
local GetResult = if FFlagFriendsChatHasFriendsGate then require(Parent.DataHydration).Friends.FriendsStore.get() else nil
local Exposure = IXPNavigationUtilsModule.createExposureHandler(FStringAppChatFriendsTabIxpLayerModule)

return function()
	-- upvalues: GetFriendsChatSettingsStoreModule (copy), ReactModule (copy), SignalsModule (copy), GetAppPolicyStoreFunction (copy), FFlagFriendsChatHasFriendsGate (copy), Players (copy), GetResult (ref), FFlagExpChatFriendsTabRequireDefaultChannels (copy), SignalsReactModule (copy), Exposure (copy)
	local FriendsChatSettingsStoreModule = GetFriendsChatSettingsStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		return game:GetService("TextChatService").CreateDefaultTextChannels
	end, {})
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetAppPolicyStoreFunction (upval), FFlagFriendsChatHasFriendsGate (upval), Players (upval), GetResult (upval), FriendsChatSettingsStoreModule (copy), FFlagExpChatFriendsTabRequireDefaultChannels (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: GetAppPolicyStoreFunction (upval), FFlagFriendsChatHasFriendsGate (upval), Players (upval), GetResult (upval), FriendsChatSettingsStoreModule (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), UseMemoResult (upval)
			local CanSeeFriendsTab = GetAppPolicyStoreFunction(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local Flag = true
			
			if FFlagFriendsChatHasFriendsGate then
				Flag = false
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer then
					local FriendsCountByUserId = GetResult.GetFriendsCountByUserId((tostring(LocalPlayer.UserId)))
					local DataResult = if FriendsCountByUserId then FriendsCountByUserId.data(p1) else nil
					Flag = DataResult ~= nil and DataResult > 0
				end
			end
			return CanSeeFriendsTab and (Flag and (FriendsChatSettingsStoreModule.getChatEnabled(p1) and (FriendsChatSettingsStoreModule.getChatUserMessagesEnabled(p1) ~= false and (not FFlagExpChatFriendsTabRequireDefaultChannels or UseMemoResult))))
		end)
	end, { FriendsChatSettingsStoreModule, UseMemoResult })))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), Exposure (upval)
		if UseSignalStateResult then
			Exposure()
		end
	end, { UseSignalStateResult })
	
	return nil
end