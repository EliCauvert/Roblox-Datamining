local parent = script:FindFirstAncestor("Moments").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local useLocalization = localizationModule.Hooks.useLocalization
local dialog = foundationModule.Dialog
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}
local t_1 = {
	title = "Feature.Moments.Label.DeleteCommentTitle",
	body = "Feature.Moments.Label.DeleteCommentBody",
	delete = "Feature.Moments.Action.Delete",
	cancel = "Feature.Moments.Action.Cancel"
}

return function(p1)
	-- upvalues: useLocalization (ref), t_1 (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), dialog (ref), foundationModule (ref)
	local var1 = useLocalization(t_1)
	local onCancel = p1.onCancel
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		ref = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onCancel (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: onCancel (copy)
							onCancel()
							p2:cancel()
						end)
					}
				}
			end, { onCancel })
		}),
		size = foundationModule.Enums.DialogSize.Medium,
		testId = `moments-comment-delete-dialog-{p1.commentId}`
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.delete,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm,
					testId = `moments-comment-delete-confirm-{p1.commentId}`
				},
				{
					text = var1.cancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel,
					testId = `moments-comment-delete-cancel-{p1.commentId}`
				}
			}
		})
	})
end