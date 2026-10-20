local Moments = script:FindFirstAncestor("Moments")
local ConstantsModule = require(Moments.Constants)
local _ = require(Moments.Enums.NavigationDestinationType)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	local config = {
		client_event_timestamp_ms = p1.clientEventTimestampMs,
		feedItemId = p1.feedItemId,
		viewId = p1.viewId,
		durationSeconds = tostring(p1.durationSeconds),
		destinationType = p1.destinationType
	}
	
	if p1.includeRecommendationDetail then
		config.impressionType = tostring(1)
		config.sourceSurface = ConstantsModule.SOURCE_SURFACE
		config.itemPosition = tostring(p1.itemPosition)
		config.tracingId = p1.tracingId or ""
	end
	return config
end