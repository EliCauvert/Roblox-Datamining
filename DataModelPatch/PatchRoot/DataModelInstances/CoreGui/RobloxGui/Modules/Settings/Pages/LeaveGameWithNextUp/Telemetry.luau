local CorePackages = game:GetService("CorePackages")
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local CryoModule = require(CorePackages.Packages.Cryo)
local NextUpStateModule = require(script.Parent.NextUpState)
local FFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local Default = LoggingProtocolModule.default
local Config = if FFlagEnableNextUpImageLatencyTelemetryModule then {
	LeaveGame = "LeaveGame",
	CloseExitModalClick = "CloseExitModalClick",
	CloseExitModalEscape = "CloseExitModalEscape",
	JoinGame = "JoinGame"
} else nil
local config = {
	eventName = "InGameNextUpExitMenuSortRequestLatency",
	description = "Request latency for In-Game Exit Page network requests",
	backends = { LoggingProtocolModule.TelemetryBackends.Stats },
	lastUpdated = { 25, 7, 16 }
}
local config1 = {
	eventName = "InGameNextUpExitMenuSortView",
	description = "Next-up sort views from the In-Game Exit Modal",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 7, 16 }
}

local function logNextUpSortView(p1)
	-- upvalues: Default (copy), config1 (copy)
	Default:logRobloxTelemetryCounter(config1, 1, { tilesLoaded = tostring(p1) })
end

local Config1 = if FFlagEnableNextUpImageLatencyTelemetryModule then {
	eventName = "InGameNextUpExitMenuSortView",
	description = "Next-up sort views from the In-Game Exit Modal",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("InGameNextUpSortViewEventThrottlingPercentage", 0),
	lastUpdated = { 25, 7, 22 }
} else nil
local Callback = if FFlagEnableNextUpImageLatencyTelemetryModule then function(p1: number): number
	return p1 * 1000
end else nil
local v1 = if FFlagEnableNextUpImageLatencyTelemetryModule then function(Action)
	-- upvalues: NextUpStateModule (copy), CryoModule (copy), Callback (copy), Default (copy), Config1 (copy)
	local NextUpComponentSortLatency = NextUpStateModule.getNextUpComponentSortLatency()
	local MapResult = CryoModule.List.map(NextUpStateModule.getNextUpTileImageTextureLatencies(), Callback)
	Default:logRobloxTelemetryEvent(Config1, {}, {
		action = Action,
		sortLatency = if NextUpComponentSortLatency then Callback(NextUpComponentSortLatency) else nil,
		tileLatencies = if #MapResult > 0 then table.concat(MapResult, ",") else nil
	})
end else nil

return {
	logRequestLatency = function(EndpointName, p1)
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryStat(config, p1, { endpointName = EndpointName })
	end,
	logNextUpSortView = if FFlagEnableNextUpImageLatencyTelemetryModule then nil else logNextUpSortView,
	NextUpSortViewActionType = if FFlagEnableNextUpImageLatencyTelemetryModule then Config else nil,
	logNextUpExitModalAction = if FFlagEnableNextUpImageLatencyTelemetryModule then v1 else nil
}