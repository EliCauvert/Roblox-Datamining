local telemetryService = game:GetService("TelemetryService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = require(script.Parent.Parent.Components.Presentation.GamepadMenu.EnumGamepadMenuOptions)
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local gamepadMenuActionThrottleHundrethsPercent = game:DefineFastInt("GamepadMenuActionThrottleHundrethsPercent", 0)

local function _(p1, p2)
	return if p1 == nil then nil else p2(p1)
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t:onOptionSelected()
	-- upvalues: gamepadMenuActionThrottleHundrethsPercent (ref), telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
	local t = {
		eventName = "coreui_gamepad_menu_action",
		description = "Event fired from the client every time GamepadMenu Options are Selected",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
		backends = { "EventIngest" },
		throttlingPercentage = gamepadMenuActionThrottleHundrethsPercent,
		lastUpdated = { 25, 4, 30 }
	}
	local list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	local t_1 = { menu_option_name = self.menuOptionName }
	local usedShortcut = self.usedShortcut
	t_1.used_shortcut = if usedShortcut ~= nil then nil else tostring(usedShortcut)
	local isToggleOpen = self.isToggleOpen
	t_1.is_toggle_open = if isToggleOpen ~= nil then nil else tostring(isToggleOpen)
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(list, "addPlaySessionId")
	else
		list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		t_1.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	telemetryService:LogEvent(t, { standardizedFields = list, customFields = t_1 })
end

t.default = t.new()

return t