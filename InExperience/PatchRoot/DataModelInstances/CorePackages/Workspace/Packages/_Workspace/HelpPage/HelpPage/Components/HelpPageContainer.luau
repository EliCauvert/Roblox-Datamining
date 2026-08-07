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

local _ = function(p0, p1, p2) --[[ line: 22 ]]
	-- upvalues: inputTypesEnumModule (ref), responsiveModule (ref)
	if p1 then
		return inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	elseif p0 == nil then
		p0 = p2
	end
	return if p0 == responsiveModule.Input.Pointer then inputTypesEnumModule.InputType.KEYBOARD elseif p0 == responsiveModule.Input.Directional then inputTypesEnumModule.InputType.GAMEPAD elseif p0 == responsiveModule.Input.Touch then inputTypesEnumModule.InputType.TOUCH else inputTypesEnumModule.InputType.KEYBOARD
end

return reactModule.memo(function() --[[ line: 43 | named "HelpPageContainer" ]]
	-- upvalues: responsiveModule (ref), inputTypesEnumModule (ref), useDeviceOrientation (ref), reactModule (ref), helpPageTelemetryModule (ref), keyboardHelpPageModule (ref), gamepadHelpPageModule (ref), touchHelpPageModule (ref), view (ref)
	local SPATIAL_GAMEPAD
	local var9 = responsiveModule.useLastInput()
	local var10 = responsiveModule.useIsSpatial()
	local var11 = responsiveModule.usePreferredInput()
	local var12 = var9
	
	if var10 then
		SPATIAL_GAMEPAD = inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	elseif var12 == nil then
		var12 = var11
	end
	SPATIAL_GAMEPAD = if var12 == responsiveModule.Input.Pointer then inputTypesEnumModule.InputType.KEYBOARD elseif var12 == responsiveModule.Input.Directional then inputTypesEnumModule.InputType.GAMEPAD elseif var12 == responsiveModule.Input.Touch then inputTypesEnumModule.InputType.TOUCH else inputTypesEnumModule.InputType.KEYBOARD
	local var13 = useDeviceOrientation()
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: helpPageTelemetryModule (copy), var13 (ref), SPATIAL_GAMEPAD (ref)
		helpPageTelemetryModule.default:logHelpPageInteraction("Help_Interaction", { orientation = var13, last_input_type = SPATIAL_GAMEPAD })
	end, { var13, SPATIAL_GAMEPAD })
	
	return if SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.KEYBOARD then reactModule.createElement(keyboardHelpPageModule) elseif SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.GAMEPAD or SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.SPATIAL_GAMEPAD then reactModule.createElement(gamepadHelpPageModule, {
		isSpatial = SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.SPATIAL_GAMEPAD
	}) elseif SPATIAL_GAMEPAD == inputTypesEnumModule.InputType.TOUCH then reactModule.createElement(touchHelpPageModule) else reactModule.createElement(view, nil, {})
end)