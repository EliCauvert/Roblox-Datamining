local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFriendsChatSettingsStoreModule = require(Parent.AppChat.GetFriendsChatSettingsStore)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local FFlagExpChatFriendsRespectWindowEnabledModule = require(FriendsChat.Flags.FFlagExpChatFriendsRespectWindowEnabled)
local FFlagFriendsChatSuggestedUsersModule = require(FriendsChat.Flags.FFlagFriendsChatSuggestedUsers)
local FFlagExpChatCanShowFriendsTab = SharedFlagsModule.FFlagExpChatCanShowFriendsTab
local FFlagExpChatFriendsTabRequireDefaultChannels = SharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local TextChatService = game:GetService("TextChatService")
local GetAppPolicyStoreFunction = require(Parent.UniversalAppPolicy).GetAppPolicyStore
local GetResult = if FFlagFriendsChatHasFriendsGate then require(Parent.DataHydration).Friends.FriendsStore.get() else nil

return function()
	-- upvalues: GetFriendsChatSettingsStoreModule (copy), TextChatService (copy), FFlagExpChatFriendsRespectWindowEnabledModule (copy), SignalsModule (copy), GetAppPolicyStoreFunction (copy), FFlagFriendsChatHasFriendsGate (copy), FFlagExpChatCanShowFriendsTab (copy), GetLocalUserIdModule (copy), GetResult (ref), FFlagFriendsChatSuggestedUsersModule (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy)
	local FriendsChatSettingsStoreModule = GetFriendsChatSettingsStoreModule(false)
	local CreateDefaultTextChannels = TextChatService.CreateDefaultTextChannels
	local Callback = nil
	local Connection = nil
	
	if FFlagExpChatFriendsRespectWindowEnabledModule then
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local Signal2
		Callback, Signal2 = SignalsModule.createSignal(ChatWindowConfiguration == nil or ChatWindowConfiguration.Enabled)
		
		if ChatWindowConfiguration then
			Connection = ChatWindowConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: Signal2 (copy), ChatWindowConfiguration (copy)
				Signal2(ChatWindowConfiguration.Enabled)
			end)
		end
	end
	return {
		getIsFriendsTabVisible = SignalsModule.createComputed(function(p1)
			-- upvalues: FFlagExpChatFriendsRespectWindowEnabledModule (upval), Callback (ref), GetAppPolicyStoreFunction (upval), FFlagFriendsChatHasFriendsGate (upval), FFlagExpChatCanShowFriendsTab (upval), GetLocalUserIdModule (upval), GetResult (upval), FFlagFriendsChatSuggestedUsersModule (upval), FriendsChatSettingsStoreModule (copy), FFlagExpChatFriendsTabRequireDefaultChannels (upval), CreateDefaultTextChannels (copy)
			if FFlagExpChatFriendsRespectWindowEnabledModule and not Callback(p1) then
				return false
			end
			local CanSeeFriendsTab = GetAppPolicyStoreFunction(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local Flag = true
			
			if FFlagFriendsChatHasFriendsGate and FFlagExpChatCanShowFriendsTab then
				Flag = false
				local LocalUserIdModule = GetLocalUserIdModule()
				
				if LocalUserIdModule ~= nil then
					local FriendsCountByUserId = GetResult.GetFriendsCountByUserId((tostring(LocalUserIdModule)))
					local DataResult = if FriendsCountByUserId then FriendsCountByUserId.data(p1) else nil
					Flag = DataResult ~= nil and (FFlagFriendsChatSuggestedUsersModule or DataResult > 0)
				end
			end
			return FFlagExpChatCanShowFriendsTab and (CanSeeFriendsTab and (Flag and (FriendsChatSettingsStoreModule.getChatEnabled(p1) and (FriendsChatSettingsStoreModule.getChatUserMessagesEnabled(p1) ~= false and (not FFlagExpChatFriendsTabRequireDefaultChannels or CreateDefaultTextChannels)))))
		end),
		dispose = function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	}
end