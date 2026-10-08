local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local roactUtilsModule = require(parent.RoactUtils)
local useProperty = require(parent.GuiObjectUtils).useProperty
local useSignalState = require(parent.SignalsReact).useSignalState
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local loginStatus = robloxAppEnumsModule.LoginStatus
local appPage = robloxAppEnumsModule.AppPage
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useIsTvRemoteDevice = roactUtilsModule.Hooks.useIsTvRemoteDevice
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseSignalsForAuthenticationStatus = sharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local fFlagLuaSupportMicroGamepadPreferredInput = sharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1)
	-- upvalues: loginStatus (ref)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == loginStatus.LOGGED_IN
end

return function(p1)
	-- upvalues: reactFocusNavigationModule (ref), responsiveModule (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), useProperty (ref), userInputService (ref), useIsTvRemoteDevice (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var1 (ref), loginStatus (ref), useSelector (ref), selectUserLoggedIn (ref), appPage (ref)
	local var2
	local var3 = reactFocusNavigationModule.useFocusedGuiObject() ~= nil
	local var4 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var5 = responsiveModule.useOrientation() == responsiveModule.Keys.Portrait
	
	if fFlagLuaSupportMicroGamepadPreferredInput then
		var2 = useProperty(userInputService, "PreferredInput") == Enum.PreferredInput.MicroGamepad
		var2 = nil
	else
		var2 = useIsTvRemoteDevice()
	end
	local var6
	if fFlagUseSignalsForAuthenticationStatus then
		var6 = useSignalState(var1(false).getStatus) == loginStatus.LOGGED_IN
		var6 = nil
	else
		var6 = useSelector(selectUserLoggedIn)
	end
	local var7
	if not var3 then
		var7 = var4
		
		if var7 then
			var7 = var6 and (p1 ~= appPage.AdjustScreen and (not var5 and not var2))
		end
		return var7
	end
end