local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).withNavigationProps
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Constants = UIBloxModule.App.Style.Constants
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local FoundationModule = require(CorePackages.Packages.Foundation)
local Checkbox = FoundationModule.Checkbox
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnderAgeInteractiveAlertModule = require(Modules.LuaApp.Components.Authentication.UnderAgeInteractiveAlert)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local AuthBirthdayBarModule = require(Modules.LuaApp.Components.Authentication.AuthBirthdayBar)
local CollapsingTextInputValidatorModule = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local SignUpGenderSelectorModule = require(Modules.LuaApp.Components.Authentication.SignUpGenderSelector)
local TitleAndParagraphModule = require(Modules.LuaApp.Components.Authentication.TitleAndParagraph)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local ContactInfoFieldModule = require(Modules.LuaApp.Components.Authentication.ContactInfoField)
local BirthdayFieldModule = require(Modules.LuaApp.Components.Authentication.Birthday.BirthdayField)
local SuggestionsFrameModule = require(Modules.LuaApp.Components.Authentication.SuggestionsFrame)
local SignUpPageViewModule = require(Modules.LuaApp.Components.Authentication.SignUpPageView)
local DisplayNameFieldModule = require(Modules.LuaApp.Components.Authentication.DisplayNameField)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local DisclaimerLinksVariant = AuthCommonModule.Enums.DisclaimerLinksVariant
local ParseCredentialsProtocolIsAvailableResponseFunction = AuthCommonModule.Utils.parseCredentialsProtocolIsAvailableResponse
local AuditContentContext = AuthCommonModule.Stores.AuditContentContext.AuditContentContext
local BackgroundFill = AuthCommonModule.Components.BackgroundFill
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local AuthBackgroundGate = AuthCommonModule.Components.AuthBackgroundGate
local AccountLinkingAlertType = AuthCommonModule.Enums.AccountLinkingAlertType
local GetCredentialsAvailabilityStoreFunction = AuthCommonModule.Stores.GetCredentialsAvailabilityStore
local UseSignUpPageNavigationBindingsFunction = AuthCommonModule.Hooks.useSignUpPageNavigationBindings
local KISAComplianceUtils = require(CorePackages.Workspace.Packages.AuthCompliance).KISAComplianceUtils
local AnalyticsEvents = require(CorePackages.Workspace.Packages.AuthCompliance).Analytics.AnalyticsEvents
local EventConstants = require(CorePackages.Workspace.Packages.AuthCompliance).Analytics.EventConstants
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local Events = require(CorePackages.Workspace.Packages.AuthAnalytics).Events
local EventStreamConstants = require(CorePackages.Workspace.Packages.AuthAnalytics).EventStreamConstants
local PreAuthDeepLinkUrlStore = AuthCommonModule.Stores.PreAuthDeepLinkUrlStore
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local RobloxLocaleIdKey = require(CorePackages.Workspace.Packages.Localization).RobloxLocaleIdKey
local DisplayNameCountersModule = require(script.Parent.Enum.DisplayNameCounters)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local UsernameValidationContextModule = require(Modules.LuaApp.Enum.UsernameValidationContext)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local ConstantsModule = require(Modules.LuaApp.Constants)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local CredentialTypeModule = require(Modules.LuaApp.Components.Authentication.Enum.CredentialType)
local UserGenderModule = require(Modules.LuaApp.Components.Authentication.Enum.UserGender)
local SignUpV2ErrorCodesModule = require(Modules.LuaApp.Components.Authentication.Enum.SignUpV2ErrorCodes)
local InputValidityModule = require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)
local VerifiedSignupErrorCodesModule = require(Modules.LuaApp.Components.Authentication.Enum.VerifiedSignupErrorCodes)
local UsernameIssueModule = require(Modules.LuaApp.Components.Authentication.Enum.UsernameIssue)
local IssueConditionModule = require(Modules.LuaApp.Components.Authentication.Enum.IssueCondition)
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local Constants1 = require(CorePackages.Workspace.Packages.OtpLogin).Constants
local UserAgreementsCounterNames = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementsCounterNames
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagEnableKoreaKISAComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
local FFlagBypassIXPKoreaComplianceModule = require(Modules.LuaApp.Flags.FFlagBypassIXPKoreaCompliance)
local FFlagBypassGUACKoreaComplianceModule = require(Modules.LuaApp.Flags.FFlagBypassGUACKoreaCompliance)
local EnableSkipVPCSignupFlow2 = game:DefineFastFlag("EnableSkipVPCSignupFlow2", false)
local BypassIXPSkipVPCSignup = game:DefineFastFlag("BypassIXPSkipVPCSignup", false)
local GetFFlagEnableTextFieldContentTypeFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType
local GetFFlagMinimalSignupAuthEnabledModule = require(Modules.LuaApp.Flags.GetFFlagMinimalSignupAuthEnabled)
local GetFFlagPasswordlessSignupAuthEnabledModule = require(Modules.LuaApp.Flags.GetFFlagPasswordlessSignupAuthEnabled)
local GetFFlagPasskeySignupEnabledModule = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local FFlagFoundationStylingOnSignUp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFoundationStylingOnSignUp
local GetFIntLuaLoginGenderSelectorModule = require(Modules.LuaApp.Flags.GetFIntLuaLoginGenderSelector)
local FFlagKoreaKISAUnderAgeNumberModule = require(Modules.LuaApp.Flags.FFlagKoreaKISAUnderAgeNumber)
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFFlagCredProtocolRegisterPasswordOnSignupModule = require(Modules.LuaApp.Flags.GetFFlagCredProtocolRegisterPasswordOnSignup)
local UsePackageFetchSignupUserAgreements = game:DefineFastFlag("UsePackageFetchSignupUserAgreements", false)
local EnableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local GetFFlagEnableSignupBirthdayExperimentsModule = require(Modules.LuaApp.Flags.GetFFlagEnableSignupBirthdayExperiments)
local DisplayNamesOnSignupExperimentV3 = game:DefineFastFlag("DisplayNamesOnSignupExperiment_v3", false)
local EnableDisplayNamesOnSignupExperimentv1Dev = game:DefineFastFlag("EnableDisplayNamesOnSignupExperimentv1_Dev", false)
local DisplayNameEligabilityAgeYears = game:DefineFastInt("DisplayNameEligabilityAgeYears", 17)
local DisplayNamesDiagLogging = game:DefineFastFlag("DisplayNamesDiagLogging", false)
local FFlagSignupDisplayNameLoggingModule = require(Modules.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging)
local DisablePasskeySignupForLuaDeepLinks = game:DefineFastFlag("DisablePasskeySignupForLuaDeepLinks", false)
local FFlagEnableAuthDeepLinkReceiver = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver
local FFlagEnableVNGDUARSignupComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance)
local GetFFlagEnablePreferredInputForSignUpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnablePreferredInputForSignUp
local FFlagEnableSignUpExitModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignUpExitModal
local FFlagHideBackButtonOnSignUpPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHideBackButtonOnSignUpPage
local FFlagUseBirthdayDropdownForGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBirthdayDropdownForGamepad
local UseBreakpointOnSignUp = game:DefineFastFlag("UseBreakpointOnSignUp", false)
local FixSinglePageSignUpScrollPinning = game:DefineFastFlag("FixSinglePageSignUpScrollPinning", false)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP
local GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherIXPTextGatingFix
local GetFFlagAuthCollapsingValidatorFoundationInputFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAuthCollapsingValidatorFoundationInput
local GetFFlagEnableAuditForSinglePageSignUpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp
local FFlagEnableSignupFoundationalizeBackgroundAndText = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignupFoundationalizeBackgroundAndText
local GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppSignupPasskeyAvailabilityPreflight
local UseLongFormSignupComplianceTextByDefault = game:DefineFastFlag("UseLongFormSignupComplianceTextByDefault", false)
game:DefineFastFlag("LuaVerifiedSignup2", false)
game:DefineFastFlag("LuaVerifiedSignupExperiment2", false)
local GetFFlagLuaAppSignUpPageRefactorModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor)
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local UsernameValidatorModule = require(Modules.LuaApp.Thunks.Authentication.UsernameValidator)
local PasswordValidatorModule = require(Modules.LuaApp.Thunks.Authentication.PasswordValidator)
local GetMetaDataFromShareLinkModule = require(Modules.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink)
local ApiFetchAuthMetaDataModule = require(Modules.LuaApp.Thunks.Authentication.AuthIntent.ApiFetchAuthMetaData)
local SignUpV2Module = require(Modules.LuaApp.Thunks.Authentication.SignUpV2)
local UserModule = require(script.Parent.Parent.Parent.Thunks.Authentication.User)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local OpenAccountSwitchingErrorOverlayModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local LogoutAllLoggedInUsersModule = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local OpenKISAPopUpAgreementsModule = require(Modules.LuaApp.Thunks.Authentication.OpenKISAPopUpAgreements)
local OpenEmailOtpModule = require(Modules.LuaApp.Thunks.Authentication.OpenEmailOtp)
local ValidateCodeFunction = require(CorePackages.Workspace.Packages.OtpLogin).Thunks.ValidateCode
local UsernameSuggestorModule = require(Modules.LuaApp.Thunks.Authentication.UsernameSuggestor)
local OpenCentralOverlayForAgreeToPhoneNumberVerificationModule = require(Modules.LuaApp.Thunks.Authentication.OpenCentralOverlayForAgreeToPhoneNumberVerification)
local OpenCentralOverlayForPhoneNumberVerificationModule = require(Modules.LuaApp.Thunks.Authentication.OpenCentralOverlayForPhoneNumberVerification)
local GetVerifiedSignupChallengeModule = require(Modules.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local FetchSignupUserAgreements = if UsePackageFetchSignupUserAgreements then require(CorePackages.Workspace.Packages.UserAgreements).FetchSignupUserAgreements else require(Modules.LuaApp.Http.Requests.FetchSignupUserAgreements)
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local _UDim2 = UDim2.new(0, 36, 0, 36)
local IconsNavigationClose = Images["icons/navigation/close"]
local _Vector2 = Vector2.new(540, 1080)

local function _(p1)
	-- upvalues: ParseCredentialsProtocolIsAvailableResponseFunction (copy)
	local ParseCredentialsProtocolIsAvailableResponseResult = ParseCredentialsProtocolIsAvailableResponseFunction(p1)
	
	return ParseCredentialsProtocolIsAvailableResponseResult.fido2Available and (ParseCredentialsProtocolIsAvailableResponseResult.fido2SupportsDeviceBoundOnly and ParseCredentialsProtocolIsAvailableResponseResult.fido2SupportsPasskeyCreationOnDevice)
end

local SinglePageSignUp = RoactModule.PureComponent:extend("SinglePageSignUp")

function SinglePageSignUp.init(p1)
	-- upvalues: Modules (copy), GetCredentialsAvailabilityStoreFunction (copy), InputValidityModule (copy), UserGenderModule (copy), RoactModule (copy), FFlagEnableLuaAccountSwitchModule (copy), UserModule (copy), AppStorageUtilitiesModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), LogoutAllLoggedInUsersModule (copy), AppStorageService (copy), LocalStorageKey (copy), GuiService (copy), FFlagEnableVNGDUARSignupComplianceModule (copy), FFlagEnableKoreaKISAComplianceModule (copy), FFlagBypassGUACKoreaComplianceModule (copy), FFlagBypassIXPKoreaComplianceModule (copy), EnableSkipVPCSignupFlow2 (copy), BypassIXPSkipVPCSignup (copy), AnalyticsEvents (copy), EventConstants (copy), KISAComplianceUtils (copy), CryoModule (copy), GetFFlagMinimalSignupAuthEnabledModule (copy), GetFFlagPasswordlessSignupAuthEnabledModule (copy), GetFFlagEnableSignupBirthdayExperimentsModule (copy), DisplayNamesOnSignupExperimentV3 (copy), FFlagUseBirthdayDropdownForGamepad (copy), GetFFlagPasskeySignupEnabledModule (copy), EventStreamConstantsModule (copy), ArgCheckModule (copy), Birthday (copy), DateHelper (copy), UsernameIssueModule (copy), IssueConditionModule (copy), FFlagSignupDisplayNameLoggingModule (copy), GetVerifiedSignupChallengeModule (copy), CredentialTypeModule (copy), FixSinglePageSignUpScrollPinning (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), DisablePasskeySignupForLuaDeepLinks (copy), GetFFlagCredProtocolRegisterPasswordOnSignupModule (copy), VerifiedSignupErrorCodesModule (copy), SignUpV2ErrorCodesModule (copy), ConstantsModule (copy), AccountLinkingAlertType (copy), GetMetaDataFromShareLinkModule (copy), HttpService (copy), ExperienceService (copy), DisplayNamesDiagLogging (copy), ReportEphemeralCounterModule (copy), DisplayNameCountersModule (copy), UserAgreementsCounterNames (copy), FFlagKoreaKISAUnderAgeNumberModule (copy), Events (copy), EventStreamConstants (copy), DisplayNameEligabilityAgeYears (copy), Constants1 (copy), ValidateCodeFunction (copy), PromiseModule (copy)
	local GetFFlagLuaAppSignUpRefactorPureLogicModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppSignUpRefactorPureLogic)
	local BuildSignupBirthdayHelpersModule = require(Modules.LuaApp.Components.Authentication.buildSignupBirthdayHelpers)
	local CredentialsAvailabilityStore = GetCredentialsAvailabilityStoreFunction(false)
	p1.state = {
		birthday = nil,
		shouldHideBirthdayEntry = false,
		username = "",
		displayName = "",
		password = "",
		birthdayValid = InputValidityModule.Unvalidated,
		usernameValid = InputValidityModule.Unvalidated,
		passwordValid = InputValidityModule.Unvalidated,
		displayNameValid = InputValidityModule.Unvalidated,
		isSignUpButtonEnabled = false,
		isSignUpInProgress = false,
		gender = UserGenderModule.Unknown,
		onScreenKeyboardHeight = 0,
		isUsernameAnimating = false,
		isPasswordAnimating = false,
		birthdayFocused = false,
		contactMethod = "",
		emailInput = "",
		emailValid = false,
		phoneCountryCode = {},
		phoneInput = "",
		phoneValid = false,
		verifiedSignupVoucher = "",
		isCountryCodeSearchVisible = false,
		hidePassword = nil,
		agreements = {},
		passkeysAvailable = CredentialsAvailabilityStore.getFido2Available(false),
		isCredentialsProtocolRegisterPasswordAvailable = CredentialsAvailabilityStore.getPasswordsAvailable(false),
		pillClicked = false,
		issueCondition = nil,
		suggestionControlState = nil,
		loadingSuggestions = false,
		signUpError = false,
		shouldShowUnderAgeAlert = false,
		shouldShowVngTosAlert = false,
		showU13AccountSwitcherAlert = false,
		showParentAccountSwitcherAlert = false,
		hasSetIneligibleAgeAtLeastOnce = false,
		recommendedUsername = nil,
		hasEditedUsername = false,
		bypassDisplayNameField = false,
		isUsernameFocused = false,
		otpSessionToken = "",
		otpCode = "",
		signupAgreementsChecked = false
	}
	p1.backButtonRef = RoactModule.createRef()
	p1.isAlreadyAuthenticated = false
	
	if FFlagEnableLuaAccountSwitchModule == true then
		p1.isAlreadyAuthenticated = UserModule.fromLocalStorage().userId ~= -1
	end
	function p1.resetDefaultTheme()
		-- upvalues: AppStorageUtilitiesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval)
		local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
		
		if AuthenticatedTheme ~= "" then
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
		end
	end
	
	function p1.logoutAllLoggedInUsersCallback()
		-- upvalues: p1 (copy), AppStorageUtilitiesModule (upval), UserModule (upval), LogoutAllLoggedInUsersModule (upval), AppStorageService (upval), LocalStorageKey (upval), GuiService (upval)
		local Networking = p1.props.networking
		local AccountBlob = AppStorageUtilitiesModule.getAccountBlob()
		local IsNotUserIdMatch = UserModule.fromLocalStorage().userId ~= -1
		p1:setState({
			signUpError = false,
			isSignUpButtonEnabled = false,
			isSignUpInProgress = false
		})
		LogoutAllLoggedInUsersModule(Networking, AccountBlob):await()
		
		if IsNotUserIdMatch == true then
			p1.props.resetAppState()
			AppStorageService:SetItem(LocalStorageKey.CredentialValue, "")
			AppStorageService:Flush()
			p1.props.logoutWithoutShowConfirmation(Networking, GuiService)
		end
		p1:setState({ signUpError = false })
		p1.props.closeCentralOverlay()
	end
	
	function p1.closeOverlayAndDisableSwitcherErrors()
		-- upvalues: p1 (copy)
		p1.props.closeCentralOverlay()
	end
	
	function p1.onCloseButtonClicked()
		-- upvalues: p1 (copy)
		p1.props.navigateBack()
	end
	
	function p1.getShouldShowVNGAgreements()
		-- upvalues: p1 (copy)
		return p1.props.appPolicy.getUseVNGUserAgreementPopup()
	end
	
	function p1.getShouldBlockVNGU12SignUpOnClientSide()
		-- upvalues: p1 (copy)
		return p1.props.appPolicy.getBlockVNGU12SignUpOnClientSide()
	end
	
	function p1.getShouldUseAgeInput()
		-- upvalues: p1 (copy), FFlagEnableVNGDUARSignupComplianceModule (upval)
		return p1.props.appPolicy.getUseAgeInput() and FFlagEnableVNGDUARSignupComplianceModule
	end
	
	function p1.getShouldShowKISAAgreements()
		-- upvalues: FFlagEnableKoreaKISAComplianceModule (upval), p1 (copy), FFlagBypassGUACKoreaComplianceModule (upval), FFlagBypassIXPKoreaComplianceModule (upval)
		return FFlagEnableKoreaKISAComplianceModule and (if p1.props.appPolicy.getUseKoreaKISAUserAgreementPopup() then p1.props.shouldShowKoreanKISASignUpFlow or FFlagBypassIXPKoreaComplianceModule else FFlagBypassGUACKoreaComplianceModule and (p1.props.shouldShowKoreanKISASignUpFlow or FFlagBypassIXPKoreaComplianceModule))
	end
	
	function p1.enableSkipVPCSignupFlow()
		-- upvalues: EnableSkipVPCSignupFlow2 (upval), p1 (copy), BypassIXPSkipVPCSignup (upval)
		return EnableSkipVPCSignupFlow2 and (p1.props.shouldSkipVPCSignupFlow or BypassIXPSkipVPCSignup)
	end
	
	function p1.getShouldAddParentalConsentAgreementId()
		-- upvalues: p1 (copy)
		return p1.props.appPolicy.getParentalConsentAgreementId()
	end
	
	function p1.getSignupCheckboxDisabled()
		-- upvalues: p1 (copy)
		return p1.props.appPolicy.getSignupCheckboxDisabled()
	end
	
	function p1.launchKISATermsOfService(p2, IsUnderAgeFlow)
		-- upvalues: p1 (copy), AnalyticsEvents (upval), EventConstants (upval), KISAComplianceUtils (upval), CryoModule (upval)
		p1.props.openKISAUserAgreements({
			agreements = p1.state.agreements,
			onAgreeFunction = function(p3)
				-- upvalues: AnalyticsEvents (upval), EventConstants (upval), KISAComplianceUtils (upval), CryoModule (upval), p2 (copy), p1 (upval), IsUnderAgeFlow (copy)
				AnalyticsEvents.sendButtonClickEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup, EventConstants.btn.agree)
				local JoinResult = CryoModule.Dictionary.join(p2, {
					agreementIds = KISAComplianceUtils.getAgreedUserAgreements(p3)
				})
				local ShouldAddParentalConsentAgreementId = p1.getShouldAddParentalConsentAgreementId()
				
				if IsUnderAgeFlow and ShouldAddParentalConsentAgreementId and ShouldAddParentalConsentAgreementId ~= "" then
					table.insert(JoinResult.agreementIds, ShouldAddParentalConsentAgreementId)
				end
				p1.requestSignUp(JoinResult)
			end,
			onAbandonFunction = p1.onAbandonKISASignUpFlow,
			isUnderAgeFlow = IsUnderAgeFlow
		})
	end
	
	function p1.getIsSignUpButtonEnabled()
		-- upvalues: p1 (copy), GetFFlagMinimalSignupAuthEnabledModule (upval), GetFFlagPasswordlessSignupAuthEnabledModule (upval), GetFFlagLuaAppSignUpRefactorPureLogicModule (copy), Modules (upval), GetFFlagEnableSignupBirthdayExperimentsModule (upval), DisplayNamesOnSignupExperimentV3 (upval), FFlagUseBirthdayDropdownForGamepad (upval), GetFFlagPasskeySignupEnabledModule (upval), InputValidityModule (upval)
		local Birthday = p1.state.birthday
		local Username = p1.state.username
		local Password = p1.state.password
		local DisplayName = p1.state.displayName
		local BirthdayValid = p1.state.birthdayValid
		local UsernameValid = p1.state.usernameValid
		local PasswordValid = p1.state.passwordValid
		local DisplayNameValid = p1.state.displayNameValid
		local ValidBirthday = p1.state.validBirthday
		local FFlagMinimalSignupAuthEnabledModule = p1.props.shouldUseMinimalSignup and GetFFlagMinimalSignupAuthEnabledModule()
		local FFlagPasswordlessSignupAuthEnabledModule = p1.props.shouldUsePasswordlessSignup and GetFFlagPasswordlessSignupAuthEnabledModule()
		
		if GetFFlagLuaAppSignUpRefactorPureLogicModule() then
			return require(Modules.LuaApp.Components.Authentication.computeIsSignUpButtonEnabled)({
				birthday = Birthday,
				username = Username,
				password = Password,
				displayName = DisplayName,
				birthdayValid = BirthdayValid,
				usernameValid = UsernameValid,
				passwordValid = PasswordValid,
				displayNameValid = DisplayNameValid,
				validBirthday = ValidBirthday,
				shouldUseMinimalSignup = FFlagMinimalSignupAuthEnabledModule,
				shouldUsePasswordlessSignup = FFlagPasswordlessSignupAuthEnabledModule,
				shouldUsePasskeySignup = p1.props.shouldUsePasskeySignup,
				passkeysAvailable = p1.state.passkeysAvailable,
				shouldUseAlternateBirthday = GetFFlagEnableSignupBirthdayExperimentsModule() and (p1.props.birthdayPickerVariant and p1.props.birthdayPickerVariant > 0),
				shouldRequireSignupCheckbox = p1.props.shouldRequireSignupCheckbox,
				signupAgreementsChecked = p1.state.signupAgreementsChecked,
				signupCheckboxDisabled = p1.getSignupCheckboxDisabled(),
				displayNamesOnSignupExperimentEnabled = DisplayNamesOnSignupExperimentV3,
				isDisplayNameFieldRequired = DisplayNamesOnSignupExperimentV3 and p1.isDisplayNameFieldRequired(),
				useBirthdayDropdownForGamepadEnabled = FFlagUseBirthdayDropdownForGamepad,
				passkeySignupEnabled = GetFFlagPasskeySignupEnabledModule()
			})
		end
		if GetFFlagPasskeySignupEnabledModule() and p1.props.shouldUsePasskeySignup and not p1.state.passkeysAvailable then
			FFlagPasswordlessSignupAuthEnabledModule = false
		end
		local IsBirthdayPickerVariantAbove: boolean = GetFFlagEnableSignupBirthdayExperimentsModule() and (p1.props.birthdayPickerVariant and p1.props.birthdayPickerVariant > 0)
		
		if not p1.getSignupCheckboxDisabled() and p1.props.shouldRequireSignupCheckbox and not p1.state.signupAgreementsChecked then
			return false
		end
		local IsNotUsernameValidMatch = UsernameValid ~= InputValidityModule.Valid or (PasswordValid ~= InputValidityModule.Valid or (IsBirthdayPickerVariantAbove and BirthdayValid ~= InputValidityModule.Valid or (if DisplayNamesOnSignupExperimentV3 and p1.isDisplayNameFieldRequired() then DisplayNameValid ~= InputValidityModule.Valid else nil)))
		
		if FFlagUseBirthdayDropdownForGamepad and Birthday and ValidBirthday == false then
			return false
		elseif FFlagMinimalSignupAuthEnabledModule and Birthday then
			return not IsBirthdayPickerVariantAbove or BirthdayValid == InputValidityModule.Valid
		elseif FFlagPasswordlessSignupAuthEnabledModule and Birthday and (Username ~= "" and UsernameValid == InputValidityModule.Valid) then
			return not IsBirthdayPickerVariantAbove or BirthdayValid == InputValidityModule.Valid
		elseif Birthday and not IsNotUsernameValidMatch and Username ~= "" and Password ~= "" and ((not DisplayNamesOnSignupExperimentV3 or not p1.isDisplayNameFieldRequired() or DisplayName ~= "") and not nil) then
			return ValidBirthday ~= false
		else
			return false
		end
	end
	
	function p1.updateState(BirthdayFromAge)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), BirthdayFromAge (copy)
			if p1.isMounted then
				p1:setState(BirthdayFromAge)
			end
		end)
	end
	
	function p1.getHidePassword()
		-- upvalues: p1 (copy)
		return if p1.state.hidePassword == nil then not p1.props.arePasswordFieldsPlaintext else p1.state.hidePassword
	end
	
	function p1.passwordVisibilityToggleCallback()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		local HidePassword = p1.getHidePassword()
		
		if HidePassword then
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.ShowPassword)
		else
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.HidePassword)
		end
		p1:setState({ hidePassword = not HidePassword })
	end
	
	function p1.onBirthdaySelected(Birthday1, ValidBirthday)
		-- upvalues: ArgCheckModule (upval), Birthday (upval), p1 (copy), EventStreamConstantsModule (upval)
		ArgCheckModule.assert(Birthday.is(Birthday1), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.")
		p1.updateState({ birthday = Birthday1, validBirthday = ValidBirthday })
		
		if p1.useVerifiedSignup() then
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.ConfirmBirthday)
		end
		p1.updateSignUpFieldFilled()
	end
	
	function p1.onAgeChanged(p2)
		-- upvalues: GetFFlagLuaAppSignUpRefactorPureLogicModule (copy), p1 (copy), BuildSignupBirthdayHelpersModule (copy), InputValidityModule (upval), Birthday (upval), DateHelper (upval)
		local Number: number? = tonumber(p2)
		local LocalTime = DateTime.now():ToLocalTime()
		
		if GetFFlagLuaAppSignUpRefactorPureLogicModule() then
			p1.updateState(BuildSignupBirthdayHelpersModule.buildBirthdayFromAge(Number, LocalTime))
			
			return
		end
		if Number == nil or Number < 1 or Number > 99 then
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
			
			return
		end
		local NewBirthday = Birthday.new({
			Year = LocalTime.Year - Number,
			Month = LocalTime.Month,
			Day = LocalTime.Day
		})
		
		if NewBirthday.Month == 2 and NewBirthday.Day == 29 and not DateHelper:isLeapYear(NewBirthday.Year) then
			NewBirthday.Day = 28
		end
		if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then
			p1.updateState({
				birthday = NewBirthday,
				birthdayValid = InputValidityModule.Valid
			})
			
			return
		else
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
		end
	end
	
	function p1.onAgeAndMonthChanged(p2: number, Month)
		-- upvalues: GetFFlagLuaAppSignUpRefactorPureLogicModule (copy), p1 (copy), BuildSignupBirthdayHelpersModule (copy), InputValidityModule (upval), Birthday (upval), DateHelper (upval)
		local LocalTime = DateTime.now():ToLocalTime()
		
		if GetFFlagLuaAppSignUpRefactorPureLogicModule() then
			p1.updateState(BuildSignupBirthdayHelpersModule.buildBirthdayFromAgeMonth(p2, Month, LocalTime))
			
			return
		end
		if p2 == nil or p2 < 1 or p2 > 99 then
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
			
			return
		end
		local YearDelta = LocalTime.Year - p2
		local NewBirthday = Birthday.new({
			Year = YearDelta,
			Month = Month,
			Day = DateHelper:getLastDayOfTheMonthInYear(Month, YearDelta)
		})
		
		if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then
			p1.updateState({
				birthday = NewBirthday,
				birthdayValid = InputValidityModule.Valid
			})
			
			return
		else
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
		end
	end
	
	function p1.onMonthAndYearChanged(Month, Year)
		-- upvalues: GetFFlagLuaAppSignUpRefactorPureLogicModule (copy), p1 (copy), BuildSignupBirthdayHelpersModule (copy), InputValidityModule (upval), Birthday (upval), DateHelper (upval)
		local LocalTime = DateTime.now():ToLocalTime()
		
		if GetFFlagLuaAppSignUpRefactorPureLogicModule() then
			p1.updateState(BuildSignupBirthdayHelpersModule.buildBirthdayFromMonthYear(Month, Year, LocalTime))
			
			return
		end
		if Year == nil or Year < LocalTime.Year - 100 or LocalTime.Year < Year then
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
			
			return
		end
		local NewBirthday = Birthday.new({
			Year = Year,
			Month = Month,
			Day = DateHelper:getLastDayOfTheMonthInYear(Month, Year)
		})
		
		if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then
			p1.updateState({
				birthday = NewBirthday,
				birthdayValid = InputValidityModule.Valid
			})
			
			return
		else
			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			})
		end
	end
	
	if GetFFlagLuaAppSignUpRefactorPureLogicModule() then
		local v1 = require(Modules.LuaApp.Components.Authentication.createUsernameSuggestionHandlers)({
			updateState = p1.updateState,
			getIssueCondition = function()
				-- upvalues: p1 (copy)
				return p1.state.issueCondition
			end,
			getAuthEventAnalytics = function()
				-- upvalues: p1 (copy)
				return p1.props.authEventAnalytics
			end
		})
		p1.usernameSuggestionClicked = v1.usernameSuggestionClicked
		p1.logRefreshButtonClicked = v1.logRefreshButtonClicked
		p1.usernameSuggestionsShown = v1.usernameSuggestionsShown
		p1.logSuggestableUsername = v1.logSuggestableUsername
		p1.shouldSuggest = v1.shouldSuggest
		p1.updatePillClicked = v1.updatePillClicked
		p1.resetPillClicked = v1.resetPillClicked
		p1.updateIssueCondition = v1.updateIssueCondition
		p1.updateSuggestionControlState = v1.updateSuggestionControlState
		p1.loadSuggestions = v1.loadSuggestions
		p1.finishSuggestions = v1.finishSuggestions
	else
		function p1.usernameSuggestionClicked(p2, p3)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.props.authEventAnalytics.reportUsernameSuggestionClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.UsernameSuggestion, p2, p3)
		end
		
		function p1.logRefreshButtonClicked()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, "usernameSuggestionRefreshButton")
		end
		
		function p1.usernameSuggestionsShown(p2, p3)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.props.authEventAnalytics.reportInteractWithActionAndSection(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Shown, "usernameSuggestionsShown", p2, p3)
		end
		
		function p1.logSuggestableUsername(Username)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.props.authEventAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Shown, "suggestableUsernameInput", Username)
		end
		
		function p1.shouldSuggest(): boolean
			-- upvalues: p1 (copy), UsernameIssueModule (upval), IssueConditionModule (upval)
			local IsProblematicMatch = false
			local IssueCondition = p1.state.issueCondition
			
			if IssueCondition then
				IsProblematicMatch = IssueCondition[UsernameIssueModule.AlreadyInUse] == IssueConditionModule.Problematic
				for i, value in pairs(IssueCondition) do
					if i ~= UsernameIssueModule.AlreadyInUse and value == IssueConditionModule.Problematic then
						return false
					end
				end
			end
			return IsProblematicMatch
		end
		
		function p1.updatePillClicked()
			-- upvalues: p1 (copy)
			p1.updateState({ pillClicked = true })
		end
		
		function p1.resetPillClicked()
			-- upvalues: p1 (copy)
			p1.updateState({ pillClicked = false })
		end
		
		function p1.updateIssueCondition(IssueCondition)
			-- upvalues: p1 (copy)
			p1.updateState({ issueCondition = IssueCondition })
		end
		
		function p1:updateSuggestionControlState(SuggestionControlState)
			-- upvalues: p1 (copy)
			p1.updateState({ suggestionControlState = SuggestionControlState })
		end
		
		function p1.loadSuggestions()
			-- upvalues: p1 (copy)
			p1.updateState({ loadingSuggestions = true })
		end
		
		function p1.finishSuggestions()
			-- upvalues: p1 (copy)
			p1.updateState({ loadingSuggestions = false })
		end
	end
	function p1.onBirthdayFocused(BirthdayFocused)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ birthdayFocused = BirthdayFocused })
		end
	end
	
	function p1.onUsernameTextChanged(Username, UsernameValid)
		-- upvalues: DisplayNamesOnSignupExperimentV3 (upval), p1 (copy)
		local IsNotRecommendedUsernameMatch = if DisplayNamesOnSignupExperimentV3 and p1.shouldShowDisplayNameField() and not p1.state.hasEditedUsername then p1.state.recommendedUsername ~= Username else nil
		p1.updateState({
			username = Username,
			usernameValid = UsernameValid,
			hasEditedUsername = if DisplayNamesOnSignupExperimentV3 then IsNotRecommendedUsernameMatch else nil
		})
		
		if p1.shouldSuggest() then
			p1.logSuggestableUsername(Username)
		end
		p1.updateSignUpFieldFilled()
	end
	
	function p1.updateSignUpFieldFilled()
		-- upvalues: p1 (copy)
		if p1.props.signUpStarted == nil then return end
		local IsNotUsernameMatch: boolean = p1.state.username ~= "" or p1.state.password ~= "" or p1.state.birthday ~= nil
		
		if IsNotUsernameMatch ~= p1.state.signUpStarted then
			p1.props.setSignUpStarted(IsNotUsernameMatch)
		end
	end
	
	function p1.onDisplayNameTextChanged(DisplayName, DisplayNameValid)
		-- upvalues: p1 (copy)
		p1.updateState({
			displayName = DisplayName,
			displayNameValid = DisplayNameValid
		})
	end
	
	function p1.updateBypassDisplayNameField(BypassDisplayNameField)
		-- upvalues: p1 (copy)
		p1:setState({ bypassDisplayNameField = BypassDisplayNameField })
	end
	
	function p1.onUsernameTextValidated(Username, UsernameValid)
		-- upvalues: p1 (copy), InputValidityModule (upval), EventStreamConstantsModule (upval)
		p1.onUsernameTextChanged(Username, UsernameValid)
		
		if UsernameValid == InputValidityModule.Valid then
			p1.props.authEventAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Submit, UsernameValid, Username)
		end
	end
	
	function p1.onPasswordTextChanged(Password, PasswordValid)
		-- upvalues: p1 (copy)
		p1.updateState({ password = Password, passwordValid = PasswordValid })
		p1.updateSignUpFieldFilled()
	end
	
	p1.cachedScrollCanvasPositionY = 0
	p1.cachedScrollCanvasInitialSizeY = 0
	p1.scrollCanvasTargetPositionY, p1.updateScrollCanvasTargetPositionY = RoactModule.createBinding(0)
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.ageTextFieldRef = RoactModule.createRef()
	p1.usernameTextFieldRef = RoactModule.createRef()
	p1.displayNameTextFieldRef = if DisplayNamesOnSignupExperimentV3 then RoactModule.createRef() else nil
	p1.passwordTextFieldRef = RoactModule.createRef()
	p1.passwordFrameRef = RoactModule.createRef()
	
	function p1.onDisplayNameTextChangeCompletedFromKeyboard()
		-- upvalues: p1 (copy), FFlagSignupDisplayNameLoggingModule (upval), EventStreamConstantsModule (upval)
		task.spawn(function()
			-- upvalues: p1 (upval), FFlagSignupDisplayNameLoggingModule (upval), EventStreamConstantsModule (upval)
			if p1.displayNameTextFieldRef.current then
				p1.displayNameTextFieldRef.current:ReleaseFocus()
			end
			task.defer(function()
				-- upvalues: p1 (upval)
				if p1.usernameTextFieldRef.current then
					p1.usernameTextFieldRef.current:CaptureFocus()
				end
			end)
			
			if FFlagSignupDisplayNameLoggingModule then
				p1.props.authEventAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.DisplayNameNext, EventStreamConstantsModule.State.KeyboardInput)
			end
		end)
	end
	
	function p1.onUsernameTextChangeCompletedFromKeyboard()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		spawn(function()
			-- upvalues: p1 (upval), EventStreamConstantsModule (upval)
			if p1.usernameTextFieldRef.current then
				p1.usernameTextFieldRef.current:ReleaseFocus()
			end
			if p1.passwordTextFieldRef.current then
				p1.passwordTextFieldRef.current:CaptureFocus()
			end
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.UsernameNext)
		end)
	end
	
	function p1.onPasswordTextChangeCompletedFromKeyboard()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		spawn(function()
			-- upvalues: p1 (upval), EventStreamConstantsModule (upval)
			if p1.passwordTextFieldRef.current then
				p1.passwordTextFieldRef.current:ReleaseFocus()
			end
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.PasswordNext)
		end)
	end
	
	function p1.cacheScrollCanvasInitialSizeIfNecessary()
		-- upvalues: p1 (copy)
		if p1.cachedScrollCanvasInitialSizeY == 0 then
			local Parent = p1.scrollingFrameRef.current.Parent
			local CanvasSize = p1.scrollingFrameRef.current.CanvasSize
			p1.cachedScrollCanvasInitialSizeY = CanvasSize.Y.Scale * (Parent and Parent.AbsoluteSize or Vector2.new(0, 0)).Y + CanvasSize.Y.Offset
		end
	end
	
	function p1.agreeToPhoneNumberVerification()
		-- upvalues: p1 (copy), GetVerifiedSignupChallengeModule (upval)
		local Networking = p1.props.networking
		local Text = p1.state.phoneCountryCode.prefix .. "," .. p1.state.phoneInput .. "," .. p1.state.phoneCountryCode.code
		p1.props.agreeToPhoneNumberVerification(Networking, function()
			-- upvalues: GetVerifiedSignupChallengeModule (upval), Networking (copy), Text (copy), p1 (upval)
			GetVerifiedSignupChallengeModule(Networking, Text):andThen(function(Result)
				-- upvalues: p1 (upval), Text (upval)
				p1.verifyPhoneNumber(Result.challenge, p1.state.phoneInput, Text)
			end, function(p2)
				-- upvalues: p1 (upval)
				if p2 == "Authentication.TwoStepVerification.Response.TooManyAttempts" or p2 == "Authentication.SignUp.Response.PhoneNumberAlreadyLinked" or p2 == "Authentication.SignUp.Response.InvalidPhoneNumber" then
					p1.props.showErrorMessageToast(p2)
					
					return
				else
					p1.props.showErrorToast()
				end
			end)
		end, p1.state.phoneInput)
	end
	
	function p1.onSignUpClick()
		-- upvalues: p1 (copy), CredentialTypeModule (upval)
		if p1.useVerifiedSignup() and p1.state.contactMethod == CredentialTypeModule.PhoneNumber then
			p1.agreeToPhoneNumberVerification()
			
			return
		else
			p1.onSignUpButtonActivated()
		end
	end
	
	function p1.verifyPhoneNumber(Challenge, PhoneInput, p2)
		-- upvalues: p1 (copy)
		p1.props.verifyPhoneNumber(p1.props.networking, p1.verifyPhoneNumberCallback, Challenge, PhoneInput, p2, p1.useEmailOptionClickedCallback)
	end
	
	function p1.verifyPhoneNumberCallback(VerifiedSignupVoucher)
		-- upvalues: p1 (copy)
		p1.verifiedSignupVoucher = VerifiedSignupVoucher
		p1.onSignUpButtonActivated()
	end
	
	function p1.useEmailOptionClickedCallback()
		-- upvalues: p1 (copy), CredentialTypeModule (upval)
		p1:setState({ contactMethod = CredentialTypeModule.Email })
	end
	
	function p1.phoneCountryCodeSelectorCallback(IsCountryCodeSearchVisible)
		-- upvalues: p1 (copy)
		p1:setState({ isCountryCodeSearchVisible = IsCountryCodeSearchVisible })
	end
	
	function p1.onTextBoxFocused(p2)
		-- upvalues: p1 (copy), FixSinglePageSignUpScrollPinning (upval)
		p1.cacheScrollCanvasInitialSizeIfNecessary()
		local ClampedValue = math.clamp(p1.scrollingFrameRef.current.CanvasPosition.Y, 0, p1.cachedScrollCanvasInitialSizeY)
		
		if p1.isMounted then
			p1.updateScrollCanvasTargetPositionY(p2.Y - p1.scrollingFrameRef.current.absolutePosition.Y + ClampedValue)
			
			if FixSinglePageSignUpScrollPinning then
				task.defer(function()
					-- upvalues: p1 (upval)
					if p1.isMounted then
						p1.updateScrollCanvasTargetPositionY(0)
					end
				end)
			end
		end
	end
	
	function p1.onTextBoxFocusLost()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.updateScrollCanvasTargetPositionY(0)
		end
	end
	
	function p1.onUsernameTextBoxFocusLost()
		-- upvalues: p1 (copy)
		p1.onTextBoxFocusLost()
		p1.updateState({ isUsernameFocused = false })
	end
	
	function p1.onAnimationStateChangeCallback(TextInputType, IsPasswordAnimating)
		-- upvalues: p1 (copy)
		if TextInputType == Enum.TextInputType.Password then
			p1:setState({ isPasswordAnimating = IsPasswordAnimating })
			
			return
		else
			p1:setState({ isUsernameAnimating = IsPasswordAnimating })
		end
	end
	
	function p1.onFocusedTextBoxPositionChanged(p2)
		-- upvalues: p1 (copy)
		if p1.state.isUsernameAnimating or p1.state.isPasswordAnimating then
			p1.onTextBoxFocused(p2)
		end
	end
	
	function p1.getScrollingFrameCanvasPosition(Y: number)
		-- upvalues: p1 (copy)
		return if Y > 0 then Vector2.new(0, Y) elseif p1.scrollingFrameRef and p1.scrollingFrameRef.current then p1.scrollingFrameRef.current.CanvasPosition else Vector2.new(0, 0)
	end
	
	function p1.onUsernameTextBoxFocused(p2)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1:setState({ isUsernameFocused = true })
		p1.props.authEventAnalytics.reportUsernameFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
		p1.onTextBoxFocused(p2)
	end
	
	function p1.onDisplayNameTextBoxFocused(p2)
		-- upvalues: FFlagSignupDisplayNameLoggingModule (upval), p1 (copy), EventStreamConstantsModule (upval)
		if FFlagSignupDisplayNameLoggingModule then
			p1.props.authEventAnalytics.reportDisplayNameFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
		end
		p1.onTextBoxFocused(p2)
	end
	
	function p1.onPasswordTextBoxFocused(p2)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.authEventAnalytics.reportPasswordFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
		p1.onTextBoxFocused(p2)
	end
	
	function p1.updateIsSignUpInProgress(IsSignUpInProgress)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), IsSignUpInProgress (copy)
			if p1.isMounted then
				p1:setState({ isSignUpInProgress = IsSignUpInProgress })
			end
		end)
	end
	
	function p1.requestSignUp(JoinResult, p2)
		-- upvalues: p1 (copy), CredentialTypeModule (upval), FFlagEnableAuthDeepLinkReceiver (upval), PreAuthDeepLinkUrlStore (upval), LinkingProtocol (upval), DisablePasskeySignupForLuaDeepLinks (upval), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagCredProtocolRegisterPasswordOnSignupModule (upval), VerifiedSignupErrorCodesModule (upval), SignUpV2ErrorCodesModule (upval), FFlagEnableLuaAccountSwitchModule (upval), ConstantsModule (upval), AccountLinkingAlertType (upval)
		local Networking = p1.props.networking
		local GuiService = p1.props.guiService
		local Analytics = p1.props.analytics
		local AppPolicy = p1.props.appPolicy
		local OmniRecommendationsRequest = p1.props.omniRecommendationsRequest
		local AuthEventAnalytics = p1.props.authEventAnalytics
		local SignUpFunction = p1.props.signUp
		local SetBackNavigationDisabledFunction = p1.props.setBackNavigationDisabled
		
		local function v206(p3, p4)
			-- upvalues: SetBackNavigationDisabledFunction (copy), p1 (upval), JoinResult (copy)
			if p3 then
				SetBackNavigationDisabledFunction(true)
				p1.requestSignUp(JoinResult, p4)
				
				return
			else
				p1.updateIsSignUpInProgress(false)
			end
		end
		
		local IsContactMethodMatch: boolean = p1.useVerifiedSignup() and p1.state.contactMethod == CredentialTypeModule.PhoneNumber
		local Url = if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL()
		local NoPasskeysAvailable: boolean = not p1.state.passkeysAvailable or DisablePasskeySignupForLuaDeepLinks and (Url ~= nil and Url ~= "")
		local FFlagPasskeySignupEnabledModule = GetFFlagPasskeySignupEnabledModule()
		SignUpFunction(Networking, OmniRecommendationsRequest, GuiService, v206, p2, Analytics, AppPolicy, JoinResult, IsContactMethodMatch, p1.props.shouldUsePasskeySignup and (FFlagPasskeySignupEnabledModule and (game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not NoPasskeysAvailable)), p1.props.shouldAutomaticallyPromptForPasskey, GetFFlagCredProtocolRegisterPasswordOnSignupModule() and p1.state.isCredentialsProtocolRegisterPasswordAvailable, AuthEventAnalytics, p1.props.isIosAuthServiceEnabled):andThen(function()
			-- upvalues: SetBackNavigationDisabledFunction (copy)
			SetBackNavigationDisabledFunction(false)
		end, function(Captcha)
			-- upvalues: SetBackNavigationDisabledFunction (copy), IsContactMethodMatch (copy), VerifiedSignupErrorCodesModule (upval), p1 (upval), SignUpV2ErrorCodesModule (upval), FFlagEnableLuaAccountSwitchModule (upval), ConstantsModule (upval), AccountLinkingAlertType (upval)
			SetBackNavigationDisabledFunction(false)
			
			if IsContactMethodMatch then
				if Captcha ~= VerifiedSignupErrorCodesModule.Captcha then
					p1.updateIsSignUpInProgress(false)
					p1:setState({ signUpError = true })
				end
			else
				if Captcha ~= SignUpV2ErrorCodesModule.Captcha then
					p1.updateIsSignUpInProgress(false)
					p1:setState({ signUpError = true })
				end
				if Captcha == SignUpV2ErrorCodesModule.VNGAgeUnder12 then
					p1:setState({ shouldShowUnderAgeAlert = true })
				end
				if FFlagEnableLuaAccountSwitchModule == true and Captcha == SignUpV2ErrorCodesModule.EmptyAccountSwitchBlobRequired then
					p1.props.openAccountSwitchingErrorOverlay(if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.LogoutConfirmation", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, ConstantsModule.Auth.AccountSwitcherSignupEmptyBlobRequiredError, p1.state.username)
					p1:setState({ signUpError = false })
				end
				if FFlagEnableLuaAccountSwitchModule == true and Captcha == SignUpV2ErrorCodesModule.ParentEmptyAccountSwitchBlobRequired then
					p1.props.openAccountSwitchingErrorOverlay(if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, ConstantsModule.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError, p1.state.username)
					p1:setState({ signUpError = false })
				end
			end
			if Captcha == SignUpV2ErrorCodesModule.AccountLinkingRequired then
				p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInAlreadyLinked)
				
				return
			end
			if Captcha == SignUpV2ErrorCodesModule.AccountLinkingFailed then
				p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInGenericError)
			end
		end)
	end
	
	function p1.onSignUpButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), FFlagEnableAuthDeepLinkReceiver (upval), PreAuthDeepLinkUrlStore (upval), LinkingProtocol (upval), GetMetaDataFromShareLinkModule (upval), HttpService (upval), ExperienceService (upval), DisplayNamesDiagLogging (upval), ReportEphemeralCounterModule (upval), DisplayNameCountersModule (upval), DisplayNamesOnSignupExperimentV3 (upval), CredentialTypeModule (upval), UserAgreementsCounterNames (upval), FFlagKoreaKISAUnderAgeNumberModule (upval), Events (upval), EventStreamConstants (upval)
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		local Birthday = p1.state.birthday
		local Username = p1.state.username
		local Password = p1.state.password
		local Gender = p1.state.gender
		local Locale = p1.locale
		local EmailInput = p1.state.emailInput
		
		local function _(List)
			local Ids = {}
			
			for _, value in ipairs(List) do
				table.insert(Ids, value.id)
			end
			return Ids
		end
		
		if p1.getIsSignUpButtonEnabled() then
			p1.props.authEventAnalytics.reportSignUpButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
			
			if p1.getShouldBlockVNGU12SignUpOnClientSide() then
				local UserAge: number = p1.getUserAge()
				
				if UserAge == nil or UserAge < 12 then
					p1:setState({ shouldShowUnderAgeAlert = true })
					
					return
				end
			end
			local Url = if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL()
			local Json = ""
			
			if Url and string.find(Url, "share") then
				local CodeTypeStamp, CodeTypeStamp2, CodeTypeStamp3 = Url:match("code=(.-)&type=(.-)&stamp=(.*)")
				
				if not CodeTypeStamp3 then
					CodeTypeStamp, CodeTypeStamp2 = Url:match("code=(.-)&type=(.*)")
				end
				if CodeTypeStamp and CodeTypeStamp2 then
					GetMetaDataFromShareLinkModule(p1.props.networking, CodeTypeStamp, CodeTypeStamp2):andThen(function(Result)
						-- upvalues: Json (ref), HttpService (upval)
						if Result and Result ~= nil then
							Json = HttpService:JSONEncode(Result)
						end
					end, function(p2)
						warn("Error fetching share link metadata: ", p2)
					end):await()
				end
			else
				local PendingJoinAttempt = ExperienceService:GetPendingJoinAttempt()
				
				if PendingJoinAttempt and PendingJoinAttempt ~= nil then
					Json = HttpService:JSONEncode(PendingJoinAttempt)
				end
			end
			p1.props.authEventAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.SignUp, Json, Url, p1.isAltAttempt)
			
			if DisplayNamesDiagLogging and p1.props.shouldSeeDisplayNamesOnSignup then
				if p1.state.recommendedUsername == Username then
					ReportEphemeralCounterModule(DisplayNameCountersModule.SignUpWithRecommendedUsernames, 1)
				elseif p1.state.hasEditedUsername then
					ReportEphemeralCounterModule(DisplayNameCountersModule.SignUpWithEditedUsernames, 1)
				end
				if p1.state.bypassDisplayNameField then
					ReportEphemeralCounterModule(DisplayNameCountersModule.SignupBypassingDisplayNames, 1)
				end
			end
			p1.updateIsSignUpInProgress(true)
			SetBackNavigationDisabledFunction(true)
			p1:setState({ signUpError = false })
			local config = {
				birthday = Birthday and Birthday:FormatForEndpoint() or "",
				username = Username,
				password = Password,
				displayName = if DisplayNamesOnSignupExperimentV3 and p1.isDisplayNameFieldRequired() then p1.state.displayName else nil,
				gender = Gender,
				locale = Locale,
				capturedAuditContent = p1.props.capturedAuditContent,
				additionalAuditContent = p1.props.additionalAuditContent
			}
			local UseVerifiedSignupResult = p1.useVerifiedSignup()
			
			if UseVerifiedSignupResult and p1.state.contactMethod == CredentialTypeModule.Email then
				config.email = EmailInput
			elseif UseVerifiedSignupResult and p1.state.contactMethod == CredentialTypeModule.PhoneNumber then
				config.verifiedSignupVoucher = p1.verifiedSignupVoucher
			end
			if p1.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
				local Agreements = p1.state.agreements
				
				if #Agreements > 0 then
					local AgreementIds = {}
					
					for _, agreement in ipairs(Agreements) do
						table.insert(AgreementIds, agreement.id)
					end
					config.agreementIds = AgreementIds
				else
					ReportEphemeralCounterModule(UserAgreementsCounterNames.AgreementsIdsEmptyOnSignup, 1)
				end
			end
			if p1.getShouldShowVNGAgreements() then
				p1.props.showVNGUserAgreementsPopup(p1.state.agreements, function(List)
					-- upvalues: config (copy), p1 (upval)
					local AgreementIds = {}
					
					for _, value in ipairs(List) do
						table.insert(AgreementIds, value.id)
					end
					config.agreementIds = AgreementIds
					p1.requestSignUp(config)
				end, function()
					-- upvalues: p1 (upval), SetBackNavigationDisabledFunction (copy)
					p1.updateIsSignUpInProgress(false)
					SetBackNavigationDisabledFunction(false)
				end)
			elseif p1.getShouldShowKISAAgreements() then
				local UserAge = p1.getUserAge()
				
				if not UserAge or UserAge >= FFlagKoreaKISAUnderAgeNumberModule then
					p1.launchKISATermsOfService(config, false)
				elseif p1.enableSkipVPCSignupFlow() then
					Events.authPageload(EventStreamConstants.Context.KISAU14Signup, EventStreamConstants.State.SkipVPC)
					p1.requestSignUp(config)
				else
					Events.authPageload(EventStreamConstants.Context.KISAU14Signup, EventStreamConstants.State.LaunchParentSignUpOtp)
					p1.launchParentSignUpOtp(config)
				end
			else
				p1.requestSignUp(config)
			end
		end
	end
	
	function p1.onGenderChanged(Gender)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.updateState({ gender = Gender })
		end
	end
	
	function p1:validUsernameEntered(): boolean
		-- upvalues: p1 (copy), InputValidityModule (upval)
		return p1.state.username ~= "" and p1.state.usernameValid ~= InputValidityModule.Invalid
	end
	
	function p1.validPasswordEntered(): boolean
		-- upvalues: p1 (copy), InputValidityModule (upval)
		return p1.state.password ~= "" and p1.state.passwordValid ~= InputValidityModule.Invalid
	end
	
	function p1.LuaVerifiedSignup2()
		-- upvalues: p1 (copy), GuiService (upval)
		return game:GetFastFlag("LuaVerifiedSignup2") or game:GetFastFlag("LuaVerifiedSignupExperiment2") and (p1.props.useVerifiedSignupPage and not GuiService:IsTenFootInterface())
	end
	
	function p1.useUsernameSuggestions()
		-- upvalues: p1 (copy)
		return p1.props.shouldUseUsernameSuggestions
	end
	
	function p1.useRefreshButton()
		-- upvalues: p1 (copy)
		return p1.props.enableRefreshButton
	end
	
	function p1.getBirthdayVariant()
		-- upvalues: p1 (copy), GetFFlagEnableSignupBirthdayExperimentsModule (upval)
		return if p1.getShouldUseAgeInput() then 1 elseif GetFFlagEnableSignupBirthdayExperimentsModule() and p1.props.birthdayPickerVariant ~= nil then p1.props.birthdayPickerVariant else 0
	end
	
	function p1.SetContactMethod(ContactMethod)
		-- upvalues: p1 (copy)
		p1.updateState({ contactMethod = ContactMethod })
	end
	
	function p1.SetPhoneNumber(PhoneCountryCode, PhoneInput, PhoneValid)
		-- upvalues: p1 (copy)
		p1.updateState({
			phoneCountryCode = PhoneCountryCode,
			phoneInput = PhoneInput,
			phoneValid = PhoneValid
		})
	end
	
	function p1.SetEmail(EmailInput, EmailValid)
		-- upvalues: p1 (copy)
		p1.updateState({ emailInput = EmailInput, emailValid = EmailValid })
	end
	
	function p1:onSignUpContentFrameCanvasSizeChange()
		-- upvalues: p1 (copy)
		p1.scrollingFrameRef.current.CanvasPosition = p1.getScrollingFrameCanvasPosition((p1.scrollCanvasTargetPositionY:getValue()))
	end
	
	function p1.getUserAge()
		-- upvalues: p1 (copy)
		return if p1.state.birthday then p1.state.birthday:GetAgeInYears() else nil
	end
	
	function p1.getUsernamePlaceholder(p2)
		-- upvalues: p1 (copy), DisplayNameEligabilityAgeYears (upval)
		return if p1.props.shouldSeeDisplayNamesOnSignup then if p1.state.birthday then if DisplayNameEligabilityAgeYears <= p1.getUserAge() and not p1.state.hasSetIneligibleAgeAtLeastOnce then p2.agedUpUsernamePlaceholder else p2.usernamePlaceholder else "" else p2.usernamePlaceholder
	end
	
	function p1.shouldShowUsernameField()
		-- upvalues: p1 (copy), DisplayNameEligabilityAgeYears (upval)
		return not p1.props.shouldSeeDisplayNamesOnSignup or (not p1.state.birthday or p1.getUserAge() < DisplayNameEligabilityAgeYears or p1.state.hasSetIneligibleAgeAtLeastOnce) or p1.state.recommendedUsername ~= nil
	end
	
	function p1.shouldShowDisplayNameField(): boolean
		-- upvalues: p1 (copy), DisplayNameEligabilityAgeYears (upval)
		return p1.props.shouldSeeDisplayNamesOnSignup and (p1.state.birthday and (DisplayNameEligabilityAgeYears <= p1.getUserAge() and not p1.state.hasSetIneligibleAgeAtLeastOnce))
	end
	
	function p1.isDisplayNameFieldRequired(): boolean
		-- upvalues: p1 (copy)
		return p1.shouldShowDisplayNameField() and not p1.state.bypassDisplayNameField
	end
	
	function p1.isValidDisplayNameEntered(): boolean
		-- upvalues: p1 (copy), InputValidityModule (upval)
		return p1.state.displayName ~= "" and p1.state.displayNameValid ~= InputValidityModule.Invalid
	end
	
	function p1.setUsernameRecommendation(p2)
		-- upvalues: p1 (copy)
		p1:setState(function(p3)
			-- upvalues: p2 (copy)
			return {
				recommendedUsername = if p3.recommendedUsername == nil or p2 ~= "" then p2 else nil
			}
		end)
	end
	
	function p1.getUsernameGuidanceText(p2)
		-- upvalues: p1 (copy)
		return if p1.shouldShowDisplayNameField() and p1.state.recommendedUsername ~= "" and p1.state.recommendedUsername ~= nil and not p1.state.hasEditedUsername and not p1.state.isUsernameFocused then p2.autogeneratedUsernameGuidance else nil
	end
	
	function p1.validateOtpCode(OtpSessionToken, OtpCode, p2)
		-- upvalues: p1 (copy), Constants1 (upval), ValidateCodeFunction (upval), PromiseModule (upval)
		p1.state.otpSessionToken = OtpSessionToken
		p1.state.otpCode = OtpCode
		local OtpSession = {
			otpSessionToken = tostring(p1.state.otpSessionToken),
			otpContactType = Constants1.otpServiceContactType
		}
		
		return ValidateCodeFunction(p1.props.networking, {
			origin = Constants1.otpServiceOriginSignup,
			contactType = Constants1.otpServiceContactType,
			passCode = p1.state.otpCode,
			otpSessionToken = p1.state.otpSessionToken
		})():andThen(function(_)
			-- upvalues: p1 (upval), p2 (copy), OtpSession (copy)
			p1.props.closeCentralOverlay()
			p2.otpSession = OtpSession
			p1.launchKISATermsOfService(p2, true)
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(Err)
		end)
	end
	
	function p1.onAbandonKISASignUpFlow()
		-- upvalues: AnalyticsEvents (upval), EventConstants (upval), p1 (copy)
		AnalyticsEvents.sendButtonClickEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup, EventConstants.btn.cancel)
		p1.updateIsSignUpInProgress(false)
	end
	
	function p1.launchParentSignUpOtp(p2)
		-- upvalues: Constants1 (upval), p1 (copy)
		p1.props.openEmailOtp({
			codeLength = 6,
			origin = Constants1.otpServiceOriginSignup,
			enterEmailTitleKey = Constants1.translationKeys.parentEmailTitleKey,
			enterEmailDescriptionKey = Constants1.translationKeys.sendParentVerificationCodeKey,
			enterCodeTitleKey = Constants1.translationKeys.oneTimeCodeTitleKey,
			enterCodeDescriptionKey = Constants1.translationKeys.oneTimeCodeHelpDescriptionKey,
			complianceCheckboxMessageKey = Constants1.translationKeys.parentalConsentModalDescriptionKey,
			onSubmitCode = function(OtpSessionToken, OtpCode)
				-- upvalues: p1 (upval), p2 (copy)
				return p1.validateOtpCode(OtpSessionToken, OtpCode, p2)
			end,
			onModalAbandoned = p1.onAbandonKISASignUpFlow,
			screenSize = p1.props.screenSize
		})
	end
	
	p1.isMounted = false
