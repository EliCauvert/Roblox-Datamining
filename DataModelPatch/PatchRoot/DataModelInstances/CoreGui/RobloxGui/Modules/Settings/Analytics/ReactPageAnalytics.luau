local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local ReactPageAnalyticsModule = {}
ReactPageAnalyticsModule.__index = ReactPageAnalyticsModule
ReactPageAnalyticsModule.configs = {
	openPage = {
		eventName = "ingame_menu_action",
		description = "Fires when a React menu page is opened",
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = game:DefineFastInt("OpenReactPageThrottleHundredthsPercent", 0),
		lastUpdated = { 2025, 9, 23 }
	},
	closePage = {
		eventName = "ingame_menu_action",
		description = "Fires when a React menu page is closed",
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = game:DefineFastInt("CloseReactPageThrottleHundredthsPercent", 0),
		lastUpdated = { 2025, 9, 23 }
	}
}

function ReactPageAnalyticsModule.new()
	-- upvalues: ReactPageAnalyticsModule (copy)
	return (setmetatable({}, ReactPageAnalyticsModule))
end

function ReactPageAnalyticsModule:_logEventWithStandardizedFields(ClosePage, EventContext, p1)
	-- upvalues: TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy)
	local StandardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	local P3 = p1 or {}
	
	if TelemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(StandardizedFields, "addPlaySessionId")
	else
		P3.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	TelemetryService:LogEvent(ClosePage, {
		eventContext = EventContext,
		standardizedFields = StandardizedFields,
		customFields = P3
	})
end

function ReactPageAnalyticsModule:openPage(p1)
	self:_logEventWithStandardizedFields(self.configs.openPage, `open_{p1}_page`)
end

function ReactPageAnalyticsModule:closePage(p1)
	self:_logEventWithStandardizedFields(self.configs.closePage, `close_{p1}_page`)
end

return ReactPageAnalyticsModule