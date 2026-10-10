local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: foundationModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useLocalization (ref), reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), text (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	})
	local var3 = useLocalization({
		titleText = "Authentication.SignUp.Header.CloseWithoutFinishing",
		bodyText = "Authentication.SignUp.Subtitle.YoureAlmostThere",
		backText = "CommonUI.Controls.Action.Back",
		closeText = "CommonUI.Features.Action.Close"
	})
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(false)
	local onSignOut = p1.onSignOut
	local onBack = p1.onBack
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "account-upgrade-close-dialog",
		ref = var2,
		size = dialogSize.Small
	}, {
		Header = reactModule.createElement(view, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			testId = "account-upgrade-close-dialog--header",
			padding = {
				top = UDim.new(0, var1.Size.Size_450),
				bottom = UDim.new(0, var1.Padding.Large)
			}
		}, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				testId = "account-upgrade-close-dialog--title",
				Text = var3.titleText
			}),
			Body = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = var3.bodyText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var3.backText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var6 (ref), onBack (ref)
						if not var6.current then
							onBack()
						end
					end, { onBack }),
					isDisabled = var4
				},
				{
					text = var3.closeText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var6 (ref), var5 (ref), onSignOut (ref)
						if var6.current then
							return
						end
						var6.current = true
						var5(true)
						onSignOut()
					end, { onSignOut }),
					isLoading = var4
				}
			}
		})
	})
end