local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local ChatConversationTelemetryLayerModule = require(Parent.AppChat.ChatConversationTelemetryLayer)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

return function(p1)
	-- upvalues: ReactModule (copy), ExpChatConversationListAdapterModule (copy), ChatConversationTelemetryLayerModule (copy)
	local ConversationId = p1.conversationId
	
	return ReactModule.createElement(ChatConversationTelemetryLayerModule.Provider, {
		value = ReactModule.useCallback(function()
			-- upvalues: ConversationId (copy), ExpChatConversationListAdapterModule (upval)
			local ModerationType = nil
			local UserPendingStatus = nil
			
			if ConversationId ~= nil and ConversationId ~= "" then
				local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId, false)
				
				if Conversation ~= nil then
					ModerationType = Conversation.moderationType
					UserPendingStatus = Conversation.userPendingStatus
				end
			end
			return {
				conversationId = ConversationId,
				moderationType = ModerationType,
				userPendingStatus = UserPendingStatus
			}
		end, { ConversationId })
	}, p1.children)
end