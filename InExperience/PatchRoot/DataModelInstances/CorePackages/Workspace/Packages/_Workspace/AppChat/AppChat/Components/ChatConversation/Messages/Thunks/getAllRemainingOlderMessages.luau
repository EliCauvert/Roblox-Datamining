local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local promiseModule = require(parent.Promise)
local name = require(appChat.Logger):new(script.Name)
local getNewestWithNilPreviousMessageIdModule = require(appChat.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId)
local appChatMessageFetchRetryDelayMs = game:DefineFastInt("AppChatMessageFetchRetryDelayMs", 500)

local function fetchNextBatch(p0, p1, p2, p3, p4) --[[ line: 15 ]]
	-- upvalues: name (ref), promiseModule (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), appChatMessageFetchRetryDelayMs (ref), fetchNextBatch (ref), getNewestWithNilPreviousMessageIdModule (ref)
	if p3 <= p4 then
		name:info("Max depth reached ({}), stopping recursive message fetching", p4)
		
		return promiseModule.resolve()
	end
	local chatAppReducer = p0:getState().ChatAppReducer
	
	if not chatAppReducer or not chatAppReducer.Conversations then
		name:info("No conversations in state, stopping recursive message fetching")
		
		return promiseModule.resolve()
	end
	local var8 = chatAppReducer.Conversations[p2]
	
	if not var8 then
		name:info("Conversation not found, stopping recursive message fetching")
		
		return promiseModule.resolve()
	elseif var8.fetchedOldestMessage then
		name:info("Already fetched oldest message, stopping recursive message fetching")
		
		return promiseModule.resolve()
	elseif appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p0:getState(), p2) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then
		name:info("Messages are currently being fetched, waiting before trying again")
		
		return promiseModule.delay(appChatMessageFetchRetryDelayMs / 1000):andThen(function() --[[ line: 51 ]]
			-- upvalues: fetchNextBatch (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
			return fetchNextBatch(p0, p1, p2, p3, p4)
		end)
	end
	local var9 = getNewestWithNilPreviousMessageIdModule(var8.messages)
	name:info("Fetching batch {} of older messages for conversation {}", p4, p2)
	
	return p0:dispatch(p1(p2, var9, var8.nextCursor)):andThen(function() --[[ line: 61 ]]
		-- upvalues: name (copy), p4 (ref), fetchNextBatch (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref)
		name:info("Fetched batch {}, continuing to fetch next batch", p4)
		
		return fetchNextBatch(p0, p1, p2, p3, p4 + 1)
	end)
end

return function(p5, p6, p7) --[[ line: 67 ]]
	-- upvalues: name (ref), fetchNextBatch (ref), promiseModule (ref)
	name:info("Starting to fetch all remaining older messages for conversation {}", p6)
	
	return function(p8) --[[ line: 69 ]]
		-- upvalues: fetchNextBatch (copy), p5 (ref), p6 (ref), p7 (ref), name (copy), promiseModule (copy)
		return fetchNextBatch(p8, p5, p6, p7, 0):catch(function(p9) --[[ line: 70 ]]
			-- upvalues: name (copy), promiseModule (copy)
			name:warning("Error fetching all remaining older messages: {}", p9)
			
			return promiseModule.reject(p9)
		end)
	end
end