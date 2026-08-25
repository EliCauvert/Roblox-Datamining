local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local foundationModule = require(corePackagesService.Packages.Foundation)
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local useEventConnection = reactUtilsModule.useEventConnection
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local HELP_PAGE = helpPageModule.Constants.HELP_PAGE
local fFlagGamepadIconSupportCheck = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck

local function getSupportsButton(p0)
	-- upvalues: fFlagGamepadIconSupportCheck (ref), userInputService (ref)
	return if fFlagGamepadIconSupportCheck then userInputService:GamepadSupports(userInputService:GetLastInputType(), p0) else true
end

local function _()
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput == Enum.PreferredInput.Gamepad
end

local _ = function()
	-- upvalues: userInputService (ref)
	return userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross"
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), getSupportsButton (ref), userInputService (ref), useEventConnection (ref), fFlagGamepadIconSupportCheck (ref), HELP_PAGE (ref), icon (ref)
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(getSupportsButton(p1.keycode))
	local var10, var11 = reactModule.useState(userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	local var12, var13 = reactModule.useBinding(userInputService.PreferredInput == Enum.PreferredInput.Gamepad)
	useEventConnection(userInputService:GetPropertyChangedSignal("PreferredInput"), function()
		-- upvalues: var13 (ref), userInputService (copy), var11 (ref)
		var13(userInputService.PreferredInput == Enum.PreferredInput.Gamepad)
		var11(userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	end, {})
	
	if fFlagGamepadIconSupportCheck then
		useEventConnection(userInputService.LastInputTypeChanged, function()
			-- upvalues: var9 (ref), getSupportsButton (copy), p1 (ref)
			var9(getSupportsButton(p1.keycode))
		end, {})
	end
	return if var8 then reactModule.createElement(icon, {
		name = reactModule.useMemo(function()
			-- upvalues: var10 (ref), HELP_PAGE (copy), p1 (ref)
			return if var10 then HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[p1.keycode] else HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[p1.keycode]
		end, { p1.keycode, var10 }),
		size = var7.Size.Size_800,
		Visible = var12,
		ref = p2
	}) else nil
end))