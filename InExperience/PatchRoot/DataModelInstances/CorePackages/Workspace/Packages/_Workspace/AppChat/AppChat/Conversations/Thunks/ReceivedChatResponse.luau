local AppChat = script:FindFirstAncestor("AppChat")
local ReceivedMessagesModule = require(AppChat.Conversations.Actions.ReceivedMessages)
local MessageModelModule = require(AppChat.Models.MessageModel)
local ReportAnalyticsForNewMessagesModule = require(AppChat.Utils.reportAnalyticsForNewMessages)
local NewResult = require(AppChat.Logger):new(script.Name)

return function(p1, p2, p3)
	-- upvalues: MessageModelModule (copy), ReportAnalyticsForNewMessagesModule (copy), NewResult (copy), ReceivedMessagesModule (copy)
	return function(p4)
		-- upvalues: MessageModelModule (upval), p2 (copy), p1 (copy), p3 (copy), ReportAnalyticsForNewMessagesModule (upval), NewResult (upval), ReceivedMessagesModule (upval)
		local FromSentChannelsApiResult = MessageModelModule.fromSentChannelsApi(p2, p1, p3)
		
		if not FromSentChannelsApiResult then return end
		ReportAnalyticsForNewMessagesModule(FromSentChannelsApiResult, p1)
		local Conversation = p4:getState().ChatAppReducer.Conversations[p1]
		
		if not Conversation then
			NewResult:warning("Dropping ReceivedChatResponse because conversation {} is no longer in state", p1)
			
			return
		end
		if Conversation.messages:Length() > 0 then
			FromSentChannelsApiResult.previousMessageId = Conversation.messages:Last().id
		end
		p4:dispatch(ReceivedMessagesModule(p1, { FromSentChannelsApiResult }))
	end
end