local appChat = script:FindFirstAncestor("AppChat")
local receivedMessagesModule = require(appChat.Conversations.Actions.ReceivedMessages)
local messageModelModule = require(appChat.Models.MessageModel)
local reportAnalyticsForNewMessagesModule = require(appChat.Utils.reportAnalyticsForNewMessages)
local fFlagAppChatNilGuardReceivedChatResponseModule = require(appChat.Flags.FFlagAppChatNilGuardReceivedChatResponse)
local name = require(appChat.Logger):new(script.Name)

return function(p0, p1, p2) --[[ line: 10 ]]
	-- upvalues: messageModelModule (ref), reportAnalyticsForNewMessagesModule (ref), fFlagAppChatNilGuardReceivedChatResponseModule (ref), name (ref), receivedMessagesModule (ref)
	return function(p3) --[[ line: 11 ]]
		-- upvalues: messageModelModule (copy), p1 (ref), p0 (ref), p2 (ref), reportAnalyticsForNewMessagesModule (copy), fFlagAppChatNilGuardReceivedChatResponseModule (copy), name (copy), receivedMessagesModule (copy)
		local var6 = messageModelModule.fromSentChannelsApi(p1, p0, p2)
		
		if not var6 then return end
		reportAnalyticsForNewMessagesModule(var6, p0)
		local var7 = p3:getState().ChatAppReducer.Conversations[p0]
		
		if fFlagAppChatNilGuardReceivedChatResponseModule and not var7 then
			name:warning("Dropping ReceivedChatResponse because conversation {} is no longer in state", p0)
			
			return
		elseif var7.messages:Length() > 0 then
			var6.previousMessageId = var7.messages:Last().id
		end
		p3:dispatch(receivedMessagesModule(p0, { var6 }))
	end
end