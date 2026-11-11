local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2)
local Module = {}
Module.__index = Module

function Module.new(Buyrobux_latency_metrics_session_id, Init_time)
	-- upvalues: Module (copy)
	local config = {
		did_mount_time = nil,
		render_time = nil,
		webview_load_time = nil,
		get_robux_balance_start = nil,
		get_robux_balance_response = nil,
		api_latency_ms = nil,
		init_to_mount_latency_ms = nil,
		mount_to_render_latency_ms = nil,
		buyrobux_latency_metrics_session_id = Buyrobux_latency_metrics_session_id,
		init_time = Init_time
	}
	setmetatable(config, Module)
	
	return config
end

function Module:setMountTime(Did_mount_time)
	self.did_mount_time = Did_mount_time
	
	if self.init_time then
		self.init_to_mount_latency_ms = (Did_mount_time - self.init_time) * 1000
	end
end

function Module:setRenderTime(Render_time)
	self.render_time = Render_time
	
	if self.did_mount_time then
		self.mount_to_render_latency_ms = (Render_time - self.did_mount_time) * 1000
	end
end

function Module:setApiTiming(Get_robux_balance_start, Get_robux_balance_response)
	self.get_robux_balance_start = Get_robux_balance_start
	self.get_robux_balance_response = Get_robux_balance_response
	self.api_latency_ms = (Get_robux_balance_response - Get_robux_balance_start) * 1000
end

function Module:setWebViewLoadTime(Webview_load_time)
	self.webview_load_time = Webview_load_time
end

local Module1 = {}
Module1.__index = Module1
local NativePurchaseRobuxPageWrapperEventThrottlingPercentage = game:DefineFastInt("NativePurchaseRobuxPageWrapperEventThrottlingPercentage", 100)
local NativePurchaseRobuxPageWrapperStatThrottlingPercentage = game:DefineFastInt("NativePurchaseRobuxPageWrapperStatThrottlingPercentage", 1000)
Module1.EventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then {
	Init = "NativePurchaseRobuxPageWrapper_Init",
	Mount = "NativePurchaseRobuxPageWrapper_Mount",
	ApiCall = "NativePurchaseRobuxPageWrapper_ApiCall",
	ApiResponse = "NativePurchaseRobuxPageWrapper_ApiResponse",
	Render = "NativePurchaseRobuxPageWrapper_Render",
	WebViewLoad = "NativePurchaseRobuxPageWrapper_WebViewLoad"
} else {
	Init = "NativePurchaseRobuxPageWrapper:Init",
	Mount = "NativePurchaseRobuxPageWrapper:Mount",
	ApiCall = "NativePurchaseRobuxPageWrapper:ApiCall",
	ApiResponse = "NativePurchaseRobuxPageWrapper:ApiResponse",
	Render = "NativePurchaseRobuxPageWrapper:Render",
	WebViewLoad = "NativePurchaseRobuxPageWrapper:WebViewLoad"
}
Module1.TelemetryStat = {
	InitToMountLatency = {
		description = "Stat for tracking initialization to mount latency in NativePurchaseRobuxPageWrapper to detect performance issues",
		links = "",
		eventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then "NativePurchaseRobuxPageWrapper_InitToMountLatency" else "NativePurchaseRobuxPageWrapper:InitToMountLatency",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 13 },
		throttlingPercentage = NativePurchaseRobuxPageWrapperStatThrottlingPercentage
	},
	ApiLatency = {
		description = "Stat for tracking API response latency in NativePurchaseRobuxPageWrapper to detect performance issues",
		links = "",
		eventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then "NativePurchaseRobuxPageWrapper_ApiLatency" else "NativePurchaseRobuxPageWrapper:ApiLatency",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 13 },
		throttlingPercentage = NativePurchaseRobuxPageWrapperStatThrottlingPercentage
	},
	InitToRenderLatency = {
		description = "Stat for tracking initialization to render latency in NativePurchaseRobuxPageWrapper to detect performance issues",
		links = "",
		eventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then "NativePurchaseRobuxPageWrapper_InitToRenderLatency" else "NativePurchaseRobuxPageWrapper:InitToRenderLatency",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 13 },
		throttlingPercentage = NativePurchaseRobuxPageWrapperStatThrottlingPercentage
	},
	MountToRenderLatency = {
		description = "Stat for tracking mount to render latency in NativePurchaseRobuxPageWrapper to detect performance issues",
		links = "",
		eventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then "NativePurchaseRobuxPageWrapper_MountToRenderLatency" else "NativePurchaseRobuxPageWrapper:MountToRenderLatency",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 13 },
		throttlingPercentage = NativePurchaseRobuxPageWrapperStatThrottlingPercentage
	},
	RenderToWebViewLatency = {
		description = "Stat for tracking render to WebView load latency in NativePurchaseRobuxPageWrapper to detect performance issues",
		links = "",
		eventName = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then "NativePurchaseRobuxPageWrapper_RenderToWebViewLatency" else "NativePurchaseRobuxPageWrapper:RenderToWebViewLatency",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 13 },
		throttlingPercentage = NativePurchaseRobuxPageWrapperStatThrottlingPercentage
	}
}

