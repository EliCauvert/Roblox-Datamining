local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local promiseModule = require(parent.Promise)
local name = require(appChat.Logger):new(script.Name)
local getNewestWithNilPreviousMessageIdModule = require(appChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: name (ref), promiseModule (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getNewestWithNilPreviousMessageIdModule (ref)
	name:info("Maybe getting older messages for {}", p1)
	
	return function(p2) --[[ line: 13 ]]
		-- upvalues: promiseModule (copy), p1 (ref), appChatNetworkingModule (copy), roduxNetworkingModule (copy), name (copy), getNewestWithNilPreviousMessageIdModule (copy), p0 (ref)
		local chatAppReducer = p2:getState().ChatAppReducer
		
		if not chatAppReducer or not chatAppReducer.Conversations then
			return promiseModule.resolve()
		end
		local var6 = chatAppReducer.Conversations[p1]
		local var7 = appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p2:getState(), p1) == roduxNetworkingModule.Enum.NetworkStatus.Fetching
		
		if not var6 then
			name:info("Canceling since conversation id {} is not in local state", p1)
			
			return promiseModule.resolve()
		elseif var7 then
			name:info("Canceling since we are already fetching older messages for conversation id {}", p1)
			
			return promiseModule.resolve()
		elseif var6.fetchedOldestMessage then
			name:info("Canceling since we have already fetched the oldest message for conversation id {}", p1)
			
			return promiseModule.resolve()
		end
		return p0(p1, getNewestWithNilPreviousMessageIdModule(var6.messages), var6.nextCursor)
	end
end