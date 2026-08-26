return {
	VideoBlockingTelemetryConfig = {
		eventName = "EdpVideoPreviewBlockingStatus",
		description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
		backends = { "Points", "EventIngest" },
		lastUpdated = { 26, 3, 25 },
		throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
	},
	isInPipeDenyList = function(p1, p2)
		if not p1 or not p2 or p2 == "" then
			return false
		end
		for i in p2:gmatch("([^|]+)") do
			if typeof(i) == "string" and string.lower(i) == string.lower(p1) then
				return true
			end
		end
		return false
	end
}