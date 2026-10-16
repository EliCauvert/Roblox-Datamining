local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseMobilePageModule = require(AccountUpgrade.MobilePage.useMobilePage)

return function(p1) --[[ Line: 30 | Named "CloseConfirmationDialog" ]]
	-- upvalues: FoundationModule (copy), UseMobilePageModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseLocalizationFunction (copy), ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Orientation (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMobilePageModuleResult = UseMobilePageModule()
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	})
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.SignUp.Header.CancelAccountCreation",
		bodyText = "Authentication.SignUp.Subtitle.YoureAlmostThere",
		continueSetupText = "Authentication.SignUp.Action.ContinueSetup",
		cancelText = "Authentication.SignUp.Action.Cancel"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local OnSignOutFunction = p1.onSignOut
	local OnBackFunction = p1.onBack
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "account-upgrade-close-dialog",
		ref = UseFocusRootResult,
		size = DialogSize.Small
	}, {
		Header = ReactModule.createElement(View, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			testId = "account-upgrade-close-dialog--header",
			padding = {
				top = UDim.new(0, UseTokensResult.Size.Size_450),
				bottom = UDim.new(0, UseTokensResult.Padding.Large)
			}
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				testId = "account-upgrade-close-dialog--title",
				Text = UseLocalizationResult.titleText
			}),
			Body = ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = UseLocalizationResult.bodyText })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.continueSetupText,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function() --[[ Line: 62 ]]
						-- upvalues: UseRefResult (copy), OnBackFunction (copy)
						if not UseRefResult.current then
							OnBackFunction()
						end
					end, { OnBackFunction }),
					isDisabled = UseStateResult
				},
				{
					text = UseLocalizationResult.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = ReactModule.useCallback(function() --[[ Line: 52 ]]
						-- upvalues: UseRefResult (copy), UseStateResult2 (copy), OnSignOutFunction (copy)
						if not UseRefResult.current then
							UseRefResult.current = true
							UseStateResult2(true)
							OnSignOutFunction()
							
							return
						end
					end, { OnSignOutFunction }),
					isLoading = UseStateResult
				}
			},
			orientation = if UseMobilePageModuleResult then Orientation.Vertical else Orientation.Horizontal
		})
	})
end