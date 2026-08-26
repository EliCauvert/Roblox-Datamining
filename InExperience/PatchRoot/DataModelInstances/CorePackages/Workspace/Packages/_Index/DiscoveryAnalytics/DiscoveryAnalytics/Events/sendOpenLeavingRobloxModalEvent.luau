local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({
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

return function(p1)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("OpenLeavingRobloxModalInterface", var3)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end