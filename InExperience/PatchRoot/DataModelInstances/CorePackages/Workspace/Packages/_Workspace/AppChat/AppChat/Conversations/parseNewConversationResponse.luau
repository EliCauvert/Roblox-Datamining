local AppChat = script:FindFirstAncestor("AppChat")
local PromiseModule = require(AppChat.Parent.Promise)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local CreateConversationErrorModule = require(AppChat.Analytics.Enums.CreateConversationError)

return function(p1, p2, p3) --[[ Line: 18 ]]
	-- upvalues: PromiseModule (copy), ConversationChannelsModule (copy), CreateConversationErrorModule (copy), EventNamesModule (copy)
	if not p1 then
		return PromiseModule.reject("No conversation returned.")
	end
	if p1.status == "failed" then
		return PromiseModule.reject("Failed to create conversation.")
	end
	local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(p1)
	
	if p2 then
		p2.fireAnalyticsEvent(EventNamesModule.NewConversationCreated, {
			conversationId = FromChannelsApiResult.id,
			createConversationResult = if FromChannelsApiResult then p1.status else CreateConversationErrorModule.InvalidResponse,
			participantsCount = #FromChannelsApiResult.participants,
			createdReason = p3 or "unknown"
		})
	end
	return FromChannelsApiResult
end