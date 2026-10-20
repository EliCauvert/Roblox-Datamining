local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local PromiseModule = require(Parent.Promise)
local NewResult = require(AppChat.Logger):new(script.Name)
local GetNewestWithNilPreviousMessageIdModule = require(AppChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)

return function(Callback, p1)
	-- upvalues: NewResult (copy), PromiseModule (copy), AppChatNetworkingModule (copy), RoduxNetworkingModule (copy), GetNewestWithNilPreviousMessageIdModule (copy)
	NewResult:info("Maybe getting older messages for {}", p1)
	
	return function(p2)
		-- upvalues: PromiseModule (upval), p1 (copy), AppChatNetworkingModule (upval), RoduxNetworkingModule (upval), NewResult (upval), GetNewestWithNilPreviousMessageIdModule (upval), Callback (copy)
		local ChatAppReducer = p2:getState().ChatAppReducer
		
		if not ChatAppReducer or not ChatAppReducer.Conversations then
			return PromiseModule.resolve()
		end
		local Conversation = ChatAppReducer.Conversations[p1]
		local IsStatusMatch = AppChatNetworkingModule.rodux.GetOlderMessages.getStatus(p2:getState(), p1) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching
		
		if not Conversation then
			NewResult:info("Canceling since conversation id {} is not in local state", p1)
			
			return PromiseModule.resolve()
		elseif IsStatusMatch then
			NewResult:info("Canceling since we are already fetching older messages for conversation id {}", p1)
			
			return PromiseModule.resolve()
		elseif Conversation.fetchedOldestMessage then
			NewResult:info("Canceling since we have already fetched the oldest message for conversation id {}", p1)
			
			return PromiseModule.resolve()
		else
			return Callback(p1, GetNewestWithNilPreviousMessageIdModule(Conversation.messages), Conversation.nextCursor)
		end
	end
end