end

function SinglePageSignUp.didMount(p2)
	-- upvalues: Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction (copy), ParseCredentialsProtocolIsAvailableResponseFunction (copy), EventStreamConstantsModule (copy), UserInputService (copy), ReportEphemeralCounterModule (copy), UserAgreementsCounterNames (copy), FetchSignupUserAgreements (copy), TelemetryConfigs (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), ApiFetchAuthMetaDataModule (copy)
	p2.isMounted = true
	p2.isAltAttempt = nil
	Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
		-- upvalues: GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction (upval), p2 (copy), ParseCredentialsProtocolIsAvailableResponseFunction (upval), EventStreamConstantsModule (upval)
		local IsAvailable = nil
		if GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction() and p2.props.shouldTightenPasskeyEligibility and Result.FIDO2 ~= nil then
			local ParseCredentialsProtocolIsAvailableResponseResult = ParseCredentialsProtocolIsAvailableResponseFunction(Result)
			IsAvailable = ParseCredentialsProtocolIsAvailableResponseResult.fido2Available and (ParseCredentialsProtocolIsAvailableResponseResult.fido2SupportsDeviceBoundOnly and ParseCredentialsProtocolIsAvailableResponseResult.fido2SupportsPasskeyCreationOnDevice)
		else
			IsAvailable = Result.isAvailable or false
		end
		local IsCredentialsProtocolRegisterPasswordAvailable: boolean = if Result.password and Result.password.isAvailable then true else false
		
		if p2.isMounted then
			p2:setState({
				passkeysAvailable = IsAvailable,
				isCredentialsProtocolRegisterPasswordAvailable = IsCredentialsProtocolRegisterPasswordAvailable
			})
		end
		p2.props.authEventAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.PasskeySignup, (tostring(IsAvailable)))
		p2.props.authEventAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.CMPasswordSignup, (tostring(IsCredentialsProtocolRegisterPasswordAvailable)))
	end):catch(function(Err)
		warn("Error checking for available credential types. Error: ", Err)
	end)
	p2.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
		-- upvalues: UserInputService (upval), p2 (copy)
		p2:setState({
			onScreenKeyboardHeight = UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		})
	end)
	local ShouldShowVNGAgreements = p2.getShouldShowVNGAgreements()
	local ShouldShowKISAAgreements = p2.getShouldShowKISAAgreements()
	
	if p2.props.appPolicy.getAddUserAgreementIdsToSignupRequest() or ShouldShowVNGAgreements or ShouldShowKISAAgreements then
		FetchSignupUserAgreements(p2.props.networking, p2.props.analytics):andThen(function(Result)
			-- upvalues: ReportEphemeralCounterModule (upval), UserAgreementsCounterNames (upval), p2 (copy)
			if not Result then
				ReportEphemeralCounterModule(UserAgreementsCounterNames.FetchAgreementsHttpRequestFailureOnSignup, 1)
				
				return
			end
			if #Result > 0 then
				p2.updateState({ agreements = Result })
				
				return
			else
				ReportEphemeralCounterModule(UserAgreementsCounterNames.FetchAgreementsEmptyResponseOnSignup, 1)
			end
		end, function() end)
	end
	p2.props.authEventAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
	p2.props.loggingProtocol:logEventOnce("signup_page_did_mount")
	p2.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.SignupPageMountTelemetryConfig, 1, { version = 1 })
	local Url = if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL()
	ApiFetchAuthMetaDataModule(p2.props.networking):andThen(function(Result)
		-- upvalues: p2 (copy), EventStreamConstantsModule (upval), Url (copy)
		if Result and Result.IsAltBrowserTracker ~= nil then
			p2.isAltAttempt = Result.IsAltBrowserTracker
			p2.props.authEventAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.SinglePageSignUpScreen, Url, p2.isAltAttempt)
		end
	end, function(_)
		-- upvalues: p2 (copy), EventStreamConstantsModule (upval), Url (copy)
		warn("Error auth metadata: ", error)
		p2.props.authEventAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.SinglePageSignUpScreen, Url, p2.isAltAttempt)
	end)
	
	if p2.props.focusedGuiObject and p2.backButtonRef and p2.backButtonRef.current then
		p2.props.focusGuiObject(p2.backButtonRef.current)
	end
