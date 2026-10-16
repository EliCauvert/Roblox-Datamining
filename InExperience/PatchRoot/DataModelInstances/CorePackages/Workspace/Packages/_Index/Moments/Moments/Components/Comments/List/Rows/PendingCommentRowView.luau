local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CommentRowViewModule = require(script.Parent.CommentRow.CommentRowView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local config = {
	retry = "Feature.Moments.Action.Retry",
	edit = "Feature.Moments.Action.Edit",
	sending = "Feature.Moments.Label.CommentSending",
	sendStatusUnknown = "Feature.Moments.Label.CommentSendStatusUnknown"
}

return function(Frame) --[[ Line: 34 | Named "PendingCommentRowView" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy), CommentRowViewModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local v1: number = if Frame.status == "Sending" then 0.5 else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(v1)
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseBindingResult2 (copy), v1 (copy)
		UseBindingResult2(v1)
	end, { v1 })
	local Element = if Frame.status == "OutcomeUnknown" and Frame.onEdit ~= nil then ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-small auto-xy" }, {
		Retry = if Frame.onRetry == nil then nil else ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.retry,
			size = InputSize.XSmall,
			variant = ButtonVariant.Link,
			onActivated = Frame.onRetry,
			testId = `moments-comment-retry-{Frame.rowKey}`
		}),
		Edit = ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.edit,
			size = InputSize.XSmall,
			variant = ButtonVariant.Link,
			onActivated = Frame.onEdit,
			testId = `moments-comment-edit-{Frame.rowKey}`
		})
	}) else nil
	
	return ReactModule.createElement(CommentRowViewModule, {
		avatarUserId = nil,
		isAuthorLoading = false,
		LayoutOrder = Frame.LayoutOrder,
		commentId = Frame.rowKey,
		authorLabel = Frame.viewerUsername,
		text = Frame.text,
		metadataLabel = if Frame.status == "Sending" then UseLocalizationResult.sending else UseLocalizationResult.sendStatusUnknown,
		avatarBackgroundStyle = Frame.avatarBackgroundStyle,
		GroupTransparency = UseBindingResult,
		headerAction = if Element == nil then if Frame.status == "OutcomeUnknown" and Frame.onRetry ~= nil then ReactModule.createElement(FoundationModule.Button, {
			text = UseLocalizationResult.retry,
			size = InputSize.XSmall,
			variant = ButtonVariant.Link,
			onActivated = Frame.onRetry,
			testId = `moments-comment-retry-{Frame.rowKey}`
		}) else nil else Element
	})
end