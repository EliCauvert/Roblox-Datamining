local CorePackages = game:GetService("CorePackages")
local _ = require(script.Parent.EventNames)
local TelemetryActionListModule = require(script.Parent.TelemetryActionList)
local FireTelemetryResult = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.FireEvent.fireTelemetry({
	telemetryImpl = require(CorePackages.Workspace.Packages.LoggingProtocol).default,
	eventList = TelemetryActionListModule
})

return function(p1, p2)
	-- upvalues: TelemetryActionListModule (copy), FireTelemetryResult (copy)
	if TelemetryActionListModule[p1] then
		FireTelemetryResult(p1, p2)
	end
end