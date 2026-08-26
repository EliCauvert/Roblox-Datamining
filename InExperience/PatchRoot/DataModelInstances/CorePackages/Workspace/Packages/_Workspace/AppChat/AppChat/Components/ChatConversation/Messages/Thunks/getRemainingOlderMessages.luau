local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local promiseModule = require(parent.Promise)
local name = require(appChat.Logger):new(script.Name)
local getNewestWithNilPreviousMessageIdModule = require(appChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)

return function(p1, p2)
	-- upvalues: name (ref), promiseModule (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getNewestWithNilPreviousMessageIdModule (ref)
	name:info("Maybe getting older messages for {}", p2)
	
	return function(p3)
		-- upvalues: promiseModule (copy), p2 (ref), appChatNetworkingModule (copy), roduxNetworkingModule (copy), name (copy), getNewestWithNilPreviousMessageIdModule (copy), p1 (ref)
		local chatAppReducer = p3:getState().ChatAppReducer
		
		if not chatAppReducer or not chatAppReducer.Conversations then
			return promiseModule.resolve()
		end
		local var1 = chatAppReducer.Conversations[p2]
		local var2 = appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p3:getState(), p2) == roduxNetworkingModule.Enum.NetworkStatus.Fetching
		
		if not var1 then
			name:info("Canceling since conversation id {} is not in local state", p2)
			
			return promiseModule.resolve()
		elseif var2 then
			name:info("Canceling since we are already fetching older messages for conversation id {}", p2)
			
			return promiseModule.resolve()
		elseif var1.fetchedOldestMessage then
			name:info("Canceling since we have already fetched the oldest message for conversation id {}", p2)
			
			return promiseModule.resolve()
		end
		return p1(p2, getNewestWithNilPreviousMessageIdModule(var1.messages), var1.nextCursor)
	end
end