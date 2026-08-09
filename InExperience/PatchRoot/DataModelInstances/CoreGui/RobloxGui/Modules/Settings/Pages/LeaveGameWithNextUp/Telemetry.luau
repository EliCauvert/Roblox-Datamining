local corePackagesService = game:GetService("CorePackages")
local loggingProtocolModule = require(corePackagesService.Workspace.Packages.LoggingProtocol)
local cryoModule = require(corePackagesService.Packages.Cryo)
local nextUpStateModule = require(script.Parent.NextUpState)
local fFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local default = loggingProtocolModule.default
local var5 = if fFlagEnableNextUpImageLatencyTelemetryModule then {
	LeaveGame = "LeaveGame",
	CloseExitModalClick = "CloseExitModalClick",
	CloseExitModalEscape = "CloseExitModalEscape",
	JoinGame = "JoinGame"
} else nil
local t = {
	eventName = "InGameNextUpExitMenuSortRequestLatency",
	description = "Request latency for In-Game Exit Page network requests",
	backends = { loggingProtocolModule.TelemetryBackends.Stats },
	lastUpdated = { 25, 7, 16 }
}

local function logRequestLatency(p0, p1) --[[ line: 33 ]]
	-- upvalues: default (ref), t (ref)
	default:logRobloxTelemetryStat(t, p1, { endpointName = p0 })
end

local t_1 = {
	eventName = "InGameNextUpExitMenuSortView",
	description = "Next-up sort views from the In-Game Exit Modal",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 7, 16 }
}

local function logNextUpSortView(p2) --[[ line: 48 ]]
	-- upvalues: default (ref), t_1 (ref)
	default:logRobloxTelemetryCounter(t_1, 1, { tilesLoaded = tostring(p2) })
end

local var10 = if fFlagEnableNextUpImageLatencyTelemetryModule then {
	eventName = "InGameNextUpExitMenuSortView",
	description = "Next-up sort views from the In-Game Exit Modal",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("InGameNextUpSortViewEventThrottlingPercentage", 0),
	lastUpdated = { 25, 7, 22 }
} else nil
local var11 = if fFlagEnableNextUpImageLatencyTelemetryModule then function(p3) --[[ line: 67 ]]
	return p3 * 1000
end else nil

return {
	logRequestLatency = logRequestLatency,
	logNextUpSortView = if fFlagEnableNextUpImageLatencyTelemetryModule then nil else logNextUpSortView,
	NextUpSortViewActionType = if fFlagEnableNextUpImageLatencyTelemetryModule then var5 else nil,
	logNextUpExitModalAction = if fFlagEnableNextUpImageLatencyTelemetryModule then if fFlagEnableNextUpImageLatencyTelemetryModule then function(p4) --[[ line: 73 ]]
		-- upvalues: nextUpStateModule (ref), cryoModule (ref), var11 (ref), default (ref), var10 (ref)
		local nextUpComponentSortLatency = nextUpStateModule.getNextUpComponentSortLatency()
		local var13 = cryoModule.List.map(nextUpStateModule.getNextUpTileImageTextureLatencies(), var11)
		default:logRobloxTelemetryEvent(var10, {}, {
			action = p4,
			sortLatency = if nextUpComponentSortLatency then var11(nextUpComponentSortLatency) else nil,
			tileLatencies = if #var13 > 0 then table.concat(var13, ",") else nil
		})
	end else nil else nil
}