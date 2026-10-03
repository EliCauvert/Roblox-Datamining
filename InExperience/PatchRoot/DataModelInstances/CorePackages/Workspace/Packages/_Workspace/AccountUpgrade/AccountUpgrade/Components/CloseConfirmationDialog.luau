local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useLocalization (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	local var1 = useLocalization({
		titleText = "Authentication.SignUp.Header.CloseWithoutFinishing",
		bodyText = "Authentication.SignUp.Subtitle.YoureAlmostThere",
		backText = "CommonUI.Controls.Action.Back",
		closeText = "CommonUI.Features.Action.Close"
	})
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "account-upgrade-close-dialog",
		ref = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}),
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { text = var1.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(dialog.Text, { Text = var1.bodyText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.backText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onBack,
					isDisabled = p1.isClosing
				},
				{
					text = var1.closeText,
					variant = buttonVariant.Standard,
					onActivated = p1.onConfirm,
					isLoading = p1.isClosing
				}
			}
		})
	})
end