local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local PromiseModule = require(Parent.Promise)
local NewResult = require(AppChat.Logger):new(script.Name)
local GetNewestWithNilPreviousMessageIdModule = require(AppChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)
local AppChatMessageFetchRetryDelayMs = game:DefineFastInt("AppChatMessageFetchRetryDelayMs", 500)

local function fetchNextBatch(p1, Callback, p2, p3, p4) --[[ Line: 15 ]]
	-- upvalues: NewResult (copy), PromiseModule (copy), AppChatNetworkingModule (copy), RoduxNetworkingModule (copy), AppChatMessageFetchRetryDelayMs (copy), fetchNextBatch (copy), GetNewestWithNilPreviousMessageIdModule (copy)
	if p3 <= p4 then
		NewResult:info("Max depth reached ({}), stopping recursive message fetching", p4)
		
		return PromiseModule.resolve()
	end
	local ChatAppReducer = p1:getState().ChatAppReducer
	
	if not ChatAppReducer or not ChatAppReducer.Conversations then
		NewResult:info("No conversations in state, stopping recursive message fetching")
		
		return PromiseModule.resolve()
	end
	local Conversation = ChatAppReducer.Conversations[p2]
	
	if not Conversation then
		NewResult:info("Conversation not found, stopping recursive message fetching")
		
		return PromiseModule.resolve()
	elseif Conversation.fetchedOldestMessage then
		NewResult:info("Already fetched oldest message, stopping recursive message fetching")
		
		return PromiseModule.resolve()
	elseif AppChatNetworkingModule.rodux.GetOlderMessages.getStatus(p1:getState(), p2) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching then
		NewResult:info("Messages are currently being fetched, waiting before trying again")
		
		return PromiseModule.delay(AppChatMessageFetchRetryDelayMs / 1000):andThen(function() --[[ Line: 51 ]]
			-- upvalues: fetchNextBatch (upval), p1 (copy), Callback (copy), p2 (copy), p3 (copy), p4 (copy)
			return fetchNextBatch(p1, Callback, p2, p3, p4)
		end)
	else
		local NewestWithNilPreviousMessageIdModule = GetNewestWithNilPreviousMessageIdModule(Conversation.messages)
		NewResult:info("Fetching batch {} of older messages for conversation {}", p4, p2)
		
		return p1:dispatch(Callback(p2, NewestWithNilPreviousMessageIdModule, Conversation.nextCursor)):andThen(function() --[[ Line: 61 ]]
			-- upvalues: NewResult (upval), p4 (copy), fetchNextBatch (upval), p1 (copy), Callback (copy), p2 (copy), p3 (copy)
			NewResult:info("Fetched batch {}, continuing to fetch next batch", p4)
			
			return fetchNextBatch(p1, Callback, p2, p3, p4 + 1)
		end)
	end
end

return function(p1, p2, p3) --[[ Line: 67 ]]
	-- upvalues: NewResult (copy), fetchNextBatch (copy), PromiseModule (copy)
	NewResult:info("Starting to fetch all remaining older messages for conversation {}", p2)
	
	return function(p4) --[[ Line: 69 ]]
		-- upvalues: fetchNextBatch (upval), p1 (copy), p2 (copy), p3 (copy), NewResult (upval), PromiseModule (upval)
		return fetchNextBatch(p4, p1, p2, p3, 0):catch(function(Err) --[[ Line: 70 ]]
			-- upvalues: NewResult (upval), PromiseModule (upval)
			NewResult:warning("Error fetching all remaining older messages: {}", Err)
			
			return PromiseModule.reject(Err)
		end)
	end
end