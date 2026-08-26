local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local inputTypesEnumModule = require(parent.Enums.InputTypesEnum)
local responsiveModule = require(parent_1.Responsive)
local keyboardHelpPageModule = require(parent.Components.Keyboard.KeyboardHelpPage)
local gamepadHelpPageModule = require(parent.Components.Gamepad.GamepadHelpPage)
local touchHelpPageModule = require(parent.Components.Touch.TouchHelpPage)
local helpPageTelemetryModule = require(parent.Telemetry.HelpPageTelemetry)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local _ = require(parent_1.RobloxAppEnums)
local view = foundationModule.View
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation

local _ = function(p1, p2, p3)
	-- upvalues: inputTypesEnumModule (ref), responsiveModule (ref)
	if p2 then
		return inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	elseif p1 == nil then
		p1 = p3
	end
	return if p1 == responsiveModule.Input.Pointer then inputTypesEnumModule.InputType.KEYBOARD elseif p1 == responsiveModule.Input.Directional then inputTypesEnumModule.InputType.GAMEPAD elseif p1 == responsiveModule.Input.Touch then inputTypesEnumModule.InputType.TOUCH else inputTypesEnumModule.InputType.KEYBOARD
end

return reactModule.memo(function()
	-- upvalues: responsiveModule (ref), inputTypesEnumModule (ref), useDeviceOrientation (ref), reactModule (ref), helpPageTelemetryModule (ref), keyboardHelpPageModule (ref), gamepadHelpPageModule (ref), touchHelpPageModule (ref), view (ref)
	local SPATIAL_GAMEPAD
	local var1 = responsiveModule.useLastInput()
	local var2 = responsiveModule.useIsSpatial()
	local var3 = responsiveModule.usePreferredInput()
	local var4 = var1
	
	if var2 then
		SPATIAL_GAMEPAD = inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	elseif var4 == nil then
		var4 = var3
	end
	SPATIAL_GAMEPAD = if var4 == responsiveModule.Input.Pointer then inputTypesEnumModule.InputType.KEYBOARD elseif var4 == responsiveModule.Input.Directional then inputTypesEnumModule.InputType.GAMEPAD elseif var4 == responsiveModule.Input.Touch then inputTypesEnumModule.InputType.TOUCH else inputTypesEnumModule.InputType.KEYBOARD
	local var5 = useDeviceOrientation()
	reactModule.useEffect(function()
		-- upvalues: helpPageTelemetryModule (copy), var5 (ref), SPATIAL_GAMEPAD (ref)
		helpPageTelemetryModule.default:logHelpPageInteraction("Help_Interaction", { orientation = var5, last_input_type = SPATIAL_GAMEPAD })
	end, { var5, SPATIAL_GAMEPAD })
	
	return if SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.KEYBOARD then reactModule.createElement(keyboardHelpPageModule) elseif SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.GAMEPAD or SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.SPATIAL_GAMEPAD then reactModule.createElement(gamepadHelpPageModule, {
		isSpatial = SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	}) elseif SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.TOUCH then reactModule.createElement(touchHelpPageModule) else reactModule.createElement(view, nil, {})
end)