local Parent = script:FindFirstAncestor("AppChat").Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local _ = require(Parent.Http)
local _ = require(Parent.LuauPolyfill)

return function(Callback)
	-- upvalues: AppChatNetworkingModule (copy)
	local Http = AppChatNetworkingModule.http
	
	local function _(p1)
		-- upvalues: Callback (copy)
		return if Callback == nil then nil else function(p2, p3, p4)
			-- upvalues: Callback (upval), p1 (copy)
			return Callback(p1, p2, p3, p4)
		end
	end
	
	return {
		SendChatTextMessage = function(p1, p2, p3)
			-- upvalues: Http (copy), Callback (copy)
			local SendChatTextMessageFunction = Http.SendChatTextMessage
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "SendChatTextMessage"
				
				local function v1(p4, p5, p6)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p4, p5, p6)
				end
			end
			return SendChatTextMessageFunction(v1, p1, p2, p3)
		end,
		GetConversationMessages = function(p1, p2)
			-- upvalues: Http (copy), Callback (copy)
			local GetConversationMessagesFunction = Http.GetConversationMessages
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "GetConversationMessages"
				
				local function v1(p3, p4, p5)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p3, p4, p5)
				end
			end
			return GetConversationMessagesFunction(v1, p1, p2)
		end,
		GetUserConversations = function(p1)
			-- upvalues: Http (copy), Callback (copy)
			local GetUserConversationsFunction = Http.GetUserConversations
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "GetUserConversations"
				
				local function v1(p2, p3, p4)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p2, p3, p4)
				end
			end
			return GetUserConversationsFunction(v1, p1)
		end,
		GetConversations = function(p1, p2)
			-- upvalues: Http (copy), Callback (copy)
			local GetConversationsFunction = Http.GetConversations
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "GetConversations"
				
				local function v1(p3, p4, p5)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p3, p4, p5)
				end
			end
			return GetConversationsFunction(v1, p1, p2)
		end,
		SearchConversations = function(p1, p2, p3)
			-- upvalues: Http (copy), Callback (copy)
			local SearchConversationsFunction = Http.SearchConversations
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "SearchConversations"
				
				local function v1(p4, p5, p6)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p4, p5, p6)
				end
			end
			return SearchConversationsFunction(v1, p1, p2, p3)
		end,
		CreateConversation = function(p1, p2, p3)
			-- upvalues: Http (copy), Callback (copy)
			local CreateConversationFunction = Http.CreateConversation
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "CreateConversation"
				
				local function v1(p4, p5, p6)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p4, p5, p6)
				end
			end
			return CreateConversationFunction(v1, p1, p2, p3)
		end,
		MarkConversationRead = function(p1)
			-- upvalues: Http (copy), Callback (copy)
			local MarkConversationReadFunction = Http.MarkConversationRead
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "MarkConversationRead"
				
				local function v1(p2, p3, p4)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p2, p3, p4)
				end
			end
			return MarkConversationReadFunction(v1, p1)
		end,
		ClearGlobalUnreadCount = function()
			-- upvalues: Http (copy), Callback (copy)
			local ClearGlobalUnreadCountFunction = Http.ClearGlobalUnreadCount
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "ClearGlobalUnreadCount"
				
				local function v1(p1, p2, p3)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p1, p2, p3)
				end
			end
			return ClearGlobalUnreadCountFunction(v1)
		end,
		RecordModalSequenceResponse = function(p1)
			-- upvalues: Http (copy), Callback (copy)
			local RecordModalSequenceResponseFunction = Http.RecordModalSequenceResponse
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "RecordModalSequenceResponse"
				
				local function v1(p2, p3, p4)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p2, p3, p4)
				end
			end
			return RecordModalSequenceResponseFunction(v1, p1)
		end,
		GetMetadata = function()
			-- upvalues: Http (copy), Callback (copy)
			local GetMetadataFunction = Http.GetMetadata
			
			if Callback == nil then
				local v1: ((any, any, any) -> any)? = nil
			else
				local v2 = "GetMetadata"
				
				local function v1(p1, p2, p3)
					-- upvalues: Callback (upval), v2 (copy)
					return Callback(v2, p1, p2, p3)
				end
			end
			return GetMetadataFunction(v1)
		end
	}
end