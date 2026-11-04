local _ = require(script.Parent.mapCallCard)

return {
	applyCallCardRefresh = function(p1, p2)
		local CallCard = p2.callCard
		
		return {
			callId = p1.callId,
			isInitiator = p1.isInitiator,
			status = string.lower(CallCard.status),
			durationSeconds = CallCard.duration_seconds,
			enableJoin = CallCard.enable_join
		}
	end,
	parseMessageCard = function(p1)
		return {
			callId = p1.call_id,
			isInitiator = p1.is_initiator,
			status = p1.status,
			durationSeconds = p1.duration_seconds,
			enableJoin = p1.enable_join
		}
	end
}