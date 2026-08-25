local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local getFriendsChatMetadataStoreModule = require(appChat.Stores.GetFriendsChatMetadataStore)
local name = require(appChat.Logger):new(script.Name)

return function()
	-- upvalues: getFriendsChatMetadataStoreModule (ref), signalsModule (ref), sharedFlagsModule (ref), name (ref)
	local var5 = getFriendsChatMetadataStoreModule(false)
	local var6, var7 = signalsModule.createSignal(Enum.ChatRestrictionStatus.Unknown)
	local var8 = signalsModule.createComputed(function(p0)
		-- upvalues: var5 (ref), var6 (ref)
		local var10 = var5.getCachedFriendsChatMetadata(p0).data(p0)
		local var11 = var6(p0)
		
		return var10 ~= nil and (var11 ~= Enum.ChatRestrictionStatus.Unknown and (var10.isChatEnabled and var11 == Enum.ChatRestrictionStatus.NotRestricted))
	end)
	local var9 = signalsModule.createComputed(function(p1)
		-- upvalues: var5 (ref)
		local var12 = var5.getCachedFriendsChatMetadata(p1).data(p1)
		
		return if var12 then var12.isChatUserMessagesEnabled else nil
	end)
	
	return {
		getThirdPartyChatRestrictionStatus = var6,
		getChatEnabled = var8,
		getGroupChatEnabled = signalsModule.createComputed(function(p2)
			-- upvalues: var5 (ref)
			local var13 = var5.getCachedFriendsChatMetadata(p2).data(p2)
			
			return var13 ~= nil and (var13.isChatEnabled and var13.isGroupChatEnabledByPrivacySetting == "enabled")
		end),
		getChatUserMessagesEnabled = var9,
		setThirdPartyChatRestrictionStatus = var7,
		dispose = if sharedFlagsModule.FFlagDebugFriendsChat then signalsModule.createEffect(function(p3)
			-- upvalues: var5 (ref), name (copy), var8 (ref), var6 (ref), var9 (ref)
			local var14 = var5.getCachedFriendsChatMetadata(p3).data(p3)
			name:debug(`Friends Chat eligibility: chatEnabled={tostring(var8(p3))}` .. ` (accountChatEnabled={tostring(if var14 then var14.isChatEnabled else nil)},` .. ` privacySetting={tostring(if var14 then var14.isChatEnabledByPrivacySetting else nil)},` .. ` globalRules={tostring(if var14 then var14.isChatEnabledByGlobalRules else nil)},` .. ` thirdPartyStatus={tostring(var6(p3))});` .. ` chatUserMessagesEnabled={tostring(var9(p3))}`)
		end) else function() end
	}
end