local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.types)
local t = {
	eventName = "LuaHttpClient_RequestTimer",
	description = "Duration for lua-apps http-client HTTP requests, bucketed by analyticsKey",
	lastUpdated = { 26, 5, 29 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaHttpClientRequestTimerEventHundredthsPercent", 0)
}
local t_1 = {
	eventName = "LuaHttpClient_RequestStatus",
	description = "Status code + final state for lua-apps http-client HTTP requests",
	lastUpdated = { 26, 5, 29 },
	backends = { "RobloxTelemetryCounter" }
}
local t_2 = {
	eventName = "LuaHttpClient_PayloadSize",
	description = "Response payload size for lua-apps http-client HTTP requests",
	lastUpdated = { 26, 5, 29 },
	backends = { "RobloxTelemetryStat" }
}
local t_3 = {
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

local function _(p0) --[[ line: 50 | named "payloadSizeOf" ]]
	return if typeof(p0) == "buffer" then buffer.len(p0) elseif typeof(p0) == "string" then string.len(p0) else nil
end

local t_4 = {
	DnsLookupTime = "dnsMs",
	ConnectTime = "connectMs",
	HandshakeTime = "tlsMs",
	TimeToFirstByte = "ttfbMs",
	DownloadTime = "downloadMs",
	TimeTotal = "totalMs"
}

return {
	defaultAnalytics = function(p1, p2, _, p3, p4, p5) --[[ line: 70 ]]
		-- upvalues: t_4 (ref), telemetryService (ref), t (ref), t_1 (ref), t_3 (ref), t_2 (ref)
		local t_5 = {
			analyticsKey = p1,
			method = p2,
			durationMs = p4,
			status = p5
		}
		
		if p3 and p3.stats then
			for i, v in t_4 do
				local var7 = p3.stats[i]
				
				if typeof(var7) == "number" then
					t_5[v] = var7 * 1000
				end
			end
		end
		local var8
		telemetryService:LogEvent(t, { customFields = t_5, standardizedFields = { "addOSInfo" } })
		telemetryService:LogCounter(t_1, {
			customFields = {
				analyticsKey = p1,
				method = p2,
				status = p5,
				statusCode = if p3 then p3.statusCode else "unknown",
				httpError = if p3 and p3.httpError then t_3[p3.httpError] else nil
			}
		})
		
		if p3 then
			local responseBody = p3.responseBody
			var8 = if typeof(responseBody) == "buffer" then buffer.len(responseBody) elseif typeof(responseBody) == "string" then string.len(responseBody) else nil
		else
			var8 = nil
		end
		if var8 ~= nil then
			telemetryService:LogStat(t_2, { customFields = { analyticsKey = p1 } }, var8)
		end
	end
}