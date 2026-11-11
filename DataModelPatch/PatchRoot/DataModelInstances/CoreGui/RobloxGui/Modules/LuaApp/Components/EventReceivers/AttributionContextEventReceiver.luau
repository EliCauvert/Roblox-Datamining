local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local TModule = require(CorePackages.Packages.t)
local HttpService = game:GetService("HttpService")
local Text = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url).APIS_URL .. "v1/attribution-contexts"
game:DefineFastInt("AttributionContextRecordedThrottleHundredthsPercent", 10000)
local config = {
	eventName = "AttributionContextRecorded",
	description = "Outcome of every POST attempt by AttributionContextEventReceiver",
	backends = { Default.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("AttributionContextRecordedThrottleHundredthsPercent"),
	lastUpdated = { 26, 6, 11 }
}

local function recordAttributionContext(Last, p1)
	-- upvalues: HttpService (copy), Default (copy), config (copy), Text (copy)
	local P1 = p1 or {}
	local HttpService1 = P1.httpService or HttpService
	local LoggingProtocol = P1.loggingProtocol or Default
	local NowMs = P1.nowMs or function()
		return DateTime.now().UnixTimestampMillis
	end
	
	local function emit(Status, StatusCode, p2)
		-- upvalues: LoggingProtocol (copy), config (upval)
		LoggingProtocol:logRobloxTelemetryEvent(config, {}, {
			status = Status,
			statusCode = StatusCode or 0,
			latencyMs = p2 or 0
		})
	end
	
	local Body = if type(Last) == "table" then Last.body else nil
	
	if type(Body) == "string" and Body ~= "" then
		local NowMsResult = NowMs()
		HttpService1:RequestInternal({
			Method = "POST",
			Timeout = 5000,
			Url = Text,
			Body = Body,
			Headers = { ["Content-Type"] = "application/json" },
			CachePolicy = Enum.HttpCachePolicy.None
		}):Start(function(p2, p3)
			-- upvalues: NowMs (copy), NowMsResult (copy), emit (copy)
			local NowMsResultDelta = NowMs() - NowMsResult
			
			if not p2 or not p3 then
				emit("NETWORK_ERROR", 0, NowMsResultDelta)
				
				return
			end
			if p3.StatusCode == 200 then
				emit("SUCCESS", p3.StatusCode, NowMsResultDelta)
				
				return
			else
				emit("HTTP_ERROR", p3.StatusCode, NowMsResultDelta)
			end
		end)
		
		return
	else
		LoggingProtocol:logRobloxTelemetryEvent(config, {}, { status = "INVALID_PARAMS", statusCode = 0, latencyMs = 0 })
	end
end

local AttributionContextEventReceiver = RoactModule.PureComponent:extend("AttributionContextEventReceiver")

function AttributionContextEventReceiver.init(p1)
	-- upvalues: MessageBus (copy), TModule (copy), recordAttributionContext (copy)
	local config = {
		mid = MessageBus.getMessageId("Linking", "recordAttributionContext"),
		validateParams = TModule.table
	}
	p1.subscriber = MessageBus.Subscriber.new()
	p1.subscriber:subscribe(config, function(p2)
		-- upvalues: recordAttributionContext (upval)
		recordAttributionContext(p2)
	end, false)
	local Last = MessageBus.getLast(config)
	
	if Last then
		recordAttributionContext(Last)
	end
end

function AttributionContextEventReceiver:render()
	return nil
end

AttributionContextEventReceiver._recordAttributionContext = recordAttributionContext

return AttributionContextEventReceiver