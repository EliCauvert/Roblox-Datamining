local appChat = script:FindFirstAncestor("AppChat")
local promiseModule = require(appChat.Parent.Promise)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local eventNamesModule = require(appChat.Analytics.EventNames)
local createConversationErrorModule = require(appChat.Analytics.Enums.CreateConversationError)

return function(p0, p1, p2)
	-- upvalues: promiseModule (ref), conversationChannelsModule (ref), createConversationErrorModule (ref), eventNamesModule (ref)
	if not p0 then
		return promiseModule.reject("No conversation returned.")
	elseif p0.status == "failed" then
		return promiseModule.reject("Failed to create conversation.")
	end
	local var5 = conversationChannelsModule.fromChannelsApi(p0)
	
	if p1 then
		p1.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
			conversationId = var5.id,
			createConversationResult = if not var5 then createConversationErrorModule.InvalidResponse else p0.status,
			participantsCount = #var5.participants,
			createdReason = p2 or "unknown"
		})
	end
	return var5
end