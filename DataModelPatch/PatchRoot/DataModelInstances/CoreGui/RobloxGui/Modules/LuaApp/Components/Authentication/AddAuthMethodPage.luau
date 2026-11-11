local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppOmniRecommendationsRequest = require(CorePackages.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local PromiseModule = require(Modules.LuaApp.Promise)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local CollapsingTextInputValidatorModule = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local PasswordValidatorModule = require(Modules.LuaApp.Thunks.Authentication.PasswordValidator)
local InputValidityModule = require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)
local Button = UIBloxModule.App.Button.Button
local LinkButton = UIBloxModule.App.Button.LinkButton
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local DividerWithText = AuthCommonModule.Components.DividerWithText
local TextInputBoxWithBorder = AuthCommonModule.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local GetPasswordManagerUsageStoreFunction = AuthCommonModule.Stores.GetPasswordManagerUsageStore
local MultiPageSignupTextModule = require(Modules.LuaApp.Components.Authentication.MultiPageSignupText)
local PageWithDisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.PageWithDisclaimerLinks)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button1 = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local InputSize = FoundationModule.Enums.InputSize
local IconName = FoundationModule.Enums.IconName
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local RegisterPasskeyModule = require(Modules.LuaApp.Thunks.Authentication.RegisterPasskey)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local SetPasswordModule = require(Modules.LuaApp.Thunks.Authentication.SetPassword)
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local UpdateUserEmailModule = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail)
local IsStringEmailModule = require(Modules.LuaApp.Util.isStringEmail)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local CredentialsProtocolModule = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetUserAppLaunchInfoFunction = require(CorePackages.Workspace.Packages.AuthCommon).Http.Requests.GetUserAppLaunchInfo
local GetAccountCreationMetadataFunction = require(CorePackages.Workspace.Packages.AuthSignup).Requests.GetAccountCreationMetadata
local LaunchContext = require(CorePackages.Workspace.Packages.AppStartup).Enums.LaunchContext
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IosAuthServiceExperimentModule = require(Modules.LuaApp.Experiment.IosAuthServiceExperiment)
local ToastRoduxModule = require(CorePackages.Workspace.Packages.ToastRodux)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local ToastType = ToastRoduxModule.Enums.ToastType
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnableSavePasswordAfterRecoveryFunction = SharedFlagsModule.GetFFlagEnableSavePasswordAfterRecovery
local FFlagEnablePWManagerSignupCheck = SharedFlagsModule.FFlagEnablePWManagerSignupCheck
local FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment = SharedFlagsModule.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment
local FFlagEnableSignupFoundationalizeBackgroundAndText = SharedFlagsModule.FFlagEnableSignupFoundationalizeBackgroundAndText
local FFlagEnableAddAuthMethodPageEmailSignup = SharedFlagsModule.FFlagEnableAddAuthMethodPageEmailSignup
local EnableAuthlessSignup = game:DefineFastFlag("EnableAuthlessSignup", false)
local CheckAndEnforceALNetworkCheck = game:DefineFastFlag("CheckAndEnforceALNetworkCheck", false)
local UseMultiPageSignupTextOnAddAuthMethodPage = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false)
local ShouldSkipPasskeySignupAutoFocus = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false)
local LuaAppCmPasswordRegistrationDelay = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2)
local PasskeySignupAndroidIterationEnabled = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false)
local EnableAuthedUsernameCMFix = game:DefineFastFlag("EnableAuthedUsernameCMFix", false)
local EnableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local AddAuthMethodEmailPlaceholder = game:DefineFastString("AddAuthMethodEmailPlaceholder", "example@email.com")
local EnableAddAuthMethodPageEmailSignupSetIsUnder13 = game:DefineFastFlag("EnableAddAuthMethodPageEmailSignupSetIsUnder13", false)
local EnableAddAuthMethodPagePasskeyOrOTPText = game:DefineFastFlag("EnableAddAuthMethodPagePasskeyOrOTPText", false)
local EnableStandardPasskeyButton = game:DefineFastFlag("EnableStandardPasskeyButton", false)
local FFlagEnableFaceIDTextOnAddAuthMethodPage = SharedFlagsModule.FFlagEnableFaceIDTextOnAddAuthMethodPage
local Offset: number = if UseMultiPageSignupTextOnAddAuthMethodPage then 24 else 60
local config = {
	passwordFirst = {
		password = 4,
		spacing = 5,
		["continue"] = 6,
		divider = 7,
		passkeyV2 = 8,
		passkeyNonV2 = 7
	},
	passkeyFirst = {
		password = 6,
		spacing = 7,
		["continue"] = 8,
		divider = 5,
		passkey = 4
	},
	showCreatePasswordButton = { passkey = 4, divider = 5, createPasswordButton = 6 },
	showCreatePasswordButtonPasswordFirst = { createPasswordButton = 4, divider = 5, passkey = 6 },
	showPasswordSectionOnly = { password = 4, spacing = 5, ["continue"] = 6 }
}

if FFlagEnableAddAuthMethodPageEmailSignup then
	config.passwordFirst = {
		password = 4,
		spacing = 5,
		["continue"] = 6,
		divider = 8,
		passkeyV2 = 9,
		passkeyNonV2 = 8
	}
end
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local PasskeyUpsellModule = require(CorePackages.Workspace.Packages.PasskeyUpsell)
local PasskeyUpsellScreen = PasskeyUpsellModule.Components.PasskeyUpsellScreen
local PasskeyUpsellSource = PasskeyUpsellModule.Enums.PasskeyUpsellSource
local FFlagAddReasonToEveryLogout = SharedFlagsModule.FFlagAddReasonToEveryLogout
local FFlagDisableMemStorageServicePasswordEvent = SharedFlagsModule.FFlagDisableMemStorageServicePasswordEvent
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local IosAuthServiceHealthCounters = require(CorePackages.Workspace.Packages.AuthAnalytics).RobloxTelemetry.IosAuthServiceHealthCounters
local Default1 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local IosAuthServiceSignupPasswordSaveModule = require(Modules.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave)
local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
GetTextBoundsParams.Text = "_unused"
GetTextBoundsParams.Font = Font.fromEnum(AppFonts.default:getDefault())
GetTextBoundsParams.Size = 19
GetTextBoundsParams.Width = 0
local _ = TextService:GetTextBoundsAsync(GetTextBoundsParams)