end

function SinglePageSignUp.willUnmount(p2)
	-- upvalues: FFlagEnableLuaAccountSwitchModule (copy)
	p2.isMounted = false
	p2.isAltAttempt = nil
	
	if FFlagEnableLuaAccountSwitchModule == true and p2.isAlreadyAuthenticated == true then
		p2.resetDefaultTheme()
	end
	if p2.keyboardVisibleChanged then
		p2.keyboardVisibleChanged:disconnect()
		p2.keyboardVisibleChanged = nil
	end
end

function SinglePageSignUp.didUpdate(p2, p3, State)
	-- upvalues: FixSinglePageSignUpScrollPinning (copy), DisplayNamesOnSignupExperimentV3 (copy), DisplayNameEligabilityAgeYears (copy), DisplayNamesDiagLogging (copy), ReportEphemeralCounterModule (copy), DisplayNameCountersModule (copy)
	if FixSinglePageSignUpScrollPinning then
		local FocusedGuiObject = p2.props.focusedGuiObject
		local BirthdayContainerRef = p2.props.birthdayContainerRef
		local FocusedGuiObject1 = p3.focusedGuiObject
		local BirthdayContainerRef1 = p3.birthdayContainerRef
		local IsDescendantOf = FocusedGuiObject1 and (BirthdayContainerRef1 and (BirthdayContainerRef1.current and FocusedGuiObject1:IsDescendantOf(BirthdayContainerRef1.current)))
		
		if FocusedGuiObject and (BirthdayContainerRef and (BirthdayContainerRef.current and FocusedGuiObject:IsDescendantOf(BirthdayContainerRef.current))) and not IsDescendantOf then
			p2.updateScrollCanvasTargetPositionY(10)
			task.defer(function()
				-- upvalues: p2 (copy)
				if p2.isMounted then
					p2.updateScrollCanvasTargetPositionY(0)
				end
			end)
		end
	elseif p2.props.focusedGuiObject and p2.props.birthdayContainerRef.current and p2.props.focusedGuiObject:IsDescendantOf(p2.props.birthdayContainerRef.current) then
		p2.updateScrollCanvasTargetPositionY(10)
	else
		p2.updateScrollCanvasTargetPositionY(0)
	end
	if DisplayNamesOnSignupExperimentV3 and p2.state.birthday ~= nil and not p2.state.hasSetIneligibleAgeAtLeastOnce and p2.getUserAge() < DisplayNameEligabilityAgeYears then
		p2:setState({ hasSetIneligibleAgeAtLeastOnce = true })
	end
	if DisplayNamesDiagLogging and p2.props.shouldSeeDisplayNamesOnSignup then
		if p2.state.recommendedUsername ~= "" and p2.state.hasEditedUsername and p2.state.hasEditedUsername ~= State.hasEditedUsername then
			ReportEphemeralCounterModule(DisplayNameCountersModule.ReccomendedNameEdited, 1)
		end
		if p2.state.recommendedUsername ~= nil and p2.state.recommendedUsername ~= "" and p2.state.hasEditedUsername == true and p2.state.username == "" and State.username ~= "" and p2.props.shouldSeeDisplayNamesOnSignup then
			ReportEphemeralCounterModule(DisplayNameCountersModule.ReccomendedNameManuallyCleared, 1)
		end
		if p2.state.birthday ~= nil and State.birthday ~= nil and p2.state.birthday ~= State.birthday then
			if DisplayNameEligabilityAgeYears <= p2.getUserAge() and State.birthday:GetAgeInYears() < DisplayNameEligabilityAgeYears then
				ReportEphemeralCounterModule(DisplayNameCountersModule.BirthdayChangedToAboveDisplayAge, 1)
			end
			if p2.getUserAge() < DisplayNameEligabilityAgeYears and DisplayNameEligabilityAgeYears <= State.birthday:GetAgeInYears() then
				ReportEphemeralCounterModule(DisplayNameCountersModule.BirthdayChangedToAboveDisplayAge, 1)
			end
		end
	end
