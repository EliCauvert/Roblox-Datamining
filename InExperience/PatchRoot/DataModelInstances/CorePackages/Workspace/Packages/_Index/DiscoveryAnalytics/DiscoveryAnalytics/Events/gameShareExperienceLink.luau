local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameShareExperienceLinkThrottleHundrethsPercent = game:DefineFastInt("GameShareExperienceLinkThrottleHundrethsPercent", 10000)
local var3 = tModule.strictInterface({
	placeId = tModule.string,
	uid = tModule.string,
	ctx = tModule.string,
	shortShareLinkFailed = tModule.optional(tModule.boolean),
	shareToAppsflyer = tModule.optional(tModule.boolean),
	stamp = tModule.optional(tModule.string),
	linkId = tModule.optional(tModule.string)
})

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameShareExperienceLinkThrottleHundrethsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameShareExperienceLinkInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "shareExperienceLink",
		description = "User has shared an experience link",
		backends = { "EventIngest" },
		throttlingPercentage = gameShareExperienceLinkThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end