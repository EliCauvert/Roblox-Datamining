local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local _ = require(Parent.Navigation)
local RequestRecoveryScreenModule = require(AccountRecovery.Components.RequestRecoveryScreen)
local SendCodeScreenModule = require(AccountRecovery.Components.SendCodeScreen)
local ChooseVerificationMethodScreenModule = require(AccountRecovery.Components.ChooseVerificationMethodScreen)
local AccountVerifiedConfirmationScreenModule = require(AccountRecovery.Components.AccountVerifiedConfirmationScreen)
local VerifyCodeScreenModule = require(AccountRecovery.Components.VerifyCodeScreen)
local ChooseAccountScreenModule = require(AccountRecovery.Components.ChooseAccountScreen)
local ResetPasswordScreenModule = require(AccountRecovery.Components.ResetPasswordScreen)
local ContinueFallbackScreenModule = require(AccountRecovery.Components.ContinueFallbackScreen)
local CannotRecoverAccountScreenModule = require(AccountRecovery.Components.CannotRecoverAccountScreen)

return (RoactNavigationModule.createRobloxStackNavigator({
	{
		[AccountRecoveryPageStateModule.RequestRecoveryScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), RequestRecoveryScreenModule (copy)
				return ReactModule.createElement(RequestRecoveryScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.RequestRecoveryScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.SendCodeScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), SendCodeScreenModule (copy)
				return ReactModule.createElement(SendCodeScreenModule, p1)
			end,
			navigationOptions = { title = AccountRecoveryPageStateModule.SendCodeScreen }
		}
	},
	{
		[AccountRecoveryPageStateModule.ChooseVerificationMethodScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), ChooseVerificationMethodScreenModule (copy)
				return ReactModule.createElement(ChooseVerificationMethodScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.ChooseVerificationMethodScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), AccountVerifiedConfirmationScreenModule (copy)
				return ReactModule.createElement(AccountVerifiedConfirmationScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.VerifyCodeScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), VerifyCodeScreenModule (copy)
				return ReactModule.createElement(VerifyCodeScreenModule, p1)
			end,
			navigationOptions = { title = AccountRecoveryPageStateModule.VerifyCodeScreen }
		}
	},
	{
		[AccountRecoveryPageStateModule.ChooseAccountScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), ChooseAccountScreenModule (copy)
				return ReactModule.createElement(ChooseAccountScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.ChooseAccountScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.ResetPasswordScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), ResetPasswordScreenModule (copy)
				return ReactModule.createElement(ResetPasswordScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.ResetPasswordScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.ContinueFallbackScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), ContinueFallbackScreenModule (copy)
				return ReactModule.createElement(ContinueFallbackScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.ContinueFallbackScreen
			}
		}
	},
	{
		[AccountRecoveryPageStateModule.CannotRecoverAccountScreen] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), CannotRecoverAccountScreenModule (copy)
				return ReactModule.createElement(CannotRecoverAccountScreenModule, p1)
			end,
			navigationOptions = {
				title = AccountRecoveryPageStateModule.CannotRecoverAccountScreen
			}
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = AccountRecoveryPageStateModule.RequestRecoveryScreen,
	backBehavior = RoactNavigationModule.BackBehavior.History,
	transitionConfig = function()
		return {
			transitionSpec = { frequency = 1000000, dampingRatio = 1 }
		}
	end
}))