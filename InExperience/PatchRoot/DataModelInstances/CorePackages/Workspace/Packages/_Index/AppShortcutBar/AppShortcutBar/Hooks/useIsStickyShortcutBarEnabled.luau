local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
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
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseSignalsForAuthenticationStatus = SharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local GetAuthenticationStatusStore = if FFlagUseSignalsForAuthenticationStatus then require(Parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1): boolean --[[ Line: 25 ]]
	-- upvalues: LoginStatus (copy)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
end

return function(AdjustScreen): boolean --[[ Line: 29 | Named "useIsStickyShortcutBarEnabled" ]]
	-- upvalues: ReactFocusNavigationModule (copy), ResponsiveModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), UsePropertyFunction (copy), UserInputService (copy), UseIsTvRemoteDeviceFunction (copy), FFlagUseSignalsForAuthenticationStatus (copy), UseSignalStateFunction (copy), GetAuthenticationStatusStore (copy), LoginStatus (copy), UseSelectorFunction (copy), selectUserLoggedIn (copy), AppPage (copy)
	local HasUseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject() ~= nil
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.Keys.Portrait
	local IsPreferredInputMatch = if FFlagLuaSupportMicroGamepadPreferredInput then UsePropertyFunction(UserInputService, "PreferredInput") == Enum.PreferredInput.MicroGamepad else UseIsTvRemoteDeviceFunction()
	local IsUseSignalStateResultMatch = if FFlagUseSignalsForAuthenticationStatus then UseSignalStateFunction(GetAuthenticationStatusStore(false).getStatus) == LoginStatus.LOGGED_IN else UseSelectorFunction(selectUserLoggedIn)
	
	return if HasUseFocusedGuiObjectResult then IsUseSignalStateResultMatch and (AdjustScreen ~= AppPage.AdjustScreen and (not IsUseOrientationResultMatch and not IsPreferredInputMatch)) else IsUsePreferredInputResultMatch and (IsUseSignalStateResultMatch and (AdjustScreen ~= AppPage.AdjustScreen and (not IsUseOrientationResultMatch and not IsPreferredInputMatch)))
end