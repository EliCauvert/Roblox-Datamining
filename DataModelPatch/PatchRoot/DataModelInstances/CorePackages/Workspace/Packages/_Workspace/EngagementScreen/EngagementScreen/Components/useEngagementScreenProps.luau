local Parent = script:FindFirstAncestor("EngagementScreen").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local NavigateWithPlatformAccountFunction = require(Parent.AppStartup).navigateWithPlatformAccount
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ResponsiveModule = require(Parent.Responsive)
local BackgroundFill = require(Parent.AuthCommon).Components.BackgroundFill
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppLogging (copy), ReactModule (copy), ThirdPartyUserService (copy), ResponsiveModule (copy), BackgroundFill (copy), NavigateWithPlatformAccountFunction (copy)
	local UseSingleSignOn = p1.useSingleSignOn
	local AllowPlatformAccountSwitching = p1.allowPlatformAccountSwitching
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local OnSwitchAccounts = if AllowPlatformAccountSwitching then function()
		-- upvalues: ThirdPartyUserService (upval)
		if ThirdPartyUserService then
			ThirdPartyUserService:ShowAccountPicker()
		end
	end else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), BackgroundFill (upval)
		return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Background = ReactModule.createElement(BackgroundFill, {
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
			})
		})
	end, {})
	local UseResult2 = if ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional then nil else UseResult1
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRoactServiceResult (copy), ThirdPartyUserService (upval), NavigateWithPlatformAccountFunction (upval), UseSingleSignOn (copy), UseNavigationResult (copy), UseStateResult2 (copy)
		if UseStateResult then
			UseRoactServiceResult:logEventOnce("engagement_screen_did_continue")
			
			if ThirdPartyUserService then
				ThirdPartyUserService:RegisterActiveUser(Enum.UserInputType.Gamepad1)
			end
			NavigateWithPlatformAccountFunction(UseSingleSignOn, UseNavigationResult.replace)
			UseStateResult2(false)
		end
	end, {
		UseStateResult,
		UseRoactServiceResult,
		UseSingleSignOn,
		UseNavigationResult.replace
	})
	
	return {
		onContinue = UseResult,
		onSwitchAccounts = OnSwitchAccounts,
		renderBackground = UseResult2
	}
end