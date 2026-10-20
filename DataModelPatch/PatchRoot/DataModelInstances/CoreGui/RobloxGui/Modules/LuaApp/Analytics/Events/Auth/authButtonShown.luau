local TelemetryService = game:GetService("TelemetryService")
local FFlagEnableAuthButtonShownEvent = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableAuthButtonShownEvent
local config = {
	throttlingPercentage = 10000,
	description = "Event fired when an auth button is shown",
	links = "https://roblox.atlassian.net/wiki/spaces/Client/pages/2496467637/Engine+Telemetry+V2+API+Migration+Guide",
	eventName = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.EventStreamConstants).AuthEventName.AuthButtonShown,
	backends = { "EventIngest" },
	lastUpdated = { 2026, 6, 10 }
}

return function(_, EventContext, Btn, State, Origin, Url)
	-- upvalues: FFlagEnableAuthButtonShownEvent (copy), TelemetryService (copy), config (copy)
	if not FFlagEnableAuthButtonShownEvent then return end
	local CustomFields = {}
	
	if Btn then
		CustomFields.btn = Btn
	end
	if State then
		CustomFields.state = State
	end
	if Origin then
		CustomFields.origin = Origin
	end
	if Url then
		CustomFields.url = Url
	end
	TelemetryService:LogEvent(config, { eventContext = EventContext, customFields = CustomFields })
end