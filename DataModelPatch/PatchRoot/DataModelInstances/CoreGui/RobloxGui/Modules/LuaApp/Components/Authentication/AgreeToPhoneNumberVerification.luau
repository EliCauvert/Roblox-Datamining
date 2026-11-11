local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local AgreeToPhoneNumberVerification = RoactModule.PureComponent:extend("AgreeToPhoneNumberVerification")
AgreeToPhoneNumberVerification.defaultProps = { phoneNumber = "" }

function AgreeToPhoneNumberVerification.init(p1)
	-- upvalues: EventStreamConstantsModule (copy)
	function p1.onConfirm()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.closeAlert()
		p1.props.verificationChallengeCallback()
		p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.VerifyPhonePrompt)
	end
end

function AgreeToPhoneNumberVerification.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), AlertWindowModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), WithLocalizationModule (upval), RoactModule (upval), AlertWindowModule (upval)
		local Theme = p2.Theme
		local ContainerWidth = p1.props.containerWidth
		local CloseAlert = p1.props.closeAlert
		
		return WithLocalizationModule({
			titleText = "Feature.VerificationUpsell.Label.VerifyPhoneNumber",
			messageText = "Feature.VerificationUpsell.Message.Confirmation",
			confirmButtonText = "Feature.VerificationUpsell.Action.Ok",
			cancelButtonText = "Feature.VerificationUpsell.Action.Edit"
		})(function(p3)
			-- upvalues: RoactModule (upval), AlertWindowModule (upval), Theme (copy), ContainerWidth (copy), p2 (copy), p1 (upval), CloseAlert (copy)
			return RoactModule.createElement(AlertWindowModule, {
				isConfirming = false,
				hasCancelButton = true,
				theme = Theme,
				containerWidth = ContainerWidth,
				titleText = p3.titleText,
				titleFont = p2.Font.Title.Font,
				messageText = string.gsub(p3.messageText, "{phoneNumber}", p1.props.phoneNumber),
				messageFont = p2.Font.Body.Font,
				buttonFont = p2.Font.Body.Font,
				confirmButtonText = p3.confirmButtonText,
				cancelButtonText = p3.cancelButtonText,
				onConfirm = p1.onConfirm,
				onCancel = CloseAlert
			})
		end)
	end)
end

return (RoactServices.connect({ authEventAnalytics = RoactAnalyticsAuthEventsModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)(AgreeToPhoneNumberVerification))))