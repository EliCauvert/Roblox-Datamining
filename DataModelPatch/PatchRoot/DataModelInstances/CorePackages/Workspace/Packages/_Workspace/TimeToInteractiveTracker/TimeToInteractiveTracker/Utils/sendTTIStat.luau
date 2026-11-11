local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("TimeToInteractiveTracker").Parent
local DashModule = require(Parent.Dash)
local Default = require(Parent.LoggingProtocol).default
local NewResult = require(Parent.TelemetryService).EventStreamReporter.new(Default)
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial
local TtiDebugLogModule = require(script.Parent.ttiDebugLog)
local UtilModule = require(script.Parent.Util)
local FFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)
local _ = require(script.Parent.Parent.Stores.types)
local TTIMetricsTableName = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric")
local AXTTIAddNumElementsRendered = game:DefineFastFlag("AXTTIAddNumElementsRendered", false)
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0)

local function getDefaultMetadata(MetaData)
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	return DashModule.assign({
		AppVersion = RunService:GetRobloxVersion(),
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion(),
		Platform = if IsSpatialFunction() then "VR" else tostring(UserInputService:GetPlatform())
	}, MetaData)
end

return function(p1)
	-- upvalues: RunService (copy), getDefaultMetadata (copy), Default (copy), UtilModule (copy), FFlagTTITrackerMemoryTrackingModule (copy), AXTTIAddNumElementsRendered (copy), HttpService (copy), NewResult (copy), TTIMetricsTableName (copy), TtiDebugLogModule (copy)
	if math.clamp(if p1.samplingRateOverride == nil then game:GetFastInt("TimeToInteractiveTrackerSampleRate") else p1.samplingRateOverride, 0, 1000) < math.random(1, 1000) and not RunService:IsStudio() then return end
	local Tbl = {
		description = "Stat to track Time-To-Interactive (TTI) latency metrics.",
		links = "",
		eventName = p1.statName,
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2026, 1, 14 }
	}
	local DefaultMetadata = getDefaultMetadata(p1.metaData)
	
	local function logMemoryStats(Text, TotalMemoryMB, LuaHeapMB)
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
	local config = { deltaMs = p1.deltaMs, metricName = p1.statName }
	
	if p1.metaData then
		config.coldStart = p1.metaData.coldStart
		config.category = p1.metaData.category
		config.subcategory = p1.metaData.subcategory
		config.page = p1.metaData.page
		config.opaquePage = p1.metaData.opaquePage
		
		if AXTTIAddNumElementsRendered then
			config.num_elements_rendered = p1.metaData.numElementsRendered
		end
	end
	local DefaultMetadata1 = getDefaultMetadata({})
	config.appVersion = DefaultMetadata1.AppVersion
	config.userAgent = DefaultMetadata1.UserAgent
	config.coreScriptVersion = DefaultMetadata1.CoreScriptVersion
	config.platform = DefaultMetadata1.Platform
	config.total_memory_mb = p1.totalMemoryMB
	config.lua_heap_mb = p1.luaHeapMB
	
	if p1.milestones then
		local MilestonesToProtoResult = UtilModule.milestonesToProto(p1.milestones)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), MilestonesToProtoResult (copy)
			return HttpService:JSONEncode(MilestonesToProtoResult)
		end)
		
		if Success then
			config.milestones_json = Result
		end
	end
	NewResult:sendTelemetryEvent(TTIMetricsTableName, TTIMetricsTableName, config)
	TtiDebugLogModule("sendTTIStat", p1.statName, p1.deltaMs, config, p1.milestones)
end