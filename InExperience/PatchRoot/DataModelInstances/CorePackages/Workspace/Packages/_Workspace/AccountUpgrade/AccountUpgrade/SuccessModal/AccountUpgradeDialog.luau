local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		ref = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			isFocusable = p1.isFocusable
		}),
		size = dialogSize.Medium,
		hasBackdrop = p1.hasBackdrop,
		onClose = p1.onClose,
		testId = p1.testId or "account-upgrade-dialog"
	}, {
		Title = if p1.title then reactModule.createElement(dialog.Title, { text = p1.title }) else nil,
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, p1.children),
		Actions = p1.actions
	})
end