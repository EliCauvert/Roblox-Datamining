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

return {
	sendLoadTimerEvent = function(CustomFields)
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogEvent(config, {
			customFields = CustomFields,
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendPageStatusEvent = function(PageKey, p1, p2)
		-- upvalues: TelemetryService (copy), config2 (copy), config4 (copy)
		TelemetryService:LogCounter(config2, {
			customFields = {
				pageKey = PageKey,
				statusCode = p1 or "unknown",
				httpError = if p2 then config4[p2] else nil
			}
		})
	end,
	sendPagePayloadSizeEvent = function(PageKey, Buf: string)
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
	sendLoadMoreEvent = function(SurfaceKey)
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogEvent(config1, {
			customFields = { surfaceKey = SurfaceKey },
			standardizedFields = { "addOSInfo" }
		})
	end
}