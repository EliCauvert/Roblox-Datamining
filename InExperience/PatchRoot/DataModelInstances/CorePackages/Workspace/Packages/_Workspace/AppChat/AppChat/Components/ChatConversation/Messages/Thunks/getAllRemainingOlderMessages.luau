local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local promiseModule = require(parent.Promise)
local name = require(appChat.Logger):new(script.Name)
local getNewestWithNilPreviousMessageIdModule = require(appChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)
local appChatMessageFetchRetryDelayMs = game:DefineFastInt("AppChatMessageFetchRetryDelayMs", 500)

local function fetchNextBatch(p1, p2, p3, p4, p5)
	-- upvalues: name (ref), promiseModule (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), appChatMessageFetchRetryDelayMs (ref), fetchNextBatch (ref), getNewestWithNilPreviousMessageIdModule (ref)
	if p4 <= p5 then
		name:info("Max depth reached ({}), stopping recursive message fetching", p5)
		
		return promiseModule.resolve()
	end
	local chatAppReducer = p1:getState().ChatAppReducer
	
	if not chatAppReducer or not chatAppReducer.Conversations then
		name:info("No conversations in state, stopping recursive message fetching")
		
		return promiseModule.resolve()
	end
	local var1 = chatAppReducer.Conversations[p3]
	
	if not var1 then
		name:info("Conversation not found, stopping recursive message fetching")
		
		return promiseModule.resolve()
	elseif var1.fetchedOldestMessage then
		name:info("Already fetched oldest message, stopping recursive message fetching")
		
		return promiseModule.resolve()
	elseif appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p1:getState(), p3) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then
		name:info("Messages are currently being fetched, waiting before trying again")
		
		return promiseModule.delay(appChatMessageFetchRetryDelayMs / 1000):andThen(function()
			-- upvalues: fetchNextBatch (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
			return fetchNextBatch(p1, p2, p3, p4, p5)
		end)
	end
	local var2 = getNewestWithNilPreviousMessageIdModule(var1.messages)
	name:info("Fetching batch {} of older messages for conversation {}", p5, p3)
	
	return p1:dispatch(p2(p3, var2, var1.nextCursor)):andThen(function()
		-- upvalues: name (copy), p5 (ref), fetchNextBatch (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		name:info("Fetched batch {}, continuing to fetch next batch", p5)
		
		return fetchNextBatch(p1, p2, p3, p4, p5 + 1)
	end)
end

return function(p1, p2, p3)
	-- upvalues: name (ref), fetchNextBatch (ref), promiseModule (ref)
	name:info("Starting to fetch all remaining older messages for conversation {}", p2)
	
	return function(p4)
		-- upvalues: fetchNextBatch (copy), p1 (ref), p2 (ref), p3 (ref), name (copy), promiseModule (copy)
		return fetchNextBatch(p4, p1, p2, p3, 0):catch(function(p5)
			-- upvalues: name (copy), promiseModule (copy)
			name:warning("Error fetching all remaining older messages: {}", p5)
			
			return promiseModule.reject(p5)
		end)
	end
end