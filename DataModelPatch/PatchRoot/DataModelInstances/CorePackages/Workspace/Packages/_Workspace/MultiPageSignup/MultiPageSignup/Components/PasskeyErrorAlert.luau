local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FoundationModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		passkeyErrorTitle = "Authentication.SignUp.Header.PleaseTryAgain",
		passkeyErrorDescription = "Authentication.SignUp.Description.PasskeyTryAgain",
		passkeyErrorButtonText = "Authentication.SignUp.Action.StartOver"
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 anchor-center-center position-center-center gui-object-defaults",
		ZIndex = 10
	}, {
		ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.passkeyErrorTitle,
			bodyText = UseLocalizationResult.passkeyErrorDescription,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimaryContextual,
						props = {
							onActivated = p1.onActivated,
							text = UseLocalizationResult.passkeyErrorButtonText
						}
					}
				},
				buttonHeight = UseDesignTokensFunction().Size.Size_1200
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = Vector2.new(400, nil)
		})
	})
end