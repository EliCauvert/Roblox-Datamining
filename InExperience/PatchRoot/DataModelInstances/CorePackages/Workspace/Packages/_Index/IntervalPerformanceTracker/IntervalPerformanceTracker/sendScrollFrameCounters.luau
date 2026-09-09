local userInputService = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("IntervalPerformanceTracker").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local default = loggingProtocolModule.default
local isSpatial = require(parent.AppCommonLib).isSpatial
local deviceTier = require(parent.Devices).DeviceTier
local JANKY_FRAME_BANDS = require(script.Parent.ScrollFrameBands).JANKY_FRAME_BANDS
local t = {
	eventName = "luaScrollFrameBucket",
	description = "Per-frame-time-band frame counts for scroll perf; one increment per band per scroll session.",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 9, 1 }
}
local t_1 = {
	eventName = "luaScrollSession",
	description = "Completed scroll-session count for scroll perf; one increment per session. Carries a jank_band label (per-session % of frames >= 18 ms, bucketed) so sum by jank_band is the session count and the per-band split reproduces the rollup's sessions_jank_* histogram.",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 9, 1 }
}
local list = {
	2, 4, 6, 8, 10, 15, 20, 25, 30, 40, 50, 60, 80
}
local list_1 = {
	"0_2", "2_4", "4_6", "6_8", "8_10", "10_15", "15_20", "20_25", "25_30",
	"30_40", "40_50", "50_60", "60_80", "80_100"
}

local function _(p1)
	-- upvalues: list (ref), list_1 (ref)
	for i, v in list do
		if p1 < v then
			return list_1[i]
		end
	end
	return list_1[#list_1]
end

local var1 = nil

local _ = function()
	-- upvalues: var1 (write), deviceTier (ref)
	if var1 == nil then
		var1 = deviceTier.GetDeviceMemoryTier()
	end
	return var1 or "unknown"
end

local _ = function()
	-- upvalues: isSpatial (ref), userInputService (ref)
	if isSpatial() then
		return "VR"
	end
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy)
		return userInputService:GetPlatform()
	end)
	
	return if ok and status then status.Name else nil
end

return function(p2)
	-- upvalues: httpService (ref), var1 (write), deviceTier (ref), isSpatial (ref), userInputService (ref), JANKY_FRAME_BANDS (ref), default (ref), t (ref), list (ref), list_1 (ref), t_1 (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONDecode(p2.frameBucketsJson)
	end)
	
	if not ok or typeof(status) ~= "table" then return end
	local t_2 = { intervalName = p2.intervalName }
	
	if var1 == nil then
		var1 = deviceTier.GetDeviceMemoryTier()
	end
	local var2, ok_1
	t_2.mem_tier = var1 or "unknown"
	
	if isSpatial() then
		var2 = "VR"
	else
		ok_1, status_1 = pcall(function()
			-- upvalues: userInputService (copy)
			return userInputService:GetPlatform()
		end)
		var2 = if ok_1 and status_1 then status_1.Name else nil
	end
	if var2 then
		t_2.platform = var2
	end
	if p2.scrollType then
		t_2.scroll_type = p2.scrollType
	end
	ok_1 = 0
	local var3 = 0
	
	for i, v in status do
		if typeof(v) == "number" and v > 0 then
			ok_1 += v
			
			if JANKY_FRAME_BANDS[i] then
				var3 += v
			end
			local cloned = table.clone(t_2)
			cloned.bucket = i
			default:logRobloxTelemetryCounter(t, v, cloned)
		end
	end
	if ok_1 == 0 then return end
	local var4
	local var5 = var3 / ok_1 * 100
	local cloned = table.clone(t_2)
	
	for i_1, v_1 in list do
		if var5 < v_1 then
			var4 = list_1[i_1]
			cloned.jank_band = var4
			default:logRobloxTelemetryCounter(t_1, 1, cloned)
			
			return
		end
	end
	var4 = list_1[#list_1]
end