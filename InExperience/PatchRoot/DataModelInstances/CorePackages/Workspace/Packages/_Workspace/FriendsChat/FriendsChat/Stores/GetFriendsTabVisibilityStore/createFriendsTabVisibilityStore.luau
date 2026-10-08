local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local getLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local fFlagExpChatFriendsRespectWindowEnabledModule = require(friendsChat.Flags.FFlagExpChatFriendsRespectWindowEnabled)
local fFlagExpChatFriendsTabUsePolicy = sharedFlagsModule.FFlagExpChatFriendsTabUsePolicy
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local fFlagFriendsChatHasFriendsGate = sharedFlagsModule.FFlagFriendsChatHasFriendsGate
local textChatService = game:GetService("TextChatService")
local var1 = if fFlagExpChatFriendsTabUsePolicy then require(parent.UniversalAppPolicy).GetAppPolicyStore else nil
local var2 = if fFlagFriendsChatHasFriendsGate then require(parent.DataHydration).Friends.FriendsStore.get() else nil

return function()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), textChatService (ref), fFlagExpChatFriendsRespectWindowEnabledModule (ref), signalsModule (ref), fFlagExpChatFriendsTabUsePolicy (ref), var1 (write), fFlagFriendsChatHasFriendsGate (ref), fFlagExpChatCanShowFriendsTab (ref), getLocalUserIdModule (ref), var2 (write), fFlagExpChatFriendsTabRequireDefaultChannels (ref)
	local var3 = getFriendsChatSettingsStoreModule(false)
	local createDefaultTextChannels = textChatService.CreateDefaultTextChannels
	local var4 = nil
	local var5 = nil
	
	if fFlagExpChatFriendsRespectWindowEnabledModule then
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local createSignal = signalsModule.createSignal
		local var6 = if chatWindowConfiguration ~= nil then chatWindowConfiguration.Enabled else true
		createSignal, var13 = createSignal(var6)
		var4 = createSignal
		
		if chatWindowConfiguration then
			var5 = chatWindowConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: var6 (ref), chatWindowConfiguration (ref)
				var6(chatWindowConfiguration.Enabled)
			end)
		end
	end
	return {
		getIsFriendsTabVisible = signalsModule.createComputed(function(p1)
			-- upvalues: fFlagExpChatFriendsRespectWindowEnabledModule (copy), var4 (write), fFlagExpChatFriendsTabUsePolicy (copy), var1 (copy), fFlagFriendsChatHasFriendsGate (copy), fFlagExpChatCanShowFriendsTab (copy), getLocalUserIdModule (copy), var2 (copy), var3 (ref), fFlagExpChatFriendsTabRequireDefaultChannels (copy), createDefaultTextChannels (ref)
			if fFlagExpChatFriendsRespectWindowEnabledModule and not var4(p1) then
				return false
			end
			local var7 = not fFlagExpChatFriendsTabUsePolicy or var1(false).getAppPolicy(p1).getCanSeeFriendsTab()
			local var8 = true
			
			if fFlagFriendsChatHasFriendsGate and fFlagExpChatCanShowFriendsTab then
				var8 = false
				local var9 = getLocalUserIdModule()
				
				if var9 ~= nil then
					local friendsCountByUserId = var2.GetFriendsCountByUserId(tostring(var9))
					local var10 = if friendsCountByUserId then friendsCountByUserId.data(p1) else nil
					var8 = var10 ~= nil and var10 > 0
				end
			end
			return fFlagExpChatCanShowFriendsTab and (var7 and (var8 and (var3.getChatEnabled(p1) and (var3.getChatUserMessagesEnabled(p1) ~= false and (not fFlagExpChatFriendsTabRequireDefaultChannels or createDefaultTextChannels)))))
		end),
		dispose = function()
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
		end
	}
end