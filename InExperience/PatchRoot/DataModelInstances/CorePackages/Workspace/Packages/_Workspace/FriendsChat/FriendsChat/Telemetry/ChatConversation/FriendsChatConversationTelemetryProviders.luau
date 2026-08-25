local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatConversationTelemetryLayerModule = require(parent.AppChat.ChatConversationTelemetryLayer)
local expChatConversationListAdapterModule = require(script.Parent.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

return function(p0)
	-- upvalues: reactModule (ref), expChatConversationListAdapterModule (ref), chatConversationTelemetryLayerModule (ref)
	local conversationId = p0.conversationId
	
	return reactModule.createElement(chatConversationTelemetryLayerModule.Provider, {
		value = reactModule.useCallback(function()
			-- upvalues: conversationId (ref), expChatConversationListAdapterModule (copy)
			local moderationType = nil
			local userPendingStatus = nil
			
			if conversationId ~= nil and conversationId ~= "" then
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
				
				if conversation ~= nil then
					moderationType = conversation.moderationType
					userPendingStatus = conversation.userPendingStatus
				end
			end
			return {
				conversationId = conversationId,
				moderationType = moderationType,
				userPendingStatus = userPendingStatus
			}
		end, { conversationId })
	}, p0.children)
end