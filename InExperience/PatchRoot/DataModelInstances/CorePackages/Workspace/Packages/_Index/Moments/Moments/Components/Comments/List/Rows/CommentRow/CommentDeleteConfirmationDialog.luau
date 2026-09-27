local parent = script:FindFirstAncestor("Moments").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local dialog = foundationModule.Dialog
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), dialog (ref), foundationModule (ref)
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
		DialogTitle = reactModule.createElement(dialog.Title, { text = "Delete comment?", LayoutOrder = 1 }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = "This comment will be permanently deleted." })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = "Delete",
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm,
					testId = `moments-comment-delete-confirm-{p1.commentId}`
				},
				{
					text = "Cancel",
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel,
					testId = `moments-comment-delete-cancel-{p1.commentId}`
				}
			}
		})
	})
end