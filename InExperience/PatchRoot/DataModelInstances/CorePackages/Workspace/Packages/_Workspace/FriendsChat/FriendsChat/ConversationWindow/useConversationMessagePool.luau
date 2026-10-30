local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local UseMessagePoolFunction = require(Parent.ChatUIPrimitives).useMessagePool
local FFlagFriendsChatOsaSystemMessage = require(Parent.SharedFlags).FFlagFriendsChatOsaSystemMessage
local UseMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local FriendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local FriendsChatOsaSystemMessageModule = require(script.Parent.FriendsChatOsaSystemMessage)
local GetOsaParticipantUserIdModule = require(script.Parent.getOsaParticipantUserId)
local UseLocalizeModule = require(script.Parent.Parent.Utils.useLocalize)
local UIListLayout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

return function(p1)
	-- upvalues: ReactModule (copy), GetConversationMessageListStoreModule (copy), UseLocalizeModule (copy), UseMessageDisplayStoreModule (copy), FriendsChatTextMessageModule (copy), UseMessagePoolFunction (copy), SignalsModule (copy), UIListLayout (copy), FFlagFriendsChatOsaSystemMessage (copy), GetConversationStoreModule (copy), GetOsaParticipantUserIdModule (copy), FriendsChatOsaSystemMessageModule (copy)
	local ConversationId = p1.conversationId
	local ShouldReadMessages = p1.shouldReadMessages
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ShouldReadMessages (copy), GetConversationMessageListStoreModule (upval), ConversationId (copy)
		return if ShouldReadMessages then function(p2)
			-- upvalues: GetConversationMessageListStoreModule (upval), ConversationId (upval)
			return GetConversationMessageListStoreModule(p2).getOrderedIds(ConversationId, p2)
		end else function()
			return {}
		end
	end, { ConversationId, ShouldReadMessages })
	local UseLocalizeModuleResult = UseLocalizeModule()
	local UseMessageDisplayStoreModuleResult = UseMessageDisplayStoreModule(UseMemoResult, ConversationId)
	local UseMessagePoolResult = UseMessagePoolFunction({
		maxSlots = 50,
		messageIdsSignal = UseMessageDisplayStoreModuleResult.getDisplayIds,
		createSlotElement = ReactModule.useCallback(function(p2)
			-- upvalues: ReactModule (upval), FriendsChatTextMessageModule (upval), UseMessageDisplayStoreModuleResult (copy), p1 (copy), UseLocalizeModuleResult (copy)
			return ReactModule.createElement(FriendsChatTextMessageModule, {
				getDisplayId = p2.getMessageId,
				getDisplayFromId = UseMessageDisplayStoreModuleResult.getDisplayFromId,
				getMessageIdFromDisplayId = UseMessageDisplayStoreModuleResult.getMessageIdFromDisplayId,
				getLayoutOrder = p2.getLayoutOrder,
				chatWindowSettings = p1.chatWindowSettings,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				localize = UseLocalizeModuleResult
			})
		end, {
			UseMessageDisplayStoreModuleResult,
			p1.chatWindowSettings,
			p1.textTransparency,
			p1.isSpatialUIEnabled,
			UseLocalizeModuleResult
		})
	})
	
	return (ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMessagePoolResult (copy), UIListLayout (upval), FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (copy), GetOsaParticipantUserIdModule (upval), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), p1 (copy), UseLocalizeModuleResult (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMessagePoolResult (upval), UIListLayout (upval), FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (upval), GetOsaParticipantUserIdModule (upval), ReactModule (upval), FriendsChatOsaSystemMessageModule (upval), p1 (upval), UseLocalizeModuleResult (upval)
			local Copy = table.clone(UseMessagePoolResult(p2))
			Copy["$layout"] = UIListLayout
			local OsaParticipantUserIdModule = GetOsaParticipantUserIdModule(if FFlagFriendsChatOsaSystemMessage then GetConversationStoreModule(p2).getConversation(ConversationId, p2) else nil)
			
			if OsaParticipantUserIdModule then
				Copy[`osa-system-message-{ConversationId}`] = ReactModule.createElement(FriendsChatOsaSystemMessageModule, {
					conversationId = ConversationId,
					userId = OsaParticipantUserIdModule,
					chatWindowSettings = p1.chatWindowSettings,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					localize = UseLocalizeModuleResult
				})
			end
			return Copy
		end)
	end, {
		UseMessagePoolResult, ConversationId, p1.chatWindowSettings,
		p1.textTransparency, p1.isSpatialUIEnabled, UseLocalizeModuleResult
	}))
end