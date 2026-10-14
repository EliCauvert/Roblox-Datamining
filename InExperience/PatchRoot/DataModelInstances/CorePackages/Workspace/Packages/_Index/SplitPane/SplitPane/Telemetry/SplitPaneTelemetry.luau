local parent = script:FindFirstAncestor("SplitPane").Parent
local telemetryService = require(parent.MockableProxyServices).TelemetryService
local loggingProtocolModule = require(parent.LoggingProtocol)
local _ = require(parent.AppSplitView)
local t = { Shown = 1, Hidden = 2 }
local t_1 = { Launch = 1, Toggle = 2, ViewportChanged = 3 }
local t_2 = { Back = "back", Expand = "expand", Close = "close" }
local t_3 = {
	eventName = "splitPaneViewChange",
	description = "Resolved split pane visibility at user-session launch, explicit control activation, or viewport change.",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("SplitPaneViewChangeTelemetryThrottleHundredthsPercent", 1),
	lastUpdated = { 2026, 10, 12 }
}
local t_4 = {
	eventName = "appLaunchViewport",
	description = "Initial resolved user-session viewport in design-space pixels.",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("AppLaunchViewportTelemetryThrottleHundredthsPercent", 10),
	lastUpdated = { 2026, 10, 12 }
}
local t_5 = {
	eventName = "SplitPane_StateChanged",
	description = "Resolved pane mode at user-session launch and changes from toggles or viewport changes.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local t_6 = {
	eventName = "SplitPane_PaneControlPressed",
	description = "Activations of the support host Back, Expand/Restore, and Close controls.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local t_7 = {
	eventName = "SplitPane_SupportRouteOpened",
	description = "Root support pane transitions from zero routes to one or more, including remounts and fallback returns.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 12 }
}
local t_8 = {
	[t_1.Launch] = "launch",
	[t_1.Toggle] = "toggle",
	[t_1.ViewportChanged] = "viewport_changed"
}

local function _(p1)
	local var1 = tonumber(p1.userId)
	
	return var1 ~= nil and (var1 > 0 and p1.viewportSize ~= nil)
end

return {
	View = t,
	Action = t_1,
	Control = t_2,
	getTelemetryStateFromMode = function(p1)
		return p1 or "inactive"
	end,
	logStateChanged = function(p1, p2)
		-- upvalues: telemetryService (ref), t_5 (ref), t_8 (ref)
		telemetryService:LogCounter(t_5, { customFields = { to_state = p1, cause = t_8[p2] } }, 1)
	end,
	logPaneControlPressed = function(p1)
		-- upvalues: telemetryService (ref), t_6 (ref)
		telemetryService:LogCounter(t_6, { customFields = { control = p1 } }, 1)
	end,
	logSupportRouteOpened = function()
		-- upvalues: telemetryService (ref), t_7 (ref)
		telemetryService:LogCounter(t_7, {}, 1)
	end,
	logSplitPaneViewChange = function(p1, p2)
		-- upvalues: telemetryService (ref), t_3 (ref)
		local var1 = tonumber(p1.userId)
		
		if var1 ~= nil and (var1 > 0 and p1.viewportSize ~= nil) then
			local viewportSize = p1.viewportSize
			telemetryService:LogEvent(t_3, {
				customFields = {
					view = p1.view,
					action = p2,
					viewport_width = viewportSize.X,
					viewport_height = viewportSize.Y
				}
			})
			
			return true
		end
		return false
	end,
	logAppLaunchViewport = function(p1)
		-- upvalues: telemetryService (ref), t_4 (ref)
		local var1 = tonumber(p1.userId)
		
		if var1 ~= nil and (var1 > 0 and p1.viewportSize ~= nil) then
			local viewportSize = p1.viewportSize
			telemetryService:LogEvent(t_4, {
				customFields = {
					viewport_width = viewportSize.X,
					viewport_height = viewportSize.Y,
					is_landscape = p1.isLandscape
				}
			})
			
			return true
		end
		return false
	end
}