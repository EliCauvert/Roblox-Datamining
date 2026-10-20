local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local InputTypesEnumModule = require(Parent.Enums.InputTypesEnum)
local ResponsiveModule = require(Parent1.Responsive)
local KeyboardHelpPageModule = require(Parent.Components.Keyboard.KeyboardHelpPage)
local GamepadHelpPageModule = require(Parent.Components.Gamepad.GamepadHelpPage)
local TouchHelpPageModule = require(Parent.Components.Touch.TouchHelpPage)
local HelpPageTelemetryModule = require(Parent.Telemetry.HelpPageTelemetry)
local _ = require(Parent1.RobloxAppEnums)
local View = require(Parent1.Foundation).View
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation

local function _(Directional, p1, p2)
	-- upvalues: InputTypesEnumModule (copy), ResponsiveModule (copy)
	if p1 then
		return InputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	end
	if Directional == nil then
		Directional = p2
	end
	return if Directional == ResponsiveModule.Input.Pointer then InputTypesEnumModule.InputType.KEYBOARD elseif Directional == ResponsiveModule.Input.Directional then InputTypesEnumModule.InputType.GAMEPAD elseif Directional == ResponsiveModule.Input.Touch then InputTypesEnumModule.InputType.TOUCH else InputTypesEnumModule.InputType.KEYBOARD
end

return ReactModule.memo(function()
	-- upvalues: ResponsiveModule (copy), InputTypesEnumModule (copy), UseDeviceOrientationFunction (copy), ReactModule (copy), HelpPageTelemetryModule (copy), KeyboardHelpPageModule (copy), GamepadHelpPageModule (copy), TouchHelpPageModule (copy), View (copy)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local SPATIALGAMEPAD = nil
	
	if ResponsiveModule.useIsSpatial() then
		SPATIALGAMEPAD = InputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	else
		if UseLastInputResult == nil then
			UseLastInputResult = UsePreferredInputResult
		end
		SPATIALGAMEPAD = if UseLastInputResult == ResponsiveModule.Input.Pointer then InputTypesEnumModule.InputType.KEYBOARD elseif UseLastInputResult == ResponsiveModule.Input.Directional then InputTypesEnumModule.InputType.GAMEPAD elseif UseLastInputResult == ResponsiveModule.Input.Touch then InputTypesEnumModule.InputType.TOUCH else InputTypesEnumModule.InputType.KEYBOARD
	end
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	ReactModule.useEffect(function()
		-- upvalues: HelpPageTelemetryModule (upval), UseDeviceOrientationResult (copy), SPATIALGAMEPAD (copy)
		HelpPageTelemetryModule.default:logHelpPageInteraction("Help_Interaction", {
			orientation = UseDeviceOrientationResult,
			last_input_type = SPATIALGAMEPAD
		})
	end, { UseDeviceOrientationResult, SPATIALGAMEPAD })
	
	return if SPATIALGAMEPAD == InputTypesEnumModule.InputType.KEYBOARD then ReactModule.createElement(KeyboardHelpPageModule) elseif SPATIALGAMEPAD == InputTypesEnumModule.InputType.GAMEPAD or SPATIALGAMEPAD == InputTypesEnumModule.InputType.SPATIAL_GAMEPAD then ReactModule.createElement(GamepadHelpPageModule, {
		isSpatial = SPATIALGAMEPAD == InputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	}) elseif SPATIALGAMEPAD == InputTypesEnumModule.InputType.TOUCH then ReactModule.createElement(TouchHelpPageModule) else ReactModule.createElement(View, nil, {})
end)