local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UIBloxModule = require(Parent.UIBlox)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseEffectFunction = ReactModule.useEffect
local DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _ = require(LoginV2.Components.Types)
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local LoginContextProviderModule = require(LoginV2.Context.LoginContextProvider)
local LoginSwitchNavigatorModule = require(LoginV2.Navigators.LoginSwitchNavigator)

local function v13(Style)
	-- upvalues: UserInputService (copy), GuiService (copy), HttpService (copy), NotificationType (copy)
	if UserInputService:GetPlatform() == Enum.Platform.IOS then
		GuiService:BroadcastNotification(HttpService:JSONEncode({ style = Style }), NotificationType.SET_STATUS_BAR_STYLE)
	end
end

local MemoizeResult = require(Parent.AppCommonLib).memoize(function(p1)
	-- upvalues: RoactNavigationModule (copy)
	return RoactNavigationModule.createAppContainer(p1)
end)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseStyleFunction (copy), MemoizeResult (copy), LoginSwitchNavigatorModule (copy), UseEffectFunction (copy), DarkTheme (copy), v13 (copy), ReactModule (copy), LoginContextProviderModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local MemoizeResultResult = MemoizeResult(LoginSwitchNavigatorModule)
	UseEffectFunction(function()
		-- upvalues: UseStyleResult (copy), DarkTheme (upval), v13 (upval)
		local IsThemeMatch = UseStyleResult.Theme == DarkTheme
		v13(if IsThemeMatch then "lightcontent" else "default")
		
		return function()
			-- upvalues: v13 (upval)
			v13("default")
		end
	end, {})
	
	return ReactModule.createElement(LoginContextProviderModule, {
		parentNavigation = UseNavigationResult,
		monoDeps = p1.monoDeps
	}, {
		NavigationAppContainer = ReactModule.createElement(MemoizeResultResult)
	})
end