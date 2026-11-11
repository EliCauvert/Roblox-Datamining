local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), UseSelectorFunction (copy), AuthModalShownFunction (copy), EventStreamConstants (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		passkeyErrorTitle = "Authentication.Passkey.Label.UpsellErrorTitle",
		passkeyErrorDescription = "Authentication.Passkey.Description.Error",
		passkeyTryAgainLaterText = "Authentication.Passkey.Action.TryAgainLaterAcknowledgement",
		passkeyTryAgainNowText = "Authentication.Passkey.Action.TryAgainNowAcknowledgement"
	})
	local UseStyleResult = UseStyleFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset.top
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	AuthModalShownFunction(EventStreamConstants.Context.PasskeyUpsellErrorModalShown, EventStreamConstants.State.Success)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, UseSelectorResult1.Y - UseSelectorResult),
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color
	}, {
		ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.passkeyErrorTitle,
			bodyText = UseLocalizationResult.passkeyErrorDescription,
			buttonStackInfo = {
				buttonHeight = 40,
				buttons = {
					{
						props = {
							buttonType = ButtonType.Secondary,
							onActivated = p1.onCancel,
							text = UseLocalizationResult.passkeyTryAgainLaterText
						}
					},
					{
						buttonType = ButtonType.PrimaryContextual,
						props = {
							onActivated = p1.onTryAgain,
							text = UseLocalizationResult.passkeyTryAgainNowText
						}
					}
				}
			},
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UDim2.new(0.5, 0, 0.5, 0),
			screenSize = UseSelectorResult1
		})
	})
end