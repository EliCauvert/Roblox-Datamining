local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local GetFriendsChatMetadataStoreModule = require(AppChat.Stores.GetFriendsChatMetadataStore)
local FFlagAppChatUseSignalsForChatSettingsModule = require(AppChat.Flags.FFlagAppChatUseSignalsForChatSettings)
local NewResult = require(AppChat.Logger):new(script.Name)

return function()
	-- upvalues: GetFriendsChatMetadataStoreModule (copy), SignalsModule (copy), FFlagAppChatUseSignalsForChatSettingsModule (copy), RetrievalStatus (copy), SharedFlagsModule (copy), NewResult (copy)
	local FriendsChatMetadataStoreModule = GetFriendsChatMetadataStoreModule(false)
	local Signal, Signal2 = SignalsModule.createSignal(Enum.ChatRestrictionStatus.Unknown)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: FriendsChatMetadataStoreModule (copy), Signal (copy), FFlagAppChatUseSignalsForChatSettingsModule (upval), Signal1 (copy)
		local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
		local SignalResult = Signal(p1)
		
		if FFlagAppChatUseSignalsForChatSettingsModule and SignalResult == Enum.ChatRestrictionStatus.Unknown then
			SignalResult = Signal1(p1) or SignalResult
		end
		return DataResult ~= nil and (SignalResult ~= Enum.ChatRestrictionStatus.Unknown and (DataResult.isChatEnabled == true and SignalResult == Enum.ChatRestrictionStatus.NotRestricted))
	end)
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: FriendsChatMetadataStoreModule (copy)
		local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
		
		return if DataResult then DataResult.isChatUserMessagesEnabled else nil
	end)
	
	return {
		getThirdPartyChatRestrictionStatus = Signal,
		getChatEnabled = Computed,
		getGroupChatEnabled = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: FriendsChatMetadataStoreModule (copy), Signal3 (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			
			return (DataResult ~= nil and (DataResult.isChatEnabled == true and DataResult.isGroupChatEnabledByPrivacySetting == "enabled")) ~= Signal3(p1)
		end),
		getChatUserMessagesEnabled = Computed1,
		getRetrievalStatus = SignalsModule.createComputed(function(p1)
			-- upvalues: FriendsChatMetadataStoreModule (copy), Signal1 (copy), RetrievalStatus (upval)
			return if FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1) == nil or Signal1(p1) == nil then RetrievalStatus.NotStarted else RetrievalStatus.Done
		end),
		getPrivacySettingsEnabled = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: FriendsChatMetadataStoreModule (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			
			return DataResult ~= nil and DataResult.isChatEnabledByPrivacySetting == "enabled"
		end),
		getGlobalRulesEnabled = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: FriendsChatMetadataStoreModule (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			
			return DataResult ~= nil and DataResult.isChatEnabledByGlobalRules == "enabled"
		end),
		getThirdPartyPrivacySettingsEnabled = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(p1) == Enum.ChatRestrictionStatus.NotRestricted
		end),
		setThirdPartyChatRestrictionStatus = function(ChatRestrictionStatus)
			-- upvalues: Signal2 (copy), Signal2_1 (copy), FriendsChatMetadataStoreModule (copy)
			Signal2(ChatRestrictionStatus)
			
			if ChatRestrictionStatus ~= Enum.ChatRestrictionStatus.Unknown then
				Signal2_1(ChatRestrictionStatus)
				
				return
			end
			if FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(false).data(false) == nil then
				Signal2_1(nil)
			end
		end,
		toggleDebugGroupChatEnabled = function()
			-- upvalues: Signal2_2 (copy), Signal3 (copy)
			Signal2_2(not Signal3(false))
		end,
		clearDebugGroupChatToggle = function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(false)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			Signal2(Enum.ChatRestrictionStatus.Unknown)
			Signal2_1(nil)
			Signal2_2(false)
		end,
		dispose = if SharedFlagsModule.FFlagDebugFriendsChat then SignalsModule.createEffect(function(p1)
			-- upvalues: FriendsChatMetadataStoreModule (copy), NewResult (upval), Computed (copy), Signal (copy), Computed1 (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			NewResult:debug(`Friends Chat eligibility: chatEnabled={tostring(Computed(p1))}` .. ` (accountChatEnabled={tostring(if DataResult then DataResult.isChatEnabled else nil)},` .. ` privacySetting={tostring(if DataResult then DataResult.isChatEnabledByPrivacySetting else nil)},` .. ` globalRules={tostring(if DataResult then DataResult.isChatEnabledByGlobalRules else nil)},` .. ` thirdPartyStatus={tostring(Signal(p1))});` .. ` chatUserMessagesEnabled={tostring(Computed1(p1))}`)
		end) else function() end
	}
end