end

function SinglePageSignUp.render(p2)
	-- upvalues: FFlagEnableLuaAccountSwitchModule (copy), RoactModule (copy), UiModeStyleProvider (copy), Constants (copy), GetFFlagLuaAppSignUpPageRefactorModule (copy)
	return if FFlagEnableLuaAccountSwitchModule and p2.isAlreadyAuthenticated then RoactModule.createElement(UiModeStyleProvider, {
		style = {
			themeName = Constants.ThemeName.Dark,
			fontName = Constants.FontName.Gotham
		}
	}, {
		Child = if GetFFlagLuaAppSignUpPageRefactorModule() then p2:renderWithView() else p2:renderDeprecated()
	}) elseif GetFFlagLuaAppSignUpPageRefactorModule() then p2:renderWithView() else p2:renderDeprecated()
end

function SinglePageSignUp.renderWithView(p2)
	-- upvalues: WithLocalizationModule (copy), RobloxLocaleIdKey (copy), RoactModule (copy), SignUpPageViewModule (copy), UsernameValidatorModule (copy), PasswordValidatorModule (copy)
	local IsSignUpButtonEnabled = p2.getIsSignUpButtonEnabled()
	
	return WithLocalizationModule({})(function(p3)
		-- upvalues: p2 (copy), RobloxLocaleIdKey (upval), RoactModule (upval), SignUpPageViewModule (upval), IsSignUpButtonEnabled (copy), UsernameValidatorModule (upval), PasswordValidatorModule (upval)
		p2.locale = p3[RobloxLocaleIdKey]
		
		return RoactModule.createElement(SignUpPageViewModule, {
			navigateBack = p2.props.navigateBack,
			useVerifiedSignup = p2.useVerifiedSignup,
			useUsernameSuggestions = p2.useUsernameSuggestions,
			useRefreshButton = p2.useRefreshButton,
			onGenderChanged = p2.onGenderChanged,
			getHidePassword = p2.getHidePassword,
			passwordVisibilityToggleCallback = p2.passwordVisibilityToggleCallback,
			onBirthdaySelected = p2.onBirthdaySelected,
			onBirthdayFocused = p2.onBirthdayFocused,
			onSignUpClick = p2.onSignUpClick,
			usernameSuggestionClicked = p2.usernameSuggestionClicked,
			usernameSuggestionsShown = p2.usernameSuggestionsShown,
			shouldSuggest = p2.shouldSuggest,
			updateIssueCondition = p2.updateIssueCondition,
			updateSuggestionControlState = p2.updateSuggestionControlState,
			logRefreshButtonClicked = p2.logRefreshButtonClicked,
			loadSuggestions = p2.loadSuggestions,
			finishSuggestions = p2.finishSuggestions,
			validUsernameEntered = p2.validUsernameEntered,
			validPasswordEntered = p2.validPasswordEntered,
			onUsernameTextBoxFocused = p2.onUsernameTextBoxFocused,
			onPasswordTextBoxFocused = p2.onPasswordTextBoxFocused,
			onUsernameTextChanged = p2.onUsernameTextChanged,
			onUsernameTextValidated = p2.onUsernameTextValidated,
			onPasswordTextChanged = p2.onPasswordTextChanged,
			onTextBoxFocusLost = p2.onTextBoxFocusLost,
			onFocusedTextBoxPositionChanged = p2.onFocusedTextBoxPositionChanged,
			onAnimationStateChangeCallback = p2.onAnimationStateChangeCallback,
			onUsernameTextChangeCompletedFromKeyboard = p2.onUsernameTextChangeCompletedFromKeyboard,
			onPasswordTextChangeCompletedFromKeyboard = p2.onPasswordTextChangeCompletedFromKeyboard,
			phoneCountryCodeSelectorCallback = p2.phoneCountryCodeSelectorCallback,
			SetContactMethod = p2.SetContactMethod,
			SetPhoneNumber = p2.SetPhoneNumber,
			SetEmail = p2.SetEmail,
			isUsernameAnimating = p2.state.isUsernameAnimating,
			isPasswordAnimating = p2.state.isPasswordAnimating,
			birthday = p2.state.birthday,
			username = p2.state.username,
			isSignUpInProgress = p2.state.isSignUpInProgress,
			onScreenKeyboardHeight = p2.state.onScreenKeyboardHeight,
			usernameValid = p2.state.usernameValid,
			passwordValid = p2.state.passwordValid,
			issueCondition = p2.state.issueCondition,
			loadingSuggestions = p2.state.loadingSuggestions,
			isSignUpButtonEnabled = IsSignUpButtonEnabled,
			birthdayFocused = p2.state.birthdayFocused,
			isCountryCodeSearchVisible = p2.state.isCountryCodeSearchVisible,
			contactMethod = p2.state.contactMethod,
			signUpError = p2.state.signUpError,
			UsernameValidator = UsernameValidatorModule,
			PasswordValidator = PasswordValidatorModule,
			signUpContentFrameRef = p2.scrollingFrameRef,
			ageTextFieldRef = p2.ageTextFieldRef,
			usernameTextFieldRef = p2.usernameTextFieldRef,
			passwordTextFieldRef = p2.passwordTextFieldRef,
			passwordFrameRef = p2.passwordFrameRef,
			onSignUpContentFrameCanvasSizeChange = p2.onSignUpContentFrameCanvasSizeChange,
			scrollCanvasTargetPositionY = p2.scrollCanvasTargetPositionY,
			updateScrollCanvasTargetPositionY = p2.updateScrollCanvasTargetPositionY,
			getScrollingFrameCanvasPosition = p2.getScrollingFrameCanvasPosition
		})
	end)
