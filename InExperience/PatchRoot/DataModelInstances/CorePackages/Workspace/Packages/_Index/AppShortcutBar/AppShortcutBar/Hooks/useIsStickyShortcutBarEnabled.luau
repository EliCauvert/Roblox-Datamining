local UserInputService = game:GetService("UserInputService")
local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local RoactUtilsModule = require(Parent.RoactUtils)
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local LoginStatus = RobloxAppEnumsModule.LoginStatus
local AppPage = RobloxAppEnumsModule.AppPage
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseIsTvRemoteDeviceFunction = RoactUtilsModule.Hooks.useIsTvRemoteDevice
local UseIsRealGamepadConnectedFunction = RoactUtilsModule.Hooks.useIsRealGamepadConnected
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseSignalsForAuthenticationStatus = SharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local FFlagStickyShortcutBarTvRemoteWithGamepad = require(AppShortcutBar.Flags).FFlagStickyShortcutBarTvRemoteWithGamepad
local FFlagUnifyShortcutBarQA = SharedFlagsModule.FFlagUnifyShortcutBarQA
local GetAuthenticationStatusStore = if FFlagUseSignalsForAuthenticationStatus then require(Parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1): boolean
	-- upvalues: LoginStatus (copy)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
end

return function(AdjustScreen)
	-- upvalues: ReactFocusNavigationModule (copy), ResponsiveModule (copy), FFlagUnifyShortcutBarQA (copy), UsePropertyFunction (copy), UserInputService (copy), FFlagStickyShortcutBarTvRemoteWithGamepad (copy), UseIsTvRemoteDeviceFunction (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), UseIsRealGamepadConnectedFunction (copy), FFlagUseSignalsForAuthenticationStatus (copy), UseSignalStateFunction (copy), GetAuthenticationStatusStore (copy), LoginStatus (copy), UseSelectorFunction (copy), selectUserLoggedIn (copy), AppPage (copy)
	local HasUseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject() ~= nil
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.Keys.Portrait
	
	if FFlagUnifyShortcutBarQA then
		local TouchEnabled = UsePropertyFunction(UserInputService, "TouchEnabled")
		IsUseOrientationResultMatch = IsUseOrientationResultMatch and TouchEnabled
	end
	local UseIsTvRemoteDeviceResult = if FFlagStickyShortcutBarTvRemoteWithGamepad then UseIsTvRemoteDeviceFunction() elseif FFlagLuaSupportMicroGamepadPreferredInput then UsePropertyFunction(UserInputService, "PreferredInput") == Enum.PreferredInput.MicroGamepad else UseIsTvRemoteDeviceFunction()
	local UseIsRealGamepadConnectedResult = if FFlagStickyShortcutBarTvRemoteWithGamepad then UseIsRealGamepadConnectedFunction() else false
	local IsUseSignalStateResultMatch = if FFlagUseSignalsForAuthenticationStatus then UseSignalStateFunction(GetAuthenticationStatusStore(false).getStatus) == LoginStatus.LOGGED_IN else UseSelectorFunction(selectUserLoggedIn)
	
	return if HasUseFocusedGuiObjectResult then IsUseSignalStateResultMatch and (AdjustScreen ~= AppPage.AdjustScreen and (not IsUseOrientationResultMatch and (not UseIsTvRemoteDeviceResult or UseIsRealGamepadConnectedResult))) else IsUsePreferredInputResultMatch and (IsUseSignalStateResultMatch and (AdjustScreen ~= AppPage.AdjustScreen and (not IsUseOrientationResultMatch and (not UseIsTvRemoteDeviceResult or UseIsRealGamepadConnectedResult))))
end