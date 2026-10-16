local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local LocalizationModule = require(Parent.Localization)
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local LocalizeStringsFunction = LocalizationModule.localizeStrings
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local FetchMessagePageModule = require(Parent.AppChat.fetchMessagePage)
local UseMessagePoolFunction = require(Parent.ChatUIPrimitives).useMessagePool
local FFlagFriendsChatOsaSystemMessage = require(Parent.SharedFlags).FFlagFriendsChatOsaSystemMessage
local UseMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local FriendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local FriendsChatOsaSystemMessageModule = require(script.Parent.FriendsChatOsaSystemMessage)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local UIListLayout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

local function getOtherParticipantUserId(Participants): string? --[[ Line: 46 ]]
	-- upvalues: Players (copy)
	if Participants == nil then
		return nil
	end
	local LocalPlayer = Players.LocalPlayer
	local Text = if LocalPlayer then tostring(LocalPlayer.UserId) else nil
	for _, participant in Participants do
		if tostring(participant) ~= Text then
			return (tostring(participant))
		end
	end
	return nil
end

return function(p1) --[[ Line: 74 | Named "useConversationMessagePool" ]]
	-- upvalues: ReactModule (copy), GetConversationMessageListStoreModule (copy), LocalizationRoactContext (copy), LocalizeStringsFunction (copy), UseMessageDisplayStoreModule (copy), FriendsChatTextMessageModule (copy), UseMessagePoolFunction (copy), SignalsModule (copy), UIListLayout (copy), FFlagFriendsChatOsaSystemMessage (copy), GetConversationStoreModule (copy), getOtherParticipantUserId (copy), FriendsChatOsaSystemMessageModule (copy), FetchMessagePageModule (copy), NewResult (copy)
	local ConversationId = p1.conversationId
	local ShouldReadMessages = p1.shouldReadMessages
	local ShouldFetchMessages = p1.shouldFetchMessages
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseResult = ReactModule.useCallback(function(Value) --[[ Line: 97 ]]
		-- upvalues: UseContextResult (copy), LocalizeStringsFunction (upval)
		if UseContextResult == nil then
			return ""
		else
			local Success, Result = pcall(function() --[[ Line: 101 ]]
				-- upvalues: LocalizeStringsFunction (upval), UseContextResult (upval), Value (copy)
				return LocalizeStringsFunction(UseContextResult, { value = Value }).value
			end)
			
			return if Success and typeof(Result) == "string" then Result else ""
		end
	end, { UseContextResult })
	local UseMessageDisplayStoreModuleResult = UseMessageDisplayStoreModule(ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: ShouldReadMessages (copy), GetConversationMessageListStoreModule (upval), ConversationId (copy)
		return if ShouldReadMessages then function(p2) --[[ Line: 90 ]]
			-- upvalues: GetConversationMessageListStoreModule (upval), ConversationId (upval)
			return GetConversationMessageListStoreModule(p2).getOrderedIds(ConversationId, p2)
		end else function() --[[ Line: 86 ]]
			return {}
		end
	end, { ConversationId, ShouldReadMessages }), ConversationId)
	local UseMessagePoolResult = UseMessagePoolFunction({
		maxSlots = 50,
		messageIdsSignal = UseMessageDisplayStoreModuleResult.getDisplayIds,
		createSlotElement = ReactModule.useCallback(function(p2) --[[ Line: 116 ]]
			-- upvalues: ReactModule (upval), FriendsChatTextMessageModule (upval), UseMessageDisplayStoreModuleResult (copy), p1 (copy), UseResult (copy)
			return ReactModule.createElement(FriendsChatTextMessageModule, {
				getDisplayId = p2.getMessageId,
				getDisplayFromId = UseMessageDisplayStoreModuleResult.getDisplayFromId,
				getMessageIdFromDisplayId = UseMessageDisplayStoreModuleResult.getMessageIdFromDisplayId,
				getLayoutOrder = p2.getLayoutOrder,
				chatWindowSettings = p1.chatWindowSettings,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				localize = UseResult
			})
		end, {
			UseMessageDisplayStoreModuleResult,
			p1.chatWindowSettings,
			p1.textTransparency,
			p1.isSpatialUIEnabled,
			UseResult
		})
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 146 ]]
		-- upvalues: SignalsModule (upval), UseMessagePoolResult (copy), UIListLayout (upval), FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (copy), getOtherParticipantUserId (upval), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), p1 (copy), UseResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 147 ]]
			-- upvalues: UseMessagePoolResult (upval), UIListLayout (upval), FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (upval), getOtherParticipantUserId (upval), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), p1 (upval), UseResult (upval)
			local Copy = table.clone(UseMessagePoolResult(p2))
			Copy["$layout"] = UIListLayout
			local Conversation = if FFlagFriendsChatOsaSystemMessage then GetConversationStoreModule(p2).getConversation(ConversationId, p2) else nil
			local IsFriends: boolean = Conversation and (Conversation.type == "one_to_one" and (Conversation.source == "friends" or (Conversation.osaAcknowledgementStatus == "acknowledged" or Conversation.osaAcknowledgementStatus == "unacknowledged")))
			local OtherParticipantUserId = if IsFriends and Conversation then getOtherParticipantUserId(Conversation.participants) else nil
			
			if OtherParticipantUserId then
				Copy[`osa-system-message-{ConversationId}`] = ReactModule.createElement(FriendsChatOsaSystemMessageModule, {
					conversationId = ConversationId,
					userId = OtherParticipantUserId,
					chatWindowSettings = p1.chatWindowSettings,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					localize = UseResult
				})
			end
			return Copy
		end)
	end, {
		UseMessagePoolResult, ConversationId, p1.chatWindowSettings,
		p1.textTransparency, p1.isSpatialUIEnabled, UseResult
	})
	ReactModule.useEffect(function() --[[ Line: 188 ]]
		-- upvalues: ShouldFetchMessages (copy), FetchMessagePageModule (upval), ConversationId (copy), NewResult (upval)
		if not ShouldFetchMessages then return end
		local Flag = false
		FetchMessagePageModule(ConversationId, nil):catch(function(Err) --[[ Line: 203 ]]
			-- upvalues: Flag (ref), NewResult (upval), ConversationId (upval)
			if not Flag then
				NewResult:warning(`Failed to fetch conversation messages for {ConversationId}: {tostring(Err)}`)
				
				return
			end
		end)
		
		return function() --[[ Line: 210 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { ConversationId, ShouldFetchMessages })
	
	return UseMemoResult
end