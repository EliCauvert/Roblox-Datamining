local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Utils.serializeChatTimeoutRange)

return function(p1)
	return if p1 == nil or p1.status ~= "active" then nil else {
		endTimestamp = p1.endTimestamp,
		decisionEventId = p1.decisionEventId,
		duration = p1.duration,
		requiresAcknowledgement = p1.requiresAcknowledgement
	}
end