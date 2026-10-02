local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize
local t = { retry = "Feature.Moments.Action.RetryLoadingComments" }

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), foundationModule (ref), progressShape (ref), progressSize (ref), inputSize (ref), buttonVariant (ref)
	return if p1.status == "Loading" then reactModule.createElement(foundationModule.View, {
		tag = "col align-x-center size-full-0 auto-y padding-y-medium",
		testId = "moments-comments-load-more-loading",
		LayoutOrder = p1.LayoutOrder
	}, {
		Spinner = reactModule.createElement(foundationModule.Progress, {
			testId = "moments-comments-load-more-spinner",
			shape = progressShape.Circle,
			size = progressSize.Medium
		})
	}) elseif p1.status == "Failed" then reactModule.createElement(foundationModule.Button, {
		testId = "moments-comments-load-more-retry",
		LayoutOrder = p1.LayoutOrder,
		text = useLocalization(t).retry,
		onActivated = p1.onRetry,
		size = inputSize.Small,
		variant = buttonVariant.Standard
	}) else nil
end