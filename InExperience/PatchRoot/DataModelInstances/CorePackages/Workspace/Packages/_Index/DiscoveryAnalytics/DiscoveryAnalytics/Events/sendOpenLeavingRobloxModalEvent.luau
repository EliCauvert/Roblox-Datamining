local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var2 = tModule.strictInterface({
	assignment_id = tModule.number,
	assignment_type = tModule.string,
	social_link_type = tModule.string,
	social_link_display_type = tModule.string
})
local t = {
	eventName = "openLeavingRobloxModal",
	description = "Event fired when a prompt is opened to confirm that the user wants to leave roblox",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("OpenLeavingRobloxModalThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 12, 9 }
}

return function(p0)
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("OpenLeavingRobloxModalInterface", var5)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end