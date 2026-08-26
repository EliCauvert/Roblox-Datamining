local parent = script.Parent.Parent
local parent_1 = parent.Parent
local telemetryService = require(parent_1.MockableProxyServices).TelemetryService
local _ = require(parent.Enum.Placement)
local deviceTier = require(parent_1.Devices).DeviceTier
local appNavDeviceTier = game:DefineFastFlag("AppNavDeviceTier", false)
local fFlagAppNavTelemetryLogger = require(parent_1.SharedFlags).FFlagAppNavTelemetryLogger
local var1 = if fFlagAppNavTelemetryLogger then require(parent_1.Loggers).Logger:new("AppNavTelemetry") else nil
local list = { "addOSInfo", "addSessionId", "addSessionInfo" }
local var2 = if appNavDeviceTier then deviceTier.GetDeviceMemoryTier() else nil
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
local var3 = nil

local function logSwitchTabStart(value, p1)
	-- upvalues: var3 (write)
	var3 = {
		previousPage = value,
		nextPage = p1,
		startTime = os.clock()
	}
end

local function reportSwitchTab(p1, p2, p3)
	-- upvalues: telemetryService (ref), t (ref), appNavDeviceTier (ref), var2 (ref), t_1 (ref), list (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
	telemetryService:LogStat(t, {
		customFields = {
			previous_page = p1,
			current_page = p2,
			device_tier = if appNavDeviceTier then var2 else nil
		}
	}, p3)
	telemetryService:LogEvent(t_1, {
		customFields = { previous_page = p1, current_page = p2, duration = p3 },
		standardizedFields = list
	})
	
	if fFlagAppNavTelemetryLogger then
		var1:info("AppNav switch_tab previous={} current={} duration_ms={} device_tier={}", tostring(p1), tostring(p2), string.format("%.2f", p3), tostring(var2))
	end
end

local function logSwitchTabEnd(p1)
	-- upvalues: var3 (write), reportSwitchTab (ref)
	if not var3 then return end
	if p1 == var3.nextPage then
		local previousPage = var3.previousPage
		local var4 = (os.clock() - var3.startTime) * 1000
		var3 = nil
		reportSwitchTab(previousPage, p1, var4)
		
		return
	end
	var3 = nil
end

local var4 = nil

local function logVisibilityStart(p1)
	-- upvalues: var4 (write)
	var4 = { nextValue = p1, startTime = os.clock() }
end

local function reportVisibility(p1, p2)
	-- upvalues: telemetryService (ref), t_2 (ref), appNavDeviceTier (ref), var2 (ref), t_3 (ref), list (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
	telemetryService:LogStat(t_2, {
		customFields = {
			is_visible = p1,
			device_tier = if appNavDeviceTier then var2 else nil
		}
	}, p2)
	telemetryService:LogEvent(t_3, {
		customFields = { is_visible = p1, duration = p2 },
		standardizedFields = list
	})
	
	if fFlagAppNavTelemetryLogger then
		var1:info("AppNav is_visible_changed is_visible={} duration_ms={} device_tier={}", tostring(p1), string.format("%.2f", p2), tostring(var2))
	end
end

local var5 = nil

return {
	logSwitchTabStart = logSwitchTabStart,
	logSwitchTabEnd = logSwitchTabEnd,
	logVisibilityStart = logVisibilityStart,
	logVisibilityEnd = function(p1)
		-- upvalues: var4 (write), reportVisibility (ref)
		if not var4 then return end
		if p1 == var4.nextValue then
			local var6 = (os.clock() - var4.startTime) * 1000
			var4 = nil
			reportVisibility(p1, var6)
			
			return
		end
		var4 = nil
	end,
	logPlacement = function(p1)
		-- upvalues: var5 (write), telemetryService (ref), t_4 (ref), fFlagAppNavTelemetryLogger (ref), var1 (write)
		if p1 == var5 then return end
		telemetryService:LogCounter(t_4, {
			customFields = { previous_placement = var5, current_placement = p1 }
		})
		
		if fFlagAppNavTelemetryLogger then
			var1:info("AppNav placement_changed previous={} current={}", tostring(var5), tostring(p1))
		end
		var5 = p1
	end,
	reset = function()
		-- upvalues: var3 (write), var4 (write), var5 (write)
		var3 = nil
		var4 = nil
		var5 = nil
	end
}