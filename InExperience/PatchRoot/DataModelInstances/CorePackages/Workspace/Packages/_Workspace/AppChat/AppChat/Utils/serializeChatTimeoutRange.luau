local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)

return function(p1, p2)
	local currentDateTime = DateTime.now()
	
	return {
		endTimestamp = math.clamp((p2 or currentDateTime.UnixTimestamp) + p1.time_remaining, -17987443200, 253402300799),
		decisionEventId = p1.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(p1.end_time) or currentDateTime).UnixTimestamp - (DateTime.fromIsoDate(p1.start_time) or currentDateTime).UnixTimestamp, 0, 253402300799)
	}
end