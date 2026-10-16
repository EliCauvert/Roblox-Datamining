local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local HasConversationChangedModule = require(AppChat.Conversations.hasConversationChanged)
local GetShouldRefetchMessagesModule = require(AppChat.Conversations.getShouldRefetchMessages)
local PaginateAndRefreshConversations = require(AppChat.Logger):new("paginateAndRefreshConversations")
local PaginateForNewerMessagesModule = require(AppChat.Conversations.Thunks.paginateForNewerMessages)

local function paginateAndRefreshConversations(NextCursor) --[[ Line: 27 ]]
	-- upvalues: AppChatNetworkingModule (copy), GetDeepValueModule (copy), ConversationChannelsModule (copy), HasConversationChangedModule (copy), GetShouldRefetchMessagesModule (copy), PaginateAndRefreshConversations (copy), PaginateForNewerMessagesModule (copy), paginateAndRefreshConversations (copy)
	return function(p1) --[[ Line: 28 ]]
		-- upvalues: AppChatNetworkingModule (upval), NextCursor (copy), GetDeepValueModule (upval), ConversationChannelsModule (upval), HasConversationChangedModule (upval), GetShouldRefetchMessagesModule (upval), PaginateAndRefreshConversations (upval), PaginateForNewerMessagesModule (upval), paginateAndRefreshConversations (upval)
		local State = p1:getState()
		
		return p1:dispatch(AppChatNetworkingModule.rodux.GetUserConversations.API(NextCursor)):andThen(function(Result) --[[ Line: 35 ]]
			-- upvalues: GetDeepValueModule (upval), State (copy), ConversationChannelsModule (upval), HasConversationChangedModule (upval), GetShouldRefetchMessagesModule (upval), PaginateAndRefreshConversations (upval), p1 (copy), PaginateForNewerMessagesModule (upval), paginateAndRefreshConversations (upval)
			for _, conversation in Result.responseBody.conversations do
				local Existing = GetDeepValueModule(State, `ChatAppReducer.Conversations.{tostring(conversation.id)}`)
				local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
				
				if not HasConversationChangedModule({ new = FromChannelsApiResult, existing = Existing }) then return end
				if GetShouldRefetchMessagesModule({ new = FromChannelsApiResult, existing = Existing }) then
					PaginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", FromChannelsApiResult.id)
					p1:dispatch(PaginateForNewerMessagesModule(FromChannelsApiResult))
				end
			end
			local NextCursor = Result.responseBody.next_cursor
			
			if not NextCursor or NextCursor == "" or typeof(NextCursor) ~= "string" then return end
			return p1:dispatch(paginateAndRefreshConversations(NextCursor))
		end):catch(function(Err) --[[ Line: 63 ]]
			warn("Failure in paginateAndRefreshConversations: ", (tostring(Err)))
			
			return Err
		end)
	end
end

return function() --[[ Line: 70 ]]
	-- upvalues: AppChatNetworkingModule (copy), GetDeepValueModule (copy), ConversationChannelsModule (copy), HasConversationChangedModule (copy), GetShouldRefetchMessagesModule (copy), PaginateAndRefreshConversations (copy), PaginateForNewerMessagesModule (copy), paginateAndRefreshConversations (copy)
	return function(p1) --[[ Line: 71 ]]
		-- upvalues: AppChatNetworkingModule (upval), GetDeepValueModule (upval), ConversationChannelsModule (upval), HasConversationChangedModule (upval), GetShouldRefetchMessagesModule (upval), PaginateAndRefreshConversations (upval), PaginateForNewerMessagesModule (upval), paginateAndRefreshConversations (upval)
		local v1 = nil
		
		return p1:dispatch(function(p2) --[[ Line: 28 ]]
			-- upvalues: AppChatNetworkingModule (upval), v1 (copy), GetDeepValueModule (upval), ConversationChannelsModule (upval), HasConversationChangedModule (upval), GetShouldRefetchMessagesModule (upval), PaginateAndRefreshConversations (upval), PaginateForNewerMessagesModule (upval), paginateAndRefreshConversations (upval)
			local State = p2:getState()
			
			return p2:dispatch(AppChatNetworkingModule.rodux.GetUserConversations.API(v1)):andThen(function(Result) --[[ Line: 35 ]]
				-- upvalues: GetDeepValueModule (upval), State (copy), ConversationChannelsModule (upval), HasConversationChangedModule (upval), GetShouldRefetchMessagesModule (upval), PaginateAndRefreshConversations (upval), p2 (copy), PaginateForNewerMessagesModule (upval), paginateAndRefreshConversations (upval)
				for _, conversation in Result.responseBody.conversations do
					local Existing = GetDeepValueModule(State, `ChatAppReducer.Conversations.{tostring(conversation.id)}`)
					local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
					
					if not HasConversationChangedModule({ new = FromChannelsApiResult, existing = Existing }) then return end
					if GetShouldRefetchMessagesModule({ new = FromChannelsApiResult, existing = Existing }) then
						PaginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", FromChannelsApiResult.id)
						p2:dispatch(PaginateForNewerMessagesModule(FromChannelsApiResult))
					end
				end
				local NextCursor = Result.responseBody.next_cursor
				
				if not NextCursor or NextCursor == "" or typeof(NextCursor) ~= "string" then return end
				return p2:dispatch(paginateAndRefreshConversations(NextCursor))
			end):catch(function(Err) --[[ Line: 63 ]]
				warn("Failure in paginateAndRefreshConversations: ", (tostring(Err)))
				
				return Err
			end)
		end)
	end
end