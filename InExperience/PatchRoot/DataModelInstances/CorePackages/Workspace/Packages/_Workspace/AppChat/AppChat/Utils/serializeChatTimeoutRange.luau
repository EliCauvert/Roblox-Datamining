local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, p2)
	-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy)
	local _DateTime = DateTime.now()
	
	return {
		endTimestamp = math.clamp((p2 or _DateTime.UnixTimestamp) + p1.time_remaining, -17987443200, 253402300799),
		decisionEventId = p1.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(p1.end_time) or _DateTime).UnixTimestamp - (DateTime.fromIsoDate(p1.start_time) or _DateTime).UnixTimestamp, 0, 253402300799),
		requiresAcknowledgement = if FFlagAppChatReactiveFeatureRestrictions then p1.requires_acknowledgement == true else nil
	}
end