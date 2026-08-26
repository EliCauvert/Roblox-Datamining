local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local getFriendsChatMetadataStoreModule = require(appChat.Stores.GetFriendsChatMetadataStore)
local name = require(appChat.Logger):new(script.Name)

return function()
	-- upvalues: getFriendsChatMetadataStoreModule (ref), signalsModule (ref), sharedFlagsModule (ref), name (ref)
	local var1 = getFriendsChatMetadataStoreModule(false)
	local var2, var3 = signalsModule.createSignal(Enum.ChatRestrictionStatus.Unknown)
	local var4 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), var2 (ref)
		local var5 = var1.getCachedFriendsChatMetadata(p1).data(p1)
		local var6 = var2(p1)
		
		return var5 ~= nil and (var6 ~= Enum.ChatRestrictionStatus.Unknown and (var5.isChatEnabled and var6 == Enum.ChatRestrictionStatus.NotRestricted))
	end)
	local var5 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref)
		local var6 = var1.getCachedFriendsChatMetadata(p1).data(p1)
		
		return if var6 then var6.isChatUserMessagesEnabled else nil
	end)
	
	return {
		getThirdPartyChatRestrictionStatus = var2,
		getChatEnabled = var4,
		getGroupChatEnabled = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref)
			local var6 = var1.getCachedFriendsChatMetadata(p1).data(p1)
			
			return var6 ~= nil and (var6.isChatEnabled and var6.isGroupChatEnabledByPrivacySetting == "enabled")
		end),
		getChatUserMessagesEnabled = var5,
		setThirdPartyChatRestrictionStatus = var3,
		dispose = if sharedFlagsModule.FFlagDebugFriendsChat then signalsModule.createEffect(function(p1)
			-- upvalues: var1 (ref), name (copy), var4 (ref), var2 (ref), var5 (ref)
			local var6 = var1.getCachedFriendsChatMetadata(p1).data(p1)
			name:debug(`Friends Chat eligibility: chatEnabled={tostring(var4(p1))}` .. ` (accountChatEnabled={tostring(if var6 then var6.isChatEnabled else nil)},` .. ` privacySetting={tostring(if var6 then var6.isChatEnabledByPrivacySetting else nil)},` .. ` globalRules={tostring(if var6 then var6.isChatEnabledByGlobalRules else nil)},` .. ` thirdPartyStatus={tostring(var2(p1))});` .. ` chatUserMessagesEnabled={tostring(var5(p1))}`)
		end) else function() end
	}
end