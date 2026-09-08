local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, p2)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref)
	local var1
	local currentDateTime = DateTime.now()
	local t = {
		endTimestamp = math.clamp((p2 or currentDateTime.UnixTimestamp) + p1.time_remaining, -17987443200, 253402300799),
		decisionEventId = p1.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(p1.end_time) or currentDateTime).UnixTimestamp - (DateTime.fromIsoDate(p1.start_time) or currentDateTime).UnixTimestamp, 0, 253402300799)
	}
	
	if fFlagAppChatReactiveFeatureRestrictions then
		var1 = p1.requires_acknowledgement == true
		var1 = nil
	else
		var1 = nil
	end
	t.requiresAcknowledgement = var1
	
	return t
end