local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GetFFlagEnableCrossDeviceEnterCodeRefreshModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoginConfirmationPrompt = RoactModule.PureComponent:extend("LoginConfirmationPrompt")

function LoginConfirmationPrompt.init(p1)
	function p1.retryCodeCallback()
		-- upvalues: p1 (copy)
		p1.props.closeCentralOverlay()
		
		if p1.props.retryCallback then
			p1.props.retryCallback()
		end
	end
	
	function p1.closePageCallback()
		-- upvalues: p1 (copy)
		p1.props.closeCentralOverlay()
		
		if p1.props.closeCallback then
			p1.props.closeCallback()
		end
	end
end

function LoginConfirmationPrompt.didMount(p1)
	p1.props.authAnalytics.reportScreenLoaded(if p1.props.loginSuccess then "quickLoginSucceeded" else "quickLoginFailed")
end

function LoginConfirmationPrompt.render(p1)
	-- upvalues: GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy), WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local LoginSuccess = p1.props.loginSuccess
	
	return WithLocalizationModule({
		errorMessage = "Authentication.CrossDevice.Label.CodeNotVerified",
		retryButtonText = "Authentication.CrossDevice.Action.TryAgain",
		cancelButtonText = "Authentication.CrossDevice.Action.CancelLogin",
		alertTitle = if LoginSuccess then "Authentication.CrossDevice.Response.LoginSuccess" else "Authentication.CrossDevice.Response.LoginFail",
		successButtonText = if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then "Authentication.CrossDevice.Label.OK" else "Authentication.CrossDevice.Action.Done"
	})(function(p2)
		-- upvalues: LoginSuccess (copy), p1 (copy), RoactModule (upval), InteractiveAlert (upval), ButtonType (upval)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.alertTitle,
			bodyText = LoginSuccess and p1.props.deviceString or p2.errorMessage,
			buttonStackInfo = {
				buttons = LoginSuccess and {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = p1.closePageCallback,
							text = p2.successButtonText
						}
					}
				} or {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = p1.closePageCallback,
							text = p2.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = p1.retryCodeCallback,
							text = p2.retryButtonText
						}
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
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)((RoactServices.connect({ authAnalytics = RoactAnalyticsAuthEventsModule })(LoginConfirmationPrompt))))