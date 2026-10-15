local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
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
local orientation = foundationModule.Enums.Orientation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useMobilePageModule = require(accountUpgrade.MobilePage.useMobilePage)

return function(p1)
	-- upvalues: foundationModule (ref), useMobilePageModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useLocalization (ref), reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), orientation (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useMobilePageModule()
	local var3 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	})
	local var4 = useLocalization({
		titleText = "Authentication.SignUp.Header.CancelAccountCreation",
		bodyText = "Authentication.SignUp.Subtitle.YoureAlmostThere",
		continueSetupText = "Authentication.SignUp.Action.ContinueSetup",
		cancelText = "Authentication.SignUp.Action.Cancel"
	})
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(false)
	local onSignOut = p1.onSignOut
	local onBack = p1.onBack
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "account-upgrade-close-dialog",
		ref = var3,
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
				Text = var4.titleText
			}),
			Body = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = var4.bodyText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.continueSetupText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var7 (ref), onBack (ref)
						if not var7.current then
							onBack()
						end
					end, { onBack }),
					isDisabled = var5
				},
				{
					text = var4.cancelText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var7 (ref), var6 (ref), onSignOut (ref)
						if var7.current then
							return
						end
						var7.current = true
						var6(true)
						onSignOut()
					end, { onSignOut }),
					isLoading = var5
				}
			},
			orientation = if var2 then orientation.Vertical else orientation.Horizontal
		})
	})
end