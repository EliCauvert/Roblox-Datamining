local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local commentRowViewModule = require(script.Parent.CommentRow.CommentRowView)
local useLocalization = localizationModule.Hooks.useLocalization
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local t = {
	retry = "Feature.Moments.Action.Retry",
	edit = "Feature.Moments.Action.Edit",
	sending = "Feature.Moments.Label.CommentSending",
	sendStatusUnknown = "Feature.Moments.Label.CommentSendStatusUnknown"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), commentRowViewModule (ref)
	local var1 = useLocalization(t)
	local var2 = if p1.status == "Sending" then 0.5 else 0
	local var3, var4 = reactModule.useBinding(var2)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var2 (ref)
		var4(var2)
	end, { var2 })
	local var5 = if p1.status == "OutcomeUnknown" and p1.onEdit ~= nil then reactModule.createElement(foundationModule.View, { tag = "row align-y-center gap-small auto-xy" }, {
		Retry = if p1.onRetry ~= nil then nil else reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 1,
			text = var1.retry,
			size = inputSize.XSmall,
			variant = buttonVariant.Link,
			onActivated = p1.onRetry,
			testId = `moments-comment-retry-{p1.rowKey}`
		}),
		Edit = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			text = var1.edit,
			size = inputSize.XSmall,
			variant = buttonVariant.Link,
			onActivated = p1.onEdit,
			testId = `moments-comment-edit-{p1.rowKey}`
		})
	}) else nil
	
	return reactModule.createElement(commentRowViewModule, {
		avatarUserId = nil,
		isAuthorLoading = false,
		LayoutOrder = p1.LayoutOrder,
		commentId = p1.rowKey,
		authorLabel = p1.viewerUsername,
		text = p1.text,
		metadataLabel = if p1.status == "Sending" then var1.sending else var1.sendStatusUnknown,
		avatarBackgroundStyle = p1.avatarBackgroundStyle,
		GroupTransparency = var3,
		headerAction = if var5 ~= nil then if p1.status == "OutcomeUnknown" and p1.onRetry ~= nil then reactModule.createElement(foundationModule.Button, {
			text = var1.retry,
			size = inputSize.XSmall,
			variant = buttonVariant.Link,
			onActivated = p1.onRetry,
			testId = `moments-comment-retry-{p1.rowKey}`
		}) else nil else var5
	})
end