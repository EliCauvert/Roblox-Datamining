local TelemetryService = game:GetService("TelemetryService")
game:DefineFastInt("logWidgetClickedThrottleHundredPercent", 10000)
local config = {
	eventName = "lockScreenWidgetClicked",
	description = "Report lock screen widget click to EventIngest backend.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("logWidgetClickedThrottleHundredPercent"),
	lastUpdated = { 26, 7, 7 }
}
local config1 = {
	eventName = "emptyContainerWidgetClicked",
	description = "Report empty container widget click to EventIngest backend.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("logWidgetClickedThrottleHundredPercent"),
	lastUpdated = { 26, 7, 7 }
}

return function(Page, EmptyOrContainer)
	-- upvalues: TelemetryService (copy), config (copy), config1 (copy)
	if EmptyOrContainer == "LockScreen" or EmptyOrContainer == "lockscreen" then
		TelemetryService:LogEvent(config, { page = Page })
		
		return
	else
		TelemetryService:LogEvent(config1, { page = Page, emptyOrContainer = EmptyOrContainer })
	end
end