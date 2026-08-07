local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local list = {
	userGameSettingsService:GetPropertyChangedSignal("GamepadCameraSensitivity"),
	userGameSettingsService:GetPropertyChangedSignal("MouseSensitivity"),
	userGameSettingsService:GetPropertyChangedSignal("MouseSensitivityFirstPerson"),
	userGameSettingsService:GetPropertyChangedSignal("MouseSensitivityThirdPerson")
}
local parent = script.Parent.Parent.Parent
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local sliderEntryModule = require(script.Parent.SliderEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)

local function _(p0) --[[ line: 30 | named "guiToEngineSensitivity" ]]
	return math.clamp(if p0 <= 5 then 0.198 * p0 + 0.01 else 0.6 * p0 - 2, 0, 10)
end

local _ = function(p1) --[[ line: 41 | named "engineToGuiSensitivity" ]]
	return math.clamp(math.floor((if p1 <= 1 then (p1 - 0.01) / 0.198 else (p1 + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10)
end

local cameraSensitivityEntry = roact.PureComponent:extend("CameraSensitivityEntry")
cameraSensitivityEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean)
})

function cameraSensitivityEntry.init(p2) --[[ line: 62 ]]
	-- upvalues: userGameSettingsService (ref)
	function p2.onSensitivityChanged() --[[ line: 63 ]]
		-- upvalues: p2 (ref), userGameSettingsService (copy)
		p2:setState({
			engineSensitivity = userGameSettingsService.MouseSensitivityFirstPerson.X
		})
	end
	
	p2.onSensitivityChanged()
end

function cameraSensitivityEntry.render(p3) --[[ line: 73 ]]
	-- upvalues: roact (ref), sliderEntryModule (ref), userGameSettingsService (ref), sendAnalyticsModule (ref), constantsModule (ref), list (ref), externalEventConnectionModule (ref)
	local t = {}
	local createElement = roact.createElement
	local t_1 = {
		labelKey = "CoreScripts.InGameMenu.GameSettings.CameraSensitivity",
		min = 0,
		max = 10,
		stepInterval = 1,
		keyboardInputStepInterval = 0.01,
		LayoutOrder = p3.props.LayoutOrder
	}
	local engineSensitivity = p3.state.engineSensitivity
	t_1.value = math.clamp(math.floor((if engineSensitivity <= 1 then (engineSensitivity - 0.01) / 0.198 else (engineSensitivity + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10)
	
	function t_1.valueChanged(p4) --[[ line: 84 ]]
		-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
		local clampedValue = math.clamp(if p4 <= 5 then 0.198 * p4 + 0.01 else 0.6 * p4 - 2, 0, 10)
		local vector2 = Vector2.new(clampedValue, clampedValue)
		userGameSettingsService.MouseSensitivityFirstPerson = vector2
		userGameSettingsService.MouseSensitivityThirdPerson = vector2
		sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
	end
	
	t_1.canCaptureFocus = p3.props.canCaptureFocus
	t_1.isMenuOpen = p3.props.isMenuOpen
	t.CameraSensitivityMouseSlider = createElement(sliderEntryModule, t_1)
	
	for i, v in ipairs(list) do
		t[tostring(v) .. "CameraSensitivityControlConnection"] = roact.createElement(externalEventConnectionModule, { event = v, callback = p3.onSensitivityChanged })
	end
	return roact.createFragment(t)
end

return cameraSensitivityEntry