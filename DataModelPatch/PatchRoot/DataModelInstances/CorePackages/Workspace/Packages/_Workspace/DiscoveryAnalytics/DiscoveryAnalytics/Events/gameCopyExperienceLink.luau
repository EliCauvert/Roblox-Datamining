local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameCopyExperienceLinkThrottleHundrethsPercent = game:DefineFastInt("GameCopyExperienceLinkThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	uid = TModule.string,
	ctx = TModule.string,
	stamp = TModule.optional(TModule.string)
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameCopyExperienceLinkThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameCopyExperienceLinkInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "copyExperienceLink",
		description = "User has copied an experience link",
		backends = { "EventIngest" },
		throttlingPercentage = GameCopyExperienceLinkThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end