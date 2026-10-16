local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local config = { retry = "Feature.Moments.Action.RetryLoadingComments" }

return function(Frame: Frame) --[[ Line: 25 | Named "CommentsListFooterView" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FoundationModule (copy), ProgressShape (copy), ProgressSize (copy), InputSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return if Frame.status == "Loading" then ReactModule.createElement(FoundationModule.View, {
		tag = "col align-x-center size-full-0 auto-y padding-y-medium",
		testId = "moments-comments-load-more-loading",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Spinner = ReactModule.createElement(FoundationModule.Progress, {
			testId = "moments-comments-load-more-spinner",
			shape = ProgressShape.Circle,
			size = ProgressSize.Medium
		})
	}) elseif Frame.status == "Failed" then ReactModule.createElement(FoundationModule.Button, {
		testId = "moments-comments-load-more-retry",
		LayoutOrder = Frame.LayoutOrder,
		text = UseLocalizationResult.retry,
		onActivated = Frame.onRetry,
		size = InputSize.Small,
		variant = ButtonVariant.Standard
	}) else nil
end