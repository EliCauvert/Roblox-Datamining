local appChat = script:FindFirstAncestor("AppChat")
local promiseModule = require(appChat.Parent.Promise)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local eventNamesModule = require(appChat.Analytics.EventNames)
local createConversationErrorModule = require(appChat.Analytics.Enums.CreateConversationError)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), conversationChannelsModule (ref), createConversationErrorModule (ref), eventNamesModule (ref)
	if not p1 then
		return promiseModule.reject("No conversation returned.")
	elseif p1.status == "failed" then
		return promiseModule.reject("Failed to create conversation.")
	end
	local var1 = conversationChannelsModule.fromChannelsApi(p1)
	
	if p2 then
		p2.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
			conversationId = var1.id,
			createConversationResult = if not var1 then createConversationErrorModule.InvalidResponse else p1.status,
			participantsCount = #var1.participants,
			createdReason = p3 or "unknown"
		})
	end
	return var1
end