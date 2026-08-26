local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.types)
local luaHttpClientRequestTimerEventHundredthsPercent = game:DefineFastInt("LuaHttpClientRequestTimerEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientRequestStatusEventHundredthsPercent", 0)
game:DefineFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent", 0)

local function _(p1)
	return if p1 <= 0 then false else p1 >= 10000 or math.random(1, 10000) <= p1
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
	defaultAnalytics = function(p1, p2, _, p3, p4, p5)
		-- upvalues: list (ref), telemetryService (ref), t (ref), t_1 (ref), t_3 (ref), t_2 (ref)
		local t_4 = {
			analyticsKey = p1,
			method = p2,
			durationMs = p4,
			status = p5
		}
		
		if p3 and p3.stats then
			for i, v in list do
				local var1 = p3.stats[v]
				
				if typeof(var1) == "number" then
					t_4[v] = var1 * 1000
				end
			end
			local wasRequestRetried = p3.stats.WasRequestRetried
			
			if typeof(wasRequestRetried) == "number" then
				t_4.WasRequestRetried = wasRequestRetried
			end
		end
		local var2
		telemetryService:LogEvent(t, { customFields = t_4, standardizedFields = { "addOSInfo" } })
		local luaHttpClientRequestStatusEventHundredthsPercentFastInt = game:GetFastInt("LuaHttpClientRequestStatusEventHundredthsPercent")
		
		if if luaHttpClientRequestStatusEventHundredthsPercentFastInt <= 0 then false else luaHttpClientRequestStatusEventHundredthsPercentFastInt >= 10000 or math.random(1, 10000) <= luaHttpClientRequestStatusEventHundredthsPercentFastInt then
			telemetryService:LogCounter(t_1, {
				customFields = {
					analyticsKey = p1,
					method = p2,
					status = p5,
					statusCode = if p3 then p3.statusCode else "unknown",
					httpError = if p3 and p3.httpError then t_3[p3.httpError] else nil
				}
			})
		end
		if p3 then
			local responseBody = p3.responseBody
			var2 = if typeof(responseBody) == "buffer" then buffer.len(responseBody) elseif typeof(responseBody) == "string" then string.len(responseBody) else nil
		else
			var2 = nil
		end
		if var2 ~= nil then
			local luaHttpClientPayloadSizeEventHundredthsPercentFastInt = game:GetFastInt("LuaHttpClientPayloadSizeEventHundredthsPercent")
			
			if if luaHttpClientPayloadSizeEventHundredthsPercentFastInt <= 0 then false else luaHttpClientPayloadSizeEventHundredthsPercentFastInt >= 10000 or math.random(1, 10000) <= luaHttpClientPayloadSizeEventHundredthsPercentFastInt then
				telemetryService:LogStat(t_2, { customFields = { analyticsKey = p1 } }, var2)
			end
		end
	end
}