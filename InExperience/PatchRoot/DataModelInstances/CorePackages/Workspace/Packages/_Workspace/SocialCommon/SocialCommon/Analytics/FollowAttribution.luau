local TelemetryService = game:GetService("TelemetryService")

return {
	Surface = { Profile = "Profile", Moments = "Moments" },
	Source = { MomentsFeed = "MomentsFeed" },
	reportFollowSuccess = require(script.Parent.createFollowAttributionReporter)(function(Config, Data)
		-- upvalues: TelemetryService (copy)
		TelemetryService:LogEvent(Config, Data)
	end)
}