local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local localizationModule = require(parent.Localization)
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizeStrings = localizationModule.localizeStrings
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local fetchMessagePageModule = require(parent.AppChat.fetchMessagePage)
local useMessagePool = require(parent.ChatUIPrimitives).useMessagePool
local fFlagFriendsChatOsaSystemMessage = sharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local useMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local friendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local friendsChatOsaSystemMessageModule = require(script.Parent.FriendsChatOsaSystemMessage)
local name = expChatSharedModule.Logger:new(script.Name)
local UIListLayout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

local function getOtherParticipantUserId(p1)
	-- upvalues: playersService (ref)
	if p1 == nil then
		return nil
	end
	local localPlayer = playersService.LocalPlayer
	local var1 = if localPlayer then tostring(localPlayer.UserId) else nil
	
	for i, v in p1 do
		if tostring(v) ~= var1 then
			return tostring(v)
		end
	end
	return nil
end

return function(p2)
	-- upvalues: reactModule (ref), getConversationMessageListStoreModule (ref), localizationRoactContext (ref), localizeStrings (ref), useMessageDisplayStoreModule (ref), friendsChatTextMessageModule (ref), useMessagePool (ref), signalsModule (ref), UIListLayout (ref), fFlagFriendsChatOsaSystemMessage (ref), getConversationStoreModule (ref), getOtherParticipantUserId (ref), friendsChatOsaSystemMessageModule (ref), fetchMessagePageModule (ref), name (ref)
	local conversationId = p2.conversationId
	local shouldReadMessages = p2.shouldReadMessages
	local shouldFetchMessages = p2.shouldFetchMessages
	local var2 = reactModule.useMemo(function()
		-- upvalues: shouldReadMessages (ref), getConversationMessageListStoreModule (copy), conversationId (ref)
		return if shouldReadMessages then function(p3)
			-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
			return getConversationMessageListStoreModule(p3).getOrderedIds(conversationId, p3)
		end else function()
			return {}
		end
	end, { conversationId, shouldReadMessages })
	local var3 = reactModule.useContext(localizationRoactContext)
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), localizeStrings (copy)
		if var3 == nil then
			return ""
		end
		local ok, status = pcall(function()
			-- upvalues: localizeStrings (copy), var3 (copy), p3 (ref)
			return localizeStrings(var3, { value = p3 }).value
		end)
		
		return if ok and typeof(status) == "string" then status else ""
	end, { var3 })
	local var5 = useMessageDisplayStoreModule(var2, conversationId)
	local var6 = useMessagePool({
		maxSlots = 50,
		messageIdsSignal = var5.getDisplayIds,
		createSlotElement = reactModule.useCallback(function(p3)
			-- upvalues: reactModule (copy), friendsChatTextMessageModule (copy), var5 (ref), p2 (ref), var4 (ref)
			return reactModule.createElement(friendsChatTextMessageModule, {
				getDisplayId = p3.getMessageId,
				getDisplayFromId = var5.getDisplayFromId,
				getMessageIdFromDisplayId = var5.getMessageIdFromDisplayId,
				getLayoutOrder = p3.getLayoutOrder,
				chatWindowSettings = p2.chatWindowSettings,
				textTransparency = p2.textTransparency,
				isSpatialUIEnabled = p2.isSpatialUIEnabled,
				localize = var4
			})
		end, {
			var5,
			p2.chatWindowSettings,
			p2.textTransparency,
			p2.isSpatialUIEnabled,
			var4
		})
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var6 (ref), UIListLayout (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (ref), getOtherParticipantUserId (copy), reactModule (copy), friendsChatOsaSystemMessageModule (copy), p2 (ref), var4 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var6 (copy), UIListLayout (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (copy), getOtherParticipantUserId (copy), reactModule (copy), friendsChatOsaSystemMessageModule (copy), p2 (copy), var4 (copy)
			local cloned = table.clone(var6(p3))
			cloned["$layout"] = UIListLayout
			local var8 = if fFlagFriendsChatOsaSystemMessage then getConversationStoreModule(p3).getConversation(conversationId, p3) else nil
			local var9 = if (var8 and (var8.type == "one_to_one" and (if var8.source ~= "friends" then if var8.osaAcknowledgementStatus ~= "acknowledged" then var8.osaAcknowledgementStatus == "unacknowledged" else true else true))) and var8 then getOtherParticipantUserId(var8.participants) else nil
			
			if var9 then
				cloned[`osa-system-message-{conversationId}`] = reactModule.createElement(friendsChatOsaSystemMessageModule, {
					conversationId = conversationId,
					userId = var9,
					chatWindowSettings = p2.chatWindowSettings,
					textTransparency = p2.textTransparency,
					isSpatialUIEnabled = p2.isSpatialUIEnabled,
					localize = var4
				})
			end
			return cloned
		end)
	end, {
		var6, conversationId, p2.chatWindowSettings, p2.textTransparency,
		p2.isSpatialUIEnabled, var4
	})
	reactModule.useEffect(function()
		-- upvalues: shouldFetchMessages (ref), fetchMessagePageModule (copy), conversationId (ref), name (copy)
		if shouldFetchMessages then
			local var8 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p3)
				-- upvalues: var8 (write), name (copy), conversationId (copy)
				if var8 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p3)}`)
			end)
			
			return function()
				-- upvalues: var8 (write)
				var8 = true
			end
		end
	end, { conversationId, shouldFetchMessages })
	
	return var7
end