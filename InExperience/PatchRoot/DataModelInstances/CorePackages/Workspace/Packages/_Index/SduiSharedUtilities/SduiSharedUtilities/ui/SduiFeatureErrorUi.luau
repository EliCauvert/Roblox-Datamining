local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), text (ref), button (ref), buttonSize (ref), buttonVariant (ref)
	local var1 = useLocalization({
		errorMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
		retryButtonText = "InGame.CommonUI.Button.Retry"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, useTokens().Gap.Large)
		}),
		ErrorText = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default text-align-x-center",
			LayoutOrder = 1,
			Text = var1.errorMessage
		}),
		RetryButton = if p1.onRetry then reactModule.createElement(button, {
			LayoutOrder = 2,
			text = var1.retryButtonText,
			onActivated = p1.onRetry,
			size = buttonSize.Medium,
			variant = buttonVariant.Emphasis
		}) else nil
	})
end