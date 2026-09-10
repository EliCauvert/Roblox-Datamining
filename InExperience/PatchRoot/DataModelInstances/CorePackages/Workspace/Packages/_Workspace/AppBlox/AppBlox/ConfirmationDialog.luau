local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local fFlagLuaAppPlayButtonPrivatePT = require(parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT

return function(p1)
	-- upvalues: useLocalization (ref), fFlagLuaAppPlayButtonPrivatePT (ref), buttonVariant (ref), reactModule (ref), dialog (ref), orientation (ref)
	local var1 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	local var2 = nil
	
	if fFlagLuaAppPlayButtonPrivatePT then
		local t = {
			variant = buttonVariant.Standard,
			text = p1.cancelButtonText or var1.cancelButtonText,
			onActivated = p1.onCancel
		}
		var2 = if p1.hideConfirmButton then { t } else {
			{
				variant = buttonVariant.Emphasis,
				text = p1.confirmButtonText or var1.confirmButtonText,
				onActivated = p1.onConfirm
			},
			t
		}
	end
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = p1.disablePortal,
		onClose = if p1.showCloseButton then p1.onCancel else nil,
		size = if fFlagLuaAppPlayButtonPrivatePT then p1.size else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p1.title }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = if fFlagLuaAppPlayButtonPrivatePT and p1.orientButtonsVertically then orientation.Vertical else nil,
			actions = if fFlagLuaAppPlayButtonPrivatePT then var2 else {
				{
					variant = buttonVariant.Emphasis,
					text = p1.confirmButtonText or var1.confirmButtonText,
					onActivated = p1.onConfirm
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