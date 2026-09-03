local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, _)
	-- upvalues: appChatNetworkingModule (ref), getChatModerationStatusDataHydrationModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), removedConversationModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), appChatNetworkingModule (copy), getChatModerationStatusDataHydrationModule (copy), fFlagAppChatReactiveFeatureRestrictions (copy), removedConversationModule (copy)
		local var1 = p1(p2)
		
		if p2.type == appChatNetworkingModule.rodux.GetChatModerationStatuses.Succeeded.name then
			local var2 = if p2.postBody then p2.postBody.ids or {} else {}
			getChatModerationStatusDataHydrationModule(false).ingestResponse(p2.responseBody, {
				includeUser = fFlagAppChatReactiveFeatureRestrictions or #var2 == 0,
				conversationIds = var2
			})
			
			return var1
		elseif p2.type == removedConversationModule.name and p2.conversationId then
			getChatModerationStatusDataHydrationModule(false).setConversationStatusNone(p2.conversationId)
		end
		return var1
	end
end