end

function SinglePageSignUp.renderDeprecated(p2)
	-- upvalues: FormFactor (copy), GetFFlagEnableTextFieldContentTypeFunction (copy), FFlagFoundationStylingOnSignUp (copy), DisplayNamesOnSignupExperimentV3 (copy), DisclaimerLinksVariant (copy), GetFFlagMinimalSignupAuthEnabledModule (copy), GetFFlagPasswordlessSignupAuthEnabledModule (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), DisablePasskeySignupForLuaDeepLinks (copy), GetFFlagPasskeySignupEnabledModule (copy), IconsNavigationClose (copy), WithStyleFunction (copy), WithLocalizationModule (copy), RobloxLocaleIdKey (copy), UseLongFormSignupComplianceTextByDefault (copy), RoactModule (copy), FullscreenPageWithSafeAreaModule (copy), AuthBackgroundGate (copy), AuthBackgroundContainer (copy), BackgroundFill (copy), UnderAgeInteractiveAlertModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), _Vector2 (copy), ImageSetButton (copy), _UDim2 (copy), Text (copy), FitTextLabelModule (copy), FitChildrenModule (copy), FixSinglePageSignUpScrollPinning (copy), AuthBirthdayBarModule (copy), FFlagEnableLuaAccountSwitchModule (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), BirthdayFieldModule (copy), InputValidityModule (copy), ContactInfoFieldModule (copy), DateHelper (copy), ReactModule (copy), DisplayNameFieldModule (copy), CollapsingTextInputValidatorModule (copy), UsernameValidatorModule (copy), UsernameValidationContextModule (copy), SuggestionsFrameModule (copy), UsernameSuggestorModule (copy), EnableAndroidPasswordSuggestionEngineFeature (copy), PasswordValidatorModule (copy), GetFIntLuaLoginGenderSelectorModule (copy), SignUpGenderSelectorModule (copy), FoundationModule (copy), Button (copy), ButtonType (copy), View (copy), Checkbox (copy), EventStreamConstantsModule (copy), InputSize (copy), TitleAndParagraphModule (copy), DisclaimerLinksModule (copy)
	local Birthday = p2.state.birthday
	local Username = p2.state.username
	local IsSignUpButtonEnabled = p2.getIsSignUpButtonEnabled()
	local IsSignUpInProgress = p2.state.isSignUpInProgress
	local Gender = p2.state.gender
	local IsFormFactorMatch = p2.props.formFactor == FormFactor.WIDE
	local IsCompactView = p2.props.isCompactView
	local NewOnScreenKeyboardHeight = 0
	local YOffset = 0
	local IsOnScreenKeyboardHeightAbove = p2.state.onScreenKeyboardHeight > 0
	local ContactMethod = p2.state.contactMethod
	local FoundationTokens = p2.props.foundationTokens
	local ShouldUseFoundationBackgroundColor = p2.props.shouldUseFoundationBackgroundColor
	local ShouldUseFoundationUsernameTextInput = p2.props.shouldUseFoundationUsernameTextInput
	local Username1 = GetFFlagEnableTextFieldContentTypeFunction() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions
	local Inverted = not p2.validUsernameEntered()
	local UseVerifiedSignupResult = p2.useVerifiedSignup()
	local v2: number = if IsFormFactorMatch and UseVerifiedSignupResult then 12 else 0
	local SummaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithUsername"
	local SummaryErrorTextKey1 = "Authentication.SignUp.Label.ErrorsWithPassword"
	local UseUsernameSuggestionsResult = p2.useUsernameSuggestions()
	local UseRefreshButtonResult = p2.useRefreshButton()
	local IsCompactView1 = FFlagFoundationStylingOnSignUp and IsCompactView
	
	if Birthday then
		if DisplayNamesOnSignupExperimentV3 and p2.isDisplayNameFieldRequired() and not p2.isValidDisplayNameEntered() then
			Inverted = true
			SummaryErrorTextKey1 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst"
		elseif Inverted then
			SummaryErrorTextKey1 = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
		end
	else
		SummaryErrorTextKey = "Authentication.SignUp.Response.BirthdayMustBeSetFirst"
		SummaryErrorTextKey1 = SummaryErrorTextKey
		Inverted = true
	end
	if IsFormFactorMatch then
		if IsOnScreenKeyboardHeightAbove then
			NewOnScreenKeyboardHeight = p2.state.onScreenKeyboardHeight + 10
		else
			NewOnScreenKeyboardHeight = 48
			YOffset = 24
		end
	end
	local Default = if IsCompactView1 then DisclaimerLinksVariant.Default else nil
	local FFlagMinimalSignupAuthEnabledModule = GetFFlagMinimalSignupAuthEnabledModule()
	local FFlagMinimalSignupAuthEnabledModule1 = p2.props.shouldUseMinimalSignup and FFlagMinimalSignupAuthEnabledModule
	local FFlagMinimalSignupAuthEnabledModule2 = p2.props.shouldHideGenderOption and FFlagMinimalSignupAuthEnabledModule
	local FFlagMinimalSignupAuthEnabledModule3 = p2.props.shouldAutofocusOnBirthday and FFlagMinimalSignupAuthEnabledModule
	local FFlagPasswordlessSignupAuthEnabledModule = GetFFlagPasswordlessSignupAuthEnabledModule()
	local FFlagPasswordlessSignupAuthEnabledModule1 = p2.props.shouldUsePasswordlessSignup and FFlagPasswordlessSignupAuthEnabledModule
	local ShouldShowVNGAgreements = p2.getShouldShowVNGAgreements()
	local ShouldShowKISAAgreements = p2.getShouldShowKISAAgreements()
	local Url = if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL()
	local NoPasskeysAvailable: boolean = not p2.state.passkeysAvailable or DisablePasskeySignupForLuaDeepLinks and (Url ~= nil and Url ~= "")
	
	if GetFFlagPasskeySignupEnabledModule() and p2.props.shouldUsePasskeySignup and NoPasskeysAvailable then
		FFlagPasswordlessSignupAuthEnabledModule1 = false
	end
	local ShouldDisableUsernameAutofill = p2.props.shouldDisableUsernameAutofill
	local FFlagPasskeySignupEnabledModule = GetFFlagPasskeySignupEnabledModule()
	local NoNoPasskeysAvailable: boolean = p2.props.shouldUsePasskeySignup and (FFlagPasskeySignupEnabledModule and (game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not NoPasskeysAvailable))
	
	local function _(CtaButton)
		-- upvalues: p2 (copy)
		local v3 = nil
		local PlatformAccountName = p2.props.appPolicy.getPlatformAccountName()
		
		if PlatformAccountName and p2.props.appPolicy.getUseSingleSignOn() then
			v3 = {
				"Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
				platform = PlatformAccountName,
				ctaButton = CtaButton
			}
		end
		return v3
	end
	
	return WithStyleFunction(function(p3)
		-- upvalues: WithLocalizationModule (upval), DisplayNamesOnSignupExperimentV3 (upval), p2 (copy), RobloxLocaleIdKey (upval), FFlagMinimalSignupAuthEnabledModule1 (copy), IsFormFactorMatch (copy), IsCompactView1 (copy), FoundationTokens (copy), UseLongFormSignupComplianceTextByDefault (upval), NoNoPasskeysAvailable (copy), RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), ShouldUseFoundationBackgroundColor (copy), BackgroundFill (upval), IsSignUpInProgress (copy), UnderAgeInteractiveAlertModule (upval), ImageSetLabel (upval), NewOnScreenKeyboardHeight (ref), YOffset (ref), GetImageDataFunction (upval), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (copy), Text (upval), FitTextLabelModule (upval), FitChildrenModule (upval), v2 (copy), FixSinglePageSignUpScrollPinning (upval), AuthBirthdayBarModule (upval), UseVerifiedSignupResult (copy), FFlagMinimalSignupAuthEnabledModule3 (copy), FFlagEnableLuaAccountSwitchModule (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), BirthdayFieldModule (upval), InputValidityModule (upval), ContactInfoFieldModule (upval), Birthday (copy), DateHelper (upval), ContactMethod (copy), ReactModule (upval), DisplayNameFieldModule (upval), CollapsingTextInputValidatorModule (upval), SummaryErrorTextKey (ref), ShouldDisableUsernameAutofill (copy), Username1 (copy), UseUsernameSuggestionsResult (copy), UsernameValidatorModule (upval), UsernameValidationContextModule (upval), ShouldUseFoundationUsernameTextInput (copy), SuggestionsFrameModule (upval), UsernameSuggestorModule (upval), UseRefreshButtonResult (copy), FFlagPasswordlessSignupAuthEnabledModule1 (ref), SummaryErrorTextKey1 (ref), Inverted (ref), EnableAndroidPasswordSuggestionEngineFeature (upval), PasswordValidatorModule (upval), Username (copy), FFlagMinimalSignupAuthEnabledModule2 (copy), GetFIntLuaLoginGenderSelectorModule (upval), SignUpGenderSelectorModule (upval), Gender (copy), FoundationModule (upval), IsSignUpButtonEnabled (copy), Button (upval), ButtonType (upval), View (upval), Checkbox (upval), EventStreamConstantsModule (upval), InputSize (upval), ShouldShowVNGAgreements (copy), ShouldShowKISAAgreements (copy), TitleAndParagraphModule (upval), DisclaimerLinksModule (upval), FFlagFoundationStylingOnSignUp (upval), Default (ref), IsOnScreenKeyboardHeightAbove (copy)
		return WithLocalizationModule({
			signUpText = "Authentication.SignUp.Action.CreateAccount",
			continueText = "Authentication.SignUp.Action.Continue",
			usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse",
			agedUpUsernamePlaceholder = "Authentication.Login.Label.AgedUpUsername",
			passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder",
			usernameHelperTitleText = "Authentication.SignUp.Heading.PickAUsername",
			usernameHelperDescriptionText = "Authentication.SignUp.Description.UsernameHelp",
			signUpAgreementFullCopyCheckboxText = "Authentication.SignUp.Description.AgreeToTermsWithGuardian.NoParameters",
			signUpAgreementShortCopyCheckboxText = "Authentication.SignUp.Description.SignUpAgreement.ShortCopy",
			autogeneratedUsernameGuidance = if DisplayNamesOnSignupExperimentV3 then "Feature.DisplayName.Label.GeneratedUserName" else nil
		})(function(p4)
			-- upvalues: p2 (upval), RobloxLocaleIdKey (upval), FFlagMinimalSignupAuthEnabledModule1 (upval), IsFormFactorMatch (upval), IsCompactView1 (upval), FoundationTokens (upval), DisplayNamesOnSignupExperimentV3 (upval), UseLongFormSignupComplianceTextByDefault (upval), NoNoPasskeysAvailable (upval), RoactModule (upval), FullscreenPageWithSafeAreaModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), ShouldUseFoundationBackgroundColor (upval), p3 (copy), BackgroundFill (upval), IsSignUpInProgress (upval), UnderAgeInteractiveAlertModule (upval), ImageSetLabel (upval), NewOnScreenKeyboardHeight (upval), YOffset (upval), GetImageDataFunction (upval), _Vector2 (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), Text (upval), FitTextLabelModule (upval), FitChildrenModule (upval), v2 (upval), FixSinglePageSignUpScrollPinning (upval), AuthBirthdayBarModule (upval), UseVerifiedSignupResult (upval), FFlagMinimalSignupAuthEnabledModule3 (upval), FFlagEnableLuaAccountSwitchModule (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), BirthdayFieldModule (upval), InputValidityModule (upval), ContactInfoFieldModule (upval), Birthday (upval), DateHelper (upval), ContactMethod (upval), ReactModule (upval), DisplayNameFieldModule (upval), CollapsingTextInputValidatorModule (upval), SummaryErrorTextKey (upval), ShouldDisableUsernameAutofill (upval), Username1 (upval), UseUsernameSuggestionsResult (upval), UsernameValidatorModule (upval), UsernameValidationContextModule (upval), ShouldUseFoundationUsernameTextInput (upval), SuggestionsFrameModule (upval), UsernameSuggestorModule (upval), UseRefreshButtonResult (upval), FFlagPasswordlessSignupAuthEnabledModule1 (upval), SummaryErrorTextKey1 (upval), Inverted (upval), EnableAndroidPasswordSuggestionEngineFeature (upval), PasswordValidatorModule (upval), Username (upval), FFlagMinimalSignupAuthEnabledModule2 (upval), GetFIntLuaLoginGenderSelectorModule (upval), SignUpGenderSelectorModule (upval), Gender (upval), FoundationModule (upval), IsSignUpButtonEnabled (upval), Button (upval), ButtonType (upval), View (upval), Checkbox (upval), EventStreamConstantsModule (upval), InputSize (upval), ShouldShowVNGAgreements (upval), ShouldShowKISAAgreements (upval), TitleAndParagraphModule (upval), DisclaimerLinksModule (upval), FFlagFoundationStylingOnSignUp (upval), Default (upval), IsOnScreenKeyboardHeightAbove (upval)
			p2.locale = p4[RobloxLocaleIdKey]
			local NoFFlagMinimalSignupAuthEnabledModule1 = not FFlagMinimalSignupAuthEnabledModule1
			local Offset: number = if IsFormFactorMatch then 25 else 48
			local _UDim2_1 = UDim2.new(0.5, 0, 0, 49)
			
			if IsCompactView1 then
				Offset += FoundationTokens.Padding.Medium
				_UDim2_1 = UDim2.new(0.5, 0, 0, 1 + FoundationTokens.Padding.Medium)
			end
			if DisplayNamesOnSignupExperimentV3 then
				NoFFlagMinimalSignupAuthEnabledModule1 = p2.shouldShowUsernameField() and not FFlagMinimalSignupAuthEnabledModule1
			end
			local ShouldRequireSignupCheckbox = not p2.getSignupCheckboxDisabled() and p2.props.shouldRequireSignupCheckbox
			local AuthenticationSignUpDescriptionSignUpAgreementFullCopyCreateAccount: string = if UseLongFormSignupComplianceTextByDefault then "Authentication.SignUp.Description.SignUpAgreement.FullCopy.CreateAccount" else "Authentication.SignUp.Description.VerificationPage.CreateAccount"
			
			if NoNoPasskeysAvailable then
				AuthenticationSignUpDescriptionSignUpAgreementFullCopyCreateAccount = "Authentication.SignUp.Description.VerificationPageMultiStep"
			else
				local SignUpText = p4.signUpText
				local v3 = nil
				local PlatformAccountName = p2.props.appPolicy.getPlatformAccountName()
				
				if PlatformAccountName and p2.props.appPolicy.getUseSingleSignOn() then
					v3 = {
						"Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
						platform = PlatformAccountName,
						ctaButton = SignUpText
					}
				end
				if v3 then
					local SignUpText1 = p4.signUpText
					local v4 = nil
					local PlatformAccountName1 = p2.props.appPolicy.getPlatformAccountName()
					
					if PlatformAccountName1 and p2.props.appPolicy.getUseSingleSignOn() then
						v4 = {
							"Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
							platform = PlatformAccountName1,
							ctaButton = SignUpText1
						}
					end
					AuthenticationSignUpDescriptionSignUpAgreementFullCopyCreateAccount = v4
				end
			end
			local SignUpAgreementFullCopyCheckboxText = ""
			
			if not p2.getSignupCheckboxDisabled() then
				if p2.props.signupLegalDisclaimerTextVariant == 1 then
					if ShouldRequireSignupCheckbox then
						SignUpAgreementFullCopyCheckboxText = p4.signUpAgreementFullCopyCheckboxText
					else
						AuthenticationSignUpDescriptionSignUpAgreementFullCopyCreateAccount = if NoNoPasskeysAvailable then "Authentication.SignUp.Description.SignUpAgreement.FullCopy.Continue" else "Authentication.SignUp.Description.SignupAgreement.FullCopy.CreateAccount"
					end
				elseif p2.props.signupLegalDisclaimerTextVariant == 2 and ShouldRequireSignupCheckbox then
					SignUpAgreementFullCopyCheckboxText = p4.signUpAgreementShortCopyCheckboxText
				end
			end
			return RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
				BackgroundTransparency = 1,
				includeStatusBar = true,
				buttonRef = p2.props.containerRef,
				renderFullscreenBackground = function()
					-- upvalues: RoactModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (upval), ShouldUseFoundationBackgroundColor (upval), FoundationTokens (upval), p3 (upval), BackgroundFill (upval)
					return RoactModule.createElement(AuthBackgroundGate, {
						renderTreatment = function()
							-- upvalues: RoactModule (upval), AuthBackgroundContainer (upval), IsFormFactorMatch (upval), ShouldUseFoundationBackgroundColor (upval), FoundationTokens (upval), p3 (upval)
							return RoactModule.createElement(AuthBackgroundContainer, {
								showImage = IsFormFactorMatch,
								fallbackBackgroundColor = if ShouldUseFoundationBackgroundColor then FoundationTokens.Color.Surface.Surface_0.Color3 else p3.Theme.BackgroundUIDefault.Color
							})
						end,
						renderLegacy = function()
							-- upvalues: RoactModule (upval), IsFormFactorMatch (upval), ShouldUseFoundationBackgroundColor (upval), FoundationTokens (upval), p3 (upval), BackgroundFill (upval)
							return RoactModule.createElement("Frame", {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = if IsFormFactorMatch then 1 else 0,
								BackgroundColor3 = if ShouldUseFoundationBackgroundColor then FoundationTokens.Color.Surface.Surface_0.Color3 else p3.Theme.BackgroundUIDefault.Color
							}, {
								Background = IsFormFactorMatch and RoactModule.createElement(BackgroundFill, {
									Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
								}),
								Mask = IsFormFactorMatch and RoactModule.createElement("ImageLabel", {
									ZIndex = 2,
									BackgroundTransparency = 0.5,
									Size = UDim2.new(1, 0, 1, 0),
									BackgroundColor3 = Color3.new(0, 0, 0)
								})
							})
						end
					})
				end
			}, {
				UserInputSink = IsSignUpInProgress and RoactModule.createElement("ImageButton", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Image = "",
					Size = UDim2.new(1, 0, 1, 0)
				}),
				UnderAgeAlert = p2.state.shouldShowUnderAgeAlert and RoactModule.createElement(UnderAgeInteractiveAlertModule, {
					ZIndex = 3,
					onDismiss = function()
						-- upvalues: p2 (upval)
						p2:setState({ shouldShowUnderAgeAlert = false })
					end
				}),
				Container = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 1, -NewOnScreenKeyboardHeight),
					Position = UDim2.new(0.5, 0, 0, YOffset),
					AnchorPoint = Vector2.new(0.5, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = if ShouldUseFoundationBackgroundColor then FoundationTokens.Color.Surface.Surface_0.Color3 else p3.Theme.BackgroundUIDefault.Color
				}, {
					SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
					HeaderFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Position = UDim2.new(0.5, 0, 0, 0),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						BackButton = (p2.props.shouldShowBackButton == nil or p2.props.shouldShowBackButton) and RoactModule.createElement(ImageSetButton, {
							Size = _UDim2,
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							ScaleType = Enum.ScaleType.Fit,
							Image = IconsNavigationClose,
							ImageColor3 = p3.Theme.UIEmphasis.Color,
							ImageTransparency = 0,
							[RoactModule.Event.Activated] = p2.onCloseButtonClicked,
							[RoactModule.Ref] = p2.backButtonRef
						}),
						Title = p4.signUpText and (if IsCompactView1 then RoactModule.createElement(Text, {
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Text = p4.signUpText or "",
							fontStyle = FoundationTokens.Typography.HeadingSmall,
							TextXAlignment = Enum.TextXAlignment.Center
						}) else RoactModule.createElement(FitTextLabelModule, {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							fitAxis = FitChildrenModule.FitAxis.Height,
							Text = p4.signUpText or "",
							Font = p3.Font.CaptionHeader.Font,
							TextSize = p3.Font.BaseSize * p3.Font.Header1.RelativeSize,
							TextColor3 = p3.Theme.TextEmphasis.Color,
							TextTransparency = p3.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Center
						}))
					}),
					Divider = not IsCompactView1 and RoactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0.5, 0, 0, 48),
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundTransparency = if ShouldUseFoundationBackgroundColor then 1 else 0,
						BackgroundColor3 = p3.Theme.UIEmphasis.Color
					}),
					SignUpContentFrame = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
						Size = UDim2.new(1, 0, 1, -(49 + v2)),
						Position = _UDim2_1,
						AnchorPoint = Vector2.new(0.5, 0),
						fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height },
						ScrollBarThickness = 0,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						ScrollingEnabled = if FixSinglePageSignUpScrollPinning then true else not (p2.state.isUsernameAnimating or p2.state.isPasswordAnimating),
						CanvasPosition = p2.scrollCanvasTargetPositionY:map(function(p5)
							-- upvalues: p2 (upval)
							return p2.getScrollingFrameCanvasPosition(p5)
						end),
						[RoactModule.Ref] = p2.scrollingFrameRef,
						[RoactModule.Change.CanvasSize] = function(_)
							-- upvalues: p2 (upval)
							p2.scrollingFrameRef.current.CanvasPosition = p2.getScrollingFrameCanvasPosition((p2.scrollCanvasTargetPositionY:getValue()))
						end
					}, {
						ContentPadding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 24),
							PaddingRight = UDim.new(0, 24),
							PaddingTop = UDim.new(0, Offset)
						}),
						ListLayout = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 5)
						}),
						BirthdayBar = p2.getBirthdayVariant() == 0 and RoactModule.createElement(AuthBirthdayBarModule, {
							layoutOrder = 1,
							onBirthdaySelected = p2.onBirthdaySelected,
							onBirthdayFocused = p2.onBirthdayFocused,
							autoFocusOnMount = UseVerifiedSignupResult or FFlagMinimalSignupAuthEnabledModule3,
							buttonRef = p2.props.defaultRef,
							preferredInput = p2.props.preferredInput,
							birthdayContainerRef = p2.props.birthdayContainerRef,
							forceDarkTheme = FFlagEnableLuaAccountSwitchModule and p2.isAlreadyAuthenticated,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUpFunction()
						}),
						AgeInput = p2.getBirthdayVariant() ~= 0 and RoactModule.createElement(BirthdayFieldModule, {
							layoutOrder = 1,
							textInputHeight = 36,
							variant = p2.getBirthdayVariant(),
							hasBirthdayError = p2.state.birthdayValid == InputValidityModule.Invalid,
							onAgeChange = p2.onAgeChanged,
							onAgeAndMonthChange = p2.onAgeAndMonthChanged,
							onMonthAndYearChange = p2.onMonthAndYearChanged,
							ageTextFieldRef = p2.ageTextFieldRef,
							screenSize = p2.props.screenSize
						}),
						ContactInfoField = UseVerifiedSignupResult and RoactModule.createElement(ContactInfoFieldModule, {
							layoutOrder = 2,
							Under13 = Birthday and DateHelper:isRecentOrFutureDate(Birthday.Month, Birthday.Day, Birthday.Year + 13),
							SetContactMethod = p2.SetContactMethod,
							SetPhoneNumber = p2.SetPhoneNumber,
							SetEmail = p2.SetEmail,
							contactMethod = ContactMethod,
							phoneCountryCodeSelectorCallback = p2.phoneCountryCodeSelectorCallback
						}),
						BackgroundPanel = UseVerifiedSignupResult and RoactModule.createElement("Frame", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 0, 0, 6)
						}, {
							LightPanel = RoactModule.createElement("Frame", {
								BorderSizePixel = 0,
								Size = UDim2.new(0, 100000, 0, 100000),
								Position = UDim2.new(0, 0, 1, 0),
								BackgroundColor3 = p3.Theme.UIDefault.Color,
								AnchorPoint = Vector2.new(0.5, 0)
							})
						}),
						DisplayName = if DisplayNamesOnSignupExperimentV3 and p2.shouldShowDisplayNameField() then ReactModule.createElement(DisplayNameFieldModule, {
							layoutOrder = 4,
							authEventAnalytics = p2.props.authEventAnalytics,
							birthday = if Birthday then Birthday:FormatForEndpoint() else "",
							bypassDisplayNameField = p2.state.bypassDisplayNameField,
							focusedTextBoxPositionChangedCallback = p2.onFocusedTextBoxPositionChanged,
							onAnimationStateChangeCallback = p2.onAnimationStateChangeCallback,
							onDisplayNameTextChanged = p2.onDisplayNameTextChanged,
							onReturnPressedFromOnScreenKeyboard = p2.onDisplayNameTextChangeCompletedFromKeyboard,
							pillClicked = p2.state.pillClicked,
							resetPillClicked = p2.resetPillClicked,
							returnKeyType = Enum.ReturnKeyType.Next,
							setUsernameRecommendation = p2.setUsernameRecommendation,
							shouldDisableRecommendation = p2.state.hasEditedUsername,
							textBoxFocusedCallback = p2.onDisplayNameTextBoxFocused,
							textBoxFocusLostCallback = p2.onTextBoxFocusLost,
							textBoxRef = p2.displayNameTextFieldRef,
							updateBypassDisplayNameField = p2.updateBypassDisplayNameField,
							updatePillClicked = p2.updatePillClicked
						}) else nil,
						UsernameValidator = NoFFlagMinimalSignupAuthEnabledModule1 and RoactModule.createElement(CollapsingTextInputValidatorModule, {
							titleTextKey = "Authentication.Login.Label.Username",
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 5 else 4,
							summaryErrorTextKey = SummaryErrorTextKey,
							prerequisiteMet = if Birthday then true else false,
							textInputType = if ShouldDisableUsernameAutofill then nil else Username1,
							onInputTextChanged = p2.onUsernameTextChanged,
							onInputTextValidated = UseUsernameSuggestionsResult and p2.onUsernameTextValidated or p2.onUsernameTextChanged,
							validator = UsernameValidatorModule,
							prefilledText = if DisplayNamesOnSignupExperimentV3 then p2.state.recommendedUsername else nil,
							placeholderText = if DisplayNamesOnSignupExperimentV3 then p2.getUsernamePlaceholder(p4) else p4.usernamePlaceholder,
							validatorAdditionalProps = {
								birthday = Birthday and Birthday:FormatForEndpoint() or "",
								context = UsernameValidationContextModule.Signup
							},
							textBoxFocusedCallback = p2.onUsernameTextBoxFocused,
							textBoxFocusLostCallback = if DisplayNamesOnSignupExperimentV3 then p2.onUsernameTextBoxFocusLost else p2.onTextBoxFocusLost,
							focusedTextBoxPositionChangedCallback = p2.onFocusedTextBoxPositionChanged,
							returnKeyType = Enum.ReturnKeyType.Next,
							onReturnPressedFromOnScreenKeyboard = p2.onUsernameTextChangeCompletedFromKeyboard,
							onAnimationStateChangeCallback = p2.onAnimationStateChangeCallback,
							textBoxRef = p2.usernameTextFieldRef,
							pillClicked = p2.state.pillClicked,
							updatePillClicked = p2.updatePillClicked,
							resetPillClicked = p2.resetPillClicked,
							issueCondition = p2.state.issueCondition,
							updateIssueCondition = p2.updateIssueCondition,
							loadingSuggestions = p2.state.loadingSuggestions,
							paddingBottomOverride = if DisplayNamesOnSignupExperimentV3 and p2.props.shouldSeeDisplayNamesOnSignup and p2.getUsernameGuidanceText(p4) then -5 else nil,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUpFunction(),
							useFoundationTextInput = if ShouldUseFoundationUsernameTextInput then true else nil
						}),
						UsernameGuidanceText = if DisplayNamesOnSignupExperimentV3 and p2.props.shouldSeeDisplayNamesOnSignup and p2.getUsernameGuidanceText(p4) then RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 5,
							Size = UDim2.new(1, 0, 0, 1),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 5) }),
							Label = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = p3.Font.CaptionBody.Font,
								Size = UDim2.new(1, 0, 0, 0),
								Text = p2.getUsernameGuidanceText(p4),
								TextColor3 = p3.Theme.TextDefault.Color,
								TextSize = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Top
							})
						}) else nil,
						SuggestionsFrame = NoFFlagMinimalSignupAuthEnabledModule1 and (UseUsernameSuggestionsResult and RoactModule.createElement(SuggestionsFrameModule, {
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 5 else 4,
							textBoxRef = p2.usernameTextFieldRef,
							usernameValid = p2.state.usernameValid,
							birthday = Birthday and Birthday:FormatForEndpoint() or "",
							suggest = UsernameSuggestorModule,
							context = UsernameValidationContextModule.Signup,
							pillClicked = p2.state.pillClicked,
							updatePillClicked = p2.updatePillClicked,
							resetPillClicked = p2.resetPillClicked,
							issueCondition = p2.state.issueCondition,
							usernameSuggestionClicked = p2.usernameSuggestionClicked,
							usernameSuggestionsShown = p2.usernameSuggestionsShown,
							shouldSuggest = p2.shouldSuggest,
							updateSuggestionControlState = p2.updateSuggestionControlState,
							useRefreshButton = UseRefreshButtonResult,
							logRefreshButtonClicked = p2.logRefreshButtonClicked,
							loadSuggestions = p2.loadSuggestions,
							finishSuggestions = p2.finishSuggestions,
							loadingSuggestions = p2.state.loadingSuggestions,
							padding = {
								PaddingLeft = UDim.new(0, 24),
								PaddingRight = UDim.new(0, 24)
							}
						})),
						PasswordValidator = not FFlagMinimalSignupAuthEnabledModule1 and (not FFlagPasswordlessSignupAuthEnabledModule1 and RoactModule.createElement(CollapsingTextInputValidatorModule, {
							titleTextKey = "CommonUI.Messages.Label.Password",
							disabled = p2.state.birthdayFocused,
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 6 else 5,
							summaryErrorTextKey = SummaryErrorTextKey1,
							prerequisiteMet = not Inverted,
							textInputType = EnableAndroidPasswordSuggestionEngineFeature and Enum.TextInputType.NewPassword or Enum.TextInputType.Password,
							onInputTextChanged = p2.onPasswordTextChanged,
							onInputTextValidated = p2.onPasswordTextChanged,
							validator = PasswordValidatorModule,
							placeholderText = p4.passwordPlaceholder,
							validatorAdditionalProps = { username = Username },
							returnKeyType = Enum.ReturnKeyType.Next,
							textBoxFocusedCallback = p2.onPasswordTextBoxFocused,
							textBoxFocusLostCallback = p2.onTextBoxFocusLost,
							focusedTextBoxPositionChangedCallback = p2.onFocusedTextBoxPositionChanged,
							onReturnPressedFromOnScreenKeyboard = p2.onPasswordTextChangeCompletedFromKeyboard,
							onAnimationStateChangeCallback = p2.onAnimationStateChangeCallback,
							textBoxRef = p2.passwordTextFieldRef,
							centralOverlayBlocksInput = UseVerifiedSignupResult,
							captureFocusOnTapStart = not p2.state.isCountryCodeSearchVisible
						})),
						GenderSelector = not FFlagMinimalSignupAuthEnabledModule2 and (GetFIntLuaLoginGenderSelectorModule() ~= 2 and RoactModule.createElement(SignUpGenderSelectorModule, {
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 8 else 7,
							gender = Gender,
							onGenderChanged = p2.onGenderChanged,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUpFunction()
						})),
						Spacing = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = if DisplayNamesOnSignupExperimentV3 then 9 else 8,
							Size = UDim2.new(1, 0, 0, 38)
						}),
						SignUpButton = if IsCompactView1 then RoactModule.createElement(FoundationModule.Button, {
							variant = FoundationModule.Enums.ButtonVariant.Emphasis,
							LayoutOrder = if DisplayNamesOnSignupExperimentV3 then 10 else 9,
							text = if NoNoPasskeysAvailable then p4.continueText else p4.signUpText,
							size = FoundationModule.Enums.InputSize.Medium,
							width = UDim.new(1, 0),
							isDisabled = not IsSignUpButtonEnabled,
							isLoading = IsSignUpInProgress,
							onActivated = p2.onSignUpClick
						}) else RoactModule.createElement(Button, {
							buttonType = ButtonType.PrimaryContextual,
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 10 else 9,
							size = UDim2.new(1, 0, 0, 36),
							text = if NoNoPasskeysAvailable then p4.continueText else p4.signUpText,
							isDisabled = not IsSignUpButtonEnabled,
							isLoading = IsSignUpInProgress,
							onActivated = p2.onSignUpClick
						}),
						CheckboxContainer = ShouldRequireSignupCheckbox and ReactModule.createElement(View, {
							tag = "auto-xy padding-x-xxlarge padding-y-large row gap-medium",
							LayoutOrder = if DisplayNamesOnSignupExperimentV3 then 11 else 10
						}, {
							SignUpAgreementCheckbox = ReactModule.createElement(Checkbox, {
								isDisabled = false,
								LayoutOrder = 1,
								label = "",
								isChecked = p2.state.signupAgreementsChecked,
								onActivated = function()
									-- upvalues: p2 (upval), EventStreamConstantsModule (upval)
									p2.props.authEventAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.TosCheckbox, (tostring(not p2.state.signupAgreementsChecked)))
									p2:setState({
										signupAgreementsChecked = not p2.state.signupAgreementsChecked
									})
								end,
								size = InputSize.Small
							}),
							Text = ReactModule.createElement(Text, {
								tag = "text-body-small text-align-x-left text-wrap auto-xy shrink",
								LayoutOrder = 2,
								Text = SignUpAgreementFullCopyCheckboxText
							})
						}),
						DisclaimerText = not (ShouldShowVNGAgreements or (ShouldShowKISAAgreements or ShouldRequireSignupCheckbox)) and RoactModule.createElement(TitleAndParagraphModule, {
							layoutOrder = if DisplayNamesOnSignupExperimentV3 then 11 else 10,
							textXAlignment = Enum.TextXAlignment.Center,
							paragraphTextKeys = {
								AuthenticationSignUpDescriptionSignUpAgreementFullCopyCreateAccount
							},
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUpFunction()
						}),
						DisclaimerLinks = not (ShouldShowVNGAgreements or ShouldShowKISAAgreements) and RoactModule.createElement(DisclaimerLinksModule, {
							LayoutOrder = if DisplayNamesOnSignupExperimentV3 then 12 else 11,
							variant = if FFlagFoundationStylingOnSignUp then Default else nil,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUpFunction()
						}),
						ScrollPadding = IsOnScreenKeyboardHeightAbove and RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = if DisplayNamesOnSignupExperimentV3 then 13 else 12,
							Size = UDim2.new(1, 0, 0, p2.state.onScreenKeyboardHeight * 2)
						})
					}),
					Footer = UseVerifiedSignupResult and (IsFormFactorMatch and RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = true,
						Size = UDim2.new(1, 0, 0, 12),
						Position = UDim2.new(0, 0, 1, -12)
					}, {
						Rounding = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 2, 0),
							Position = UDim2.new(0, 0, -1, 0),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(9, 9, 9, 9),
							Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
							ImageColor3 = p3.Theme.UIDefault.Color
						})
					}))
				})
			})
		end)
	end)
