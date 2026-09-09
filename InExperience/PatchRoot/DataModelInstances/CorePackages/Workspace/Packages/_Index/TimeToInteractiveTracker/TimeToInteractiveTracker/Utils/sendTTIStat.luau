local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("TimeToInteractiveTracker").Parent
local dashModule = require(parent.Dash)
local loggingProtocolModule = require(parent.LoggingProtocol)
local default = loggingProtocolModule.default
local var1 = require(parent.TelemetryService).EventStreamReporter.new(default)
local isSpatial = require(parent.AppCommonLib).isSpatial
local ttiDebugLogModule = require(script.Parent.ttiDebugLog)
local utilModule = require(script.Parent.Util)
local fFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)
local _ = require(script.Parent.Parent.Stores.types)
local TTIMetricsTableName = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric")
local AXTTIAddNumElementsRendered = game:DefineFastFlag("AXTTIAddNumElementsRendered", false)
local TTIEmitPointsEvent = game:DefineFastFlag("TTIEmitPointsEvent", false)
local t = {
	eventName = "ua_page_load_time",
	description = "Raw per-page-load TTI event to Elasticsearch (Points) for exact-percentile PLT dashboards.",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.Points },
	lastUpdated = { 2026, 9, 3 }
}
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0)
game:DefineFastInt("TTIPointsEventSampleRate", 0)

local function getDefaultMetadata(p1)
	-- upvalues: userInputService (ref), isSpatial (ref), runService (ref), httpService (ref), dashModule (ref)
	return dashModule.assign({
		AppVersion = runService:GetRobloxVersion(),
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion(),
		Platform = if isSpatial() then "VR" else tostring(userInputService:GetPlatform())
	}, p1)
end

return function(p1)
	-- upvalues: runService (ref), getDefaultMetadata (ref), default (ref), utilModule (ref), fFlagTTITrackerMemoryTrackingModule (ref), AXTTIAddNumElementsRendered (ref), httpService (ref), var1 (ref), TTIMetricsTableName (ref), TTIEmitPointsEvent (ref), t (ref), ttiDebugLogModule (ref)
	if math.clamp(if p1.samplingRateOverride ~= nil then game:GetFastInt("TimeToInteractiveTrackerSampleRate") else p1.samplingRateOverride, 0, 1000) < math.random(1, 1000) and not runService:IsStudio() then return end
	local t_1 = {
		description = "Stat to track Time-To-Interactive (TTI) latency metrics.",
		links = "",
		eventName = p1.statName,
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2026, 1, 14 }
	}
	local var2 = getDefaultMetadata(p1.metaData)
	
	local function logMemoryStats(p2, p3, p4)
		-- upvalues: t_1 (ref), default (copy), var2 (ref)
		if p3 then
			local cloned = table.clone(t_1)
			cloned.eventName = p2 .. "_TotalMemoryMB"
			default:logRobloxTelemetryStat(cloned, p3, var2)
		end
		if p4 then
			local cloned = table.clone(t_1)
			cloned.eventName = p2 .. "_LuaHeapMB"
			default:logRobloxTelemetryStat(cloned, p4, var2)
		end
	end
	
	default:logRobloxTelemetryStat(t_1, p1.deltaMs, var2)
	
	if p1.milestones then
		for i, v in utilModule.generateMilestoneStats(p1.statName, p1.milestones) do
			local cloned = table.clone(t_1)
			cloned.eventName = v.eventName
			default:logRobloxTelemetryStat(cloned, v.deltaMs, var2)
			
			if fFlagTTITrackerMemoryTrackingModule then
				logMemoryStats(v.eventName, v.totalMemoryMB, v.luaHeapMB)
			end
		end
	end
	if fFlagTTITrackerMemoryTrackingModule then
		logMemoryStats(p1.statName, p1.totalMemoryMB, p1.luaHeapMB)
	end
	local t_2 = { deltaMs = p1.deltaMs, metricName = p1.statName }
	
	if p1.metaData then
		t_2.coldStart = p1.metaData.coldStart
		t_2.category = p1.metaData.category
		t_2.subcategory = p1.metaData.subcategory
		t_2.page = p1.metaData.page
		t_2.opaquePage = p1.metaData.opaquePage
		
		if AXTTIAddNumElementsRendered then
			t_2.num_elements_rendered = p1.metaData.numElementsRendered
		end
	end
	local var3 = getDefaultMetadata({})
	t_2.appVersion = var3.AppVersion
	t_2.userAgent = var3.UserAgent
	t_2.coreScriptVersion = var3.CoreScriptVersion
	t_2.platform = var3.Platform
	t_2.total_memory_mb = p1.totalMemoryMB
	t_2.lua_heap_mb = p1.luaHeapMB
	
	if p1.milestones then
		local var4 = utilModule.milestonesToProto(p1.milestones)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var4 (ref)
			return httpService:JSONEncode(var4)
		end)
		
		if ok then
			t_2.milestones_json = status
		end
	end
	var1:sendTelemetryEvent(TTIMetricsTableName, TTIMetricsTableName, t_2)
	
	if TTIEmitPointsEvent and (math.random(1, 1000) <= math.clamp(game:GetFastInt("TTIPointsEventSampleRate"), 0, 1000) or runService:IsStudio()) then
		local cloned = table.clone(t_2)
		cloned.milestones_json = nil
		
		if p1.milestones then
			for i, v in utilModule.milestonesToPointsFields(p1.milestones) do
				cloned[i] = v
			end
		end
		default:logRobloxTelemetryEvent(t, nil, cloned)
	end
	ttiDebugLogModule("sendTTIStat", p1.statName, p1.deltaMs, t_2, p1.milestones)
end