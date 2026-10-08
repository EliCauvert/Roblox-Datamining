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
	-- upvalues: useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useLocalization (ref), reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	})
	local var2 = useLocalization({
		titleText = "Authentication.SignUp.Header.CloseWithoutFinishing",
		bodyText = "Authentication.SignUp.Subtitle.YoureAlmostThere",
		backText = "CommonUI.Controls.Action.Back",
		closeText = "CommonUI.Features.Action.Close"
	})
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(false)
	local onSignOut = p1.onSignOut
	local onBack = p1.onBack
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "account-upgrade-close-dialog",
		ref = var1,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { text = var2.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(dialog.Text, { Text = var2.bodyText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var2.backText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var5 (ref), onBack (ref)
						if not var5.current then
							onBack()
						end
					end, { onBack }),
					isDisabled = var3
				},
				{
					text = var2.closeText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var5 (ref), var4 (ref), onSignOut (ref)
						if var5.current then
							return
						end
						var5.current = true
						var4(true)
						onSignOut()
					end, { onSignOut }),
					isLoading = var3
				}
			}
		})
	})
end