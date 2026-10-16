local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({
	assignment_id = TModule.number,
	assignment_type = TModule.string,
	social_link_type = TModule.string,
	social_link_display_type = TModule.string
})
local config = {
	eventName = "openLeavingRobloxModal",
	description = "Event fired when a prompt is opened to confirm that the user wants to leave roblox",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("OpenLeavingRobloxModalThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 12, 9 }
}

return function(CustomFields) --[[ Line: 27 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("OpenLeavingRobloxModalInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end