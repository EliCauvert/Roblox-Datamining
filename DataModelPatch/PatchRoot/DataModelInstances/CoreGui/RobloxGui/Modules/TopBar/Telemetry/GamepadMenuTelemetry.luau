local TelemetryService = game:GetService("TelemetryService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = require(script.Parent.Parent.Components.Presentation.GamepadMenu.EnumGamepadMenuOptions)
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local GamepadMenuActionThrottleHundrethsPercent = game:DefineFastInt("GamepadMenuActionThrottleHundrethsPercent", 0)

local function _(p1, Callback)
	return if p1 == nil then nil else Callback(p1)
end

local GamepadMenuTelemetryModule = {}
GamepadMenuTelemetryModule.__index = GamepadMenuTelemetryModule

function GamepadMenuTelemetryModule.new()
	-- upvalues: GamepadMenuTelemetryModule (copy)
	return (setmetatable({}, GamepadMenuTelemetryModule))
end

function GamepadMenuTelemetryModule:onOptionSelected()
	-- upvalues: GamepadMenuActionThrottleHundrethsPercent (copy), TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy)
	local config = {
		eventName = "coreui_gamepad_menu_action",
		description = "Event fired from the client every time GamepadMenu Options are Selected",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
		backends = { "EventIngest" },
		throttlingPercentage = GamepadMenuActionThrottleHundrethsPercent,
		lastUpdated = { 25, 4, 30 }
	}
	local List = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	local UsedShortcut = self.usedShortcut
	local Callback = tostring
	local CallbackResult = if UsedShortcut == nil then nil else Callback(UsedShortcut)
	local IsToggleOpen = self.isToggleOpen
	local Callback1 = tostring
	local CustomFields = {
		menu_option_name = self.menuOptionName,
		used_shortcut = CallbackResult,
		is_toggle_open = if IsToggleOpen == nil then nil else Callback1(IsToggleOpen)
	}
	
	if TelemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(List, "addPlaySessionId")
	else
		List = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		CustomFields.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	TelemetryService:LogEvent(config, { standardizedFields = List, customFields = CustomFields })
end

GamepadMenuTelemetryModule.default = GamepadMenuTelemetryModule.new()

return GamepadMenuTelemetryModule