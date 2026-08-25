local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameCopyExperienceLinkThrottleHundrethsPercent = game:DefineFastInt("GameCopyExperienceLinkThrottleHundrethsPercent", 10000)
local var3 = tModule.strictInterface({
	placeId = tModule.string,
	uid = tModule.string,
	ctx = tModule.string,
	stamp = tModule.optional(tModule.string)
})

return function(p0, p1)
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameCopyExperienceLinkThrottleHundrethsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameCopyExperienceLinkInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "copyExperienceLink",
		description = "User has copied an experience link",
		backends = { "EventIngest" },
		throttlingPercentage = gameCopyExperienceLinkThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end