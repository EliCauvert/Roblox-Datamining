local conversationChannelsModule = require(script:FindFirstAncestor("AppChat").Models.ConversationChannels)
local _ = require(script.Parent.serializeChatTimeoutRange)

return function(p1, p2, p3, p4)
	-- upvalues: conversationChannelsModule (ref)
	p4 = p4 or DateTime.now().UnixTimestamp
	local var1 = if p1 and p1.endTimestamp then p1.endTimestamp else 0
	local var2 = if p2 and p2.endTimestamp then p2.endTimestamp else 0
	local var3 = if var1 < var2 then p2 else p1
	local maxValue = math.max(var1, var2)
	
	return {
		isTimedOut = p4 < maxValue and p3 ~= conversationChannelsModule.ModerationType.TrustedComms,
		timeoutEndTimestamp = maxValue,
		decisionEventId = if var3 then var3.decisionEventId else nil,
		duration = if var3 then var3.duration else nil
	}
end