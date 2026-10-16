local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 17 | Named "SduiFeatureErrorUi" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), Text (copy), Button (copy), ButtonSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		errorMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
		retryButtonText = "InGame.CommonUI.Button.Retry"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Large)
		}),
		ErrorText = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default text-align-x-center",
			LayoutOrder = 1,
			Text = UseLocalizationResult.errorMessage
		}),
		RetryButton = if p1.onRetry then ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.retryButtonText,
			onActivated = p1.onRetry,
			size = ButtonSize.Medium,
			variant = ButtonVariant.Emphasis
		}) else nil
	})
end