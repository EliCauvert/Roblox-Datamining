local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("TimeToInteractiveTracker").Parent
local dashModule = require(parent.Dash)
local default = require(parent.LoggingProtocol).default
local var4 = require(parent.TelemetryService).EventStreamReporter.new(default)
local isSpatial = require(parent.AppCommonLib).isSpatial
local ttiDebugLogModule = require(script.Parent.ttiDebugLog)
local utilModule = require(script.Parent.Util)
local fFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)
local _ = require(script.Parent.Parent.Stores.types)
local TTIMetricsTableName = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric")
local AXTTIAddNumElementsRendered = game:DefineFastFlag("AXTTIAddNumElementsRendered", false)
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0)

local function getDefaultMetadata(p0)
	-- upvalues: userInputService (ref), isSpatial (ref), runService (ref), httpService (ref), dashModule (ref)
	return dashModule.assign({
		AppVersion = runService:GetRobloxVersion(),
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion(),
		Platform = if isSpatial() then "VR" else tostring(userInputService:GetPlatform())
	}, p0)
end

return function(p1)
	-- upvalues: runService (ref), getDefaultMetadata (ref), default (ref), utilModule (ref), fFlagTTITrackerMemoryTrackingModule (ref), AXTTIAddNumElementsRendered (ref), httpService (ref), var4 (ref), TTIMetricsTableName (ref), ttiDebugLogModule (ref)
	if math.clamp(if p1.samplingRateOverride ~= nil then game:GetFastInt("TimeToInteractiveTrackerSampleRate") else p1.samplingRateOverride, 0, 1000) < math.random(1, 1000) and not runService:IsStudio() then return end
	local t = {
		description = "Stat to track Time-To-Interactive (TTI) latency metrics.",
		links = "",
		eventName = p1.statName,
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2026, 1, 14 }
	}
	local var12 = getDefaultMetadata(p1.metaData)
	
	local function logMemoryStats(p2, p3, p4)
		-- upvalues: t (ref), default (copy), var12 (ref)
		if p3 then
			local cloned = table.clone(t)
			cloned.eventName = p2 .. "_TotalMemoryMB"
			default:logRobloxTelemetryStat(cloned, p3, var12)
		end
		if p4 then
			local cloned = table.clone(t)
			cloned.eventName = p2 .. "_LuaHeapMB"
			default:logRobloxTelemetryStat(cloned, p4, var12)
		end
	end
	
	default:logRobloxTelemetryStat(t, p1.deltaMs, var12)
	
	if p1.milestones then
		for i, v in utilModule.generateMilestoneStats(p1.statName, p1.milestones) do
			local cloned = table.clone(t)
			cloned.eventName = v.eventName
			default:logRobloxTelemetryStat(cloned, v.deltaMs, var12)
			
			if fFlagTTITrackerMemoryTrackingModule then
				logMemoryStats(v.eventName, v.totalMemoryMB, v.luaHeapMB)
			end
		end
	end
	if fFlagTTITrackerMemoryTrackingModule then
		logMemoryStats(p1.statName, p1.totalMemoryMB, p1.luaHeapMB)
	end
	local t_1 = { deltaMs = p1.deltaMs, metricName = p1.statName }
	
	if p1.metaData then
		t_1.coldStart = p1.metaData.coldStart
		t_1.category = p1.metaData.category
		t_1.subcategory = p1.metaData.subcategory
		t_1.page = p1.metaData.page
		t_1.opaquePage = p1.metaData.opaquePage
		
		if AXTTIAddNumElementsRendered then
			t_1.num_elements_rendered = p1.metaData.numElementsRendered
		end
	end
	local var16 = getDefaultMetadata({})
	t_1.appVersion = var16.AppVersion
	t_1.userAgent = var16.UserAgent
	t_1.coreScriptVersion = var16.CoreScriptVersion
	t_1.platform = var16.Platform
	t_1.total_memory_mb = p1.totalMemoryMB
	t_1.lua_heap_mb = p1.luaHeapMB
	
	if p1.milestones then
		local var17 = utilModule.milestonesToProto(p1.milestones)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var17 (ref)
			return httpService:JSONEncode(var17)
		end)
		
		if ok then
			t_1.milestones_json = status
		end
	end
	var4:sendTelemetryEvent(TTIMetricsTableName, TTIMetricsTableName, t_1)
	ttiDebugLogModule("sendTTIStat", p1.statName, p1.deltaMs, t_1, p1.milestones)
end