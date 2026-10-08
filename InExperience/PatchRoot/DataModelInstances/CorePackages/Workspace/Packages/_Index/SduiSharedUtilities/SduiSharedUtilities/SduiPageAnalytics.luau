local telemetryService = game:GetService("TelemetryService")
local _ = require(script:FindFirstAncestor("SduiSharedUtilities").SduiIntegrationTypes)
local t = {
	eventName = "Sdui_PageLoadTimer",
	description = "Duration for sdui page loading, network requests",
	lastUpdated = { 25, 11, 18 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SduiPageTimerEventHundredthsPercent", 0)
}
local t_1 = {
	eventName = "Sdui_LoadMoreFromApi",
	description = "Event log for pagination request",
	lastUpdated = { 26, 1, 9 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SduiLoadMoreFromApiEventHundredthsPercent", 0)
}
local t_2 = {
	eventName = "Sdui_PageStatus",
	description = "Status code for sdui page requests",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 11, 18 }
}
local t_3 = {
	eventName = "Sdui_PagePayloadSize",
	description = "Payload size for sdui page requests",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 25, 11, 19 }
}
local t_4 = {
	eventName = "Sdui_RequestOutcome",
	description = "Terminal outcome of sdui page requests, bucketed by endpoint",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 31 }
}
local t_5 = {
	eventName = "Sdui_RequestRetry",
	description = "Retry attempts for sdui page requests, bucketed by endpoint",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 31 }
}

local function sendLoadTimerEvent(p1)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, { customFields = p1, standardizedFields = { "addOSInfo" } })
end

local t_6 = {
	[Enum.HttpError.OK] = "OK",
	[Enum.HttpError.InvalidUrl] = "InvalidUrl",
	[Enum.HttpError.DnsResolve] = "DnsResolve",
	[Enum.HttpError.ConnectFail] = "ConnectFail",
	[Enum.HttpError.OutOfMemory] = "OutOfMemory",
	[Enum.HttpError.TimedOut] = "Timedout",
	[Enum.HttpError.TooManyRedirects] = "TooManyRedirects",
	[Enum.HttpError.InvalidRedirect] = "InvalidRedirect",
	[Enum.HttpError.NetFail] = "NetFail",
	[Enum.HttpError.Aborted] = "Aborted",
	[Enum.HttpError.SslConnectFail] = "SslConnectFail",
	[Enum.HttpError.SslVerificationFail] = "SslVerificationFail",
	[Enum.HttpError.Unknown] = "Unknown"
}

local function sendPageStatusEvent(p1, p2, p3)
	-- upvalues: telemetryService (ref), t_2 (ref), t_6 (ref)
	telemetryService:LogCounter(t_2, {
		customFields = {
			pageKey = p1,
			statusCode = p2 or "unknown",
			httpError = if p3 then t_6[p3] else nil
		}
	})
end

local function sendPagePayloadSizeEvent(p1, p2)
	-- upvalues: telemetryService (ref), t_3 (ref)
	local var1 = nil
	
	if typeof(p2) == "buffer" then
		var1 = buffer.len(p2)
	elseif typeof(p2) == "string" then
		var1 = string.len(p2)
	else
		return
	end
	telemetryService:LogStat(t_3, { customFields = { pageKey = p1 } }, var1)
end

local function sendRequestOutcomeCounter(p1, p2, p3, p4, p5)
	-- upvalues: telemetryService (ref), t_4 (ref), t_6 (ref)
	telemetryService:LogCounter(t_4, {
		customFields = {
			pageKey = p1,
			endpoint = p2,
			outcome = p3,
			statusCode = p4 or "unknown",
			httpError = if p5 == nil or p5 == Enum.HttpError.OK then nil else t_6[p5]
		}
	})
end

local function sendRequestRetryCounter(p1, p2, p3)
	-- upvalues: telemetryService (ref), t_5 (ref)
	telemetryService:LogCounter(t_5, {
		customFields = { pageKey = p1, endpoint = p2, attempt = p3 }
	})
end

local t_7 = {
	eventName = "Sdui_MissingRoot",
	description = "Mounted SDUI content has no root after the request deadline and grace period",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 10, 5 }
}
local t_8 = {
	eventName = "Sdui_StaleResponseDiscarded",
	description = "SDUI response work discarded after the authenticated account changed",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 10, 6 }
}

return {
	sendLoadTimerEvent = sendLoadTimerEvent,
	sendPageStatusEvent = sendPageStatusEvent,
	sendPagePayloadSizeEvent = sendPagePayloadSizeEvent,
	sendLoadMoreEvent = function(p1)
		-- upvalues: telemetryService (ref), t_1 (ref)
		telemetryService:LogEvent(t_1, {
			customFields = { surfaceKey = p1 },
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendRequestOutcomeCounter = sendRequestOutcomeCounter,
	sendRequestRetryCounter = sendRequestRetryCounter,
	sendMissingRoot = function(p1, p2, p3)
		-- upvalues: telemetryService (ref), t_7 (ref)
		telemetryService:LogCounter(t_7, {
			customFields = {
				surface = p1,
				status = if p2 == "Ready" or p2 == "NotReady" or p2 == "Failed" then p2 else "unknown",
				inFlight = tostring(p3)
			},
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendStaleResponseDiscarded = function(p1, p2, p3)
		-- upvalues: telemetryService (ref), t_8 (ref)
		telemetryService:LogCounter(t_8, {
			customFields = { surface = p1, mode = p2, stage = p3 },
			standardizedFields = { "addOSInfo" }
		})
	end
}