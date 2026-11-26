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
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseMobilePageModule = require(AccountUpgrade.MobilePage.useMobilePage)
local FFlagLuaAppSsoLinkCandidateModule = require(AccountUpgrade.Flags.FFlagLuaAppSsoLinkCandidate)
local Frozen = table.freeze({})

return function(p1)
	-- upvalues: FoundationModule (copy), UseMobilePageModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagLuaAppSsoLinkCandidateModule (copy), Frozen (copy), UseLocalizationFunction (copy), ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), Orientation (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMobilePageModuleResult = UseMobilePageModule()
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	})
	local Frozen1 = if FFlagLuaAppSsoLinkCandidateModule then p1 else Frozen
	local TestId = Frozen1.testId or "account-upgrade-close-dialog"
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = if Frozen1.titleText then nil else Frozen1.titleKey or "Authentication.SignUp.Header.CancelAccountCreation",
		bodyText = if Frozen1.bodyText then nil else Frozen1.bodyKey or "Authentication.SignUp.Subtitle.YoureAlmostThereClose",
		continueSetupText = if Frozen1.primaryText then nil else Frozen1.primaryKey or "Authentication.SignUp.Action.ContinueSetup",
		cancelText = if Frozen1.secondaryText then nil else Frozen1.secondaryKey or "Authentication.SignUp.Action.Cancel"
	})
	local config = {
		titleText = Frozen1.titleText or UseLocalizationResult.titleText,
		bodyText = Frozen1.bodyText or UseLocalizationResult.bodyText,
		continueSetupText = Frozen1.primaryText or UseLocalizationResult.continueSetupText,
		cancelText = Frozen1.secondaryText or UseLocalizationResult.cancelText
	}
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local OnSignOutFunction = p1.onSignOut
	local OnBackFunction = p1.onBack
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		ref = UseFocusRootResult,
		size = DialogSize.Small,
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1,
			padding = {
				top = UDim.new(0, UseTokensResult.Size.Size_450),
				bottom = UDim.new(0, UseTokensResult.Padding.Large)
			},
			testId = `{TestId}--header`
		}, {
			Icon = if Frozen1.icon then ReactModule.createElement(Icon, {
				LayoutOrder = 0,
				name = Frozen1.icon,
				size = IconSize.Large,
				testId = `{TestId}--icon`
			}) else nil,
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = config.titleText,
				testId = `{TestId}--title`
			}),
			Body = ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = config.bodyText })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = config.continueSetupText,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseRefResult (copy), OnBackFunction (copy)
						if not UseRefResult.current then
							OnBackFunction()
						end
					end, { OnBackFunction }),
					isDisabled = UseStateResult
				},
				{
					text = config.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = ReactModule.useCallback(function()
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