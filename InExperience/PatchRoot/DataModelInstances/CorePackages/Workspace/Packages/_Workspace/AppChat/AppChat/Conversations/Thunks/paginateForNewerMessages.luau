local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local var2 = require(appChat.Logger):new("AppChat.paginateForNewerMessages")
local _ = require(appChat.Models.ConversationChannels)
local appChatNewMessageFetchMaxDepth = game:DefineFastInt("AppChatNewMessageFetchMaxDepth", 10)

local function _(p0, p1) --[[ line: 18 | named "isMessageAlreadyInConversation" ]]
	return p0.messages:Get(p1) ~= nil
end

local function fetchOlderMessages(p2, p3, p4) --[[ line: 23 ]]
	-- upvalues: appChatNewMessageFetchMaxDepth (ref), var2 (ref), appChatNetworkingModule (ref), fetchOlderMessages (ref)
	return function(p5) --[[ line: 30 ]]
		-- upvalues: p4 (ref), appChatNewMessageFetchMaxDepth (copy), var2 (copy), p3 (ref), p2 (ref), appChatNetworkingModule (copy), fetchOlderMessages (copy)
		if appChatNewMessageFetchMaxDepth <= p4 then
			var2:warning("Reached max depth {} of fetching new messages", appChatNewMessageFetchMaxDepth)
			
			return
		end
		local responseBody = p3.responseBody
		
		if not responseBody then return end
		local messages = responseBody.messages
		local id = messages and (#messages <= 0 and (messages[#messages].id or nil))
		
		if id == nil then
			var2:warning("No messages in response")
			
			return
		end
		local nextCursor
		assert(id, "FFlagLuauTinyControlFlowAnalysis")
		
		if responseBody.next_cursor and responseBody.next_cursor ~= "" then
			nextCursor = responseBody.next_cursor or nil
		end
		if nextCursor == nil then
			var2:debug("No more messages to fetch")
			
			return
		elseif p2.messages:Get(id) ~= nil then
			var2:debug("Last message already in conversation, we've caught up")
			
			return
		end
		var2:trace("Fetching for the next page of messages using cursor: {}", nextCursor)
		
		return p5:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p2.id, nextCursor)):andThen(function(p7) --[[ line: 66 ]]
			-- upvalues: p5 (ref), fetchOlderMessages (copy), p2 (copy), p4 (copy)
			return p5:dispatch(fetchOlderMessages(p2, p7, p4 + 1))
		end):catch(function(p6) --[[ line: 69 ]]
			-- upvalues: var2 (copy)
			var2:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", p6)
		end)
	end
end

return function(p8) --[[ line: 75 ]]
	-- upvalues: var2 (ref), appChatNetworkingModule (ref), appChatNewMessageFetchMaxDepth (ref), fetchOlderMessages (ref)
	return function(p9) --[[ line: 76 ]]
		-- upvalues: var2 (copy), p8 (ref), appChatNetworkingModule (copy), appChatNewMessageFetchMaxDepth (copy), fetchOlderMessages (copy)
		var2:info("Starting to fetch newest messages for conversation: {}", p8.id)
		
		return p9:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p8.id, nil)):andThen(function(p11) --[[ line: 82 ]]
			-- upvalues: p9 (ref), p8 (copy), appChatNewMessageFetchMaxDepth (copy), var2 (copy), appChatNetworkingModule (copy), fetchOlderMessages (copy)
			local var7 = 0
			
			return p9:dispatch(function(p12) --[[ line: 30 ]]
				-- upvalues: var7 (ref), appChatNewMessageFetchMaxDepth (copy), var2 (copy), p11 (ref), p8 (ref), appChatNetworkingModule (copy), fetchOlderMessages (copy)
				if appChatNewMessageFetchMaxDepth <= var7 then
					var2:warning("Reached max depth {} of fetching new messages", appChatNewMessageFetchMaxDepth)
					
					return
				end
				local responseBody = p11.responseBody
				
				if not responseBody then return end
				local messages = responseBody.messages
				local id = messages and (#messages <= 0 and (messages[#messages].id or nil))
				
				if id == nil then
					var2:warning("No messages in response")
					
					return
				end
				local nextCursor
				assert(id, "FFlagLuauTinyControlFlowAnalysis")
				
				if responseBody.next_cursor and responseBody.next_cursor ~= "" then
					nextCursor = responseBody.next_cursor or nil
				end
				if nextCursor == nil then
					var2:debug("No more messages to fetch")
					
					return
				elseif p8.messages:Get(id) ~= nil then
					var2:debug("Last message already in conversation, we've caught up")
					
					return
				end
				var2:trace("Fetching for the next page of messages using cursor: {}", nextCursor)
				
				return p12:dispatch(appChatNetworkingModule.rodux.GetOlderMessages.API(p8.id, nextCursor)):andThen(function(p14) --[[ line: 66 ]]
					-- upvalues: p12 (ref), fetchOlderMessages (copy), p8 (copy), var7 (copy)
					return p12:dispatch(fetchOlderMessages(p8, p14, var7 + 1))
				end):catch(function(p13) --[[ line: 69 ]]
					-- upvalues: var2 (copy)
					var2:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", p13)
				end)
			end)
		end):catch(function(p10) --[[ line: 85 ]]
			-- upvalues: var2 (copy)
			var2:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", p10)
		end)
	end
end