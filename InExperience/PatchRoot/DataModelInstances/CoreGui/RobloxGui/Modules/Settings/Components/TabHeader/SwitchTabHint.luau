local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local HELPPAGE = require(CorePackages.Workspace.Packages.HelpPage).Constants.HELP_PAGE
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagGamepadIconSupportCheck = SharedFlagsModule.FFlagGamepadIconSupportCheck
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput

local function getSupportsButton(Keycode) --[[ Line: 23 ]]
	-- upvalues: FFlagGamepadIconSupportCheck (copy), UserInputService (copy)
	return not FFlagGamepadIconSupportCheck or UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Keycode)
end

local function _(): boolean --[[ Line: 30 | Named "isPreferredInputTypeGamepad" ]]
	-- upvalues: UserInputService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy)
	return UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
end

local _ = function(): boolean --[[ Line: 38 | Named "isPlayStationGamepad" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross"
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 43 | Named "SwitchTabHint" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), getSupportsButton (copy), UserInputService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), UseEventConnectionFunction (copy), FFlagGamepadIconSupportCheck (copy), HELPPAGE (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(getSupportsButton(p1.keycode))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad)
	UseEventConnectionFunction(UserInputService:GetPropertyChangedSignal("PreferredInput"), function() --[[ Line: 48 ]]
		-- upvalues: UseBindingResult2 (copy), UserInputService (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), UseStateResult2_1 (copy)
		UseBindingResult2(UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad)
		UseStateResult2_1(UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	end, {})
	
	if FFlagGamepadIconSupportCheck then
		UseEventConnectionFunction(UserInputService.LastInputTypeChanged, function() --[[ Line: 53 ]]
			-- upvalues: UseStateResult2 (copy), getSupportsButton (upval), p1 (copy)
			UseStateResult2(getSupportsButton(p1.keycode))
		end, {})
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 58 ]]
		-- upvalues: UseStateResult1 (copy), HELPPAGE (upval), p1 (copy)
		return if UseStateResult1 then HELPPAGE.GAMEPAD_ICON_MAP_PLAYSTATION[p1.keycode] else HELPPAGE.GAMEPAD_ICON_MAP_XBOX[p1.keycode]
	end, { p1.keycode, UseStateResult1 })
	
	return if UseStateResult then ReactModule.createElement(Icon, {
		name = UseMemoResult,
		size = UseTokensResult.Size.Size_800,
		Visible = UseBindingResult,
		ref = Ref
	}) else nil
end))