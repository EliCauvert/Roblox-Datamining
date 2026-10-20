local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameShareExperienceLinkThrottleHundrethsPercent = game:DefineFastInt("GameShareExperienceLinkThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	uid = TModule.string,
	ctx = TModule.string,
	shortShareLinkFailed = TModule.optional(TModule.boolean),
	shareToAppsflyer = TModule.optional(TModule.boolean),
	stamp = TModule.optional(TModule.string),
	linkId = TModule.optional(TModule.string),
	targetId = if require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents then TModule.optional(TModule.string) else nil
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameShareExperienceLinkThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameShareExperienceLinkInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "shareExperienceLink",
		description = "User has shared an experience link",
		backends = { "EventIngest" },
		throttlingPercentage = GameShareExperienceLinkThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end