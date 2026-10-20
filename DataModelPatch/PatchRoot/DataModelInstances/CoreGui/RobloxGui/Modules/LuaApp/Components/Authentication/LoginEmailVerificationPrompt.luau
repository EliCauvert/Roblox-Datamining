local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local VerifyCredentialsModule = require(Modules.LuaApp.Thunks.Authentication.VerifyCredentials)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoginEmailVerificationPrompt = RoactModule.PureComponent:extend("LoginEmailVerificationPrompt")

function LoginEmailVerificationPrompt.init(p1)
	function p1.resendCallback()
		-- upvalues: p1 (copy)
		p1.props.verifyCredentials(p1.props.networking, p1.props.credentialValue, p1.props.password)
		p1.props.onClose(p1.props.credentialValue)
		p1.props.closeCentralOverlay()
	end
	
	function p1.closeCallback()
		-- upvalues: p1 (copy)
		p1.props.onClose(p1.props.credentialValue)
		p1.props.closeCentralOverlay()
	end
end

function LoginEmailVerificationPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationModule({
		alertTitle = "Authentication.Login.Label.EmailNeedsVerification",
		buttonText = "Authentication.Login.Action.SendVerificationEmail",
		cancelText = "Feature.Chat.Action.Cancel",
		message = "Authentication.Login.Label.UnverifiedEmailInstructions"
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), ButtonType (upval), p1 (copy)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.alertTitle,
			bodyText = p2.message,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = { onActivated = p1.closeCallback, text = p2.cancelText }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = p1.resendCallback, text = p2.buttonText }
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
	-- upvalues: VerifyCredentialsModule (copy), CloseCentralOverlayModule (copy)
	return {
		verifyCredentials = function(p1, p2, p3)
			-- upvalues: Callback (copy), VerifyCredentialsModule (upval)
			return Callback(VerifyCredentialsModule(p1, "Email", p2, p3))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)((RoactServices.connect({ networking = RoactNetworkingModule })(LoginEmailVerificationPrompt))))