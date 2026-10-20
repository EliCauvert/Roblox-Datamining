local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local GetFriendsChatMetadataStoreModule = require(AppChat.Stores.GetFriendsChatMetadataStore)
local NewResult = require(AppChat.Logger):new(script.Name)

return function()
	-- upvalues: GetFriendsChatMetadataStoreModule (copy), SignalsModule (copy), SharedFlagsModule (copy), NewResult (copy)
	local FriendsChatMetadataStoreModule = GetFriendsChatMetadataStoreModule(false)
	local Signal, Signal2 = SignalsModule.createSignal(Enum.ChatRestrictionStatus.Unknown)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: FriendsChatMetadataStoreModule (copy), Signal (copy)
		local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
		local SignalResult = Signal(p1)
		
		return DataResult ~= nil and (SignalResult ~= Enum.ChatRestrictionStatus.Unknown and (DataResult.isChatEnabled and SignalResult == Enum.ChatRestrictionStatus.NotRestricted))
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
			-- upvalues: FriendsChatMetadataStoreModule (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			
			return DataResult ~= nil and (DataResult.isChatEnabled and DataResult.isGroupChatEnabledByPrivacySetting == "enabled")
		end),
		getChatUserMessagesEnabled = Computed1,
		setThirdPartyChatRestrictionStatus = Signal2,
		dispose = if SharedFlagsModule.FFlagDebugFriendsChat then SignalsModule.createEffect(function(p1)
			-- upvalues: FriendsChatMetadataStoreModule (copy), NewResult (upval), Computed (copy), Signal (copy), Computed1 (copy)
			local DataResult = FriendsChatMetadataStoreModule.getCachedFriendsChatMetadata(p1).data(p1)
			NewResult:debug(`Friends Chat eligibility: chatEnabled={tostring(Computed(p1))}` .. ` (accountChatEnabled={tostring(if DataResult then DataResult.isChatEnabled else nil)},` .. ` privacySetting={tostring(if DataResult then DataResult.isChatEnabledByPrivacySetting else nil)},` .. ` globalRules={tostring(if DataResult then DataResult.isChatEnabledByGlobalRules else nil)},` .. ` thirdPartyStatus={tostring(Signal(p1))});` .. ` chatUserMessagesEnabled={tostring(Computed1(p1))}`)
		end) else function() end
	}
end