local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.types)
local LuaHttpClientRequestTimerEventHundredthsPercent = game:DefineFastInt("LuaHttpClientRequestTimerEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientRequestStatusEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent", 0)

local function _(p1: number): boolean --[[ Line: 18 | Named "shouldSample" ]]
	return p1 > 0 and (p1 >= 10000 or math.random(1, 10000) <= p1)
end

local config = {
	eventName = "LuaHttpClient_RequestTimer",
	description = "Duration for lua-apps http-client HTTP requests, bucketed by analyticsKey",
	lastUpdated = { 26, 5, 29 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = LuaHttpClientRequestTimerEventHundredthsPercent
}
local config1 = {
	eventName = "LuaHttpClient_RequestStatus",
	description = "Status code + final state for lua-apps http-client HTTP requests",
	lastUpdated = { 26, 5, 29 },
	backends = { "RobloxTelemetryCounter" }
}
local config2 = {
	eventName = "LuaHttpClient_PayloadSize",
	description = "Response payload size for lua-apps http-client HTTP requests",
	lastUpdated = { 26, 5, 29 },
	backends = { "RobloxTelemetryStat" }
}
local config3 = {
	[Enum.HttpError.OK] = "OK",
	[Enum.HttpError.InvalidUrl] = "InvalidUrl",
	[Enum.HttpError.DnsResolve] = "DnsResolve",
	[Enum.HttpError.ConnectFail] = "ConnectFail",
	[Enum.HttpError.OutOfMemory] = "OutOfMemory",
	[Enum.HttpError.TimedOut] = "TimedOut",
	[Enum.HttpError.TooManyRedirects] = "TooManyRedirects",
	[Enum.HttpError.InvalidRedirect] = "InvalidRedirect",
	[Enum.HttpError.NetFail] = "NetFail",
	[Enum.HttpError.Aborted] = "Aborted",
	[Enum.HttpError.SslConnectFail] = "SslConnectFail",
	[Enum.HttpError.SslVerificationFail] = "SslVerificationFail",
	[Enum.HttpError.Unknown] = "Unknown"
}

local _ = function(Buf: string) --[[ Line: 66 | Named "payloadSizeOf" ]]
	return if typeof(Buf) == "buffer" then buffer.len(Buf) elseif typeof(Buf) == "string" then string.len(Buf) else nil
end

local list = {
	"DurationInQueue", "DurationNameLookup", "DurationConnect",
	"DurationSSLHandshake", "DurationMakeRequest", "DurationReceiveResponse",
	"RoundTripTime"
}

return {
	defaultAnalytics = function(AnalyticsKey, Method, _, p1, DurationMs, Status) --[[ Line: 87 ]]
		-- upvalues: list (copy), TelemetryService (copy), config (copy), config1 (copy), config3 (copy), config2 (copy)
		local CustomFields = {
			analyticsKey = AnalyticsKey,
			method = Method,
			durationMs = DurationMs,
			status = Status
		}
		
		if p1 and p1.stats then
			for _, value in list do
				local Stat: number = p1.stats[value]
				
				if typeof(Stat) == "number" then
					CustomFields[value] = Stat * 1000
				end
			end
			local WasRequestRetried = p1.stats.WasRequestRetried
			
			if typeof(WasRequestRetried) == "number" then
				CustomFields.WasRequestRetried = WasRequestRetried
			end
		end
		TelemetryService:LogEvent(config, {
			customFields = CustomFields,
			standardizedFields = { "addOSInfo" }
		})
		local LuaHttpClientRequestStatusEventHundredthsPercentFastInt: number = game:GetFastInt("LuaHttpClientRequestStatusEventHundredthsPercent")
		
		if LuaHttpClientRequestStatusEventHundredthsPercentFastInt > 0 and (LuaHttpClientRequestStatusEventHundredthsPercentFastInt >= 10000 or LuaHttpClientRequestStatusEventHundredthsPercentFastInt >= math.random(1, 10000)) then
			TelemetryService:LogCounter(config1, {
				customFields = {
					analyticsKey = AnalyticsKey,
					method = Method,
					status = Status,
					statusCode = p1 and p1.statusCode or "unknown",
					httpError = if p1 and p1.httpError then config3[p1.httpError] else nil
				}
			})
		end
		local Length = nil
		if p1 then
			local ResponseBody: string = p1.responseBody
			Length = if typeof(ResponseBody) == "buffer" then buffer.len(ResponseBody) elseif typeof(ResponseBody) == "string" then string.len(ResponseBody) else nil
		else
			Length = nil
		end
		if Length ~= nil then
			local LuaHttpClientPayloadSizeEventHundredthsPercentFastInt: number = game:GetFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent")
			
			if LuaHttpClientPayloadSizeEventHundredthsPercentFastInt > 0 and (LuaHttpClientPayloadSizeEventHundredthsPercentFastInt >= 10000 or LuaHttpClientPayloadSizeEventHundredthsPercentFastInt >= math.random(1, 10000)) then
				TelemetryService:LogStat(config2, { customFields = { analyticsKey = AnalyticsKey } }, Length)
			end
		end
	end
}