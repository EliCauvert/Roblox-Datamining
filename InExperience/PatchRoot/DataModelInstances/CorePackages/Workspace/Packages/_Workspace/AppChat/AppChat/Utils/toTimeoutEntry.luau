local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(AppChat.Utils.serializeChatTimeoutRange)

return function(p1) --[[ Line: 9 | Named "toTimeoutEntry" ]]
	return if p1 == nil or p1.status ~= "active" then nil else {
		endTimestamp = p1.endTimestamp,
		decisionEventId = p1.decisionEventId,
		duration = p1.duration,
		requiresAcknowledgement = p1.requiresAcknowledgement
	}
end