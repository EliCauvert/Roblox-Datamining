local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameCopyExperienceLinkThrottleHundrethsPercent = game:DefineFastInt("GameCopyExperienceLinkThrottleHundrethsPercent", 10000)
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	uid = tModule.string,
	ctx = tModule.string,
	stamp = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), gameCopyExperienceLinkThrottleHundrethsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameCopyExperienceLinkInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "copyExperienceLink",
		description = "User has copied an experience link",
		backends = { "EventIngest" },
		throttlingPercentage = gameCopyExperienceLinkThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end