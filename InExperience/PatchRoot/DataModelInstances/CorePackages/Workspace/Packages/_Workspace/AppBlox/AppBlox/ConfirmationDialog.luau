local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppPlayButtonPrivatePT = sharedFlagsModule.FFlagLuaAppPlayButtonPrivatePT
local fFlagAppBloxConfirmationDialogFocusNav = sharedFlagsModule.FFlagAppBloxConfirmationDialogFocusNav
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: useLocalization (ref), fFlagAppBloxConfirmationDialogFocusNav (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref), fFlagLuaAppPlayButtonPrivatePT (ref), buttonVariant (ref), dialog (ref), orientation (ref)
	local var1 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	local var2 = nil
	local var3 = nil
	
	if fFlagAppBloxConfirmationDialogFocusNav then
		local onCancel = p1.onCancel
		local var4, var5 = useDefaultFocusBehavior(useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
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
		}))
		var3 = var4
		var2 = var5
	end
	local var6 = nil
	
	if fFlagLuaAppPlayButtonPrivatePT then
		local t_1 = {
			variant = buttonVariant.Standard,
			text = p1.cancelButtonText or var1.cancelButtonText,
			onActivated = p1.onCancel,
			ref = if p1.hideConfirmButton then var3 else nil
		}
		var6 = if p1.hideConfirmButton then { t_1 } else {
			{
				variant = buttonVariant.Emphasis,
				text = p1.confirmButtonText or var1.confirmButtonText,
				onActivated = p1.onConfirm,
				ref = var3
			},
			t_1
		}
	end
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = p1.disablePortal,
		onClose = if p1.showCloseButton then p1.onCancel else nil,
		size = if fFlagLuaAppPlayButtonPrivatePT then p1.size else nil,
		ref = var2
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p1.title }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = if fFlagLuaAppPlayButtonPrivatePT and p1.orientButtonsVertically then orientation.Vertical else nil,
			actions = if fFlagLuaAppPlayButtonPrivatePT then var6 else {
				{
					variant = buttonVariant.Emphasis,
					text = p1.confirmButtonText or var1.confirmButtonText,
					onActivated = p1.onConfirm,
					ref = var3
				},
				{
					variant = buttonVariant.Standard,
					text = p1.cancelButtonText or var1.cancelButtonText,
					onActivated = p1.onCancel
				}
			}
		})
	})
end