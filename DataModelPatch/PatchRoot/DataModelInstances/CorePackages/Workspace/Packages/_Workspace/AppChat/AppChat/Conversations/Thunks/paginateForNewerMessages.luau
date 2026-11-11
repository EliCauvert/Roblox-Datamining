local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local AppChatPaginateForNewerMessages = require(AppChat.Logger):new("AppChat.paginateForNewerMessages")
local _ = require(AppChat.Models.ConversationChannels)
local AppChatNewMessageFetchMaxDepth = game:DefineFastInt("AppChatNewMessageFetchMaxDepth", 10)

local function _(p1, p2): boolean
	return p1.messages:Get(p2) ~= nil
end

local function fetchOlderMessages(p1, p2, p3)
	-- upvalues: AppChatNewMessageFetchMaxDepth (copy), AppChatPaginateForNewerMessages (copy), AppChatNetworkingModule (copy), fetchOlderMessages (copy)
	return function(p4)
		-- upvalues: p3 (copy), AppChatNewMessageFetchMaxDepth (upval), AppChatPaginateForNewerMessages (upval), p2 (copy), p1 (copy), AppChatNetworkingModule (upval), fetchOlderMessages (upval)
		if AppChatNewMessageFetchMaxDepth <= p3 then
			AppChatPaginateForNewerMessages:warning("Reached max depth {} of fetching new messages", AppChatNewMessageFetchMaxDepth)
			
			return
		end
		local ResponseBody = p2.responseBody
		
		if not ResponseBody then return end
		local Messages = ResponseBody.messages
		local Id = Messages and #Messages > 0 and Messages[#Messages].id or nil
		
		if Id == nil then
			AppChatPaginateForNewerMessages:warning("No messages in response")
			
			return
		end
		assert(Id, "FFlagLuauTinyControlFlowAnalysis")
		local NextCursor = ResponseBody.next_cursor and ResponseBody.next_cursor ~= "" and ResponseBody.next_cursor or nil
		
		if NextCursor == nil then
			AppChatPaginateForNewerMessages:debug("No more messages to fetch")
			
			return
		end
		if p1.messages:Get(Id) ~= nil then
			AppChatPaginateForNewerMessages:debug("Last message already in conversation, we've caught up")
			
			return
		end
		AppChatPaginateForNewerMessages:trace("Fetching for the next page of messages using cursor: {}", NextCursor)
		
		return p4:dispatch(AppChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, NextCursor)):andThen(function(Result)
			-- upvalues: p4 (copy), fetchOlderMessages (upval), p1 (upval), p3 (upval)
			return p4:dispatch(fetchOlderMessages(p1, Result, p3 + 1))
		end):catch(function(Err)
			-- upvalues: AppChatPaginateForNewerMessages (upval)
			AppChatPaginateForNewerMessages:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", Err)
		end)
	end
end

return function(p1)
	-- upvalues: AppChatPaginateForNewerMessages (copy), AppChatNetworkingModule (copy), AppChatNewMessageFetchMaxDepth (copy), fetchOlderMessages (copy)
	return function(p2)
		-- upvalues: AppChatPaginateForNewerMessages (upval), p1 (copy), AppChatNetworkingModule (upval), AppChatNewMessageFetchMaxDepth (upval), fetchOlderMessages (upval)
		AppChatPaginateForNewerMessages:info("Starting to fetch newest messages for conversation: {}", p1.id)
		
		return p2:dispatch(AppChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, nil)):andThen(function(Result)
			-- upvalues: p2 (copy), p1 (upval), AppChatNewMessageFetchMaxDepth (upval), AppChatPaginateForNewerMessages (upval), AppChatNetworkingModule (upval), fetchOlderMessages (upval)
			local v1 = 0
			
			return p2:dispatch(function(p3)
				-- upvalues: v1 (copy), AppChatNewMessageFetchMaxDepth (upval), AppChatPaginateForNewerMessages (upval), Result (copy), p1 (copy), AppChatNetworkingModule (upval), fetchOlderMessages (upval)
				if AppChatNewMessageFetchMaxDepth <= v1 then
					AppChatPaginateForNewerMessages:warning("Reached max depth {} of fetching new messages", AppChatNewMessageFetchMaxDepth)
					
					return
				end
				local ResponseBody = Result.responseBody
				
				if not ResponseBody then return end
				local Messages = ResponseBody.messages
				local Id = Messages and #Messages > 0 and Messages[#Messages].id or nil
				
				if Id == nil then
					AppChatPaginateForNewerMessages:warning("No messages in response")
					
					return
				end
				assert(Id, "FFlagLuauTinyControlFlowAnalysis")
				local NextCursor = ResponseBody.next_cursor and ResponseBody.next_cursor ~= "" and ResponseBody.next_cursor or nil
				
				if NextCursor == nil then
					AppChatPaginateForNewerMessages:debug("No more messages to fetch")
					
					return
				end
				if p1.messages:Get(Id) ~= nil then
					AppChatPaginateForNewerMessages:debug("Last message already in conversation, we've caught up")
					
					return
				end
				AppChatPaginateForNewerMessages:trace("Fetching for the next page of messages using cursor: {}", NextCursor)
				
				return p3:dispatch(AppChatNetworkingModule.rodux.GetOlderMessages.API(p1.id, NextCursor)):andThen(function(Result)
					-- upvalues: p3 (copy), fetchOlderMessages (upval), p1 (upval), v1 (upval)
					return p3:dispatch(fetchOlderMessages(p1, Result, v1 + 1))
				end):catch(function(Err)
					-- upvalues: AppChatPaginateForNewerMessages (upval)
					AppChatPaginateForNewerMessages:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", Err)
				end)
			end)
		end):catch(function(Err)
			-- upvalues: AppChatPaginateForNewerMessages (upval)
			AppChatPaginateForNewerMessages:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", Err)
		end)
	end
end