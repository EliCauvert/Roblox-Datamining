local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local loggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local openReactPageThrottleHundredthsPercent = game:DefineFastInt("OpenReactPageThrottleHundredthsPercent", 0)
local closeReactPageThrottleHundredthsPercent = game:DefineFastInt("CloseReactPageThrottleHundredthsPercent", 0)
local t = {}
t.__index = t
t.configs = {
	openPage = {
		eventName = "ingame_menu_action",
		description = "Fires when a React menu page is opened",
		backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = openReactPageThrottleHundredthsPercent,
		lastUpdated = { 2025, 9, 23 }
	},
	closePage = {
		eventName = "ingame_menu_action",
		description = "Fires when a React menu page is closed",
		backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = closeReactPageThrottleHundredthsPercent,
		lastUpdated = { 2025, 9, 23 }
	}
}

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t._logEventWithStandardizedFields(_, p0, p1, p2)
	-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
	local list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	p2 = p2 or {}
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(list, "addPlaySessionId")
	else
		p2.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	telemetryService:LogEvent(p0, {
		eventContext = p1,
		standardizedFields = list,
		customFields = p2
	})
end

function t:openPage(p3)
	self:_logEventWithStandardizedFields(self.configs.openPage, `open_{p3}_page`)
end

function t:closePage(p4)
	self:_logEventWithStandardizedFields(self.configs.closePage, `close_{p4}_page`)
end

return t