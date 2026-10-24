local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("SplitPane").Parent
local TelemetryService = require(Parent.MockableProxyServices).TelemetryService
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local EndReason = {
	TooltipHiddenTimeout = 1,
	UserChanged = 2,
	HostUnmounted = 3,
	BreakpointLost = 4,
	DeepLink = 5
}
local config = { Collapsed = 1, Open = 2 }
local config1 = { Pointer = 1, Touch = 2, Gamepad = 3 }
local config2 = {
	[1] = "delivered",
	[2] = "started",
	[3] = "step_shown",
	[4] = "step_advanced",
	[5] = "skipped",
	[6] = "completed",
	[7] = "abandoned",
	[8] = "interrupted",
	[9] = "restarted"
}
local config3 = {
	[EndReason.TooltipHiddenTimeout] = "tooltip_hidden_timeout",
	[EndReason.UserChanged] = "user_changed",
	[EndReason.HostUnmounted] = "host_unmounted",
	[EndReason.BreakpointLost] = "breakpoint_lost",
	[EndReason.DeepLink] = "deep_link"
}
local config4 = {
	eventName = "splitPaneTourEvent",
	description = "Split Pane educational tour lifecycle, from delivery through its ending.",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("SplitPaneTourEventTelemetryThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 10, 13 }
}
local config5 = {
	eventName = "SplitPane_TourEvent",
	description = "Split Pane educational tour lifecycle events by type and end reason.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 13 }
}
local StandardizedFields = { "addSessionId", "addOSInfo" }
local Config = nil

local function _(): number
	-- upvalues: ResponsiveModule (copy)
	local PreferredInputType = ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false)
	
	return if PreferredInputType == ResponsiveModule.Input.Directional then 3 elseif PreferredInputType == ResponsiveModule.Input.Touch then 2 else 1
end

local _ = function(p1): number
	return if p1 then 1 else 2
end

local _ = function()
	-- upvalues: Config (ref), HttpService (copy)
	if Config == nil then
		Config = {
			hasStarted = false,
			didTourOpenPane = false,
			id = HttpService:GenerateGUID(false)
		}
	end
	return Config
end

local function log(Event_type, Tbl)
	-- upvalues: Config (ref), HttpService (copy), DisplayModule (copy), ResponsiveModule (copy), config1 (copy), TelemetryService (copy), config4 (copy), StandardizedFields (copy), config5 (copy), config2 (copy), config3 (copy)
	if Config == nil then
		Config = {
			hasStarted = false,
			didTourOpenPane = false,
			id = HttpService:GenerateGUID(false)
		}
	end
	local Config1 = Config
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local PlatformScale: number = DisplayStore.getPlatformScale(false)
	local Copy = table.clone(Tbl)
	Copy.tour_run_id = Config1.id
	Copy.event_type = Event_type
	local PreferredInputType = ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false)
	Copy.input_mode = if PreferredInputType == ResponsiveModule.Input.Directional then config1.Gamepad elseif PreferredInputType == ResponsiveModule.Input.Touch then config1.Touch else config1.Pointer
	Copy.start_pane_state = Config1.startPaneState
	Copy.viewport_width = math.round((DisplayStore.getDesignSpaceViewportWidth(false)))
	Copy.viewport_height = math.round(DisplayStore.getViewportSize(false).Y / (if PlatformScale and PlatformScale > 0 then PlatformScale else 1))
	TelemetryService:LogEvent(config4, {
		standardizedFields = StandardizedFields,
		customFields = Copy
	})
	TelemetryService:LogCounter(config5, {
		customFields = {
			event_type = config2[Event_type],
			end_reason = if Tbl.end_reason == nil then "none" else config3[Tbl.end_reason]
		}
	}, 1)
end

local _ = function()
	-- upvalues: Config (ref)
	local StepShownAt = if Config == nil then nil else Config.stepShownAt
	
	return if StepShownAt == nil then nil else math.round((os.clock() - StepShownAt) * 1000)
end

return {
	EndReason = EndReason,
	logDelivered = function(Total_steps)
		-- upvalues: Config (ref), log (copy)
		if Config == nil or not Config.hasStarted then
			Config = nil
			log(1, { total_steps = Total_steps })
			
			return
		end
	end,
	logStepShown = function(Step_index, Total_steps, p1)
		-- upvalues: Config (ref), HttpService (copy), config (copy), log (copy)
		if Config == nil then
			Config = {
				hasStarted = false,
				didTourOpenPane = false,
				id = HttpService:GenerateGUID(false)
			}
		end
		local Config1 = Config
		
		if Step_index == 1 and not Config1.hasStarted then
			Config1.hasStarted = true
			Config1.startPaneState = if p1 then config.Collapsed else config.Open
			log(2, { step_index = Step_index, total_steps = Total_steps })
		elseif Step_index == 1 and Config1.interruptedAtStep ~= nil then
			log(9, {
				step_index = Step_index,
				total_steps = Total_steps,
				interrupted_at_step = Config1.interruptedAtStep
			})
		end
		Config1.interruptedAtStep = nil
		Config1.stepShownAt = os.clock()
		log(3, { step_index = Step_index, total_steps = Total_steps })
	end,
	logStepAdvanced = function(Step_index, Total_steps, p1)
		-- upvalues: Config (ref), HttpService (copy), log (copy)
		if p1 then
			if Config == nil then
				Config = {
					hasStarted = false,
					didTourOpenPane = false,
					id = HttpService:GenerateGUID(false)
				}
			end
			Config.didTourOpenPane = true
		end
		local StepShownAt = if Config == nil then nil else Config.stepShownAt
		log(4, {
			step_index = Step_index,
			total_steps = Total_steps,
			step_duration_ms = if StepShownAt == nil then nil else math.round((os.clock() - StepShownAt) * 1000)
		})
	end,
	logInterrupted = function(InterruptedAtStep, Total_steps)
		-- upvalues: Config (ref), log (copy)
		if Config ~= nil and Config.hasStarted then
			local Config1 = Config
			Config1.interruptedAtStep = InterruptedAtStep
			Config1.stepShownAt = nil
			log(8, {
				step_index = InterruptedAtStep,
				total_steps = Total_steps,
				interrupted_at_step = InterruptedAtStep
			})
			
			return
		end
	end,
	logUserEnded = function(p1, Step_index, Total_steps, p2)
		-- upvalues: log (copy), Config (ref), config (copy), HttpService (copy)
		local Event_type: number = if p1 then 6 else 5
		local StepShownAt = if Config == nil then nil else Config.stepShownAt
		local config1 = {
			step_index = Step_index,
			total_steps = Total_steps,
			step_duration_ms = if StepShownAt == nil then nil else math.round((os.clock() - StepShownAt) * 1000),
			end_pane_state = if p2 then config.Collapsed else config.Open
		}
		
		if Config == nil then
			Config = {
				hasStarted = false,
				didTourOpenPane = false,
				id = HttpService:GenerateGUID(false)
			}
		end
		config1.did_tour_open_pane = Config.didTourOpenPane
		log(Event_type, config1)
		Config = nil
	end,
	logAbandoned = function(End_reason, p1: number, Total_steps, p2)
		-- upvalues: Config (ref), log (copy), config (copy)
		if Config ~= nil then
			log(7, {
				step_index = if p1 > 0 then p1 else nil,
				total_steps = Total_steps,
				end_pane_state = if p2 then config.Collapsed else config.Open,
				end_reason = End_reason,
				did_tour_open_pane = Config.didTourOpenPane,
				interrupted_at_step = Config.interruptedAtStep
			})
			Config = nil
			
			return
		end
	end
}