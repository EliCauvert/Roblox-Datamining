local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.LinkingProtocolTypes)
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }
local t = {
	eventName = "StartAttributionDecisionPublishedCounter",
	description = "\t\tCounts delayed-AppsFlyer-start decisions published to native. Custom field\n\t\t\"trigger\" is Auth / SessionStart / ConsentChanged (ConsentChanged isolates the\n\t\tlive mid-session sell/share toggle); \"applySharingFilter\" is whether the\n\t\tpartner-postback filter was applied.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 9, 1 }
}

return {
	logDecisionPublished = function(p1, p2)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogCounter(t, {
			standardizedFields = list,
			customFields = { trigger = p1, applySharingFilter = p2 }
		}, 1)
	end
}