local conversationChannelsModule = require(script:FindFirstAncestor("AppChat").Models.ConversationChannels)
local _ = require(script.Parent.serializeChatTimeoutRange)

return function(p0, p1, p2, p3)
	-- upvalues: conversationChannelsModule (ref)
	p3 = p3 or DateTime.now().UnixTimestamp
	local var2 = if p0 and p0.endTimestamp then p0.endTimestamp else 0
	local var3 = if p1 and p1.endTimestamp then p1.endTimestamp else 0
	local var4 = if var2 < var3 then p1 else p0
	local maxValue = math.max(var2, var3)
	
	return {
		isTimedOut = p3 < maxValue and p2 ~= conversationChannelsModule.ModerationType.TrustedComms,
		timeoutEndTimestamp = maxValue,
		decisionEventId = if var4 then var4.decisionEventId else nil,
		duration = if var4 then var4.duration else nil
	}
end