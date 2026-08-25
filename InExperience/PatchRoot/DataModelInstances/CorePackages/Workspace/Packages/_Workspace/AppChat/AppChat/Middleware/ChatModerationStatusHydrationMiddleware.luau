local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)

return function(p0, _)
	-- upvalues: appChatNetworkingModule (ref), getChatModerationStatusDataHydrationModule (ref), removedConversationModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), appChatNetworkingModule (copy), getChatModerationStatusDataHydrationModule (copy), removedConversationModule (copy)
		local var4 = p0(p1)
		
		if p1.type == appChatNetworkingModule.rodux.GetChatModerationStatuses.Succeeded.name then
			local var5 = if p1.postBody then p1.postBody.ids or {} else {}
			getChatModerationStatusDataHydrationModule(false).ingestResponse(p1.responseBody, { includeUser = #var5 == 0, conversationIds = var5 })
			
			return var4
		elseif p1.type == removedConversationModule.name and p1.conversationId then
			getChatModerationStatusDataHydrationModule(false).setConversationStatusNone(p1.conversationId)
		end
		return var4
	end
end