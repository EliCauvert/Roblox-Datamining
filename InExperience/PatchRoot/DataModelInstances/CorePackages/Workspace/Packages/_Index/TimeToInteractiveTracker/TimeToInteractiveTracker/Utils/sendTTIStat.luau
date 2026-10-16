local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("TimeToInteractiveTracker").Parent
local DashModule = require(Parent.Dash)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local NewResult = require(Parent.TelemetryService).EventStreamReporter.new(Default)
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial
local TtiDebugLogModule = require(script.Parent.ttiDebugLog)
local UtilModule = require(script.Parent.Util)
local FFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)
local _ = require(script.Parent.Parent.Stores.types)
local TTIMetricsTableName = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric")
local AXTTIAddNumElementsRendered = game:DefineFastFlag("AXTTIAddNumElementsRendered", false)
local TTIEmitPointsEvent = game:DefineFastFlag("TTIEmitPointsEvent", false)
local config = {
	eventName = "ua_page_load_time",
	description = "Raw per-page-load TTI event to Elasticsearch (Points) for exact-percentile PLT dashboards.",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	lastUpdated = { 2026, 9, 3 }
}
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0)
game:DefineFastInt("TTIPointsEventSampleRate", 0)

local function getDefaultMetadata(MetaData) --[[ Line: 74 ]]
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	return DashModule.assign({
		AppVersion = RunService:GetRobloxVersion(),
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion(),
		Platform = if IsSpatialFunction() then "VR" else tostring(UserInputService:GetPlatform())
	}, MetaData)
end

return function(p1) --[[ Line: 97 | Named "sendTTIStat" ]]
	-- upvalues: RunService (copy), getDefaultMetadata (copy), Default (copy), UtilModule (copy), FFlagTTITrackerMemoryTrackingModule (copy), AXTTIAddNumElementsRendered (copy), HttpService (copy), NewResult (copy), TTIMetricsTableName (copy), TTIEmitPointsEvent (copy), config (copy), TtiDebugLogModule (copy)
	if math.clamp(if p1.samplingRateOverride == nil then game:GetFastInt("TimeToInteractiveTrackerSampleRate") else p1.samplingRateOverride, 0, 1000) < math.random(1, 1000) and not RunService:IsStudio() then return end
	local Tbl = {
		description = "Stat to track Time-To-Interactive (TTI) latency metrics.",
		links = "",
		eventName = p1.statName,
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2026, 1, 14 }
	}
	local DefaultMetadata = getDefaultMetadata(p1.metaData)
	
	local function logMemoryStats(Text, TotalMemoryMB, LuaHeapMB) --[[ Line: 134 ]]
		-- upvalues: Tbl (copy), Default (upval), DefaultMetadata (copy)
		if TotalMemoryMB then
			local Copy = table.clone(Tbl)
			Copy.eventName = Text .. "_TotalMemoryMB"
			Default:logRobloxTelemetryStat(Copy, TotalMemoryMB, DefaultMetadata)
		end
		if LuaHeapMB then
			local Copy = table.clone(Tbl)
			Copy.eventName = Text .. "_LuaHeapMB"
			Default:logRobloxTelemetryStat(Copy, LuaHeapMB, DefaultMetadata)
		end
	end
	
	Default:logRobloxTelemetryStat(Tbl, p1.deltaMs, DefaultMetadata)
	
	if p1.milestones then
		for _, value in UtilModule.generateMilestoneStats(p1.statName, p1.milestones) do
			local Copy = table.clone(Tbl)
			Copy.eventName = value.eventName
			Default:logRobloxTelemetryStat(Copy, value.deltaMs, DefaultMetadata)
			
			if FFlagTTITrackerMemoryTrackingModule then
				logMemoryStats(value.eventName, value.totalMemoryMB, value.luaHeapMB)
			end
		end
	end
	if FFlagTTITrackerMemoryTrackingModule then
		logMemoryStats(p1.statName, p1.totalMemoryMB, p1.luaHeapMB)
	end
	local config1 = { deltaMs = p1.deltaMs, metricName = p1.statName }
	
	if p1.metaData then
		config1.coldStart = p1.metaData.coldStart
		config1.category = p1.metaData.category
		config1.subcategory = p1.metaData.subcategory
		config1.page = p1.metaData.page
		config1.opaquePage = p1.metaData.opaquePage
		
		if AXTTIAddNumElementsRendered then
			config1.num_elements_rendered = p1.metaData.numElementsRendered
		end
	end
	local DefaultMetadata1 = getDefaultMetadata({})
	config1.appVersion = DefaultMetadata1.AppVersion
	config1.userAgent = DefaultMetadata1.UserAgent
	config1.coreScriptVersion = DefaultMetadata1.CoreScriptVersion
	config1.platform = DefaultMetadata1.Platform
	config1.total_memory_mb = p1.totalMemoryMB
	config1.lua_heap_mb = p1.luaHeapMB
	
	if p1.milestones then
		local MilestonesToProtoResult = UtilModule.milestonesToProto(p1.milestones)
		local Success, Result = pcall(function() --[[ Line: 203 ]]
			-- upvalues: HttpService (upval), MilestonesToProtoResult (copy)
			return HttpService:JSONEncode(MilestonesToProtoResult)
		end)
		
		if Success then
			config1.milestones_json = Result
		end
	end
	NewResult:sendTelemetryEvent(TTIMetricsTableName, TTIMetricsTableName, config1)
	
	if TTIEmitPointsEvent and (math.random(1, 1000) <= math.clamp(game:GetFastInt("TTIPointsEventSampleRate"), 0, 1000) or RunService:IsStudio()) then
		local Copy = table.clone(config1)
		Copy.milestones_json = nil
		
		if p1.milestones then
			for i, value1 in UtilModule.milestonesToPointsFields(p1.milestones) do
				Copy[i] = value1
			end
		end
		Default:logRobloxTelemetryEvent(config, nil, Copy)
	end
	TtiDebugLogModule("sendTTIStat", p1.statName, p1.deltaMs, config1, p1.milestones)
end