local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local TModule = require(CorePackages.Packages.t)
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local FFlagEnableDeeplinkResolutionEventReceiverModule = require(Modules.LuaApp.Flags.FFlagEnableDeeplinkResolutionEventReceiver)
local Text = require(Modules.LuaApp.Http.Url).APIS_URL .. "v1/resolve/"
game:DefineFastInt("DeferredDeeplinkResolvedThrottleHundredthsPercent", 10000)
local config = {
	eventName = "DeferredDeeplinkResolved",
	description = "Outcome of every resolve attempt by DeeplinkResolutionEventReceiver",
	backends = { Default.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("DeferredDeeplinkResolvedThrottleHundredthsPercent"),
	lastUpdated = { 26, 5, 18 }
}

local function _(UserInputService): string
	local Platform = UserInputService:GetPlatform()
	
	return if Platform == Enum.Platform.IOS then "iOS" elseif Platform == Enum.Platform.Android then "Android" else "Unknown"
end

local function resolveAndRoute(p1, p2)
	-- upvalues: HttpService (copy), UserInputService (copy), LinkingProtocol (copy), Default (copy), IXPServiceWrapper (copy), AppBtidLayers (copy), config (copy), Text (copy)
	local P2 = p2 or {}
	local HttpService1 = P2.httpService or HttpService
	local UserInputService1 = P2.userInputService or UserInputService
	local LinkingProtocol1 = P2.linkingProtocol or LinkingProtocol.default
	local LoggingProtocol = P2.loggingProtocol or Default
	local IxpWrapper = P2.ixpWrapper or IXPServiceWrapper
	local NowMs = P2.nowMs or function()
		return DateTime.now().UnixTimestampMillis
	end
	local AttributionAdName = if type(p1) == "table" then p1.attributionAdName else nil
	
	if type(AttributionAdName) ~= "string" or AttributionAdName == "" then return end
	local BTIDLayerData = IxpWrapper:GetBTIDLayerData(AppBtidLayers.DeferredDeeplinkResolutionLayer)
	IxpWrapper:LogBrowserTrackerLayerExposure(AppBtidLayers.DeferredDeeplinkResolutionLayer)
	
	if type(BTIDLayerData) == "table" and BTIDLayerData.IsResolutionEnabled == true then
		local Platform = UserInputService1:GetPlatform()
		local IOS: string = if Platform == Enum.Platform.IOS then "iOS" elseif Platform == Enum.Platform.Android then "Android" else "Unknown"
		local NowMsResult = NowMs()
		
		local function emit(Status, Url)
			-- upvalues: LoggingProtocol (copy), config (upval), AttributionAdName (copy), NowMs (copy), NowMsResult (copy), IOS (copy)
			LoggingProtocol:logRobloxTelemetryEvent(config, {}, {
				attributionAdName = AttributionAdName,
				status = Status,
				latencyMs = NowMs() - NowMsResult,
				resolvedUrl = Url or "",
				platform = IOS
			})
		end
		
		HttpService1:RequestInternal({
			Method = "GET",
			Timeout = 5000,
			Url = Text .. HttpService1:UrlEncode(AttributionAdName),
			Headers = { ["X-Roblox-Platform"] = IOS },
			CachePolicy = Enum.HttpCachePolicy.None
		}):Start(function(p3, p4)
			-- upvalues: emit (copy), HttpService1 (copy), LinkingProtocol1 (copy)
			if not p3 or not p4 then
				emit("NETWORK_ERROR")
				
				return
			end
			if p4.StatusCode == 404 then
				emit("NOT_FOUND")
				
				return
			end
			if p4.StatusCode ~= 200 then
				emit("HTTP_ERROR")
				
				return
			end
			local Success, Result = pcall(function()
				-- upvalues: HttpService1 (upval), p4 (copy)
				return HttpService1:JSONDecode(p4.Body)
			end)
			
			if not Success then
				emit("PARSE_ERROR")
				
				return
			end
			if type(Result) == "table" and type(Result.url) == "string" and Result.url ~= "" then
				LinkingProtocol1:detectURL(Result.url)
				emit("SUCCESS", Result.url)
				
				return
			else
				emit("EMPTY_URL")
			end
		end)
		
		return
	end
end

local DeeplinkResolutionEventReceiver = RoactModule.PureComponent:extend("DeeplinkResolutionEventReceiver")

function DeeplinkResolutionEventReceiver.init(p1)
	-- upvalues: FFlagEnableDeeplinkResolutionEventReceiverModule (copy), MessageBus (copy), TModule (copy), resolveAndRoute (copy)
	if FFlagEnableDeeplinkResolutionEventReceiverModule then
		p1.subscriber = MessageBus.Subscriber.new()
		p1.subscriber:subscribe({
			mid = MessageBus.getMessageId("Linking", "resolveAttributionAdName"),
			validateParams = TModule.table
		}, function(p2)
			-- upvalues: resolveAndRoute (upval)
			resolveAndRoute(p2)
		end)
		
		return
	end
end

function DeeplinkResolutionEventReceiver:render()
	return nil
end

DeeplinkResolutionEventReceiver._resolveAndRoute = resolveAndRoute

return DeeplinkResolutionEventReceiver