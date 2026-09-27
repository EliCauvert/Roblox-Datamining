local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	return if p1.status == "Loading" then reactModule.createElement(foundationModule.Text, {
		Text = "Loading more comments\226\128\166",
		tag = "auto-xy text-body-small content-muted",
		testId = "moments-comments-load-more-loading",
		LayoutOrder = p1.LayoutOrder
	}) elseif p1.status == "Failed" then reactModule.createElement(foundationModule.Button, {
		text = "Retry loading comments",
		testId = "moments-comments-load-more-retry",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onRetry,
		size = inputSize.Small,
		variant = buttonVariant.Standard
	}) else nil
end