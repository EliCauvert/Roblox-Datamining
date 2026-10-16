local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.LinkingProtocolTypes)
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }
local config = {
	eventName = "StartAttributionDecisionPublishedCounter",
	description = "\t\tCounts delayed-AppsFlyer-start decisions published to native. Custom field\n\t\t\"trigger\" is Auth / SessionStart / ConsentChanged (ConsentChanged isolates the\n\t\tlive mid-session sell/share toggle); \"applySharingFilter\" is whether the\n\t\tpartner-postback filter was applied.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 9, 1 }
}

return {
	logDecisionPublished = function(Trigger, ApplySharingFilter) --[[ Line: 33 ]]
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				trigger = Trigger,
				applySharingFilter = ApplySharingFilter
			}
		}, 1)
	end
}