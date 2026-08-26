local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local var1 = require(appChat.Logger):new("AppChat.paginateForNewerMessages")
local _ = require(appChat.Models.ConversationChannels)
local appChatNewMessageFetchMaxDepth = game:DefineFastInt("AppChatNewMessageFetchMaxDepth", 10)

local function _(p1, p2)
	return p1.messages:Get(p2) ~= nil
end

local function fetchOlderMessages(p1, p2, p3)
	-- upvalues: appChatNewMessageFetchMaxDepth (ref), var1 (ref), appChatNetworkingModule (ref), fetchOlderMessages (ref)
	return function(p4)
		-- upvalues: p3 (ref), appChatNewMessageFetchMaxDepth (copy), var1 (copy), p2 (ref), p1 (ref), appChatNetworkingModule (copy), fetchOlderMessages (copy)
		if appChatNewMessageFetchMaxDepth <= p3 then
			var1:warning("Reached max depth {} of fetching new messages", appChatNewMessageFetchMaxDepth)
			
			return
		end
		local responseBody = p2.responseBody
		
		if not responseBody then return end
		local messages = responseBody.messages
		local id = messages and (#messages <= 0 and (messages[#messages].id or nil))
		
		if id == nil then
			var1:warning("No messages in response")
			
			return
		end
		local nextCursor
		assert(id, "FFlagLuauTinyControlFlowAnalysis")
		
		if responseBody.next_cursor and responseBody.next_cursor ~= "" then
			nextCursor = responseBody.next_cursor or nil
		end
		if nextCursor == nil then
			var1:debug("No more messages to fetch")
			
			return
		elseif p1.messages:Get(id) ~= nil then
			var1:debug("Last message already in conversation, we've caught up")
			
			return
		end
		var1:trace("Fetching for the next page of messages using cursor: {}", nextCursor)
		
		return p4:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, nextCursor)):andThen(function(p5)
			-- upvalues: p4 (ref), fetchOlderMessages (copy), p1 (copy), p3 (copy)
			return p4:dispatch(fetchOlderMessages(p1, p5, p3 + 1))
		end):catch(function(p5)
			-- upvalues: var1 (copy)
			var1:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", p5)
		end)
	end
end

return function(p1)
	-- upvalues: var1 (ref), appChatNetworkingModule (ref), appChatNewMessageFetchMaxDepth (ref), fetchOlderMessages (ref)
	return function(p2)
		-- upvalues: var1 (copy), p1 (ref), appChatNetworkingModule (copy), appChatNewMessageFetchMaxDepth (copy), fetchOlderMessages (copy)
		var1:info("Starting to fetch newest messages for conversation: {}", p1.id)
		
		return p2:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, nil)):andThen(function(p3)
			-- upvalues: p2 (ref), p1 (copy), appChatNewMessageFetchMaxDepth (copy), var1 (copy), appChatNetworkingModule (copy), fetchOlderMessages (copy)
			local var2 = 0
			
			return p2:dispatch(function(p4)
				-- upvalues: var2 (ref), appChatNewMessageFetchMaxDepth (copy), var1 (copy), p3 (ref), p1 (ref), appChatNetworkingModule (copy), fetchOlderMessages (copy)
				if appChatNewMessageFetchMaxDepth <= var2 then
					var1:warning("Reached max depth {} of fetching new messages", appChatNewMessageFetchMaxDepth)
					
					return
				end
				local responseBody = p3.responseBody
				
				if not responseBody then return end
				local messages = responseBody.messages
				local id = messages and (#messages <= 0 and (messages[#messages].id or nil))
				
				if id == nil then
					var1:warning("No messages in response")
					
					return
				end
				local nextCursor
				assert(id, "FFlagLuauTinyControlFlowAnalysis")
				
				if responseBody.next_cursor and responseBody.next_cursor ~= "" then
					nextCursor = responseBody.next_cursor or nil
				end
				if nextCursor == nil then
					var1:debug("No more messages to fetch")
					
					return
				elseif p1.messages:Get(id) ~= nil then
					var1:debug("Last message already in conversation, we've caught up")
					
					return
				end
				var1:trace("Fetching for the next page of messages using cursor: {}", nextCursor)
				
				return p4:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, nextCursor)):andThen(function(p5)
					-- upvalues: p4 (ref), fetchOlderMessages (copy), p1 (copy), var2 (copy)
					return p4:dispatch(fetchOlderMessages(p1, p5, var2 + 1))
				end):catch(function(p5)
					-- upvalues: var1 (copy)
					var1:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", p5)
				end)
			end)
		end):catch(function(p3)
			-- upvalues: var1 (copy)
			var1:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", p3)
		end)
	end
end