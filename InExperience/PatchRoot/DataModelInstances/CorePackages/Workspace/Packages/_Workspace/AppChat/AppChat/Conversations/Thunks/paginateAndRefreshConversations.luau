local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local hasConversationChangedModule = require(appChat.Conversations.hasConversationChanged)
local getShouldRefetchMessagesModule = require(appChat.Conversations.getShouldRefetchMessages)
local paginateAndRefreshConversations = require(appChat.Logger):new("paginateAndRefreshConversations")
local paginateForNewerMessagesModule = require(appChat.Conversations.Thunks.paginateForNewerMessages)

local function paginateAndRefreshConversations_1(p0)
	-- upvalues: appChatNetworkingModule (ref), getDeepValueModule (ref), conversationChannelsModule (ref), hasConversationChangedModule (ref), getShouldRefetchMessagesModule (ref), paginateAndRefreshConversations (ref), paginateForNewerMessagesModule (ref), paginateAndRefreshConversations_1 (ref)
	return function(p1)
		-- upvalues: appChatNetworkingModule (copy), p0 (ref), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
		local state = p1:getState()
		
		return p1:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(p0)):andThen(function(p3)
			-- upvalues: getDeepValueModule (copy), state (ref), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), p1 (ref), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
			for i, v in p3.responseBody.conversations do
				local var10 = getDeepValueModule(state, `ChatAppReducer.Conversations.{tostring(v.id)}`)
				local var11 = conversationChannelsModule.fromChannelsApi(v)
				
				if hasConversationChangedModule({ new = var11, existing = var10 }) then
					if getShouldRefetchMessagesModule({ new = var11, existing = var10 }) then
						paginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", var11.id)
						p1:dispatch(paginateForNewerMessagesModule(var11))
					end
				end
				return
			end
			local nextCursor = p3.responseBody.next_cursor
			
			if nextCursor and nextCursor ~= "" and typeof(nextCursor) == "string" then
				return p1:dispatch(paginateAndRefreshConversations_1(nextCursor))
			end
		end):catch(function(p2)
			warn("Failure in paginateAndRefreshConversations: ", tostring(p2))
			
			return p2
		end)
	end
end

return function()
	-- upvalues: appChatNetworkingModule (ref), getDeepValueModule (ref), conversationChannelsModule (ref), hasConversationChangedModule (ref), getShouldRefetchMessagesModule (ref), paginateAndRefreshConversations (ref), paginateForNewerMessagesModule (ref), paginateAndRefreshConversations_1 (ref)
	return function(p4)
		-- upvalues: appChatNetworkingModule (copy), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
		local var12 = nil
		
		return p4:dispatch(function(p5)
			-- upvalues: appChatNetworkingModule (copy), var12 (ref), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
			local state = p5:getState()
			
			return p5:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(var12)):andThen(function(p7)
				-- upvalues: getDeepValueModule (copy), state (ref), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), p5 (ref), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
				for i, v in p7.responseBody.conversations do
					local var10 = getDeepValueModule(state, `ChatAppReducer.Conversations.{tostring(v.id)}`)
					local var11 = conversationChannelsModule.fromChannelsApi(v)
					
					if hasConversationChangedModule({ new = var11, existing = var10 }) then
						if getShouldRefetchMessagesModule({ new = var11, existing = var10 }) then
							paginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", var11.id)
							p5:dispatch(paginateForNewerMessagesModule(var11))
						end
					end
					return
				end
				local nextCursor = p7.responseBody.next_cursor
				
				if nextCursor and nextCursor ~= "" and typeof(nextCursor) == "string" then
					return p5:dispatch(paginateAndRefreshConversations_1(nextCursor))
				end
			end):catch(function(p6)
				warn("Failure in paginateAndRefreshConversations: ", tostring(p6))
				
				return p6
			end)
		end)
	end
end