local parent = script.Parent.Parent
local parent_1 = parent.Parent
local telemetryService = require(parent_1.MockableProxyServices).TelemetryService
local _ = require(parent.Enum.Placement)
local deviceTier = require(parent_1.Devices).DeviceTier
local appNavDeviceTier = game:DefineFastFlag("AppNavDeviceTier", false)
local fFlagAppNavTelemetryLogger = require(parent_1.SharedFlags).FFlagAppNavTelemetryLogger
local var1 = if fFlagAppNavTelemetryLogger then require(parent_1.Loggers).Logger:new("AppNavTelemetry") else nil
local list = { "addOSInfo", "addSessionId", "addSessionInfo" }
local var3 = if appNavDeviceTier then deviceTier.GetDeviceMemoryTier() else nil
local t = {
	eventName = "AppNav_SwitchTab",
	throttlingPercentage = 10000,
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 3, 12 }
}
local t_1 = {
	eventName = "AppNav_SwitchTab",
	throttlingPercentage = 10000,
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "EventIngest" },
	lastUpdated = { 2026, 3, 12 }
}
local t_2 = {
	eventName = "AppNav_IsVisibleChanged",
	throttlingPercentage = 10000,
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 26, 3, 17 }
}
local t_3 = {
	eventName = "AppNav_IsVisibleChanged",
	throttlingPercentage = 10000,
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "EventIngest" },
	lastUpdated = { 26, 3, 17 }
}
local t_4 = {
	eventName = "AppNav_PlacementChanged",
	throttlingPercentage = 10000,
	description = "App Nav placement prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 3, 17 }
}
local var9 = nil

local function logSwitchTabStart(value, p0) --[[ line: 80 ]]
	-- upvalues: var9 (write)
	var9 = {
		previousPage = value,
		nextPage = p0,
		startTime = os.clock()
	}
end

local function reportSwitchTab(p1, p2, p3) --[[ line: 88 ]]
	-- upvalues: telemetryService (ref), t (ref), appNavDeviceTier (ref), var3 (ref), t_1 (ref), list (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
	telemetryService:LogStat(t, {
		customFields = {
			previous_page = p1,
			current_page = p2,
			device_tier = if appNavDeviceTier then var3 else nil
		}
	}, p3)
	telemetryService:LogEvent(t_1, {
		customFields = { previous_page = p1, current_page = p2, duration = p3 },
		standardizedFields = list
	})
	
	if fFlagAppNavTelemetryLogger then
		var1:info("AppNav switch_tab previous={} current={} duration_ms={} device_tier={}", tostring(p1), tostring(p2), string.format("%.2f", p3), tostring(var3))
	end
end

local function logSwitchTabEnd(p4) --[[ line: 115 ]]
	-- upvalues: var9 (write), reportSwitchTab (ref)
	if not var9 then return end
	if p4 == var9.nextPage then
		local previousPage = var9.previousPage
		local var17 = (os.clock() - var9.startTime) * 1000
		var9 = nil
		reportSwitchTab(previousPage, p4, var17)
		
		return
	end
	var9 = nil
end

local var13 = nil

local function logVisibilityStart(p5) --[[ line: 134 ]]
	-- upvalues: var13 (write)
	var13 = { nextValue = p5, startTime = os.clock() }
end

local function reportVisibility(p6, p7) --[[ line: 141 ]]
	-- upvalues: telemetryService (ref), t_2 (ref), appNavDeviceTier (ref), var3 (ref), t_3 (ref), list (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
	telemetryService:LogStat(t_2, {
		customFields = {
			is_visible = p6,
			device_tier = if appNavDeviceTier then var3 else nil
		}
	}, p7)
	telemetryService:LogEvent(t_3, {
		customFields = { is_visible = p6, duration = p7 },
		standardizedFields = list
	})
	
	if fFlagAppNavTelemetryLogger then
		var1:info("AppNav is_visible_changed is_visible={} duration_ms={} device_tier={}", tostring(p6), string.format("%.2f", p7), tostring(var3))
	end
end

local var16 = nil

return {
	logSwitchTabStart = logSwitchTabStart,
	logSwitchTabEnd = logSwitchTabEnd,
	logVisibilityStart = logVisibilityStart,
	logVisibilityEnd = function(p8) --[[ line: 165 ]]
		-- upvalues: var13 (write), reportVisibility (ref)
		if not var13 then return end
		if p8 == var13.nextValue then
			local var18 = (os.clock() - var13.startTime) * 1000
			var13 = nil
			reportVisibility(p8, var18)
			
			return
		end
		var13 = nil
	end,
	logPlacement = function(p9) --[[ line: 183 ]]
		-- upvalues: var16 (write), telemetryService (ref), t_4 (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
		if p9 == var16 then return end
		telemetryService:LogCounter(t_4, {
			customFields = { previous_placement = var16, current_placement = p9 }
		})
		
		if fFlagAppNavTelemetryLogger then
			var1:info("AppNav placement_changed previous={} current={}", tostring(var16), tostring(p9))
		end
		var16 = p9
	end,
	reset = function() --[[ line: 201 ]]
		-- upvalues: var9 (write), var13 (write), var16 (write)
		var9 = nil
		var13 = nil
		var16 = nil
	end
}