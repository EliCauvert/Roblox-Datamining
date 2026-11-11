local UserGameSettings = UserSettings():GetService("UserGameSettings")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Events = {
	UserGameSettings:GetPropertyChangedSignal("GamepadCameraSensitivity"),
	UserGameSettings:GetPropertyChangedSignal("MouseSensitivity"),
	UserGameSettings:GetPropertyChangedSignal("MouseSensitivityFirstPerson"),
	UserGameSettings:GetPropertyChangedSignal("MouseSensitivityThirdPerson")
}
local Parent = script.Parent.Parent.Parent
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local SliderEntryModule = require(script.Parent.SliderEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)

local function _(p1: number): number
	return (math.clamp(if p1 <= 5 then 0.198 * p1 + 0.01 else 0.6 * p1 - 2, 0, 10))
end

local _ = function(p1: number): number
	return (math.clamp(math.floor((if p1 <= 1 then (p1 - 0.01) / 0.198 else (p1 + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10))
end

local CameraSensitivityEntry = Roact.PureComponent:extend("CameraSensitivityEntry")
CameraSensitivityEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean)
})

function CameraSensitivityEntry.init(p1)
	-- upvalues: UserGameSettings (copy)
	function p1.onSensitivityChanged()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({
			engineSensitivity = UserGameSettings.MouseSensitivityFirstPerson.X
		})
	end
	
	p1.onSensitivityChanged()
end

function CameraSensitivityEntry.render(p1)
	-- upvalues: Roact (copy), SliderEntryModule (copy), UserGameSettings (copy), SendAnalyticsModule (copy), ConstantsModule (copy), Events (copy), ExternalEventConnectionModule (copy)
	local EngineSensitivity: number = p1.state.engineSensitivity
	local config = {
		CameraSensitivityMouseSlider = Roact.createElement(SliderEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.CameraSensitivity",
			min = 0,
			max = 10,
			stepInterval = 1,
			keyboardInputStepInterval = 0.01,
			LayoutOrder = p1.props.LayoutOrder,
			value = math.clamp(math.floor((if EngineSensitivity <= 1 then (EngineSensitivity - 0.01) / 0.198 else (EngineSensitivity + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10),
			valueChanged = function(p2: number)
				-- upvalues: UserGameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
				local ClampedValue = math.clamp(if p2 <= 5 then 0.198 * p2 + 0.01 else 0.6 * p2 - 2, 0, 10)
				local _Vector2 = Vector2.new(ClampedValue, ClampedValue)
				UserGameSettings.MouseSensitivityFirstPerson = _Vector2
				UserGameSettings.MouseSensitivityThirdPerson = _Vector2
				SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		})
	}
	
	for _, event in ipairs(Events) do
		config[tostring(event) .. "CameraSensitivityControlConnection"] = Roact.createElement(ExternalEventConnectionModule, { event = event, callback = p1.onSensitivityChanged })
	end
	return Roact.createFragment(config)
end

return CameraSensitivityEntry