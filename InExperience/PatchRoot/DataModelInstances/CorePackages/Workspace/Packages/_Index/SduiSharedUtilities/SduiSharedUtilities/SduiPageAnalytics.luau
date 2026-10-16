local TelemetryService = game:GetService("TelemetryService")
local _ = require(script:FindFirstAncestor("SduiSharedUtilities").SduiIntegrationTypes)
local config = {
	eventName = "Sdui_PageLoadTimer",
	description = "Duration for sdui page loading, network requests",
	lastUpdated = { 25, 11, 18 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SduiPageTimerEventHundredthsPercent", 0)
}
local config1 = {
	eventName = "Sdui_LoadMoreFromApi",
	description = "Event log for pagination request",
	lastUpdated = { 26, 1, 9 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SduiLoadMoreFromApiEventHundredthsPercent", 0)
}
local config2 = {
	eventName = "Sdui_PageStatus",
	description = "Status code for sdui page requests",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 11, 18 }
}
local config3 = {
	eventName = "Sdui_PagePayloadSize",
	description = "Payload size for sdui page requests",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 25, 11, 19 }
}
local config4 = {
	eventName = "Sdui_RequestOutcome",
	description = "Terminal outcome of sdui page requests, bucketed by endpoint",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 31 }
}
local config5 = {
	eventName = "Sdui_RequestRetry",
	description = "Retry attempts for sdui page requests, bucketed by endpoint",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 31 }
}
local config6 = {
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
local config7 = {
	eventName = "Sdui_MissingRoot",
	description = "Mounted SDUI content has no root after the request deadline and grace period",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 10, 5 }
}
local config8 = {
	eventName = "Sdui_StaleResponseDiscarded",
	description = "SDUI response work discarded after the authenticated account changed",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 10, 6 }
}

return {
	sendLoadTimerEvent = function(CustomFields) --[[ Line: 84 ]]
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogEvent(config, {
			customFields = CustomFields,
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendPageStatusEvent = function(PageKey, p1, p2) --[[ Line: 107 ]]
		-- upvalues: TelemetryService (copy), config2 (copy), config6 (copy)
		TelemetryService:LogCounter(config2, {
			customFields = {
				pageKey = PageKey,
				statusCode = p1 or "unknown",
				httpError = if p2 then config6[p2] else nil
			}
		})
	end,
	sendPagePayloadSizeEvent = function(PageKey, Buf: string) --[[ Line: 117 ]]
		-- upvalues: TelemetryService (copy), config3 (copy)
		local Length: number? = nil
		
		if typeof(Buf) == "buffer" then
			Length = buffer.len(Buf)
		else
			if typeof(Buf) ~= "string" then return end
			Length = string.len(Buf)
		end
		TelemetryService:LogStat(config3, { customFields = { pageKey = PageKey } }, Length)
	end,
	sendLoadMoreEvent = function(SurfaceKey) --[[ Line: 208 ]]
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogEvent(config1, {
			customFields = { surfaceKey = SurfaceKey },
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendRequestOutcomeCounter = function(PageKey, Endpoint, Outcome, p1, HttpError) --[[ Line: 138 ]]
		-- upvalues: TelemetryService (copy), config4 (copy), config6 (copy)
		TelemetryService:LogCounter(config4, {
			customFields = {
				pageKey = PageKey,
				endpoint = Endpoint,
				outcome = Outcome,
				statusCode = p1 or "unknown",
				httpError = if HttpError == nil or HttpError == Enum.HttpError.OK then nil else config6[HttpError]
			}
		})
	end,
	sendRequestRetryCounter = function(PageKey, Endpoint, Attempt) --[[ Line: 160 ]]
		-- upvalues: TelemetryService (copy), config5 (copy)
		TelemetryService:LogCounter(config5, {
			customFields = {
				pageKey = PageKey,
				endpoint = Endpoint,
				attempt = Attempt
			}
		})
	end,
	sendMissingRoot = function(Surface, p1, p2) --[[ Line: 177 ]]
		-- upvalues: TelemetryService (copy), config7 (copy)
		TelemetryService:LogCounter(config7, {
			customFields = {
				surface = Surface,
				status = if p1 == "Ready" or p1 == "NotReady" or p1 == "Failed" then p1 else "unknown",
				inFlight = tostring(p2)
			},
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendStaleResponseDiscarded = function(Surface, Mode, Stage) --[[ Line: 197 ]]
		-- upvalues: TelemetryService (copy), config8 (copy)
		TelemetryService:LogCounter(config8, {
			customFields = { surface = Surface, mode = Mode, stage = Stage },
			standardizedFields = { "addOSInfo" }
		})
	end
}