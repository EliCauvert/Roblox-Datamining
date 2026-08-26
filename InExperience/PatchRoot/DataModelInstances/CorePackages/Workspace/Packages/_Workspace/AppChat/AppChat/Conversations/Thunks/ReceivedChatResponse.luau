local appChat = script:FindFirstAncestor("AppChat")
local receivedMessagesModule = require(appChat.Conversations.Actions.ReceivedMessages)
local messageModelModule = require(appChat.Models.MessageModel)
local reportAnalyticsForNewMessagesModule = require(appChat.Utils.reportAnalyticsForNewMessages)
local fFlagAppChatNilGuardReceivedChatResponseModule = require(appChat.Flags.FFlagAppChatNilGuardReceivedChatResponse)
local name = require(appChat.Logger):new(script.Name)

return function(p1, p2, p3)
	-- upvalues: messageModelModule (ref), reportAnalyticsForNewMessagesModule (ref), fFlagAppChatNilGuardReceivedChatResponseModule (ref), name (ref), receivedMessagesModule (ref)
	return function(p4)
		-- upvalues: messageModelModule (copy), p2 (ref), p1 (ref), p3 (ref), reportAnalyticsForNewMessagesModule (copy), fFlagAppChatNilGuardReceivedChatResponseModule (copy), name (copy), receivedMessagesModule (copy)
		local var1 = messageModelModule.fromSentChannelsApi(p2, p1, p3)
		
		if not var1 then return end
		reportAnalyticsForNewMessagesModule(var1, p1)
		local var2 = p4:getState().ChatAppReducer.Conversations[p1]
		
		if fFlagAppChatNilGuardReceivedChatResponseModule and not var2 then
			name:warning("Dropping ReceivedChatResponse because conversation {} is no longer in state", p1)
			
			return
		elseif var2.messages:Length() > 0 then
			var1.previousMessageId = var2.messages:Last().id
		end
		p4:dispatch(receivedMessagesModule(p1, { var1 }))
	end
end