local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.types)
local luaHttpClientRequestTimerEventHundredthsPercent = game:DefineFastInt("LuaHttpClientRequestTimerEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientRequestStatusEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent", 0)

local function _(p0)
	return if p0 <= 0 then false else p0 >= 10000 or math.random(1, 10000) <= p0
end

local t = {
	eventName = "LuaHttpClient_RequestTimer",
	description = "Duration for lua-apps http-client HTTP requests, bucketed by analyticsKey",
	lastUpdated = { 26, 5, 29 },
	backends = { "Points", "EventIngest" },
	throttlingPercentage = luaHttpClientRequestTimerEventHundredthsPercent
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

local _ = function(p1)
	return if typeof(p1) == "buffer" then buffer.len(p1) elseif typeof(p1) == "string" then string.len(p1) else nil
end

local list = {
	"DurationInQueue", "DurationNameLookup", "DurationConnect",
	"DurationSSLHandshake", "DurationMakeRequest", "DurationReceiveResponse",
	"RoundTripTime"
}

return {
	defaultAnalytics = function(p2, p3, _, p4, p5, p6)
		-- upvalues: list (ref), telemetryService (ref), t (ref), t_1 (ref), t_3 (ref), t_2 (ref)
		local t_4 = {
			analyticsKey = p2,
			method = p3,
			durationMs = p5,
			status = p6
		}
		
		if p4 and p4.stats then
			for i, v in list do
				local var8 = p4.stats[v]
				
				if typeof(var8) == "number" then
					t_4[v] = var8 * 1000
				end
			end
			local wasRequestRetried = p4.stats.WasRequestRetried
			
			if typeof(wasRequestRetried) == "number" then
				t_4.WasRequestRetried = wasRequestRetried
			end
		end
		local var10
		telemetryService:LogEvent(t, { customFields = t_4, standardizedFields = { "addOSInfo" } })
		local luaHttpClientRequestStatusEventHundredthsPercentFastInt = game:GetFastInt("LuaHttpClientRequestStatusEventHundredthsPercent")
		
		if if luaHttpClientRequestStatusEventHundredthsPercentFastInt <= 0 then false else luaHttpClientRequestStatusEventHundredthsPercentFastInt >= 10000 or math.random(1, 10000) <= luaHttpClientRequestStatusEventHundredthsPercentFastInt then
			telemetryService:LogCounter(t_1, {
				customFields = {
					analyticsKey = p2,
					method = p3,
					status = p6,
					statusCode = if p4 then p4.statusCode else "unknown",
					httpError = if p4 and p4.httpError then t_3[p4.httpError] else nil
				}
			})
		end
		if p4 then
			local responseBody = p4.responseBody
			var10 = if typeof(responseBody) == "buffer" then buffer.len(responseBody) elseif typeof(responseBody) == "string" then string.len(responseBody) else nil
		else
			var10 = nil
		end
		if var10 ~= nil then
			local luaHttpClientPayloadSizeEventHundredthsPercentFastInt = game:GetFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent")
			
			if if luaHttpClientPayloadSizeEventHundredthsPercentFastInt <= 0 then false else luaHttpClientPayloadSizeEventHundredthsPercentFastInt >= 10000 or math.random(1, 10000) <= luaHttpClientPayloadSizeEventHundredthsPercentFastInt then
				telemetryService:LogStat(t_2, { customFields = { analyticsKey = p2 } }, var10)
			end
		end
	end
}