end

local v2 = WithNavigationPropsFunction(function(_, p2)
	return p2
end)((RoactAppExperimentModule.connectBrowserTrackerLayer({
	AppBtidLayers.SignupLayer,
	AppBtidLayers.IosPasswordSavingLayer,
	AppBtidLayers.AccountSwitcherLayer
}, function(p2, _)
	-- upvalues: AppBtidLayers (copy), DisplayNamesOnSignupExperimentV3 (copy), EnableDisplayNamesOnSignupExperimentv1Dev (copy), GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy)
	local v3 = p2[AppBtidLayers.SignupLayer] or {}
	local v4 = p2[AppBtidLayers.IosPasswordSavingLayer] or {}
	local ShouldSeeDisplayNamesOnSignup = if EnableDisplayNamesOnSignupExperimentv1Dev then true elseif DisplayNamesOnSignupExperimentV3 then v3.shouldSeeDisplayNamesOnSignup else nil
	local Inverted1 = nil
	
	if GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction() then
		local v5 = p2[AppBtidLayers.AccountSwitcherLayer] or {}
		local Inverted: boolean = not GetFFlagEnableAccountSwitcherRedesignIXPFunction() or v5.enableAccountSwitcherFoundationDesign == true
		Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction() and Inverted
	else
		Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction()
	end
	return {
		useVerifiedSignupPage = v3.contactMethodRequired,
		arePasswordFieldsPlaintext = v3.ArePasswordFieldsPlaintext,
		shouldUseUsernameSuggestions = v3.usernameSuggestionsEnabled,
		enableRefreshButton = v3.suggestionRefreshButtonEnabled,
		shouldUseMinimalSignup = v3.shouldUseMinimalSignup,
		shouldHideGenderOption = v3.shouldHideGenderOption,
		shouldAutofocusOnBirthday = v3.shouldAutofocusOnBirthday,
		shouldUsePasswordlessSignup = v3.shouldUsePasswordlessSignup,
		shouldUsePasskeySignup = v3.shouldUsePasskeySignup,
		shouldAutomaticallyPromptForPasskey = v3.shouldAutomaticallyPromptForPasskey,
		shouldTightenPasskeyEligibility = v3.shouldTightenPasskeyEligibility,
		birthdayPickerVariant = v3.birthdayPickerVariant,
		shouldSeeDisplayNamesOnSignup = ShouldSeeDisplayNamesOnSignup,
		shouldShowKoreanKISASignUpFlow = v3.shouldShowKoreanKISASignUpFlow,
		shouldSkipVPCSignupFlow = v3.shouldSkipVPCSignupFlow,
		shouldDisableUsernameAutofill = v3.shouldDisableUsernameAutofill,
		shouldRequireSignupCheckbox = v3.shouldRequireSignupCheckbox,
		signupLegalDisclaimerTextVariant = v3.signupLegalDisclaimerTextVariant,
		isIosAuthServiceEnabled = v4.enableNewIosPasswordSaving or false,
		showAccountSwitcherFoundationDesign = Inverted1
	}
end)((RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService,
	authEventAnalytics = RoactAnalyticsAuthEventsModule,
	analytics = RoactAnalyticsModule,
	loggingProtocol = AppLogging
})((RoactRoduxModule.connect(function(p2, _)
	return { formFactor = p2.FormFactor, screenSize = p2.ScreenSize }
end, function(Callback)
	-- upvalues: SignUpV2Module (copy), OpenCentralOverlayForAgreeToPhoneNumberVerificationModule (copy), AnalyticsEvents (copy), EventConstants (copy), OpenKISAPopUpAgreementsModule (copy), FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), SetNetworkingErrorToastModule (copy), OpenCentralOverlayForPhoneNumberVerificationModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), CloseCentralOverlayModule (copy), OpenAccountSwitchingErrorOverlayModule (copy), ResetAppStateModule (copy), LogoutModule (copy), OpenEmailOtpModule (copy)
	return {
		signUp = function(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15)
			-- upvalues: Callback (copy), SignUpV2Module (upval)
			return Callback(SignUpV2Module(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15))
		end,
		agreeToPhoneNumberVerification = function(_, VerificationChallengeCallback, PhoneNumber)
			-- upvalues: Callback (copy), OpenCentralOverlayForAgreeToPhoneNumberVerificationModule (upval)
			return Callback(OpenCentralOverlayForAgreeToPhoneNumberVerificationModule({
				verificationChallengeCallback = VerificationChallengeCallback,
				phoneNumber = PhoneNumber
			}))
		end,
		openKISAUserAgreements = function(p2)
			-- upvalues: AnalyticsEvents (upval), EventConstants (upval), Callback (copy), OpenKISAPopUpAgreementsModule (upval)
			AnalyticsEvents.sendPageLoadEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup)
			
			return Callback(OpenKISAPopUpAgreementsModule(p2))
		end,
		setBackNavigationDisabled = function(p2)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p2) else Callback(SetBackNavigationDisabledModule(p2))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end,
		showErrorToast = function()
			-- upvalues: Callback (copy), SetNetworkingErrorToastModule (upval)
			return Callback(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
		end,
		verifyPhoneNumber = function(_, VerifyPhoneNumberCallback, Challenge, PhoneNumber, DeliveryTarget, UseEmailOptionClickedCallback)
			-- upvalues: Callback (copy), OpenCentralOverlayForPhoneNumberVerificationModule (upval)
			return Callback(OpenCentralOverlayForPhoneNumberVerificationModule({
				verifyPhoneNumberCallback = VerifyPhoneNumberCallback,
				phoneNumber = PhoneNumber,
				deliveryTarget = DeliveryTarget,
				challenge = Challenge,
				useEmailOptionClickedCallback = UseEmailOptionClickedCallback
			}))
		end,
		showErrorMessageToast = function(ToastMessage)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
			return Callback(SetCurrentToastMessageModule({
				toastType = ToastTypeModule.NetworkingError,
				toastMessage = ToastMessage
			}))
		end,
		showVNGUserAgreementsPopup = function(Agreements, AgreementAccepted, AgreementDeclined)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.VNGUserAgreementsPopup, {
				isSignup = true,
				agreements = Agreements,
				agreementAccepted = AgreementAccepted,
				agreementDeclined = AgreementDeclined
			}, { DisableBackButtonClose = true }))
		end,
		showVNGDCForm = function()
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.VngContactInfoFormWebviewPopup, {}, { DisableBackButtonClose = true }))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		openAccountSwitchingErrorOverlay = function(p2, p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: Callback (copy), OpenAccountSwitchingErrorOverlayModule (upval)
			return Callback(OpenAccountSwitchingErrorOverlayModule(p2, p3, p4, p5, p6, p7, p8, p9, true))
		end,
		resetAppState = function()
			-- upvalues: Callback (copy), ResetAppStateModule (upval)
			return Callback(ResetAppStateModule())
		end,
		logoutWithoutShowConfirmation = function(p2, p3)
			-- upvalues: Callback (copy), LogoutModule (upval)
			return Callback(LogoutModule(p2, p3))
		end,
		openEmailOtp = function(p2)
			-- upvalues: Callback (copy), OpenEmailOtpModule (upval)
			Callback(OpenEmailOtpModule(p2))
		end,
		showAccountLinkingAlert = function(AlertType)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.AccountLinkingAlert, { alertType = AlertType }))
		end
	}
