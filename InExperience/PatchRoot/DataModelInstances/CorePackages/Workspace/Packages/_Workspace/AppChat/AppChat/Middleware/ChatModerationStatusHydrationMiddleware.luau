local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ClearUserSpecificData = require(Parent.UserLib).Actions.ClearUserSpecificData
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local GetChatModerationStatusDataHydrationModule = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagAppChatUseDataHydrationForChatTimeoutsModule = require(AppChat.Flags.FFlagAppChatUseDataHydrationForChatTimeouts)

return function(Callback, _)
	-- upvalues: AppChatNetworkingModule (copy), GetChatModerationStatusDataHydrationModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), RemovedConversationModule (copy), FFlagAppChatUseDataHydrationForChatTimeoutsModule (copy), ClearUserSpecificData (copy)
	return function(p1)
		-- upvalues: Callback (copy), AppChatNetworkingModule (upval), GetChatModerationStatusDataHydrationModule (upval), FFlagAppChatReactiveFeatureRestrictions (upval), RemovedConversationModule (upval), FFlagAppChatUseDataHydrationForChatTimeoutsModule (upval), ClearUserSpecificData (upval)
		local CallbackResult = Callback(p1)
		
		if p1.type == AppChatNetworkingModule.rodux.GetChatModerationStatuses.Succeeded.name then
			local Ids = if p1.postBody then p1.postBody.ids or {} else {}
			GetChatModerationStatusDataHydrationModule(false).ingestResponse(p1.responseBody, {
				includeUser = FFlagAppChatReactiveFeatureRestrictions or #Ids == 0,
				conversationIds = Ids
			})
			
			return CallbackResult
		end
		if p1.type == RemovedConversationModule.name and p1.conversationId then
			GetChatModerationStatusDataHydrationModule(false).setConversationStatusNone(p1.conversationId)
			
			return CallbackResult
		end
		if FFlagAppChatUseDataHydrationForChatTimeoutsModule and p1.type == ClearUserSpecificData.name then
			GetChatModerationStatusDataHydrationModule(false).clear()
		end
		return CallbackResult
	end
end