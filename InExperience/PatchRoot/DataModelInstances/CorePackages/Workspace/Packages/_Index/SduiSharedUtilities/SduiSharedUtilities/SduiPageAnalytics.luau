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
	sendLoadTimerEvent = function(p0)
		-- upvalues: telemetryService (ref), t (ref)
		telemetryService:LogEvent(t, { customFields = p0, standardizedFields = { "addOSInfo" } })
	end,
	sendPageStatusEvent = function(p1, p2, p3)
		-- upvalues: telemetryService (ref), t_2 (ref), t_4 (ref)
		telemetryService:LogCounter(t_2, {
			customFields = {
				pageKey = p1,
				statusCode = p2 or "unknown",
				httpError = if p3 then t_4[p3] else nil
			}
		})
	end,
	sendPagePayloadSizeEvent = function(p4, p5)
		-- upvalues: telemetryService (ref), t_3 (ref)
		local var6 = nil
		
		if typeof(p5) == "buffer" then
			var6 = buffer.len(p5)
		elseif typeof(p5) == "string" then
			var6 = string.len(p5)
		else
			return
		end
		telemetryService:LogStat(t_3, { customFields = { pageKey = p4 } }, var6)
	end,
	sendLoadMoreEvent = function(p6)
		-- upvalues: telemetryService (ref), t_1 (ref)
		telemetryService:LogEvent(t_1, {
			customFields = { surfaceKey = p6 },
			standardizedFields = { "addOSInfo" }
		})
	end
}