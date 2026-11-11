local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local UrlModule = require(Modules.LuaApp.Http.Url)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetFFlagEnableLuafiedRecoveryFlowFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableLuafiedRecoveryFlow
local EnrolledInLuafiedRecoveryExperimentFunction = require(CorePackages.Workspace.Packages.AuthCommon).Experiments.enrolledInLuafiedRecoveryExperiment
local PasswordResetPrompt = RoactModule.PureComponent:extend("PasswordResetPrompt")

function PasswordResetPrompt.init(p1)
	-- upvalues: GetFFlagEnableLuafiedRecoveryFlowFunction (copy), EnrolledInLuafiedRecoveryExperimentFunction (copy), AppPageModule (copy)
	function p1.callback()
		-- upvalues: GetFFlagEnableLuafiedRecoveryFlowFunction (upval), EnrolledInLuafiedRecoveryExperimentFunction (upval), p1 (copy), AppPageModule (upval)
		if GetFFlagEnableLuafiedRecoveryFlowFunction() and EnrolledInLuafiedRecoveryExperimentFunction() then
			p1.props.navigateToPage({
				name = AppPageModule.AccountRecovery,
				extraProps = { identifier = "", recoverPassword = true }
			})
		else
			p1.props.goToSecurityNotificationPage()
		end
		p1.props.closeCentralOverlay()
	end
end

function PasswordResetPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationModule({
		alertTitle = "CommonUI.Messages.Label.Alert",
		buttonText = "CommonUI.Messages.Action.OK",
		message = "Authentication.ResetPassword.Response.ResetPasswordStarted"
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), ButtonType (upval), p1 (copy)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.alertTitle,
			bodyText = p2.message,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = p1.callback, text = p2.buttonText }
					}
				}
			},
			screenSize = p1.props.screenSize
		})
	end)
end

return (RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), AppPageModule (copy), UrlModule (copy), TransitionAnimationModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		goToSecurityNotificationPage = function()
			-- upvalues: AppPageModule (upval), UrlModule (upval), TransitionAnimationModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = string.format("%slogin/securityNotification", UrlModule.BASE_URL),
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.None
				}
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else Callback(NavigateDownModule(config))
		end,
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end
	}
end)(PasswordResetPrompt))