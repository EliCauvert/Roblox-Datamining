return {
	VideoBlockingTelemetryConfig = {
		eventName = "EdpVideoPreviewBlockingStatus",
		description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
		backends = { "Points", "EventIngest" },
		lastUpdated = { 26, 3, 25 },
		throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
	},
	isInPipeDenyList = function(p0, p1)
		if not p0 or not p1 or p1 == "" then
			return false
		end
		for i in p1:gmatch("([^|]+)") do
			if typeof(i) == "string" and string.lower(i) == string.lower(p0) then
				return true
			end
		end
		return false
	end
}