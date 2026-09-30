local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local commentRowViewModule = require(script.Parent.CommentRow.CommentRowView)
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), commentRowViewModule (ref)
	local var1 = if p1.status == "Sending" then 0.5 else 0
	local var2, var3 = reactModule.useBinding(var1)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref)
		var3(var1)
	end, { var1 })
	local var4 = if p1.status == "OutcomeUnknown" and p1.onEdit ~= nil then reactModule.createElement(foundationModule.View, { tag = "row align-y-center gap-small auto-xy" }, {
		Retry = if p1.onRetry ~= nil then nil else reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 1,
			text = "Retry",
			size = inputSize.XSmall,
			variant = buttonVariant.Link,
			onActivated = p1.onRetry,
			testId = `moments-comment-retry-{p1.rowKey}`
		}),
		Edit = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			text = "Edit",
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
		metadataLabel = if p1.status == "Sending" then "Sending\226\128\166" else "Send status unknown",
		avatarBackgroundStyle = p1.avatarBackgroundStyle,
		GroupTransparency = var2,
		headerAction = if var4 ~= nil then if p1.status == "OutcomeUnknown" and p1.onRetry ~= nil then reactModule.createElement(foundationModule.Button, {
			text = "Retry",
			size = inputSize.XSmall,
			variant = buttonVariant.Link,
			onActivated = p1.onRetry,
			testId = `moments-comment-retry-{p1.rowKey}`
		}) else nil else var4
	})
end