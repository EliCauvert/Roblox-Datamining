return {
	VideoBlockingTelemetryConfig = {
		eventName = "EdpVideoPreviewBlockingStatus",
		description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
		backends = { "Points", "EventIngest" },
		lastUpdated = { 26, 3, 25 },
		throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
	},
	isInPipeDenyList = function(Text: string, Text1: string): boolean --[[ Line: 15 ]]
		if not Text or not Text1 or Text1 == "" then
			return false
		end
		for i in Text1:gmatch("([^|]+)") do
			if typeof(i) == "string" and string.lower(i) == string.lower(Text) then
				return true
			end
		end
		return false
	end
}