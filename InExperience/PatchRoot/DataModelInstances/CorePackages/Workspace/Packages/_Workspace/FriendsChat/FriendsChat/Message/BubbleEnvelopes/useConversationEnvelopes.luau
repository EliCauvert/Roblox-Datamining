local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local FIntFriendsChatBubbleMaxMessagesModule = require(script.Parent.Parent.Parent.Flags.FIntFriendsChatBubbleMaxMessages)
local CreateGetIsGroupModule = require(script.Parent.Parent.MessageDisplayStore.createGetIsGroup)
local UseLocalizeModule = require(script.Parent.Parent.Parent.Utils.useLocalize)
local CreateConversationEnvelopesModule = require(script.Parent.createConversationEnvelopes)

return function(p1)
	-- upvalues: UseLocalizeModule (copy), ReactModule (copy), GetConversationMessageListStoreModule (copy), CreateConversationEnvelopesModule (copy), FIntFriendsChatBubbleMaxMessagesModule (copy), CreateGetIsGroupModule (copy)
	local ConversationId = p1.conversationId
	local ShouldReadMessages = p1.shouldReadMessages
	local UseLocalizeModuleResult = UseLocalizeModule()
	
	return ReactModule.useMemo(function()
		-- upvalues: ShouldReadMessages (copy), GetConversationMessageListStoreModule (upval), ConversationId (copy), CreateConversationEnvelopesModule (upval), UseLocalizeModuleResult (copy), FIntFriendsChatBubbleMaxMessagesModule (upval), CreateGetIsGroupModule (upval)
		return CreateConversationEnvelopesModule.create(function(p2)
			-- upvalues: ShouldReadMessages (upval), GetConversationMessageListStoreModule (upval), ConversationId (upval)
			return if ShouldReadMessages then GetConversationMessageListStoreModule(p2).getOrderedIds(ConversationId, p2) else {}
		end, {
			localize = UseLocalizeModuleResult,
			maxMessages = FIntFriendsChatBubbleMaxMessagesModule,
			getIsGroup = CreateGetIsGroupModule(ConversationId)
		})
	end, {
		ConversationId,
		ShouldReadMessages,
		UseLocalizeModuleResult
	})
end