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

local function getSupportsButton(p1)
	-- upvalues: fFlagGamepadIconSupportCheck (ref), userInputService (ref)
	return if fFlagGamepadIconSupportCheck then userInputService:GamepadSupports(userInputService:GetLastInputType(), p1) else true
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
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(getSupportsButton(p1.keycode))
	local var4, var5 = reactModule.useState(userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	local var6, var7 = reactModule.useBinding(userInputService.PreferredInput == Enum.PreferredInput.Gamepad)
	useEventConnection(userInputService:GetPropertyChangedSignal("PreferredInput"), function()
		-- upvalues: var7 (ref), userInputService (copy), var5 (ref)
		var7(userInputService.PreferredInput == Enum.PreferredInput.Gamepad)
		var5(userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	end, {})
	
	if fFlagGamepadIconSupportCheck then
		useEventConnection(userInputService.LastInputTypeChanged, function()
			-- upvalues: var3 (ref), getSupportsButton (copy), p1 (ref)
			var3(getSupportsButton(p1.keycode))
		end, {})
	end
	return if var2 then reactModule.createElement(icon, {
		name = reactModule.useMemo(function()
			-- upvalues: var4 (ref), HELP_PAGE (copy), p1 (ref)
			return if var4 then HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[p1.keycode] else HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[p1.keycode]
		end, { p1.keycode, var4 }),
		size = var1.Size.Size_800,
		Visible = var6,
		ref = p2
	}) else nil
end))