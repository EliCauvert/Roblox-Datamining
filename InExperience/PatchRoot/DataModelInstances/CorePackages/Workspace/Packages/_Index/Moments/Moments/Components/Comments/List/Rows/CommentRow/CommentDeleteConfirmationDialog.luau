local Parent = script:FindFirstAncestor("Moments").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Dialog = FoundationModule.Dialog
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local config = {
	title = "Feature.Moments.Label.DeleteCommentTitle",
	body = "Feature.Moments.Label.DeleteCommentBody",
	delete = "Feature.Moments.Action.Delete",
	cancel = "Feature.Moments.Action.Cancel"
}

return function(p1) --[[ Line: 36 | Named "CommentDeleteConfirmationDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local OnCancelFunction = p1.onCancel
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function() --[[ Line: 39 ]]
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCancelFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 42 ]]
							-- upvalues: OnCancelFunction (upval)
							OnCancelFunction()
							p2:cancel()
						end)
					}
				}
			end, { OnCancelFunction })
		}),
		size = FoundationModule.Enums.DialogSize.Medium,
		testId = `moments-comment-delete-dialog-{p1.commentId}`
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.delete,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm,
					testId = `moments-comment-delete-confirm-{p1.commentId}`
				},
				{
					text = UseLocalizationResult.cancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel,
					testId = `moments-comment-delete-cancel-{p1.commentId}`
				}
			}
		})
	})
end