function Module1:sendWebViewMetrics(Lifecycle_event_type, p1, List)
	-- upvalues: LoggingProtocolModule (copy), NativePurchaseRobuxPageWrapperEventThrottlingPercentage (copy)
	local config = {
		eventName = "BuyRobuxWebViewMetrics",
		description = "Event sent to track BuyRobux WebView latency metrics and lifecycle events",
		links = "",
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = NativePurchaseRobuxPageWrapperEventThrottlingPercentage,
		lastUpdated = { 2025, 8, 13 }
	}
	local CustomFields = {
		triggering_context = "NativePurchaseRobuxPage",
		component_name = "NativePurchaseRobuxPageWrapper",
		target = "client",
		buyrobux_latency_metrics_session_id = p1.buyrobux_latency_metrics_session_id,
		lifecycle_event_type = Lifecycle_event_type,
		local_timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
	}
	
	for i, value in pairs(List) do
		CustomFields[i] = value
	end
	self.telemetryService:LogEvent(config, { customFields = CustomFields })
end

function Module1:onInit(p2)
	-- upvalues: Module1 (copy)
	self:sendWebViewMetrics(Module1.EventName.Init, p2, { init_time = tostring(p2.init_time) })
end

function Module1:onMount(p2)
	-- upvalues: Module1 (copy), LoggingProtocolModule (copy)
	if p2.did_mount_time then
		local DidMountTimeDelta = p2.did_mount_time - p2.init_time
		self:sendWebViewMetrics(Module1.EventName.Mount, p2, {
			init_time = tostring(p2.init_time),
			did_mount_time = tostring(p2.did_mount_time),
			init_to_mount_latency_ms = tostring(DidMountTimeDelta * 1000)
		})
		LoggingProtocolModule.default:logRobloxTelemetryStat(Module1.TelemetryStat.InitToMountLatency, DidMountTimeDelta * 1000, {
			component = "NativePurchaseRobuxPageWrapper",
			target = "client"
		})
		
		return
	end
end

function Module1:onApiCall(p2, Api_call_type)
	-- upvalues: Module1 (copy)
	if p2.get_robux_balance_start then
		self:sendWebViewMetrics(Module1.EventName.ApiCall, p2, {
			get_robux_balance_start = tostring(p2.get_robux_balance_start),
			api_call_type = Api_call_type
		})
		
		return
	end
end

function Module1:onApiResponse(p2, Api_call_type, Robux_balance)
	-- upvalues: Module1 (copy), LoggingProtocolModule (copy)
	if p2.get_robux_balance_start and p2.get_robux_balance_response and p2.api_latency_ms then
		self:sendWebViewMetrics(Module1.EventName.ApiResponse, p2, {
			get_robux_balance_start = tostring(p2.get_robux_balance_start),
			get_robux_balance_response = tostring(p2.get_robux_balance_response),
			api_latency_ms = tostring(p2.api_latency_ms),
			api_call_type = Api_call_type,
			robux_balance = Robux_balance
		})
		LoggingProtocolModule.default:logRobloxTelemetryStat(Module1.TelemetryStat.ApiLatency, p2.api_latency_ms, {
			component = "NativePurchaseRobuxPageWrapper",
			target = "client",
			api_call_type = Api_call_type
		})
		
		return
	end
end

function Module1:onRender(p2)
	-- upvalues: Module1 (copy), LoggingProtocolModule (copy)
	if not p2.render_time then return end
	local RenderTime = p2.render_time
	local RenderTimeDelta = RenderTime - p2.init_time
	local v1 = 0
	local config = {
		init_time = tostring(p2.init_time),
		render_time = tostring(RenderTime),
		init_to_render_latency_ms = tostring(RenderTimeDelta * 1000)
	}
	
	if p2.did_mount_time then
		local DidMountTimeDelta = p2.did_mount_time - p2.init_time
		v1 = RenderTime - p2.did_mount_time
		config.did_mount_time = tostring(p2.did_mount_time)
		config.init_to_mount_latency_ms = tostring(DidMountTimeDelta * 1000)
		config.mount_to_render_latency_ms = tostring(v1 * 1000)
	end
	self:sendWebViewMetrics(Module1.EventName.Render, p2, config)
	LoggingProtocolModule.default:logRobloxTelemetryStat(Module1.TelemetryStat.InitToRenderLatency, RenderTimeDelta * 1000, {
		component = "NativePurchaseRobuxPageWrapper",
		target = "client"
	})
	
	if p2.did_mount_time then
		LoggingProtocolModule.default:logRobloxTelemetryStat(Module1.TelemetryStat.MountToRenderLatency, v1 * 1000, {
			component = "NativePurchaseRobuxPageWrapper",
			target = "client"
		})
	end
end

function Module1:onWebViewLoad(p2, p3)
	-- upvalues: Module1 (copy), LoggingProtocolModule (copy)
	if p2.webview_load_time then
		local WebviewLoadTime = p2.webview_load_time
		local WebviewLoadTimeDelta = WebviewLoadTime - p3
		self:sendWebViewMetrics(Module1.EventName.WebViewLoad, p2, {
			render_time = tostring(p3),
			webview_load_time = tostring(WebviewLoadTime),
			render_to_webview_latency_ms = tostring(WebviewLoadTimeDelta * 1000)
		})
		LoggingProtocolModule.default:logRobloxTelemetryStat(Module1.TelemetryStat.RenderToWebViewLatency, WebviewLoadTimeDelta * 1000, {
			component = "NativePurchaseRobuxPageWrapper",
			target = "client"
		})
		
		return
	end
end

function Module1.new(TelemetryService)
	-- upvalues: Module1 (copy)
	local config = { telemetryService = TelemetryService }
	setmetatable(config, Module1)
	
	return config
end

return {
	NativePurchaseRobuxPageWrapperAnalytics = Module1,
	TimingData = Module
}