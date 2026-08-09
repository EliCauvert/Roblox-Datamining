local appChat = script:FindFirstAncestor("AppChat")
local receivedMessagesModule = require(appChat.Conversations.Actions.ReceivedMessages)
local messageModelModule = require(appChat.Models.MessageModel)
local reportAnalyticsForNewMessagesModule = require(appChat.Utils.reportAnalyticsForNewMessages)

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: messageModelModule (ref), reportAnalyticsForNewMessagesModule (ref), receivedMessagesModule (ref)
	return function(p3) --[[ line: 9 ]]
		-- upvalues: messageModelModule (copy), p1 (ref), p0 (ref), p2 (ref), reportAnalyticsForNewMessagesModule (copy), receivedMessagesModule (copy)
		local var4 = messageModelModule.fromSentChannelsApi(p1, p0, p2)
		
		if not var4 then return end
		reportAnalyticsForNewMessagesModule(var4, p0)
		local var5 = p3:getState().ChatAppReducer.Conversations[p0]
		
		if var5.messages:Length() > 0 then
			var4.previousMessageId = var5.messages:Last().id
		end
		p3:dispatch(receivedMessagesModule(p0, { var4 }))
	end
end