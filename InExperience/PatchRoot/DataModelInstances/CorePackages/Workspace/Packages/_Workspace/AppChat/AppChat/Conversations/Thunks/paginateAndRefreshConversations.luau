local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local hasConversationChangedModule = require(appChat.Conversations.hasConversationChanged)
local getShouldRefetchMessagesModule = require(appChat.Conversations.getShouldRefetchMessages)
local paginateAndRefreshConversations = require(appChat.Logger):new("paginateAndRefreshConversations")
local paginateForNewerMessagesModule = require(appChat.Conversations.Thunks.paginateForNewerMessages)

local function paginateAndRefreshConversations_1(p1)
	-- upvalues: appChatNetworkingModule (ref), getDeepValueModule (ref), conversationChannelsModule (ref), hasConversationChangedModule (ref), getShouldRefetchMessagesModule (ref), paginateAndRefreshConversations (ref), paginateForNewerMessagesModule (ref), paginateAndRefreshConversations_1 (ref)
	return function(p2)
		-- upvalues: appChatNetworkingModule (copy), p1 (ref), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
		local state = p2:getState()
		
		return p2:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(p1)):andThen(function(p3)
			-- upvalues: getDeepValueModule (copy), state (ref), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), p2 (ref), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
			for i, v in p3.responseBody.conversations do
				local var1 = getDeepValueModule(state, `ChatAppReducer.Conversations.{tostring(v.id)}`)
				local var2 = conversationChannelsModule.fromChannelsApi(v)
				
				if hasConversationChangedModule({ new = var2, existing = var1 }) then
					if getShouldRefetchMessagesModule({ new = var2, existing = var1 }) then
						paginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", var2.id)
						p2:dispatch(paginateForNewerMessagesModule(var2))
					end
				end
				return
			end
			local nextCursor = p3.responseBody.next_cursor
			
			if nextCursor and nextCursor ~= "" and typeof(nextCursor) == "string" then
				return p2:dispatch(paginateAndRefreshConversations_1(nextCursor))
			end
		end):catch(function(p4)
			warn("Failure in paginateAndRefreshConversations: ", tostring(p4))
			
			return p4
		end)
	end
end

return function()
	-- upvalues: appChatNetworkingModule (ref), getDeepValueModule (ref), conversationChannelsModule (ref), hasConversationChangedModule (ref), getShouldRefetchMessagesModule (ref), paginateAndRefreshConversations (ref), paginateForNewerMessagesModule (ref), paginateAndRefreshConversations_1 (ref)
	return function(p2)
		-- upvalues: appChatNetworkingModule (copy), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
		local var1 = nil
		
		return p2:dispatch(function(p3)
			-- upvalues: appChatNetworkingModule (copy), var1 (ref), getDeepValueModule (copy), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
			local state = p3:getState()
			
			return p3:dispatch(appChatNetworkingModule.rodux.GetUserConversations.API(var1)):andThen(function(p4)
				-- upvalues: getDeepValueModule (copy), state (ref), conversationChannelsModule (copy), hasConversationChangedModule (copy), getShouldRefetchMessagesModule (copy), paginateAndRefreshConversations (copy), p3 (ref), paginateForNewerMessagesModule (copy), paginateAndRefreshConversations_1 (copy)
				for i, v in p4.responseBody.conversations do
					local var2 = getDeepValueModule(state, `ChatAppReducer.Conversations.{tostring(v.id)}`)
					local var3 = conversationChannelsModule.fromChannelsApi(v)
					
					if hasConversationChangedModule({ new = var3, existing = var2 }) then
						if getShouldRefetchMessagesModule({ new = var3, existing = var2 }) then
							paginateAndRefreshConversations:debug("Fetching missing messages for conversation: {}", var3.id)
							p3:dispatch(paginateForNewerMessagesModule(var3))
						end
					end
					return
				end
				local nextCursor = p4.responseBody.next_cursor
				
				if nextCursor and nextCursor ~= "" and typeof(nextCursor) == "string" then
					return p3:dispatch(paginateAndRefreshConversations_1(nextCursor))
				end
			end):catch(function(p5)
				warn("Failure in paginateAndRefreshConversations: ", tostring(p5))
				
				return p5
			end)
		end)
	end
end