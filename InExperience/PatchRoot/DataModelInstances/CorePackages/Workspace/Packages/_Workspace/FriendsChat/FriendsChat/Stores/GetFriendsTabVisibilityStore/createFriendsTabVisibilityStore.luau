local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFriendsChatSettingsStoreModule = require(Parent.AppChat.GetFriendsChatSettingsStore)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local FFlagExpChatFriendsRespectWindowEnabledModule = require(FriendsChat.Flags.FFlagExpChatFriendsRespectWindowEnabled)
local FFlagExpChatFriendsTabUsePolicy = SharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local FFlagExpChatCanShowFriendsTab = SharedFlagsModule.FFlagExpChatCanShowFriendsTab
local FFlagExpChatFriendsTabRequireDefaultChannels = SharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local TextChatService = game:GetService("TextChatService")
local GetAppPolicyStore = if FFlagExpChatFriendsTabUsePolicy then require(Parent.UniversalAppPolicy).GetAppPolicyStore else nil
local GetResult = if FFlagFriendsChatHasFriendsGate then require(Parent.DataHydration).Friends.FriendsStore.get() else nil

return function()
	-- upvalues: GetFriendsChatSettingsStoreModule (copy), TextChatService (copy), FFlagExpChatFriendsRespectWindowEnabledModule (copy), SignalsModule (copy), FFlagExpChatFriendsTabUsePolicy (copy), GetAppPolicyStore (ref), FFlagFriendsChatHasFriendsGate (copy), FFlagExpChatCanShowFriendsTab (copy), GetLocalUserIdModule (copy), GetResult (ref), FFlagExpChatFriendsTabRequireDefaultChannels (copy)
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
			-- upvalues: FFlagExpChatFriendsRespectWindowEnabledModule (upval), Callback (ref), FFlagExpChatFriendsTabUsePolicy (upval), GetAppPolicyStore (upval), FFlagFriendsChatHasFriendsGate (upval), FFlagExpChatCanShowFriendsTab (upval), GetLocalUserIdModule (upval), GetResult (upval), FriendsChatSettingsStoreModule (copy), FFlagExpChatFriendsTabRequireDefaultChannels (upval), CreateDefaultTextChannels (copy)
			if FFlagExpChatFriendsRespectWindowEnabledModule and not Callback(p1) then
				return false
			end
			local NoFFlagExpChatFriendsTabUsePolicy = not FFlagExpChatFriendsTabUsePolicy or GetAppPolicyStore(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local Flag = true
			
			if FFlagFriendsChatHasFriendsGate and FFlagExpChatCanShowFriendsTab then
				Flag = false
				local LocalUserIdModule = GetLocalUserIdModule()
				
				if LocalUserIdModule ~= nil then
					local FriendsCountByUserId = GetResult.GetFriendsCountByUserId((tostring(LocalUserIdModule)))
					local DataResult = if FriendsCountByUserId then FriendsCountByUserId.data(p1) else nil
					Flag = DataResult ~= nil and DataResult > 0
				end
			end
			return FFlagExpChatCanShowFriendsTab and (NoFFlagExpChatFriendsTabUsePolicy and (Flag and (FriendsChatSettingsStoreModule.getChatEnabled(p1) and (FriendsChatSettingsStoreModule.getChatUserMessagesEnabled(p1) ~= false and (not FFlagExpChatFriendsTabRequireDefaultChannels or CreateDefaultTextChannels)))))
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