local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local TelemetryService = require(Parent1.MockableProxyServices).TelemetryService
local _ = require(Parent.Enum.Placement)
local DeviceTier = require(Parent1.Devices).DeviceTier
local AppNavDeviceTier = game:DefineFastFlag("AppNavDeviceTier", false)
local FFlagAppNavTelemetryLogger = require(Parent1.SharedFlags).FFlagAppNavTelemetryLogger
local AppNavTelemetry = if FFlagAppNavTelemetryLogger then require(Parent1.Loggers).Logger:new("AppNavTelemetry") else nil
local StandardizedFields = { "addOSInfo", "addSessionId", "addSessionInfo" }
local DeviceMemoryTier = if AppNavDeviceTier then DeviceTier.GetDeviceMemoryTier() else nil
local config = {
	eventName = "AppNav_SwitchTab",
	throttlingPercentage = 10000,
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 3, 12 }
}
local config1 = {
	eventName = "AppNav_SwitchTab",
	throttlingPercentage = 10000,
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "EventIngest" },
	lastUpdated = { 2026, 3, 12 }
}
local config2 = {
	eventName = "AppNav_IsVisibleChanged",
	throttlingPercentage = 10000,
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 26, 3, 17 }
}
local config3 = {
	eventName = "AppNav_IsVisibleChanged",
	throttlingPercentage = 10000,
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "EventIngest" },
	lastUpdated = { 26, 3, 17 }
}
local config4 = {
	eventName = "AppNav_PlacementChanged",
	throttlingPercentage = 10000,
	description = "App Nav placement prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 3, 17 }
}
local Config = nil

local function reportSwitchTab(Previous_page, Current_page, Duration)
	-- upvalues: TelemetryService (copy), config (copy), AppNavDeviceTier (copy), DeviceMemoryTier (copy), config1 (copy), StandardizedFields (copy), FFlagAppNavTelemetryLogger (copy), AppNavTelemetry (ref)
	TelemetryService:LogStat(config, {
		customFields = {
			previous_page = Previous_page,
			current_page = Current_page,
			device_tier = if AppNavDeviceTier then DeviceMemoryTier else nil
		}
	}, Duration)
	TelemetryService:LogEvent(config1, {
		customFields = {
			previous_page = Previous_page,
			current_page = Current_page,
			duration = Duration
		},
		standardizedFields = StandardizedFields
	})
	
	if FFlagAppNavTelemetryLogger then
		AppNavTelemetry:info("AppNav switch_tab previous={} current={} duration_ms={} device_tier={}", tostring(Previous_page), tostring(Current_page), string.format("%.2f", Duration), (tostring(DeviceMemoryTier)))
	end
end

local Config1 = nil

local function reportVisibility(Is_visible, Duration)
	-- upvalues: TelemetryService (copy), config2 (copy), AppNavDeviceTier (copy), DeviceMemoryTier (copy), config3 (copy), StandardizedFields (copy), FFlagAppNavTelemetryLogger (copy), AppNavTelemetry (ref)
	TelemetryService:LogStat(config2, {
		customFields = {
			is_visible = Is_visible,
			device_tier = if AppNavDeviceTier then DeviceMemoryTier else nil
		}
	}, Duration)
	TelemetryService:LogEvent(config3, {
		customFields = { is_visible = Is_visible, duration = Duration },
		standardizedFields = StandardizedFields
	})
	
	if FFlagAppNavTelemetryLogger then
		AppNavTelemetry:info("AppNav is_visible_changed is_visible={} duration_ms={} device_tier={}", tostring(Is_visible), string.format("%.2f", Duration), (tostring(DeviceMemoryTier)))
	end
end

local Previous_placement = nil

return {
	logSwitchTabStart = function(PreviousPage, NextPage)
		-- upvalues: Config (ref)
		Config = {
			previousPage = PreviousPage,
			nextPage = NextPage,
			startTime = os.clock()
		}
	end,
	logSwitchTabEnd = function(Current_page)
		-- upvalues: Config (ref), reportSwitchTab (copy)
		if not Config then return end
		if Current_page == Config.nextPage then
			local PreviousPage = Config.previousPage
			local ScaledClockTime = (os.clock() - Config.startTime) * 1000
			Config = nil
			reportSwitchTab(PreviousPage, Current_page, ScaledClockTime)
			
			return
		else
			Config = nil
		end
	end,
	logVisibilityStart = function(NextValue)
		-- upvalues: Config1 (ref)
		Config1 = { nextValue = NextValue, startTime = os.clock() }
	end,
	logVisibilityEnd = function(Is_visible)
		-- upvalues: Config1 (ref), reportVisibility (copy)
		if not Config1 then return end
		if Is_visible == Config1.nextValue then
			local ScaledClockTime = (os.clock() - Config1.startTime) * 1000
			Config1 = nil
			reportVisibility(Is_visible, ScaledClockTime)
			
			return
		else
			Config1 = nil
		end
	end,
	logPlacement = function(Current_placement)
		-- upvalues: Previous_placement (ref), TelemetryService (copy), config4 (copy), FFlagAppNavTelemetryLogger (copy), AppNavTelemetry (ref)
		if Current_placement == Previous_placement then return end
		TelemetryService:LogCounter(config4, {
			customFields = {
				previous_placement = Previous_placement,
				current_placement = Current_placement
			}
		})
		
		if FFlagAppNavTelemetryLogger then
			AppNavTelemetry:info("AppNav placement_changed previous={} current={}", tostring(Previous_placement), (tostring(Current_placement)))
		end
		Previous_placement = Current_placement
	end,
	reset = function()
		-- upvalues: Config (ref), Config1 (ref), Previous_placement (ref)
		Config = nil
		Config1 = nil
		Previous_placement = nil
	end
}