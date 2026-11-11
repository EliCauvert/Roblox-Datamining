local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local _ = require(Parent.Navigation)
local AuthenticationScreenModule = require(LoginV2.Components.AuthenticationScreen)
local LoginScreenV2Module = require(LoginV2.Components.LoginScreenV2)
local EmailOtpScreenModule = require(LoginV2.Components.EmailOtpScreen)

return (RoactNavigationModule.createRobloxSwitchNavigator({
	{
		[LoginPageStateModule.LoginScreenV2] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), LoginScreenV2Module (copy)
				return ReactModule.createElement(LoginScreenV2Module, p1)
			end,
			navigationOptions = { title = LoginPageStateModule.LoginScreenV2 }
		}
	},
	{
		[LoginPageStateModule.AuthenticationScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), AuthenticationScreenModule (copy)
				return ReactModule.createElement(AuthenticationScreenModule, p1)
			end,
			navigationOptions = { title = LoginPageStateModule.AuthenticationScreen }
		}
	},
	{
		[LoginPageStateModule.EmailOtpScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), EmailOtpScreenModule (copy)
				return ReactModule.createElement(EmailOtpScreenModule, p1)
			end,
			navigationOptions = { title = LoginPageStateModule.EmailOtpScreen }
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = LoginPageStateModule.LoginScreenV2,
	backBehavior = RoactNavigationModule.BackBehavior.InitialRoute
}))