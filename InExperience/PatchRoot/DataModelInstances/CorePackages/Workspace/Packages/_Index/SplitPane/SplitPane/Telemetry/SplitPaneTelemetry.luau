local Parent = script:FindFirstAncestor("SplitPane").Parent
local TelemetryService = require(Parent.MockableProxyServices).TelemetryService
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local _ = require(Parent.AppSplitView)
local Action = { Launch = 1, Toggle = 2, ViewportChanged = 3 }
local config = {
	eventName = "splitPaneViewChange",
	description = "Resolved split pane visibility at user-session launch, explicit control activation, or viewport change.",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("SplitPaneViewChangeTelemetryThrottleHundredthsPercent", 1),
	lastUpdated = { 2026, 10, 12 }
}
local config1 = {
	eventName = "appLaunchViewport",
	description = "Initial resolved user-session viewport in design-space pixels.",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("AppLaunchViewportTelemetryThrottleHundredthsPercent", 10),
	lastUpdated = { 2026, 10, 12 }
}
local config2 = {
	eventName = "SplitPane_StateChanged",
	description = "Resolved pane mode at user-session launch and changes from toggles or viewport changes.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local config3 = {
	eventName = "SplitPane_PaneControlPressed",
	description = "Activations of the support host Back, Expand/Restore, and Close controls.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local config4 = {
	eventName = "SplitPane_SupportRouteOpened",
	description = "Root support pane transitions from zero routes to one or more, including remounts and fallback returns.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local config5 = {
	[Action.Launch] = "launch",
	[Action.Toggle] = "toggle",
	[Action.ViewportChanged] = "viewport_changed"
}

local function _(p1): boolean --[[ Line: 73 | Named "getIsViewportReady" ]]
	local Number: number? = tonumber(p1.userId)
	
	return Number ~= nil and (Number > 0 and p1.viewportSize ~= nil)
end

return {
	View = { Shown = 1, Hidden = 2 },
	Action = Action,
	Control = { Back = "back", Expand = "expand", Close = "close" },
	getTelemetryStateFromMode = function(p1) --[[ Line: 57 ]]
		return p1 or "inactive"
	end,
	logStateChanged = function(To_state, p1) --[[ Line: 61 ]]
		-- upvalues: TelemetryService (copy), config2 (copy), config5 (copy)
		TelemetryService:LogCounter(config2, {
			customFields = { to_state = To_state, cause = config5[p1] }
		}, 1)
	end,
	logPaneControlPressed = function(Control) --[[ Line: 65 ]]
		-- upvalues: TelemetryService (copy), config3 (copy)
		TelemetryService:LogCounter(config3, { customFields = { control = Control } }, 1)
	end,
	logSupportRouteOpened = function() --[[ Line: 69 ]]
		-- upvalues: TelemetryService (copy), config4 (copy)
		TelemetryService:LogCounter(config4, {}, 1)
	end,
	logSplitPaneViewChange = function(p1, Action): boolean --[[ Line: 78 ]]
		-- upvalues: TelemetryService (copy), config (copy)
		local Number: number? = tonumber(p1.userId)
		
		if Number ~= nil and (Number > 0 and p1.viewportSize ~= nil) then
			local ViewportSize = p1.viewportSize
			TelemetryService:LogEvent(config, {
				customFields = {
					view = p1.view,
					action = Action,
					viewport_width = ViewportSize.X,
					viewport_height = ViewportSize.Y
				}
			})
			
			return true
		else
			return false
		end
	end,
	logAppLaunchViewport = function(p1): boolean --[[ Line: 94 ]]
		-- upvalues: TelemetryService (copy), config1 (copy)
		local Number: number? = tonumber(p1.userId)
		
		if Number ~= nil and (Number > 0 and p1.viewportSize ~= nil) then
			local ViewportSize = p1.viewportSize
			TelemetryService:LogEvent(config1, {
				customFields = {
					viewport_width = ViewportSize.X,
					viewport_height = ViewportSize.Y,
					is_landscape = p1.isLandscape
				}
			})
			
			return true
		else
			return false
		end
	end
}