local moments = script:FindFirstAncestor("Moments")
local constantsModule = require(moments.Constants)
local _ = require(moments.Enums.NavigationDestinationType)

return function(p1)
	-- upvalues: constantsModule (ref)
	local t = {
		client_event_timestamp_ms = p1.clientEventTimestampMs,
		feedItemId = p1.feedItemId,
		viewId = p1.viewId,
		durationSeconds = tostring(p1.durationSeconds),
		destinationType = p1.destinationType
	}
	
	if p1.includeRecommendationDetail then
		t.impressionType = tostring(1)
		t.sourceSurface = constantsModule.SOURCE_SURFACE
		t.itemPosition = tostring(p1.itemPosition)
		t.tracingId = p1.tracingId or ""
	end
	return t
end