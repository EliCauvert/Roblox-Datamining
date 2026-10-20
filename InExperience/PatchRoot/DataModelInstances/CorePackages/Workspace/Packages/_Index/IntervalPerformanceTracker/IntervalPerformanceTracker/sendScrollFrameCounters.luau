local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("IntervalPerformanceTracker").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial
local DeviceTier = require(Parent.Devices).DeviceTier
local JANKYFRAMEBANDS = require(script.Parent.ScrollFrameBands).JANKY_FRAME_BANDS
local config = {
	eventName = "luaScrollFrameBucket",
	description = "Per-frame-time-band frame counts for scroll perf; one increment per band per scroll session.",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 9, 1 }
}
local config1 = {
	eventName = "luaScrollSession",
	description = "Completed scroll-session count for scroll perf; one increment per session. Carries a jank_band label (per-session % of frames >= 18 ms, bucketed) so sum by jank_band is the session count and the per-band split reproduces the rollup's sessions_jank_* histogram.",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 9, 1 }
}
local list = {
	2, 4, 6, 8, 10, 15, 20, 25, 30, 40, 50, 60, 80
}
local list1 = {
	"0_2", "2_4", "4_6", "6_8", "8_10", "10_15", "15_20", "20_25", "25_30",
	"30_40", "40_50", "50_60", "60_80", "80_100"
}

local function _(p1)
	-- upvalues: list (copy), list1 (copy)
	for i, value in list do
		if p1 < value then
			return list1[i]
		end
	end
	return list1[#list1]
end

local DeviceMemoryTier = nil

local _ = function()
	-- upvalues: DeviceMemoryTier (ref), DeviceTier (copy)
	if DeviceMemoryTier == nil then
		DeviceMemoryTier = DeviceTier.GetDeviceMemoryTier()
	end
	return DeviceMemoryTier or "unknown"
end

local _ = function()
	-- upvalues: IsSpatialFunction (copy), UserInputService (copy)
	if IsSpatialFunction() then
		return "VR"
	else
		local Success, Result = pcall(function()
			-- upvalues: UserInputService (upval)
			return UserInputService:GetPlatform()
		end)
		
		return if Success and Result then Result.Name else nil
	end
end

return function(p2)
	-- upvalues: HttpService (copy), DeviceMemoryTier (ref), DeviceTier (copy), IsSpatialFunction (copy), UserInputService (copy), JANKYFRAMEBANDS (copy), Default (copy), config (copy), list (copy), list1 (copy), config1 (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), p2 (copy)
		return HttpService:JSONDecode(p2.frameBucketsJson)
	end)
	
	if not Success or typeof(Result) ~= "table" then return end
	local Tbl = { intervalName = p2.intervalName }
	
	if DeviceMemoryTier == nil then
		DeviceMemoryTier = DeviceTier.GetDeviceMemoryTier()
	end
	Tbl.mem_tier = DeviceMemoryTier or "unknown"
	local Name = nil
	
	if IsSpatialFunction() then
		Name = "VR"
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: UserInputService (upval)
			return UserInputService:GetPlatform()
		end)
		Name = if Success1 and Result1 then Result1.Name else nil
	end
	if Name then
		Tbl.platform = Name
	end
	if p2.scrollType then
		Tbl.scroll_type = p2.scrollType
	end
	local Total = 0
	local Total1 = 0
	
	for Bucket, Amount in Result do
		if typeof(Amount) == "number" and Amount > 0 then
			Total += Amount
			
			if JANKYFRAMEBANDS[Bucket] then
				Total1 += Amount
			end
			local Copy = table.clone(Tbl)
			Copy.bucket = Bucket
			Default:logRobloxTelemetryCounter(config, Amount, Copy)
		end
	end
	if Total == 0 then return end
	local ScaledTotal = Total1 / Total * 100
	local Copy = table.clone(Tbl)
	local Entry = nil
	
	for i, value in list do
		if ScaledTotal < value then
			Entry = list1[i]
			Copy.jank_band = Entry
			Default:logRobloxTelemetryCounter(config1, 1, Copy)
			
			return
		end
	end
	Entry = list1[#list1]
end