return function(_)
	-- upvalues: UseRoactServiceModule (copy), RoactNetworkingModule (copy), AppGuiService (copy), RoactAnalyticsAuthEventsModule (copy), RoactAnalyticsModule (copy), AppOmniRecommendationsRequest (copy), UseAppPolicyFunction (copy), FFlagEnablePWManagerSignupCheck (copy), GetPasswordManagerUsageStoreFunction (copy), ReactModule (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), FFlagEnableSignupFoundationalizeBackgroundAndText (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), PasskeySignupAndroidIterationEnabled (copy), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (copy), FFlagEnableAddAuthMethodPageEmailSignup (copy), EnableAddAuthMethodPagePasskeyOrOTPText (copy), EnableAuthlessSignup (copy), CheckAndEnforceALNetworkCheck (copy), EnableStandardPasskeyButton (copy), FFlagEnableFaceIDTextOnAddAuthMethodPage (copy), IosAuthServiceExperimentModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDispatchFunction (copy), ReactFocusNavigationModule (copy), UsePreferredInputFunction (copy), AppStorageUtilitiesModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), SystemThemeFeatureModule (copy), InputValidityModule (copy), IsStringEmailModule (copy), EnableAuthedUsernameCMFix (copy), Players (copy), EventStreamConstantsModule (copy), UpdateUserEmailModule (copy), LaunchAppModule (copy), LaunchContext (copy), SetPasswordModule (copy), FFlagDisableMemStorageServicePasswordEvent (copy), HttpService (copy), IosAuthServiceSignupPasswordSaveModule (copy), Default (copy), Constants (copy), Logger (copy), IosAuthServiceHealthCounters (copy), GetFFlagEnableSavePasswordAfterRecoveryFunction (copy), PromiseModule (copy), LuaAppCmPasswordRegistrationDelay (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), RegisterPasskeyModule (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy), ShouldSkipPasskeySignupAutoFocus (copy), ResponsiveModule (copy), Default1 (copy), TelemetryConfigs (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), GetUserAppLaunchInfoFunction (copy), EnableAddAuthMethodPageEmailSignupSetIsUnder13 (copy), UserModule (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), GetAccountCreationMetadataFunction (copy), PasskeyUpsellScreen (copy), PasskeyUpsellSource (copy), WithLocalizationFunction (copy), config (copy), Button1 (copy), ButtonVariant (copy), FoundationModule (copy), InputSize (copy), Button (copy), ButtonType (copy), LinkButton (copy), FullscreenPageWithSafeAreaModule (copy), DarkTheme (copy), PageWithDisclaimerLinksModule (copy), ImageSetButton (copy), Images (copy), View (copy), IconButton (copy), IconName (copy), ButtonSize (copy), Offset (copy), UseMultiPageSignupTextOnAddAuthMethodPage (copy), MultiPageSignupTextModule (copy), CollapsingTextInputValidatorModule (copy), EnableAndroidPasswordSuggestionEngineFeature (copy), PasswordValidatorModule (copy), TextInputBoxWithBorder (copy), AuthStatefulRoundCornerBorder (copy), AddAuthMethodEmailPlaceholder (copy), DividerWithText (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppGuiService)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(RoactAnalyticsAuthEventsModule)
	local UseRoactServiceModuleResult3 = UseRoactServiceModule(RoactAnalyticsModule)
	local UseRoactServiceModuleResult4 = UseRoactServiceModule(AppOmniRecommendationsRequest)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	local PasswordManagerUsageStore = if FFlagEnablePWManagerSignupCheck then GetPasswordManagerUsageStoreFunction(false) else nil
	
	if FFlagEnablePWManagerSignupCheck then
		ReactModule.useEffect(function()
			-- upvalues: PasswordManagerUsageStore (copy)
			if PasswordManagerUsageStore then
				PasswordManagerUsageStore.resetAll()
			end
		end, { PasswordManagerUsageStore })
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AuthenticationStylingLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			shouldUseFoundationBackgroundColor = (p1[AppBtidLayers.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
		}
	end)
	local ShouldUseFoundationBackgroundColor = FFlagEnableSignupFoundationalizeBackgroundAndText and UseBrowserTrackerExperimentResult.shouldUseFoundationBackgroundColor
	local UseBrowserTrackerExperimentResult1 = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.SignupLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		local v1 = p1[AppBtidLayers.SignupLayer] or {}
		
		return {
			shouldUseV2FallbackScreen = v1.shouldUseV2FallbackScreen,
			shouldSuppressPasskeyOnAddAuthMethodPage = v1.shouldSuppressPasskeyOnAddAuthMethodPage,
			shouldWaitForPasswordRegistration = v1.shouldWaitForPasswordRegistration,
			shouldDelayPasswordRegistration = v1.shouldDelayPasswordRegistration,
			showPasskeyNudgingHeader = v1.showPasskeyNudgingHeader,
			showPasskeyBeforePassword = v1.showPasskeyBeforePassword,
			showPasskeyNudgingParagraph = v1.showPasskeyNudgingParagraph,
			shouldRemoveOrDivider = v1.shouldRemoveOrDivider,
			shouldUsePrimaryPasskeyButton = v1.shouldUsePrimaryPasskeyButton,
			shouldUseSecondaryPasswordNextButton = v1.shouldUseSecondaryPasswordNextButton,
			showPasskeyIconOnAddAuthMethodPage = v1.showPasskeyIconOnAddAuthMethodPage,
			showPasswordLockIconOnAddAuthMethodPage = v1.showPasswordLockIconOnAddAuthMethodPage,
			showPasskeyEducationalPage = v1.showPasskeyEducationalPage,
			shouldShowCreateAPasswordButton = v1.shouldShowCreateAPasswordButton,
			shouldDisablePasswordFocus = v1.shouldDisablePasswordFocus,
			shouldShowEmailSignupO13 = v1.shouldShowEmailSignupO13,
			shouldShowEmailSignupU13 = v1.shouldShowEmailSignupU13,
			shouldShowPasskeyOrOTPText = v1.shouldShowPasskeyOrOTPText,
			shouldShowSetupLaterInCornerWhenEmailProvided = v1.shouldShowSetupLaterInCornerWhenEmailProvided,
			shouldShowSetupLaterInBottomRowWhenEmailProvided = v1.shouldShowSetupLaterInBottomRowWhenEmailProvided,
			shouldUseStandardPasskeyButton = v1.shouldUseStandardPasskeyButton,
			shouldShowFaceIDText = v1.shouldShowFaceIDText
		}
	end)
	local ShouldUseV2FallbackScreen = UseBrowserTrackerExperimentResult1.shouldUseV2FallbackScreen
	local ShouldSuppressPasskeyOnAddAuthMethodPage = GetFFlagEnableMultiPageSignupExperimentModule() and UseBrowserTrackerExperimentResult1.shouldSuppressPasskeyOnAddAuthMethodPage
	local ShouldWaitForPasswordRegistration = PasskeySignupAndroidIterationEnabled and UseBrowserTrackerExperimentResult1.shouldWaitForPasswordRegistration
	local ShouldDelayPasswordRegistration = PasskeySignupAndroidIterationEnabled and UseBrowserTrackerExperimentResult1.shouldDelayPasswordRegistration
	local ShowPasskeyNudgingHeader = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasskeyNudgingHeader
	local ShowPasskeyBeforePassword = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasskeyBeforePassword
	local ShowPasskeyNudgingParagraph = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasskeyNudgingParagraph
	local ShouldRemoveOrDivider = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.shouldRemoveOrDivider
	local ShouldUsePrimaryPasskeyButton = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.shouldUsePrimaryPasskeyButton
	local ShouldUseSecondaryPasswordNextButton = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.shouldUseSecondaryPasswordNextButton
	local ShowPasskeyIconOnAddAuthMethodPage = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasskeyIconOnAddAuthMethodPage
	local ShowPasswordLockIconOnAddAuthMethodPage = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasswordLockIconOnAddAuthMethodPage
	local ShowPasskeyEducationalPage = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.showPasskeyEducationalPage
	local ShouldShowCreateAPasswordButton = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.shouldShowCreateAPasswordButton
	local ShouldDisablePasswordFocus = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and UseBrowserTrackerExperimentResult1.shouldDisablePasswordFocus
	local ShouldShowEmailSignupU13 = FFlagEnableAddAuthMethodPageEmailSignup and (if UseStateResult then UseBrowserTrackerExperimentResult1.shouldShowEmailSignupU13 else UseBrowserTrackerExperimentResult1.shouldShowEmailSignupO13)
	local ShouldShowPasskeyOrOTPText = EnableAddAuthMethodPagePasskeyOrOTPText and UseBrowserTrackerExperimentResult1.shouldShowPasskeyOrOTPText
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local ShouldShowEmailSignupU13_1 = EnableAuthlessSignup and ShouldShowEmailSignupU13
	
	if CheckAndEnforceALNetworkCheck then
		ShouldShowEmailSignupU13_1 = ShouldShowEmailSignupU13_1 and UseStateResult1
	end
	local ShouldShowSetupLaterInCornerWhenEmailProvided = ShouldShowEmailSignupU13_1 and UseBrowserTrackerExperimentResult1.shouldShowSetupLaterInCornerWhenEmailProvided
	local ShouldShowSetupLaterInBottomRowWhenEmailProvided = ShouldShowEmailSignupU13_1 and UseBrowserTrackerExperimentResult1.shouldShowSetupLaterInBottomRowWhenEmailProvided
	local ShouldUseStandardPasskeyButton = EnableStandardPasskeyButton and UseBrowserTrackerExperimentResult1.shouldUseStandardPasskeyButton
	local ShouldShowFaceIDText = FFlagEnableFaceIDTextOnAddAuthMethodPage and (UseBrowserTrackerExperimentResult1.shouldShowFaceIDText and UseAppPolicyResult.getShouldShowFaceIDText())
	local UseStateResult3 = ShouldShowEmailSignupU13 and UseStateResult
	local UseStateResult4, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult5, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_4 = ReactModule.useState(true)
	local UseStateResult7, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult8, UseStateResult2_6 = ReactModule.useState("")
	local UseStateResult9, UseStateResult2_7 = ReactModule.useState("")
	local UseStateResult10, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_9 = ReactModule.useState("")
	local UseStateResult12, UseStateResult2_10 = ReactModule.useState(false)
	local UseStateResult13, UseStateResult2_11 = ReactModule.useState(true)
	local UseStateResult14, UseStateResult2_12 = ReactModule.useState(false)
	local UseStateResult15, UseStateResult2_13 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseIsIosAuthServiceEnabledResult = IosAuthServiceExperimentModule.useIsIosAuthServiceEnabled()
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UsePreferredInputResult = UsePreferredInputFunction()
	
	local function v165()
		-- upvalues: AppStorageUtilitiesModule (upval)
		AppStorageUtilitiesModule.setSignupActionRequired("")
		AppStorageUtilitiesModule.setPasskeySignupUsername("")
		AppStorageUtilitiesModule.flush()
	end
	
	local function v166()
		-- upvalues: AppStorageUtilitiesModule (upval), UseStateResult2_13 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval)
		local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
		
		if AuthenticatedTheme ~= "" then
			UseStateResult2_13(true)
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
		end
		SystemThemeFeatureModule.ClearThemeOverride()
	end
	
	local function OnToggleCallback()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult4 (copy)
		UseStateResult2_2(not UseStateResult4)
	end
	
	local function OnInputTextChanged(p1, Valid)
		-- upvalues: UseStateResult2_5 (copy), UseStateResult2_10 (copy), InputValidityModule (upval)
		UseStateResult2_5(p1)
		UseStateResult2_10(Valid == InputValidityModule.Valid)
	end
	
	local function OnChangeTextCallback(p1)
		-- upvalues: UseStateResult2_6 (copy), IsStringEmailModule (upval), UseStateResult2_7 (copy), UseStateResult2_8 (copy), UseStateResult2_10 (copy)
		local Text = p1.Text
		UseStateResult2_6(Text)
		local IsStringEmailModule1 = IsStringEmailModule((tostring(Text)))
		
		if IsStringEmailModule1 or Text == "" then
			UseStateResult2_7("")
			UseStateResult2_8(false)
		else
			UseStateResult2_7("")
			UseStateResult2_8(true)
		end
		UseStateResult2_10(IsStringEmailModule1)
	end
	
	local function _()
		-- upvalues: EnableAuthedUsernameCMFix (upval), UseStateResult11 (copy), AppStorageUtilitiesModule (upval), Players (upval)
		if EnableAuthedUsernameCMFix and UseStateResult11 and UseStateResult11 ~= "" then
			return UseStateResult11
		else
			local PasskeySignupUsername = AppStorageUtilitiesModule.getPasskeySignupUsername()
			
			return if PasskeySignupUsername and PasskeySignupUsername ~= "" then PasskeySignupUsername else Players.LocalPlayer and Players.LocalPlayer.Name or ""
		end
	end
	
	local function OnActivated()
		-- upvalues: UseStateResult2_10 (copy), UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), ShouldShowEmailSignupU13 (copy), UseDispatchResult (copy), UpdateUserEmailModule (upval), UseRoactServiceModuleResult (copy), UseStateResult8 (copy), AppStorageUtilitiesModule (upval), UseStateResult2_13 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), LaunchAppModule (upval), UseRoactServiceModuleResult4 (copy), UseRoactServiceModuleResult3 (copy), UseAppPolicyResult (copy), LaunchContext (upval), UseStateResult2_7 (copy), UseStateResult2_8 (copy), SetPasswordModule (upval), UseStateResult7 (copy), EnableAuthedUsernameCMFix (upval), UseStateResult11 (copy), Players (upval), ShouldUseV2FallbackScreen (copy), UseStateResult14 (copy), UseIsIosAuthServiceEnabledResult (copy), FFlagDisableMemStorageServicePasswordEvent (upval), HttpService (upval), IosAuthServiceSignupPasswordSaveModule (upval), Default (upval), Constants (upval), Logger (upval), PasswordManagerUsageStore (copy), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), ShouldWaitForPasswordRegistration (copy), ShouldDelayPasswordRegistration (copy), PromiseModule (upval), LuaAppCmPasswordRegistrationDelay (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), UseStyleResult (copy)
		UseStateResult2_10(false)
		UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.PasskeySignupPasswordFallback, EventStreamConstantsModule.Button.Continue)
		
		if ShouldShowEmailSignupU13 then
			UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.SignupEmailOnAddAuthMethod, EventStreamConstantsModule.Button.SubmitEmail)
			UseDispatchResult(UpdateUserEmailModule(UseRoactServiceModuleResult, UseStateResult8, nil)):andThen(function()
				-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval)
				UseRoactServiceModuleResult2.reportAuthModalShown(EventStreamConstantsModule.Context.SignupEmailOnAddAuthMethod, EventStreamConstantsModule.State.Success)
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.setPasskeySignupUsername("")
				AppStorageUtilitiesModule.flush()
				local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
				
				if AuthenticatedTheme ~= "" then
					UseStateResult2_13(true)
					MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
				end
				SystemThemeFeatureModule.ClearThemeOverride()
				UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
				UseStateResult2_10(true)
			end, function(p1)
				-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), UseStateResult2_7 (upval), UseStateResult2_8 (upval), UseStateResult2_10 (upval)
				local Message = p1 and p1.Message and p1.Message ~= "" and p1.Message or ""
				UseRoactServiceModuleResult2.reportAuthClientError(EventStreamConstantsModule.Context.SignupEmailOnAddAuthMethod, Message)
				UseStateResult2_7(Message)
				UseStateResult2_8(true)
				UseStateResult2_10(true)
			end)
			
			return
		else
			SetPasswordModule(UseRoactServiceModuleResult, UseStateResult7):andThen(function(_)
				-- upvalues: AppStorageUtilitiesModule (upval), EnableAuthedUsernameCMFix (upval), UseStateResult11 (upval), Players (upval), ShouldUseV2FallbackScreen (upval), UseStateResult7 (upval), UseStateResult14 (upval), UseIsIosAuthServiceEnabledResult (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), HttpService (upval), UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), Default (upval), Constants (upval), Logger (upval), PasswordManagerUsageStore (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), UseStateResult2_13 (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval), ShouldWaitForPasswordRegistration (upval), ShouldDelayPasswordRegistration (upval), PromiseModule (upval), LuaAppCmPasswordRegistrationDelay (upval)
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.setPasskeySignupUsername("")
				AppStorageUtilitiesModule.flush()
				local PasskeySignupUsername1 = nil
				
				if EnableAuthedUsernameCMFix and UseStateResult11 and UseStateResult11 ~= "" then
					PasskeySignupUsername1 = UseStateResult11
				else
					local PasskeySignupUsername = AppStorageUtilitiesModule.getPasskeySignupUsername()
					PasskeySignupUsername1 = if PasskeySignupUsername and PasskeySignupUsername ~= "" then PasskeySignupUsername else Players.LocalPlayer and Players.LocalPlayer.Name or ""
				end
				if ShouldUseV2FallbackScreen and PasskeySignupUsername1 and UseStateResult7 then
					if not FFlagDisableMemStorageServicePasswordEvent and (not UseStateResult14 or not UseIsIosAuthServiceEnabledResult) then
						MemStorageService:Fire(MemStorageKeysModule.AuthenticatedCredentials, HttpService:JSONEncode({
							authType = "signup",
							cvalue = PasskeySignupUsername1,
							password = UseStateResult7
						}))
					end
					if UseStateResult14 then
						local Json = HttpService:JSONEncode({
							username = PasskeySignupUsername1,
							password = UseStateResult7
						})
						
						local function v189()
							-- upvalues: UseIsIosAuthServiceEnabledResult (upval), UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), PasskeySignupUsername1 (copy), Default (upval), Json (copy), Constants (upval), HttpService (upval), Logger (upval), PasswordManagerUsageStore (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval)
							if UseIsIosAuthServiceEnabledResult then
								UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServicePasswordFallback, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordAttempted)
								IosAuthServiceSignupPasswordSaveModule.reportAttempted(PasskeySignupUsername1)
							end
							return Default:registerCredentials(Default.CredentialsTypes.password, Json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
								-- upvalues: HttpService (upval), Logger (upval), PasswordManagerUsageStore (upval), UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), UseIsIosAuthServiceEnabledResult (upval), IosAuthServiceSignupPasswordSaveModule (upval), PasskeySignupUsername1 (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval)
								local Data = if Result then HttpService:JSONDecode(Result) else {}
								
								if Data and Data.errorCode == nil then
									Logger:info("Successfully registered password.")
									
									if PasswordManagerUsageStore then
										PasswordManagerUsageStore.setPasswordManagerMediatedSignup(true)
									end
									UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.CMPasswordPasskeyFallback, EventStreamConstantsModule.Button.SavePassword)
									
									if UseIsIosAuthServiceEnabledResult then
										UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServicePasswordFallback, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordSuccess)
										IosAuthServiceSignupPasswordSaveModule.reportSuccess(PasskeySignupUsername1)
									end
									IosAuthServiceHealthCounters.reportPasswordSaveSuccess({
										credentialType = "password",
										iosAuthServiceEnabled = UseIsIosAuthServiceEnabledResult == true
									})
								else
									Logger:warning("Error registering password: " .. tostring(Data.errorMsg))
									
									if UseIsIosAuthServiceEnabledResult then
										UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServicePasswordFallback, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordFailure, Data.errorMsg or "unknown")
										IosAuthServiceSignupPasswordSaveModule.reportFailure(PasskeySignupUsername1, Data.errorMsg or "unknown")
									end
									IosAuthServiceHealthCounters.reportPasswordSaveFailure({
										credentialType = "password",
										errorCode = if Data and Data.errorCode ~= nil then tostring(Data.errorCode) else "unknown",
										iosAuthServiceEnabled = UseIsIosAuthServiceEnabledResult == true
									})
								end
								if GetFFlagEnableSavePasswordAfterRecoveryFunction() and UseIsIosAuthServiceEnabledResult then
									local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
									
									if AuthenticatedTheme ~= "" then
										UseStateResult2_13(true)
										MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
									end
									SystemThemeFeatureModule.ClearThemeOverride()
									UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
									UseStateResult2_10(true)
								end
							end, function(p1)
								-- upvalues: Logger (upval), UseIsIosAuthServiceEnabledResult (upval), UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), PasskeySignupUsername1 (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval)
								Logger:warning("Error registering password: " .. tostring(p1))
								
								if UseIsIosAuthServiceEnabledResult then
									UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServicePasswordFallback, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordFailure, (tostring(p1)))
									IosAuthServiceSignupPasswordSaveModule.reportFailure(PasskeySignupUsername1, (tostring(p1)))
								end
								IosAuthServiceHealthCounters.reportPasswordSaveFailure({
									credentialType = "password",
									errorCode = "transportError",
									iosAuthServiceEnabled = UseIsIosAuthServiceEnabledResult == true
								})
								
								if GetFFlagEnableSavePasswordAfterRecoveryFunction() and UseIsIosAuthServiceEnabledResult then
									local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
									
									if AuthenticatedTheme ~= "" then
										UseStateResult2_13(true)
										MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
									end
									SystemThemeFeatureModule.ClearThemeOverride()
									UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
									UseStateResult2_10(true)
								end
							end)
						end
						
						if GetFFlagEnableSavePasswordAfterRecoveryFunction() and UseIsIosAuthServiceEnabledResult then
							return v189()
						end
						local Promise = nil
						if ShouldWaitForPasswordRegistration then
							Promise = v189()
							Promise:await()
						else
							Promise = if ShouldDelayPasswordRegistration then PromiseModule.delay(LuaAppCmPasswordRegistrationDelay):andThen(v189) else v189()
						end
						return Promise:andThen(function()
							-- upvalues: AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), UseStateResult2_10 (upval)
							local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
							
							if AuthenticatedTheme ~= "" then
								UseStateResult2_13(true)
								MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
							end
							SystemThemeFeatureModule.ClearThemeOverride()
							UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
							UseStateResult2_10(true)
						end)
					elseif UseIsIosAuthServiceEnabledResult then
						UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServicePasswordFallback, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordSkipped, EventStreamConstantsModule.State.IosAuthServiceProtocolNotAvailable)
						IosAuthServiceSignupPasswordSaveModule.reportSkipped(EventStreamConstantsModule.State.IosAuthServiceProtocolNotAvailable)
					end
				end
				local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
				
				if AuthenticatedTheme ~= "" then
					UseStateResult2_13(true)
					MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
				end
				SystemThemeFeatureModule.ClearThemeOverride()
				UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
				UseStateResult2_10(true)
				
				return PromiseModule.resolve()
			end, function(_)
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), UseStyleResult (upval), UseStateResult2_10 (upval)
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "Authentication.Login.Response.SomethingWentWrong",
					slideIn = true,
					toastType = ToastType.NetworkingError,
					toastIconColorStyle = {
						Transparency = 0,
						Color = UseStyleResult.Theme.Alert.Color
					}
				}))
				UseStateResult2_10(true)
			end)
		end
	end
	
	local function OnActivated1()
		-- upvalues: UseStateResult13 (copy), UseStateResult2_11 (copy), UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), RegisterPasskeyModule (upval), UseRoactServiceModuleResult (copy), AppStorageUtilitiesModule (upval), UseStateResult2_13 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (copy), LaunchAppModule (upval), UseRoactServiceModuleResult4 (copy), UseRoactServiceModuleResult3 (copy), UseAppPolicyResult (copy), LaunchContext (upval), PromiseModule (upval)
		if not UseStateResult13 then return end
		UseStateResult2_11(false)
		UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.PasskeySignupPasswordFallback, EventStreamConstantsModule.Button.SetupPasskey)
		
		return RegisterPasskeyModule(UseRoactServiceModuleResult):andThen(function(_)
			-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult4 (upval), UseRoactServiceModuleResult3 (upval), UseAppPolicyResult (upval), LaunchContext (upval), PromiseModule (upval)
			UseRoactServiceModuleResult2.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasswordFallbackPasskeyCreated, "success")
			AppStorageUtilitiesModule.setSignupActionRequired("")
			AppStorageUtilitiesModule.setPasskeySignupUsername("")
			AppStorageUtilitiesModule.flush()
			local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
			
			if AuthenticatedTheme ~= "" then
				UseStateResult2_13(true)
				MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
			end
			SystemThemeFeatureModule.ClearThemeOverride()
			UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
			
			return PromiseModule.resolve()
		end, function(p1)
			-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), UseStateResult2_11 (upval), PromiseModule (upval)
			if p1.name then
				UseRoactServiceModuleResult2.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasswordFallbackPasskeyCreated, p1.name)
				
				if type(p1.body) == "string" then
					UseRoactServiceModuleResult2.reportAuthClientError(EventStreamConstantsModule.Context.SignupPasswordFallbackPasskeyCreated, p1.body, p1.source)
				end
			else
				UseRoactServiceModuleResult2.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasswordFallbackPasskeyCreated, "unknown")
			end
			UseStateResult2_11(true)
			
			return PromiseModule.resolve()
		end)
	end
	
	local function v173()
		-- upvalues: UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), UseDispatchResult (copy), LogoutModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), LuaLogoutReasonNamesModule (upval)
		UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.PasskeySignupPasswordFallback, EventStreamConstantsModule.Button.Close)
		AppStorageUtilitiesModule.setSignupActionRequired("")
		AppStorageUtilitiesModule.setPasskeySignupUsername("")
		AppStorageUtilitiesModule.flush()
		UseDispatchResult(LogoutModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, LuaLogoutReasonNamesModule.MultiStepSignupCanceled))
	end
	
	ReactModule.useEffect(function()
		-- upvalues: ShouldSkipPasskeySignupAutoFocus (upval), UseRefResult (copy), ShouldDisablePasswordFocus (copy), UseRefResult1 (copy), UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy), UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), ShouldShowEmailSignupU13 (copy), Default1 (upval), TelemetryConfigs (upval)
		if not ShouldSkipPasskeySignupAutoFocus and UseRefResult.current then
			if ShouldDisablePasswordFocus and UseRefResult1.current then
				if UsePreferredInputResult == ResponsiveModule.Input.Directional then
					UseFocusGuiObjectResult(UseRefResult1.current)
				end
			else
				UseRefResult.current:CaptureFocus()
			end
		end
		UseRoactServiceModuleResult2.reportAuthPageload(EventStreamConstantsModule.Context.PasskeySignupPasswordFallback)
		
		if ShouldShowEmailSignupU13 then
			UseRoactServiceModuleResult2.reportAuthPageload(EventStreamConstantsModule.Context.SignupEmailOnAddAuthMethod)
		end
		Default1:logRobloxTelemetryCounter(TelemetryConfigs.AddAuthMethodPageMountTelemetryConfig, 1)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult15 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval)
		if not UseStateResult15 then
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, "dark")
			SystemThemeFeatureModule.SetDarkThemeOverride()
		end
	end, { UseStyleResult })
	ReactModule.useEffect(function()
		-- upvalues: ShouldUseV2FallbackScreen (copy), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), UseStateResult2_12 (copy), Logger (upval)
		if ShouldUseV2FallbackScreen then
			Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
				-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), UseStateResult2_12 (upval)
				local v1: boolean = if Result.password and Result.password.isAvailable then true else false
				UseRoactServiceModuleResult2.reportAuthPageload(EventStreamConstantsModule.Context.CMPasswordPasskeySignup, (tostring(v1)))
				UseStateResult2_12(v1)
			end):catch(function(Err)
				-- upvalues: Logger (upval)
				Logger:warning("Error checking for available credential types. Error: ", Err)
			end)
		end
	end, { ShouldUseV2FallbackScreen })
	ReactModule.useEffect(function()
		-- upvalues: GetUserAppLaunchInfoFunction (upval), UseRoactServiceModuleResult (copy), EnableAuthedUsernameCMFix (upval), UseStateResult2_9 (copy), EnableAddAuthMethodPageEmailSignupSetIsUnder13 (upval), UseStateResult2 (copy), UserModule (upval), AppStorageUtilitiesModule (upval), FFlagAddReasonToEveryLogout (upval), UseDispatchResult (copy), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval)
		GetUserAppLaunchInfoFunction(UseRoactServiceModuleResult):andThen(function(Result)
			-- upvalues: EnableAuthedUsernameCMFix (upval), UseStateResult2_9 (upval), EnableAddAuthMethodPageEmailSignupSetIsUnder13 (upval), UseStateResult2 (upval), UserModule (upval), AppStorageUtilitiesModule (upval), FFlagAddReasonToEveryLogout (upval), UseDispatchResult (upval), LogoutModule (upval), UseRoactServiceModuleResult (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval)
			local Name = if Result and Result.responseBody then Result.responseBody.name else nil
			
			if Name and Name ~= "" then
				if EnableAuthedUsernameCMFix then
					UseStateResult2_9(Name)
				end
				if EnableAddAuthMethodPageEmailSignupSetIsUnder13 then
					UseStateResult2(UserModule.fromUserInfoRequest(Result).isUnder13)
					
					return
				end
			else
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.setPasskeySignupUsername("")
				AppStorageUtilitiesModule.flush()
				
				if FFlagAddReasonToEveryLogout then
					UseDispatchResult(LogoutModule(UseRoactServiceModuleResult, GuiService, LuaLogoutReasonNamesModule.MultiStepSignupResetIncompleteState))
					
					return
				end
				UseDispatchResult(LogoutModule(UseRoactServiceModuleResult, GuiService))
			end
		end):catch(function(_)
			-- upvalues: AppStorageUtilitiesModule (upval), FFlagAddReasonToEveryLogout (upval), UseDispatchResult (upval), LogoutModule (upval), UseRoactServiceModuleResult (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval)
			AppStorageUtilitiesModule.setSignupActionRequired("")
			AppStorageUtilitiesModule.setPasskeySignupUsername("")
			AppStorageUtilitiesModule.flush()
			
			if FFlagAddReasonToEveryLogout then
				UseDispatchResult(LogoutModule(UseRoactServiceModuleResult, GuiService, LuaLogoutReasonNamesModule.MultiStepSignupResetIncompleteState))
				
				return
			else
				UseDispatchResult(LogoutModule(UseRoactServiceModuleResult, GuiService))
			end
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: CheckAndEnforceALNetworkCheck (upval), EventStreamConstantsModule (upval), GetAccountCreationMetadataFunction (upval), UseRoactServiceModuleResult (copy), UseStateResult2_1 (copy), UseRoactServiceModuleResult2 (copy)
		if CheckAndEnforceALNetworkCheck then
			local ALError = EventStreamConstantsModule.State.ALError
			GetAccountCreationMetadataFunction(UseRoactServiceModuleResult):andThen(function(Result)
				-- upvalues: ALError (ref), EventStreamConstantsModule (upval), UseStateResult2_1 (upval)
				if Result and Result.responseBody and Result.responseBody.isEligibleForALSignup == true then
					ALError = EventStreamConstantsModule.State.ALCheckSuccess
					UseStateResult2_1(true)
					
					return
				else
					ALError = EventStreamConstantsModule.State.ALCheckFail
				end
			end):catch(function()
				-- upvalues: ALError (ref), EventStreamConstantsModule (upval)
				ALError = EventStreamConstantsModule.State.ALError
			end):finally(function()
				-- upvalues: UseRoactServiceModuleResult2 (upval), EventStreamConstantsModule (upval), ALError (ref)
				UseRoactServiceModuleResult2.reportAuthPageload(EventStreamConstantsModule.Context.AddAuthMethodPage, ALError)
			end)
		end
	end, {
		UseRoactServiceModuleResult,
		UseRoactServiceModuleResult2.reportAuthPageload
	})
	local PasskeySignupUsername1 = nil
	
	if EnableAuthedUsernameCMFix and UseStateResult11 and UseStateResult11 ~= "" then
		PasskeySignupUsername1 = UseStateResult11
	else
		local PasskeySignupUsername = AppStorageUtilitiesModule.getPasskeySignupUsername()
		PasskeySignupUsername1 = if PasskeySignupUsername and PasskeySignupUsername ~= "" then PasskeySignupUsername else Players.LocalPlayer and Players.LocalPlayer.Name or ""
	end
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (copy), LaunchAppModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult4 (copy), UseRoactServiceModuleResult3 (copy), UseAppPolicyResult (copy), LaunchContext (upval)
		UseRoactServiceModuleResult2.reportAuthButtonClick(EventStreamConstantsModule.Context.PasskeySignupPasswordFallback, p1)
		AppStorageUtilitiesModule.setSignupActionRequired("")
		AppStorageUtilitiesModule.setPasskeySignupUsername("")
		AppStorageUtilitiesModule.flush()
		local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
		
		if AuthenticatedTheme ~= "" then
			UseStateResult2_13(true)
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
		end
		SystemThemeFeatureModule.ClearThemeOverride()
		UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
	end, {
		UseAppPolicyResult, UseRoactServiceModuleResult2.reportAuthButtonClick,
		UseDispatchResult, UseRoactServiceModuleResult, UseRoactServiceModuleResult4,
		v165, v166, UseRoactServiceModuleResult3
	})
	
	if ShowPasskeyEducationalPage and not UseStateResult5 then
		return (ReactModule.createElement(PasskeyUpsellScreen, {
			resetNavigationHistory = function(_)
				-- upvalues: UseRoactServiceModuleResult2 (copy), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), UseStateResult2_13 (copy), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval), UseDispatchResult (copy), LaunchAppModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult4 (copy), UseRoactServiceModuleResult3 (copy), UseAppPolicyResult (copy), LaunchContext (upval)
				UseRoactServiceModuleResult2.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success")
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.setPasskeySignupUsername("")
				AppStorageUtilitiesModule.flush()
				local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
				
				if AuthenticatedTheme ~= "" then
					UseStateResult2_13(true)
					MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
				end
				SystemThemeFeatureModule.ClearThemeOverride()
				UseDispatchResult(LaunchAppModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult4, UseRoactServiceModuleResult3, UseAppPolicyResult, LaunchContext.SignUp))
			end,
			onDismiss = function()
				-- upvalues: UseStateResult2_3 (copy)
				UseStateResult2_3(true)
			end,
			source = PasskeyUpsellSource.AddAuthMethodPage
		}))
	else
		local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header1.RelativeSize
		
		return WithLocalizationFunction({
			continueText = "Authentication.SignUp.Label.Continue",
			doneText = "CommonUI.Controls.Action.Done",
			passwordHint = "Authentication.SignUp.Label.Use8CharPassword",
			signUpLabel = "Authentication.SignUp.Action.CreateAccount",
			oneMoreStepText = "Authentication.SignUp.Description.OneMoreStep",
			setUpPasskeyLabel = "Authentication.SignUp.Label.SetUpPasskey",
			createAPasskeyLabel = "Authentication.SignUp.Action.CreateAPasskey",
			createAPasswordButtonText = "Authentication.SignUp.Heading.PasswordPage",
			createAPasswordText = "Authentication.SignUp.Description.CreateAPassword",
			ensureNeverLoseAccountText = "Authentication.SignUp.Description.EnsureNeverLoseAccount",
			dividerText = "Authentication.SignUp.Description.Or",
			secureAccountWithPasskeyText = "Authentication.SignUp.Description.SecureAccountWithPasskeyText",
			createdAccountChooseSigninText = "Authentication.SignUp.Header.CreatedAccountChooseSignin",
			createAccountPasskeyEmphasisDescriptionText = "Authentication.SignUp.Description.CreateAccountPasskeyEmphasisDescription",
			emailLabelText = "Authentication.SignUp.Label.EnterYourEmail",
			parentEmailLabelText = "Authentication.SignUp.Label.EnterYourParentsEmail",
			invalidEmailText = "Feature.VerificationUpsell.Message.InvalidEmailAddress",
			parentEmailDisclaimerText = "Authentication.SignUp.Description.ParentEmailDisclaimer",
			createPasskeyOrOTPText = "Authentication.SignUp.Description.CreatePasskeyOrOTP",
			setupLaterText = "Authentication.SignUp.Action.SetupLater",
			faceIDHeadingText = "Authentication.SignUp.Heading.SecureWithFaceId",
			faceIDDescriptionText = "Authentication.SignUp.Description.FaceIdPromo",
			enableFaceIDText = "Authentication.SignUp.Action.EnableFaceId",
			userGreetingHeaderText = {
				"Authentication.SignUp.Heading.UserGreetingWithName",
				username = PasskeySignupUsername1
			},
			userGreetingHeaderTextWithPasskeyPassword = {
				"Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword",
				username = PasskeySignupUsername1
			},
			userPasswordOnlyGreetingHeaderText = {
				"Authentication.SignUp.Title",
				username = PasskeySignupUsername1
			}
		})(function(p1)
			-- upvalues: ShouldUseV2FallbackScreen (copy), PasskeySignupUsername1 (copy), ShouldShowCreateAPasswordButton (copy), UseStateResult6 (copy), ShouldShowFaceIDText (copy), ShowPasskeyNudgingHeader (copy), ShowPasskeyNudgingParagraph (copy), ShouldShowPasskeyOrOTPText (copy), GetFFlagEnableMultiPageSignupExperimentModule (upval), ShouldSuppressPasskeyOnAddAuthMethodPage (copy), ShowPasskeyBeforePassword (copy), config (upval), ShouldUsePrimaryPasskeyButton (copy), ReactModule (upval), Button1 (upval), ButtonVariant (upval), ShowPasskeyIconOnAddAuthMethodPage (copy), FoundationModule (upval), OnActivated1 (copy), UseStateResult13 (copy), InputSize (upval), UseRefResult1 (copy), ShouldUseStandardPasskeyButton (copy), Button (upval), ButtonType (upval), LinkButton (upval), ShouldUseSecondaryPasswordNextButton (copy), ShowPasswordLockIconOnAddAuthMethodPage (copy), UseStateResult2_4 (copy), FullscreenPageWithSafeAreaModule (upval), ShouldUseFoundationBackgroundColor (copy), UseTokensResult (copy), DarkTheme (upval), PageWithDisclaimerLinksModule (upval), UseStateResult3 (copy), ImageSetButton (upval), Images (upval), v173 (copy), View (upval), IconButton (upval), IconName (upval), ButtonSize (upval), UseStyleResult (copy), ScaledBaseSize (copy), EnableAuthlessSignup (upval), ShouldShowSetupLaterInCornerWhenEmailProvided (copy), UseResult (copy), EventStreamConstantsModule (upval), Offset (upval), UseMultiPageSignupTextOnAddAuthMethodPage (upval), MultiPageSignupTextModule (upval), ShouldShowEmailSignupU13 (copy), CollapsingTextInputValidatorModule (upval), EnableAndroidPasswordSuggestionEngineFeature (upval), OnInputTextChanged (copy), PasswordValidatorModule (upval), UseStateResult4 (copy), OnToggleCallback (copy), UseRefResult (copy), TextInputBoxWithBorder (upval), UseStateResult10 (copy), AuthStatefulRoundCornerBorder (upval), OnChangeTextCallback (copy), UseStateResult (copy), UseStateResult9 (copy), AddAuthMethodEmailPlaceholder (upval), FFlagEnableAddAuthMethodPageEmailSignup (upval), OnActivated (copy), UseStateResult12 (copy), ShouldRemoveOrDivider (copy), DividerWithText (upval), ShouldShowSetupLaterInBottomRowWhenEmailProvided (copy)
			local UserGreetingHeaderText = if ShouldUseV2FallbackScreen and PasskeySignupUsername1 then if ShouldShowCreateAPasswordButton and not UseStateResult6 then p1.userGreetingHeaderText elseif ShouldShowFaceIDText then p1.faceIDHeadingText elseif ShowPasskeyNudgingHeader then p1.createdAccountChooseSigninText else p1.userGreetingHeaderText else p1.oneMoreStepText
			local CreateAPasswordText = if ShouldShowCreateAPasswordButton and not UseStateResult6 then p1.createAPasswordText elseif ShouldShowFaceIDText then p1.faceIDDescriptionText elseif ShowPasskeyNudgingParagraph and ShouldShowPasskeyOrOTPText then p1.createPasskeyOrOTPText elseif ShowPasskeyNudgingParagraph then p1.createAccountPasskeyEmphasisDescriptionText else p1.createAPasswordText
			
			if GetFFlagEnableMultiPageSignupExperimentModule() and ShouldSuppressPasskeyOnAddAuthMethodPage then
				UserGreetingHeaderText = p1.userPasswordOnlyGreetingHeaderText
				CreateAPasswordText = p1.ensureNeverLoseAccountText
			end
			local EnableFaceIDText = if ShouldShowFaceIDText then p1.enableFaceIDText else p1.createAPasskeyLabel
			local Entry = config[if ShouldShowCreateAPasswordButton then if UseStateResult6 and ShowPasskeyBeforePassword then "showCreatePasswordButton" elseif UseStateResult6 then "showCreatePasswordButtonPasswordFirst" else "showPasswordSectionOnly" elseif ShowPasskeyBeforePassword then "passkeyFirst" else "passwordFirst"]
			local Password = Entry.password
			local Spacing = Entry.spacing
			local Continue: number = Entry["continue"]
			local Divider = Entry.divider
			local Passkey = Entry.passkey or (if ShouldUseV2FallbackScreen then Entry.passkeyV2 else Entry.passkeyNonV2)
			local CreatePasswordButton = Entry.createPasswordButton
			local Element = if ShouldUseV2FallbackScreen and ShouldUsePrimaryPasskeyButton then ReactModule.createElement(Button1, {
				LayoutOrder = Passkey,
				variant = ButtonVariant.Emphasis,
				text = EnableFaceIDText,
				icon = if ShowPasskeyIconOnAddAuthMethodPage then FoundationModule.Enums.IconName.Key else nil,
				onActivated = OnActivated1,
				isDisabled = not UseStateResult13,
				size = InputSize.Large,
				width = UDim.new(1, 0),
				buttonRef = UseRefResult1
			}) elseif ShouldUseV2FallbackScreen and ShouldUseStandardPasskeyButton then ReactModule.createElement(Button1, {
				LayoutOrder = Passkey,
				variant = ButtonVariant.Standard,
				text = EnableFaceIDText,
				icon = if ShowPasskeyIconOnAddAuthMethodPage then FoundationModule.Enums.IconName.Key else nil,
				onActivated = OnActivated1,
				isDisabled = not UseStateResult13,
				size = InputSize.Large,
				width = UDim.new(1, 0),
				buttonRef = UseRefResult1
			}) elseif ShouldUseV2FallbackScreen then ReactModule.createElement(Button, {
				layoutOrder = Passkey,
				buttonType = ButtonType.Secondary,
				text = EnableFaceIDText,
				size = UDim2.new(1, 0, 0, 48),
				onActivated = OnActivated1,
				isDisabled = not UseStateResult13,
				buttonRef = UseRefResult1
			}) else ReactModule.createElement(LinkButton, {
				layoutOrder = Passkey,
				text = p1.setUpPasskeyLabel,
				onActivated = OnActivated1,
				isDisabled = not UseStateResult13,
				buttonRef = UseRefResult1
			})
			
			return ReactModule.createElement(FullscreenPageWithSafeAreaModule, {
				BackgroundTransparency = 0,
				includeStatusBar = true,
				BackgroundColor3 = if ShouldUseFoundationBackgroundColor then UseTokensResult.Color.Surface.Surface_0.Color3 else DarkTheme.BackgroundUIDefault.Color
			}, {
				PageContent = ReactModule.createElement(PageWithDisclaimerLinksModule, { showFooter = UseStateResult3 }, {
					HeaderFrameListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					HeaderPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 25) }),
					HeaderFrame = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						LogoutButton = if ShouldUseV2FallbackScreen then nil else ReactModule.createElement(ImageSetButton, {
							Size = UDim2.new(0, 36, 0, 36),
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							ScaleType = Enum.ScaleType.Fit,
							Image = Images["icons/navigation/close"],
							ImageColor3 = DarkTheme.UIEmphasis.Color,
							ImageTransparency = 0,
							[ReactModule.Event.Activated] = v173
						}),
						HeaderBackButton = if ShouldShowCreateAPasswordButton and not UseStateResult6 then ReactModule.createElement(View, {
							tag = "col",
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 36, 0, 36),
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5)
						}, {
							Button = ReactModule.createElement(IconButton, {
								icon = IconName.ChevronLargeLeft,
								variant = ButtonVariant.Utility,
								size = ButtonSize.Medium,
								onActivated = function()
									-- upvalues: UseStateResult2_4 (upval)
									UseStateResult2_4(true)
								end
							})
						}) else nil,
						Title = ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Text = p1.signUpLabel,
							Font = UseStyleResult.Font.CaptionHeader.Font,
							TextSize = ScaledBaseSize,
							TextColor3 = DarkTheme.TextEmphasis.Color,
							TextTransparency = DarkTheme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Center
						}),
						SetupLaterButton = if EnableAuthlessSignup and ShouldShowSetupLaterInCornerWhenEmailProvided then ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Position = UDim2.new(1, -12, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							Button = ReactModule.createElement(LinkButton, {
								fontStyle = "CaptionHeader",
								colorStyleDefault = "TextDefault",
								colorStyleHover = "TextDefault",
								text = p1.setupLaterText,
								onActivated = function()
									-- upvalues: UseResult (upval), EventStreamConstantsModule (upval)
									UseResult(EventStreamConstantsModule.Button.SetupLaterCornerButton)
								end
							})
						}) else nil
					}),
					Divider = ReactModule.createElement("Frame", {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0.5, 0, 0, 48),
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundTransparency = if ShouldUseFoundationBackgroundColor then 1 else 0,
						BackgroundColor3 = DarkTheme.UIEmphasis.Color
					}),
					ContentFrame = ReactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, -49),
						Position = UDim2.new(0.5, 0, 0, 49),
						AnchorPoint = Vector2.new(0.5, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ContainerListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							Padding = UDim.new(0, 5)
						}),
						ContentPadding = ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 24),
							PaddingRight = UDim.new(0, 24),
							PaddingTop = UDim.new(0, Offset)
						}),
						MultiPageSignupText = if UseMultiPageSignupTextOnAddAuthMethodPage then ReactModule.createElement(MultiPageSignupTextModule, {
							layoutOrder = 1,
							titleText = UserGreetingHeaderText,
							helpText = CreateAPasswordText
						}) else nil,
						InstructionsHeadingText = if UseMultiPageSignupTextOnAddAuthMethodPage then nil else ReactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextSize = 24,
							Text = UserGreetingHeaderText,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							Font = UseStyleResult.Font.Header1.Font
						}, {
							UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 36) })
						}),
						InstructionsHeadingBody = if UseMultiPageSignupTextOnAddAuthMethodPage then nil else ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextSize = 14,
							TextWrapped = true,
							Text = CreateAPasswordText,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextColor3 = UseStyleResult.Theme.TextDefault.Color,
							Font = UseStyleResult.Font.Header2.Font
						}, {}),
						Spacing = ReactModule.createElement("Frame", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 16)
						}),
						PasswordValidator = if ShouldShowEmailSignupU13 or not Password then nil else ReactModule.createElement(CollapsingTextInputValidatorModule, {
							titleTextKey = "CommonUI.Messages.Label.Password",
							summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword",
							prerequisiteMet = true,
							showDetailedError = true,
							layoutOrder = Password,
							textInputType = EnableAndroidPasswordSuggestionEngineFeature and Enum.TextInputType.NewPassword or Enum.TextInputType.Password,
							onInputTextChanged = OnInputTextChanged,
							onInputTextValidated = OnInputTextChanged,
							validator = PasswordValidatorModule,
							validatorAdditionalProps = { username = PasskeySignupUsername1 },
							returnKeyType = Enum.ReturnKeyType.Next,
							hidePassword = UseStateResult4,
							onToggleCallback = OnToggleCallback,
							textBoxRef = UseRefResult
						}),
						EmailInput = if ShouldShowEmailSignupU13 and Password then ReactModule.createElement(TextInputBoxWithBorder, {
							textInputHeight = 36,
							textInputType = Enum.TextInputType.Email,
							layoutOrder = Password,
							borderState = if UseStateResult10 then AuthStatefulRoundCornerBorder.BorderState.Error else AuthStatefulRoundCornerBorder.BorderState.Default,
							textBarColor = UseStyleResult.Theme.BackgroundUIContrast.Color,
							onChangeTextCallback = OnChangeTextCallback,
							labelText = if UseStateResult then p1.parentEmailLabelText else p1.emailLabelText,
							labelTextColor = UseStyleResult.Theme.TextDefault.Color,
							errorText = if UseStateResult9 == "" then if UseStateResult10 then p1.invalidEmailText else nil else UseStateResult9,
							Size = UDim2.new(1, 0, 0, 0),
							placeholderText = AddAuthMethodEmailPlaceholder,
							placeholderTextColor = UseStyleResult.Theme.TextDefault.Color
						}) else nil,
						ParentEmailDisclaimer = if FFlagEnableAddAuthMethodPageEmailSignup and ShouldShowEmailSignupU13 and (UseStateResult and Continue) then ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = Continue + 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 4) }),
							Label = ReactModule.createElement("TextLabel", {
								TextWrapped = true,
								BackgroundTransparency = 1,
								Text = p1.parentEmailDisclaimerText,
								TextColor3 = UseStyleResult.Theme.TextDefault.Color,
								TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
								Font = UseStyleResult.Font.Footer.Font,
								TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
								TextXAlignment = Enum.TextXAlignment.Left,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							})
						}) else nil,
						Spacing2 = if Spacing then ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = Spacing,
							Size = UDim2.new(1, 0, 0, 8)
						}) else nil,
						ContinueButton = if Continue then if ShouldUseSecondaryPasswordNextButton then ReactModule.createElement(Button1, {
							LayoutOrder = Continue,
							variant = ButtonVariant.Standard,
							text = if ShouldUseV2FallbackScreen then p1.doneText else p1.continueText,
							icon = if ShowPasswordLockIconOnAddAuthMethodPage then FoundationModule.Enums.IconName.LockClosed else nil,
							size = InputSize.Large,
							width = UDim.new(1, 0),
							onActivated = OnActivated,
							isDisabled = not UseStateResult12
						}) else ReactModule.createElement(Button, {
							layoutOrder = Continue,
							buttonType = ButtonType.PrimaryContextual,
							text = if ShouldUseV2FallbackScreen then p1.doneText else p1.continueText,
							size = UDim2.new(1, 0, 0, 48),
							onActivated = OnActivated,
							isDisabled = not UseStateResult12
						}) else nil,
						DividerWithText = if ShouldUseV2FallbackScreen and not ShouldSuppressPasskeyOnAddAuthMethodPage and not ShouldRemoveOrDivider and Divider then ReactModule.createElement(DividerWithText, {
							width = 0,
							height = 0,
							padding = 8,
							layoutOrder = Divider,
							size = UDim2.new(1, 0, 0, 32),
							font = UseStyleResult.Font.BodySmall.Font,
							fontSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.BodySmall.RelativeSize,
							color3 = UseStyleResult.Theme.TextMuted.Color,
							transparency = UseStyleResult.Theme.TextMuted.Transparency,
							text = p1.dividerText
						}) else nil,
						CreatePasswordButton = CreatePasswordButton and ReactModule.createElement(Button1, {
							LayoutOrder = CreatePasswordButton,
							variant = if ShouldUseSecondaryPasswordNextButton then ButtonVariant.Standard else ButtonVariant.Emphasis,
							text = p1.createAPasswordButtonText,
							icon = if ShowPasswordLockIconOnAddAuthMethodPage then FoundationModule.Enums.IconName.LockClosed else nil,
							onActivated = function()
								-- upvalues: UseStateResult2_4 (upval)
								UseStateResult2_4(false)
							end,
							size = InputSize.Large,
							width = UDim.new(1, 0)
						}),
						PasskeyButton = if ShouldSuppressPasskeyOnAddAuthMethodPage or not Passkey then nil else Element,
						SetupLaterBottomButton = if EnableAuthlessSignup and ShouldShowSetupLaterInBottomRowWhenEmailProvided then ReactModule.createElement(Button1, {
							LayoutOrder = 11,
							variant = ButtonVariant.Utility,
							text = p1.setupLaterText,
							size = InputSize.Large,
							width = UDim.new(1, 0),
							onActivated = function()
								-- upvalues: UseResult (upval), EventStreamConstantsModule (upval)
								UseResult(EventStreamConstantsModule.Button.SetupLaterRowButton)
							end
						}) else nil
					})
				})
			})
		end)
	end
end