end)(SinglePageSignUp)))))))))

local function SinglePageSignUpWithAuditContent(p2)
	-- upvalues: AuditContentContext (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	local UseAuditContentContextResult = AuditContentContext.useAuditContentContext()
	
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p2, {
		capturedAuditContent = UseAuditContentContextResult.capturedAuditContent,
		additionalAuditContent = UseAuditContentContextResult.additionalAuditContent
	}))
end

return function(p2)
	-- upvalues: ReactFocusNavigationModule (copy), UseBreakpointOnSignUp (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), FFlagFoundationStylingOnSignUp (copy), FFlagEnableSignupFoundationalizeBackgroundAndText (copy), UseTokensFunction (copy), CryoModule (copy), FoundationModule (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), GetFFlagAuthCollapsingValidatorFoundationInputFunction (copy), ReactModule (copy), GetFFlagEnablePreferredInputForSignUpFunction (copy), UsePreferredInputFunction (copy), FFlagEnableSignUpExitModal (copy), UseDispatchFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), CloseCentralOverlayModule (copy), UseSignUpPageNavigationBindingsFunction (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), RoactModule (copy), AuditContentContext (copy), SinglePageSignUpWithAuditContent (copy), FFlagHideBackButtonOnSignUpPage (copy), v2 (ref)
	local UseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseBreakpointXOrSmallerResult = if UseBreakpointOnSignUp then UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Medium) else nil
	local UseTokensResult = if FFlagFoundationStylingOnSignUp or FFlagEnableSignupFoundationalizeBackgroundAndText then UseTokensFunction() else nil
	
	if UseTokensResult and game:DefineFastFlag("SignupFoundationBackgroundDarkFix", false) then
		UseTokensResult = CryoModule.Dictionary.join(UseTokensResult, {
			Color = FoundationModule.Utility.getTokens(FoundationModule.Enums.Theme.Dark).Color
		})
	end
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AuthenticationStylingLayer }, function(p3)
		-- upvalues: AppBtidLayers (upval)
		local v3 = p3[AppBtidLayers.AuthenticationStylingLayer] or {}
		
		return {
			shouldUseFoundationBackgroundColor = v3.shouldUseFoundationBackgroundColor,
			shouldUseFoundationUsernameTextInput = v3.shouldUseFoundationUsernameTextInput
		}
	end)
	local ShouldUseFoundationBackgroundColor = FFlagEnableSignupFoundationalizeBackgroundAndText and UseBrowserTrackerExperimentResult.shouldUseFoundationBackgroundColor
	local ShouldUseFoundationUsernameTextInput = GetFFlagAuthCollapsingValidatorFoundationInputFunction() and UseBrowserTrackerExperimentResult.shouldUseFoundationUsernameTextInput
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UsePreferredInputResult = if GetFFlagEnablePreferredInputForSignUpFunction() then UsePreferredInputFunction() else nil
	local IsUsePreferredInputResultMatch: boolean = FFlagEnableSignUpExitModal and UsePreferredInputResult == ResponsiveModule.Input.Directional
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsUsePreferredInputResultMatch (copy), UseStateResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackModule (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval), CloseCentralOverlayModule (upval), UseFocusGuiObjectResult (copy), UseFocusedGuiObjectResult (copy)
		if not IsUsePreferredInputResultMatch then return end
		if UseStateResult then
			UseDispatchResult(SetCentralOverlayModule(OverlayTypeModule.SignUpExitModal, {
				onClose = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval), UseFocusGuiObjectResult (upval), UseFocusedGuiObjectResult (upval)
					UseDispatchResult(CloseCentralOverlayModule())
					UseDispatchResult(function()
						-- upvalues: UseFocusGuiObjectResult (upval), UseFocusedGuiObjectResult (upval)
						UseFocusGuiObjectResult(UseFocusedGuiObjectResult)
					end)
				end,
				onConfirm = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackModule (upval)
					UseDispatchResult(CloseCentralOverlayModule())
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back()
						
						return
					else
						UseDispatchResult(NavigateBackModule())
					end
				end
			}))
			
			return
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back()
			
			return
		else
			UseDispatchResult(NavigateBackModule())
		end
	end, {
		UseStateResult,
		IsUsePreferredInputResultMatch,
		UseFocusedGuiObjectResult,
		UseFocusGuiObjectResult,
		UseDispatchResult
	})
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((UseSignUpPageNavigationBindingsFunction(if IsUsePreferredInputResultMatch then UseResult else nil)))
	local UseRefResult = ReactModule.useRef(nil)
	
	return if GetFFlagEnableAuditForSinglePageSignUpFunction() then RoactModule.createElement(AuditContentContext.Provider, nil, {
		SignUpPage = RoactModule.createElement(SinglePageSignUpWithAuditContent, CryoModule.Dictionary.join(p2, {
			signUpStarted = if IsUsePreferredInputResultMatch then UseStateResult else nil,
			setSignUpStarted = if IsUsePreferredInputResultMatch then UseStateResult2 else nil,
			shouldShowBackButton = if FFlagHideBackButtonOnSignUpPage then not IsUsePreferredInputResultMatch else nil,
			preferredInput = UsePreferredInputResult,
			focusedGuiObject = UseFocusedGuiObjectResult,
			focusGuiObject = UseFocusGuiObjectResult,
			defaultRef = UseDefaultFocusBehaviorResult,
			containerRef = UseDefaultFocusBehaviorResult2,
			birthdayContainerRef = UseRefResult,
			isCompactView = UseBreakpointXOrSmallerResult,
			foundationTokens = UseTokensResult,
			shouldUseFoundationBackgroundColor = ShouldUseFoundationBackgroundColor,
			shouldUseFoundationUsernameTextInput = ShouldUseFoundationUsernameTextInput
		}))
	}) else RoactModule.createElement(v2, CryoModule.Dictionary.join(p2, {
		signUpStarted = if IsUsePreferredInputResultMatch then UseStateResult else nil,
		setSignUpStarted = if IsUsePreferredInputResultMatch then UseStateResult2 else nil,
		shouldShowBackButton = if FFlagHideBackButtonOnSignUpPage then not IsUsePreferredInputResultMatch else nil,
		preferredInput = UsePreferredInputResult,
		focusedGuiObject = UseFocusedGuiObjectResult,
		focusGuiObject = UseFocusGuiObjectResult,
		defaultRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2,
		birthdayContainerRef = UseRefResult,
		isCompactView = UseBreakpointXOrSmallerResult,
		foundationTokens = UseTokensResult,
		shouldUseFoundationBackgroundColor = ShouldUseFoundationBackgroundColor,
		shouldUseFoundationUsernameTextInput = ShouldUseFoundationUsernameTextInput
	}))
end