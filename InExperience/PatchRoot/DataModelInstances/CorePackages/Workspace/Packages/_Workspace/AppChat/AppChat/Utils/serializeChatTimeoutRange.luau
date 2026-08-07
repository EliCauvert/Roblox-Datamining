local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)

return function(p0, p1) --[[ line: 15 | named "serializeChatTimeoutRange" ]]
	local currentDateTime = DateTime.now()
	
	return {
		endTimestamp = math.clamp((p1 or currentDateTime.UnixTimestamp) + p0.time_remaining, -17987443200, 253402300799),
		decisionEventId = p0.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(p0.end_time) or currentDateTime).UnixTimestamp - (DateTime.fromIsoDate(p0.start_time) or currentDateTime).UnixTimestamp, 0, 253402300799)
	}
end