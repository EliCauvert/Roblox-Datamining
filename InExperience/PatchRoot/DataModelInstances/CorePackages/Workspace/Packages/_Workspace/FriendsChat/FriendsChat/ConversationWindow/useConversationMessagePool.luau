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

local function getOtherParticipantUserId(p0) --[[ line: 46 ]]
	-- upvalues: playersService (ref)
	if p0 == nil then
		return nil
	end
	local localPlayer = playersService.LocalPlayer
	local var15 = if localPlayer then tostring(localPlayer.UserId) else nil
	
	for i, v in p0 do
		if tostring(v) ~= var15 then
			return tostring(v)
		end
	end
	return nil
end

return function(p1) --[[ line: 74 | named "useConversationMessagePool" ]]
	-- upvalues: reactModule (ref), getConversationMessageListStoreModule (ref), localizationRoactContext (ref), localizeStrings (ref), useMessageDisplayStoreModule (ref), friendsChatTextMessageModule (ref), useMessagePool (ref), signalsModule (ref), UIListLayout (ref), fFlagFriendsChatOsaSystemMessage (ref), getConversationStoreModule (ref), getOtherParticipantUserId (ref), friendsChatOsaSystemMessageModule (ref), fetchMessagePageModule (ref), name (ref)
	local conversationId = p1.conversationId
	local shouldReadMessages = p1.shouldReadMessages
	local shouldFetchMessages = p1.shouldFetchMessages
	local var16 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: shouldReadMessages (ref), getConversationMessageListStoreModule (copy), conversationId (ref)
		return if shouldReadMessages then function(p2) --[[ line: 90 ]]
			-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
			return getConversationMessageListStoreModule(p2).getOrderedIds(conversationId, p2)
		end else function() --[[ line: 86 ]]
			return {}
		end
	end, { conversationId, shouldReadMessages })
	local var17 = reactModule.useContext(localizationRoactContext)
	local var18 = reactModule.useCallback(function(p3) --[[ line: 97 ]]
		-- upvalues: var17 (ref), localizeStrings (copy)
		if var17 == nil then
			return ""
		end
		local ok, status = pcall(function() --[[ line: 101 ]]
			-- upvalues: localizeStrings (copy), var17 (copy), p3 (ref)
			return localizeStrings(var17, { value = p3 }).value
		end)
		
		return if ok and typeof(status) == "string" then status else ""
	end, { var17 })
	local var19 = useMessageDisplayStoreModule(var16, conversationId)
	local var20 = useMessagePool({
		maxSlots = 50,
		messageIdsSignal = var19.getDisplayIds,
		createSlotElement = reactModule.useCallback(function(p4) --[[ line: 116 ]]
			-- upvalues: reactModule (copy), friendsChatTextMessageModule (copy), var19 (ref), p1 (ref), var18 (ref)
			return reactModule.createElement(friendsChatTextMessageModule, {
				getDisplayId = p4.getMessageId,
				getDisplayFromId = var19.getDisplayFromId,
				getLayoutOrder = p4.getLayoutOrder,
				chatWindowSettings = p1.chatWindowSettings,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				localize = var18
			})
		end, {
			var19,
			p1.chatWindowSettings,
			p1.textTransparency,
			p1.isSpatialUIEnabled,
			var18
		})
	})
	local var21 = reactModule.useMemo(function() --[[ line: 145 ]]
		-- upvalues: signalsModule (copy), var20 (ref), UIListLayout (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (ref), getOtherParticipantUserId (copy), reactModule (copy), friendsChatOsaSystemMessageModule (copy), p1 (ref), var18 (ref)
		return signalsModule.createComputed(function(p5) --[[ line: 146 ]]
			-- upvalues: var20 (copy), UIListLayout (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (copy), getOtherParticipantUserId (copy), reactModule (copy), friendsChatOsaSystemMessageModule (copy), p1 (copy), var18 (copy)
			local cloned = table.clone(var20(p5))
			cloned["$layout"] = UIListLayout
			local var23 = if fFlagFriendsChatOsaSystemMessage then getConversationStoreModule(p5).getConversation(conversationId, p5) else nil
			local var24 = if (var23 and (var23.type == "one_to_one" and (if var23.source ~= "friends" then if var23.osaAcknowledgementStatus ~= "acknowledged" then var23.osaAcknowledgementStatus == "unacknowledged" else true else true))) and var23 then getOtherParticipantUserId(var23.participants) else nil
			
			if var24 then
				cloned[`osa-system-message-{conversationId}`] = reactModule.createElement(friendsChatOsaSystemMessageModule, {
					conversationId = conversationId,
					userId = var24,
					chatWindowSettings = p1.chatWindowSettings,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					localize = var18
				})
			end
			return cloned
		end)
	end, {
		var20, conversationId, p1.chatWindowSettings, p1.textTransparency,
		p1.isSpatialUIEnabled, var18
	})
	reactModule.useEffect(function() --[[ line: 187 ]]
		-- upvalues: shouldFetchMessages (ref), fetchMessagePageModule (copy), conversationId (ref), name (copy)
		if shouldFetchMessages then
			local var25 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p6) --[[ line: 202 ]]
				-- upvalues: var25 (write), name (copy), conversationId (copy)
				if var25 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p6)}`)
			end)
			
			return function() --[[ line: 209 ]]
				-- upvalues: var25 (write)
				var25 = true
			end
		end
	end, { conversationId, shouldFetchMessages })
	
	return var21
end