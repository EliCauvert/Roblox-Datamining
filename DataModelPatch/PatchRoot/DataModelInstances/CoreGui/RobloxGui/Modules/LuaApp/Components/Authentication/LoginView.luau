local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ContentProvider = game:GetService("ContentProvider")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(CorePackages.Packages.Cryo)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local Common = Modules.Common
local RoactModule = require(Common.Roact)
local RoactRoduxModule = require(Common.RoactRodux)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local GetPasswordManagerUsageStoreFunction = AuthCommonModule.Stores.GetPasswordManagerUsageStore
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppPageModule = require(Modules.LuaApp.AppPage)
local LoginModule = require(Modules.LuaApp.Thunks.Authentication.Login)
local LoginByCodeModule = require(Modules.LuaApp.Thunks.Authentication.LoginByCode)
local LoginByPasskeyModule = require(Modules.LuaApp.Thunks.Authentication.LoginByPasskey)
local LoginByOtpModule = require(Modules.LuaApp.Thunks.Authentication.LoginByOtp)
local LoginResultModule = require(Modules.LuaApp.Models.Authentication.LoginResult)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local StartPasskeyAuthenticationModule = require(Modules.LuaApp.Thunks.Authentication.StartPasskeyAuthentication)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local OpenCentralOverlayForLoginPasswordResetPromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt)
local SetLoginResultModule = require(Modules.LuaApp.Actions.Authentication.SetLoginResult)
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local CrossDeviceLoginModule = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local OpenAccountSelectorModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSelector)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local OpenEmailOtpModule = require(Modules.LuaApp.Thunks.Authentication.OpenEmailOtp)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AuthCanVerifyCredentialsModule = require(Modules.LuaApp.Http.Requests.AuthCanVerifyCredentials)
local GetIXPLayerParametersModule = require(Modules.LuaApp.Http.Requests.GetIXPLayerParameters)
local LogoWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.LogoWithContentsLayout)
local DualLoginWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.DualLoginWithContentsLayout)
local IsStringEmailFunction = AuthCommonModule.Utils.isStringEmail
local IsStringPhoneFunction = AuthCommonModule.Utils.isStringPhone
local EnrolledInLuafiedRecoveryExperimentFunction = AuthCommonModule.Experiments.enrolledInLuafiedRecoveryExperiment
local Base64Module = require(Modules.LuaApp.Util.Base64)
local CredentialLoginContainerModule = require(Modules.LuaApp.Components.Authentication.CredentialLoginContainer)
local LoginCodePromptModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local LoginErrorCodesModule = require(Modules.LuaApp.Enum.LoginErrorCodes)
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local CredentialTypeModule = require(Modules.LuaApp.Enum.CredentialType)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local AppLoginCounterNamesModule = require(Modules.LuaApp.Analytics.Events.AppLoginCounterNames)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local ConstantsModule = require(Modules.LuaApp.Constants)
local AccountSwitcherConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local LinkButton = UIBloxModule.App.Button.LinkButton
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3eAuth = SharedFlagsModule.FFlagSignalsNavP3eAuth
local FFlagRemoveUnusedLoginResultRoduxSlice = SharedFlagsModule.FFlagRemoveUnusedLoginResultRoduxSlice
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3eAuth then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local TypeModule = require(Modules.LuaApp.Enum.Challenge.Type)
local GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev)
local GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule = require(Modules.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin)
local RenderChallengeModule = require(Modules.LuaApp.Thunks.Challenge.RenderChallenge)
local TwoStepRequestsModule = require(Modules.LuaApp.Http.Requests.TwoStepRequests)
local LogoutAllLoggedInUsersModule = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local ActionTypeModule = require(Modules.LuaApp.Enum.Challenge.TwoStepVerification.ActionType)
local GetFFlagLuaAppEnableDesktopDualLoginABTestFunction = SharedFlagsModule.GetFFlagLuaAppEnableDesktopDualLoginABTest
local GetFFlagEnableLoginAccountSelectorModule = require(Modules.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFIntLoginViewBottomPaddingPxModule = require(Modules.LuaApp.Flags.GetFIntLoginViewBottomPaddingPx)
local GetFFlagEnableOtpEmailLoginModule = require(Modules.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)
local GetFFlagShouldUsePeekViewForLoginDisambiguationModule = require(Modules.LuaApp.Flags.GetFFlagShouldUsePeekViewForLoginDisambiguation)
local GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction = SharedFlagsModule.GetFFlagEnableLoginDisambiguationFoundationSwitcher
local GetFFlagEnableCredentialsProtocolPasswordsModule = require(Modules.LuaApp.Flags.GetFFlagEnableCredentialsProtocolPasswords)
local GetFFlagReportCrossAppLoginAttemptModule = require(Modules.LuaApp.Flags.GetFFlagReportCrossAppLoginAttempt)
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1", false)
local CredentialsProtocolModule = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local CredentialsProtocolErrorCodes = CredentialsProtocolModule.CredentialsProtocolErrorCodes
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local DeleteAllCredentialsFromKeystoreModule = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local OpenAccountSwitchingErrorOverlayModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagEnableKoreaKISAComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
local FFlagLuaEnableDidSwitchAccountModule = require(Modules.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount)
local AwaitLoginCompletionForDisambiguationFlow = game:DefineFastFlag("AwaitLoginCompletionForDisambiguationFlow", false)
game:DefineFastFlag("LuaLoginManualCredentialValidation", false)
local FFlagEnablePasskeyLoginErrorLogging = SharedFlagsModule.FFlagEnablePasskeyLoginErrorLogging
local FFlagAuthSecExclusions = SharedFlagsModule.FFlagAuthSecExclusions
local FFlagEnablePWManagerSignupCheck = SharedFlagsModule.FFlagEnablePWManagerSignupCheck
local FFlagEnableAuthDeepLinkReceiver = SharedFlagsModule.FFlagEnableAuthDeepLinkReceiver
local FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlagsModule.FFlagEnableNavigateToLoginAfterLogoutAll
local PreAuthDeepLinkUrlStore = AuthCommonModule.Stores.PreAuthDeepLinkUrlStore
local UserModule = require(script.Parent.Parent.Parent.Thunks.Authentication.User)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local PromiseModule = require(CorePackages.Packages.Promise)
local GetFFlagEnableVNGNewAppAvailableModalModule = require(Modules.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)
local GetFStringVNGDownloadNowUrlModule = require(Modules.LuaApp.Flags.GetFStringVNGDownloadNowUrl)
local FixLoginSelection = game:DefineFastFlag("FixLoginSelection", false)
local FFlagEnableVNGDUARSignupComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherRedesignIXP
local GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherIXPTextGatingFix
local FFlagEnableIosKeychainLoginLuaModule = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local GetUserByUsernameFunction = AuthCommonModule.Thunks.GetUserByUsername
local WithNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).withNavigationProps
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local AccountLinkingAlertType = AuthCommonModule.Enums.AccountLinkingAlertType
local TwoStepErrorCodes = AuthCommonModule.Enums.TwoStepErrorCodes
local GetTwoStepLoginErrorKeyFunction = AuthCommonModule.Utils.getTwoStepLoginErrorKey
local LoginButtonAutoDisabled = game:DefineFastFlag("LoginButtonAutoDisabled", false)
local EnableTwoStepLoginChallengeAnalytics = game:DefineFastFlag("EnableTwoStepLoginChallengeAnalytics", false)
local DebugOTPBypass = game:DefineFastFlag("DebugOTPBypass", false)
local GetFFlagBypassKeystoreLoginIxpV2Function = SharedFlagsModule.GetFFlagBypassKeystoreLoginIxpV2
local GetFFlagRemoveKeystoreIxpLogicFunction = SharedFlagsModule.GetFFlagRemoveKeystoreIxpLogic
local GetFFlagEnableLuafiedRecoveryFlowFunction = SharedFlagsModule.GetFFlagEnableLuafiedRecoveryFlow
local FFlagDisableMemStorageServicePasswordEvent = SharedFlagsModule.FFlagDisableMemStorageServicePasswordEvent
local FFlagEnableLoginV1ForcedUsernameOverride = SharedFlagsModule.FFlagEnableLoginV1ForcedUsernameOverride
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagEnable2SVRecoveryFunction = require(CorePackages.Workspace.Packages.AccountRecovery).Flags.GetFFlagEnable2SVRecovery
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local IosAuthServiceHealthCounters = require(CorePackages.Workspace.Packages.AuthAnalytics).RobloxTelemetry.IosAuthServiceHealthCounters
local KeystoreSaveCredentialsTelemetryConfig = TelemetryConfigs.KeystoreSaveCredentialsTelemetryConfig
local TelemetryService = game:GetService("TelemetryService")
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local PasskeyConstants = AuthCommonModule.Common.PasskeyConstants
local IsIosAuthServiceEnabledFunction = AuthCommonModule.Utils.isIosAuthServiceEnabled
local CoarseLoginErrorBucketFunction = AuthCommonModule.Utils.coarseLoginErrorBucket
local IsNonTerminalLoginErrorFunction = AuthCommonModule.Utils.isNonTerminalLoginError
local LoginView = RoactModule.PureComponent:extend("LoginView")
local YOffset = GetFIntLoginViewBottomPaddingPxModule()

function LoginView.init(p1)
	-- upvalues: RoactModule (copy), FixLoginSelection (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagEnableLuaAccountSwitchModule (copy), FFlagEnableLoginV1ForcedUsernameOverride (copy), GetPasswordManagerUsageStoreFunction (copy), FFlagEnablePWManagerSignupCheck (copy), LoginErrorCodesModule (copy), UserModule (copy), AppStorageUtilitiesModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), SystemThemeFeatureModule (copy), UserInputService (copy), AuthCanVerifyCredentialsModule (copy), ReportEphemeralCounterModule (copy), AppLoginCounterNamesModule (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), LoginResultModule (copy), IosAuthServiceHealthCounters (copy), IsIosAuthServiceEnabledFunction (copy), TelemetryConfigs (copy), IsNonTerminalLoginErrorFunction (copy), GetFFlagEnableLoginAccountSelectorModule (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (copy), CoarseLoginErrorBucketFunction (copy), HttpService (copy), Base64Module (copy), Default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), EventStreamConstantsModule (copy), PasskeyConstants (copy), FFlagEnablePasskeyLoginErrorLogging (copy), GetFFlagEnableOtpEmailLoginModule (copy), TypeModule (copy), GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule (copy), GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule (copy), EnableTwoStepLoginChallengeAnalytics (copy), ActionTypeModule (copy), GetFFlagEnable2SVRecoveryFunction (copy), TwoStepRequestsModule (copy), FFlagDisableMemStorageServicePasswordEvent (copy), GetFFlagEnableCredentialsProtocolPasswordsModule (copy), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 (copy), TwoStepErrorCodes (copy), GetTwoStepLoginErrorKeyFunction (copy), AccountLinkingAlertType (copy), IsStringEmailFunction (copy), IsStringPhoneFunction (copy), AwaitLoginCompletionForDisambiguationFlow (copy), GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction (copy), GetFFlagShouldUsePeekViewForLoginDisambiguationModule (copy), PromiseModule (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), GetFFlagRemoveKeystoreIxpLogicFunction (copy), GetFFlagBypassKeystoreLoginIxpV2Function (copy), ContentProvider (copy), GetUserByUsernameFunction (copy), DeleteAllCredentialsFromKeystoreModule (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), FFlagRemoveUnusedLoginResultRoduxSlice (copy), Constants (copy), LogoutAllLoggedInUsersModule (copy), AccountSwitcherConstants (copy), GuiService (copy), StatusCodes (copy), ConstantsModule (copy), CredentialTypeModule (copy), GetFFlagEnableVNGNewAppAvailableModalModule (copy), GetFStringVNGDownloadNowUrlModule (copy), GetFFlagEnableLuafiedRecoveryFlowFunction (copy), EnrolledInLuafiedRecoveryExperimentFunction (copy), AppPageModule (copy), TransitionAnimationModule (copy), GetFFlagReportCrossAppLoginAttemptModule (copy), RbxAnalyticsService (copy)
	local Flag = false
	p1.cvalueRef = RoactModule.createRef()
	p1.passwordRef = RoactModule.createRef()
	p1.loginButtonRef = RoactModule.createRef()
	p1.forgotLinkRef = RoactModule.createRef()
	p1.crossDeviceButtonRef = RoactModule.createRef()
	p1.emailOtpRef = RoactModule.createRef()
	
	if FixLoginSelection then
		p1.focusRef = RoactModule.createRef()
	end
	local Item = AppStorageService:GetItem(LocalStorageKey.CredentialValue)
	
	if FFlagEnableLuaAccountSwitchModule then
		local Item1 = AppStorageService:GetItem(LocalStorageKey.AccountBlob)
		
		if Item1 and Item1 ~= "" then
			Item = ""
		end
	end
	if FFlagEnableLoginV1ForcedUsernameOverride and p1.props.forcedUsernameOverride then
		Item = p1.props.forcedUsernameOverride
	end
	p1.cvalueText, p1.updateCValueText = RoactModule.createBinding(Item)
	p1.passwordText, p1.updatePasswordText = RoactModule.createBinding("")
	p1.state = {
		errorKey = "",
		localizedErrorMessage = nil,
		errorCode = -1,
		loginButtonDisabled = true,
		isLoginInProgress = false,
		forceLoginByUsername = false,
		forgotLinkFocused = false,
		quickLoginButtonTextOverride = "",
		isDesktopDualLoginEnabled = false,
		isLoginByOtp = false,
		otpSessionToken = "",
		otpCode = "",
		isCredentialsProtocolRegisterPasswordAvailable = false
	}
	p1.passwordManagerUsageStore = GetPasswordManagerUsageStoreFunction(false)
	
	if FFlagEnablePWManagerSignupCheck and p1.passwordManagerUsageStore then
		p1.passwordManagerUsageStore.resetAll()
	elseif p1.passwordManagerUsageStore then
		p1.passwordManagerUsageStore.setLoggedinUsingSavedPassword(false)
		p1.passwordManagerUsageStore.setSavedPasswordAfterLogin(false)
	end
	p1.errorHandlingInfoList = {
		[LoginErrorCodesModule.IncorrectCValueOrPassword] = { newFocusedTextBox = 2, textBoxesToClear = { 2 } },
		[LoginErrorCodesModule.CValueAndPasswordRequired] = { newFocusedTextBox = 2, textBoxesToClear = { 2 } },
		[LoginErrorCodesModule.AccountLocked] = { textBoxesToClear = { 2 } },
		[LoginErrorCodesModule.MoreThanOneUsername] = {
			newFocusedTextBox = 1,
			forceLoginByUsername = true,
			textBoxesToClear = { 1, 2 }
		},
		[LoginErrorCodesModule.AccountNotVerified] = { forceLoginByUsername = true, textBoxesToClear = { 1, 2 } },
		[LoginErrorCodesModule.MultipleUsersPerCredential] = if p1.props.appPolicy.getAccountDisambiguationDisabled() then {
			newFocusedTextBox = 1,
			forceLoginByUsername = true,
			textBoxesToClear = { 1, 2 }
		} else nil
	}
	p1.isAlreadyAuthenticated = UserModule.fromLocalStorage().userId ~= -1
	
	function resetDefaultTheme()
		-- upvalues: AppStorageUtilitiesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), SystemThemeFeatureModule (upval)
		local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
		
		if AuthenticatedTheme ~= "" then
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
		end
		SystemThemeFeatureModule.ClearThemeOverride()
	end
	
	function p1.updateIsLoginInProgress(IsLoginInProgress)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), IsLoginInProgress (copy)
			local IsLoginInProgress1 = p1.state.isLoginInProgress
			
			if p1.isMounted and IsLoginInProgress1 ~= IsLoginInProgress then
				p1:setState({ isLoginInProgress = IsLoginInProgress })
			end
		end)
	end
	
	function p1.onTextBoxesChanged(p2)
		-- upvalues: p1 (copy)
		if not p1.cvalueRef.current or not p1.passwordRef.current or not p1.isMounted then return end
		local Text = p2.Text:gsub("\t", "")
		
		if p2.Text ~= Text then
			p2.Text = Text
		end
		p1:setState({
			errorCode = -1,
			loginButtonDisabled = #p1.cvalueRef.current.Text == 0 or #p1.passwordRef.current.Text == 0,
			errorKey = #p2.Text == 0 and p1.state.errorKey or ""
		})
	end
	
	function p1.unfocusTextBoxes()
		-- upvalues: UserInputService (upval), p1 (copy)
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox and (FocusedTextBox == p1.cvalueRef.current or FocusedTextBox == p1.passwordRef.current) then
			FocusedTextBox:ReleaseFocus()
		end
	end
	
	function p1.handleCaptchaResult(p2, p3)
		-- upvalues: p1 (copy)
		if p2 then
			p1.handleLoginWithFormData(p3)
			
			return
		else
			p1.updateIsLoginInProgress(false)
		end
	end
	
	function p1.getCaptchaResultHandlerWithCode(p2, p3)
		-- upvalues: p1 (copy)
		return function(p4, p5)
			-- upvalues: p1 (upval), p2 (copy), p3 (copy)
			if p4 then
				p1.handleLoginWithCode(p2, p3, p5)
				
				return
			else
				p1.updateIsLoginInProgress(false)
			end
		end
	end
	
	function p1.getSecurityQuestionsLoginWithCodeCallback(p2, p3)
		-- upvalues: p1 (copy)
		return function(p4)
			-- upvalues: p1 (upval), p2 (copy), p3 (copy)
			p1.handleLoginWithCode(p2, p3, nil, p4)
		end
	end
	
	function p1.getSecurityQuestionsLoginWithOtpCallback()
		-- upvalues: p1 (copy)
		return function(p2)
			-- upvalues: p1 (upval)
			p1.handleLoginWithOtp(p2, nil)
		end
	end
	
	function p1.getSecurityQuestionsLoginWithFormDataCallback()
		-- upvalues: p1 (copy)
		return function(p2)
			-- upvalues: p1 (upval)
			p1.handleLoginWithFormData(nil, p2)
		end
	end
	
	function p1.canVerifyCredentials(Email, Cvalue, Password)
		-- upvalues: AuthCanVerifyCredentialsModule (upval), p1 (copy)
		return AuthCanVerifyCredentialsModule(p1.props.networking, Email, Cvalue, Password):andThen(function(Result)
			return Result and (Result.responseBody and Result.responseBody.canSend)
		end, function(): boolean
			return false
		end)
	end
	
	function p1.handleLoginWithCode(Cvalue, Password, p2, p3)
		-- upvalues: p1 (copy), LoginErrorCodesModule (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval)
		p1.updateIsLoginInProgress(true)
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		p1.unfocusTextBoxes()
		SetBackNavigationDisabledFunction(true)
		
		return p1.props.loginByCode(p1.props.networking, Cvalue, Password, p1.getCaptchaResultHandlerWithCode(Cvalue, Password), p2, p1.getSecurityQuestionsLoginWithCodeCallback(Cvalue, Password), p3):andThen(function(Result)
			-- upvalues: p1 (upval)
			p1.handleLoginResult(Result, nil)
		end, function(p4)
			-- upvalues: LoginErrorCodesModule (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), p1 (upval), Cvalue (copy), Password (copy)
			if p4.errorCode ~= LoginErrorCodesModule.Captcha then
				ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureAuthCode, 1)
			end
			p1.handleLoginError(p4, Cvalue, Password)
		end)
	end
	
	function p1.handleLoginWithPasskey(Cvalue, SessionId, p2)
		-- upvalues: FFlagEnableNavigateToLoginAfterLogoutAll (upval), Flag (ref), p1 (copy), LoginResultModule (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), TelemetryConfigs (upval), IsNonTerminalLoginErrorFunction (upval), GetFFlagEnableLoginAccountSelectorModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (upval), FFlagEnableLuaAccountSwitchModule (upval), CoarseLoginErrorBucketFunction (upval)
		if FFlagEnableNavigateToLoginAfterLogoutAll then
			Flag = false
		end
		p1.updateIsLoginInProgress(true)
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		p1.unfocusTextBoxes()
		SetBackNavigationDisabledFunction(true)
		
		return p1.props.loginByPasskey(p1.props.networking, Cvalue, SessionId):andThen(function(Result)
			-- upvalues: LoginResultModule (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), p2 (copy), p1 (upval), TelemetryConfigs (upval)
			if LoginResultModule.hasTwoStepData(Result) then
				IosAuthServiceHealthCounters.reportLoginTwoStepRequired({
					credentialType = "passkey",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			else
				IosAuthServiceHealthCounters.reportLoginSuccess({
					credentialType = "passkey",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p2 and IsIosAuthServiceEnabledFunction() then
					p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginSuccessConfig, 1, { credentialType = "passkey" })
				end
			end
			p1.handleLoginResult(Result, nil, "passkey")
		end, function(p3)
			-- upvalues: IsNonTerminalLoginErrorFunction (upval), GetFFlagEnableLoginAccountSelectorModule (upval), p1 (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (upval), FFlagEnableLuaAccountSwitchModule (upval), IosAuthServiceHealthCounters (upval), CoarseLoginErrorBucketFunction (upval), IsIosAuthServiceEnabledFunction (upval), p2 (copy), TelemetryConfigs (upval), Cvalue (copy)
			if not IsNonTerminalLoginErrorFunction(p3, {
				accountSelectorEnabled = GetFFlagEnableLoginAccountSelectorModule() and not p1.props.appPolicy.getAccountDisambiguationDisabled(),
				securityQuestionsEnabled = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule(),
				accountSwitchEnabled = FFlagEnableLuaAccountSwitchModule
			}) then
				IosAuthServiceHealthCounters.reportLoginFailure({
					credentialType = "passkey",
					errorCode = CoarseLoginErrorBucketFunction(p3),
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p2 and IsIosAuthServiceEnabledFunction() then
					local config = { credentialType = "passkey" }
					
					if p3 and p3.errorCode ~= nil then
						config.errorCode = tostring(p3.errorCode)
					end
					p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginFailureConfig, 1, config)
				end
			end
			p1.handleLoginError(p3, Cvalue)
		end)
	end
	
	function p1.showPasskeyLoginPopup()
		-- upvalues: p1 (copy), HttpService (upval), UserInputService (upval), Base64Module (upval), Default (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), EventStreamConstantsModule (upval), PasskeyConstants (upval)
		return p1.props.startPasskeyAuthentication(p1.props.networking):andThen(function(Result)
			-- upvalues: HttpService (upval), UserInputService (upval), Base64Module (upval), Default (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), p1 (upval), EventStreamConstantsModule (upval), PasskeyConstants (upval)
			local Data = HttpService:JSONDecode(Result.authenticationOptions)
			local SessionId = Result.sessionId
			local Number: number? = tonumber(Data.publicKey.timeout)
			Data.keyType = "platform"
			Data.deviceBoundOnly = true
			
			if UserInputService:GetPlatform() ~= Enum.Platform.Android then
				Data.publicKey.challenge = Base64Module.FromUrlSafeBase64(Data.publicKey.challenge)
			end
			Default:getCredentials(Default.CredentialsTypes.FIDO2, HttpService:JSONEncode(Data), Number):andThen(function(Result)
				-- upvalues: HttpService (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), p1 (upval), EventStreamConstantsModule (upval), PasskeyConstants (upval), Base64Module (upval), SessionId (copy)
				local Data = HttpService:JSONDecode(Result)
				
				if Data == nil or next(Data) == nil then
					Logger:info("Passkey credential signing failed. No result returned.")
					
					return
				end
				if Data.errorCode == nil then
					Logger:info("Passkey credential signing completed. Attempting login.")
					Data.id = Base64Module.ToUrlSafeBase64(Data.id)
					Data.rawId = Base64Module.ToUrlSafeBase64(Data.rawId)
					Data.response.signature = Base64Module.ToUrlSafeBase64(Data.response.signature)
					Data.response.userHandle = Base64Module.ToUrlSafeBase64(Data.response.userHandle)
					Data.response.authenticatorData = Base64Module.ToUrlSafeBase64(Data.response.authenticatorData)
					Data.response.clientDataJSON = Base64Module.ToUrlSafeBase64(Data.response.clientDataJSON)
					p1.handleLoginWithPasskey(Data, SessionId)
					
					return
				else
					Logger:info("Passkey credential signing failed. Error {} (msg: {}) returned.", Data.errorCode, Data.errorMsg)
					p1.props.authAnalytics.reportAuthClientError(EventStreamConstantsModule.Context.PasskeyLoginAttempt, CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[tonumber(Data.errorCode) or -1] or string.format(CredentialsProtocolErrorCodes.UNMAPPED_ERROR_CODE, (tostring(Data.errorCode))), PasskeyConstants.PASSKEY_FETCH_LOGIN_V1)
				end
			end, function(p2)
				-- upvalues: Logger (upval)
				Logger:warning("Passkey credential signing failed. Error: {}", p2)
			end)
		end, function(p2)
			-- upvalues: Logger (upval)
			Logger:warning("Fetching passkey login options failed with error code: {}", p2.errorCode)
		end)
	end
	
	function p1.showGenericCredentialLoginPopup(SupportsDeviceBoundOnly, IsAvailable)
		-- upvalues: IsIosAuthServiceEnabledFunction (upval), p1 (copy), TelemetryConfigs (upval), HttpService (upval), UserInputService (upval), Base64Module (upval), Logger (upval), Default (upval), CredentialsProtocolErrorCodes (upval), FFlagEnablePasskeyLoginErrorLogging (upval), EventStreamConstantsModule (upval), PasskeyConstants (upval)
		if SupportsDeviceBoundOnly or IsAvailable then
			local Networking = p1.props.networking
			local StartPasskeyAuthenticationFunction = p1.props.startPasskeyAuthentication
			local Data = nil
			local SessionId = nil
			local Number: number? = nil
			local Input = {}
			
			if SupportsDeviceBoundOnly then
				StartPasskeyAuthenticationFunction(Networking):andThen(function(Result)
					-- upvalues: Data (ref), HttpService (upval), SessionId (ref), Number (ref), UserInputService (upval), Base64Module (upval)
					Data = HttpService:JSONDecode(Result.authenticationOptions)
					SessionId = Result.sessionId
					Number = tonumber(Data.publicKey.timeout)
					Data.keyType = "platform"
					Data.deviceBoundOnly = true
					
					if UserInputService:GetPlatform() ~= Enum.Platform.Android then
						Data.publicKey.challenge = Base64Module.FromUrlSafeBase64(Data.publicKey.challenge)
					end
				end, function(p2)
					-- upvalues: Logger (upval)
					Logger:warning("Fetching passkey login options failed with error code: {}", p2.errorCode)
				end):await()
				
				if Data ~= nil then
					Input.FIDO2 = Data
				end
			end
			if IsAvailable then
				Input.password = {}
			end
			local Json = HttpService:JSONEncode(Input)
			
			if IsIosAuthServiceEnabledFunction() then
				p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetShownConfig, 1)
			end
			return Default:getCredentials(Default.CredentialsTypes.all, Json, Number / 1000):andThen(function(Result)
				-- upvalues: HttpService (upval), Logger (upval), IsIosAuthServiceEnabledFunction (upval), p1 (upval), TelemetryConfigs (upval), CredentialsProtocolErrorCodes (upval), FFlagEnablePasskeyLoginErrorLogging (upval), EventStreamConstantsModule (upval), PasskeyConstants (upval), Default (upval), Base64Module (upval), SessionId (ref)
				local Data = HttpService:JSONDecode(Result)
				
				if Data == nil or not Data.response and not Data.errorCode then
					Logger:info("Generic credential fetch failed. No result returned.")
					
					if IsIosAuthServiceEnabledFunction() then
						p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
					end
					return
				else
					if Data.errorCode == nil then
						if Data.credentialType == Default.CredentialsTypes.password then
							local Password = Data.response.password
							p1.updateCValueText(Data.response.username)
							p1.updatePasswordText(Password)
							
							if IsIosAuthServiceEnabledFunction() then
								p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig, 1)
							end
							p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.CMPasswordLogin, EventStreamConstantsModule.Button.SelectPassword)
							p1.updateIsLoginInProgress(true)
							p1.handleLoginWithFormData(nil, nil, nil, true)
							
							return
						else
							if Data.credentialType == Default.CredentialsTypes.FIDO2 then
								if IsIosAuthServiceEnabledFunction() then
									p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig, 1)
								end
								Data.response.id = Base64Module.ToUrlSafeBase64(Data.response.id)
								Data.response.rawId = Base64Module.ToUrlSafeBase64(Data.response.rawId)
								Data.response.response.signature = Base64Module.ToUrlSafeBase64(Data.response.response.signature)
								Data.response.response.userHandle = Base64Module.ToUrlSafeBase64(Data.response.response.userHandle)
								Data.response.response.authenticatorData = Base64Module.ToUrlSafeBase64(Data.response.response.authenticatorData)
								Data.response.response.clientDataJSON = Base64Module.ToUrlSafeBase64(Data.response.response.clientDataJSON)
								p1.handleLoginWithPasskey(Data.response, SessionId, true)
							end
						end
					else
						Logger:info("Generic credential fetch failed. Error {} (msg: {}) returned.", Data.errorCode, Data.errorMsg)
						
						if IsIosAuthServiceEnabledFunction() then
							local GetCredentialsErrorCode = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[tonumber(Data.errorCode) or -1]
							
							if GetCredentialsErrorCode == "CANCELLATION_ERROR" then
								p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
							else
								p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetErrorConfig, 1, {
									errorCode = GetCredentialsErrorCode or tostring(Data.errorCode)
								})
							end
						end
						if FFlagEnablePasskeyLoginErrorLogging and type(Data.errorMsg) == "string" then
							p1.props.authAnalytics.reportAuthClientError(EventStreamConstantsModule.Context.PasskeyLoginAttempt, Data.errorMsg, PasskeyConstants.GENERIC_CREDENTIAL_FETCH_LOGIN_V1)
							
							return
						end
					end
				end
			end, function(p2)
				-- upvalues: Logger (upval), IsIosAuthServiceEnabledFunction (upval), CredentialsProtocolErrorCodes (upval), p1 (upval), TelemetryConfigs (upval)
				Logger:warning("Generic credential signing failed. Error: {}", p2)
				
				if IsIosAuthServiceEnabledFunction() then
					local GetCredentialsErrorCode = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[(if typeof(p2) == "table" then tonumber(p2.errorCode) else tonumber(p2)) or -1]
					
					if GetCredentialsErrorCode == "CANCELLATION_ERROR" then
						p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
						
						return
					end
					p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetErrorConfig, 1, { errorCode = GetCredentialsErrorCode or "rejected" })
				end
			end)
		elseif IsIosAuthServiceEnabledFunction() then
			p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "noSupportedCredentials" })
		end
	end
	
	function p1.handleLoginWithOtp(p2, p3)
		-- upvalues: GetFFlagEnableOtpEmailLoginModule (upval), p1 (copy)
		if not GetFFlagEnableOtpEmailLoginModule() and p1.props.isLoginWithOtpEnabled then return end
		p1.updateIsLoginInProgress(true)
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		p1.unfocusTextBoxes()
		SetBackNavigationDisabledFunction(true)
		
		return p1.props.loginByOtp(p1.props.networking, p1.state.otpSessionToken, p1.state.otpCode, p1.getSecurityQuestionsLoginWithOtpCallback(), p2, p3):andThen(function(Result)
			-- upvalues: p1 (upval)
			p1.handleLoginResult(Result, nil)
		end, function(p4)
			-- upvalues: p1 (upval)
			p1.handleLoginError(p4, p1.state.otpSessionToken, p1.state.otpCode)
			
			return p4.errorKey
		end)
	end
	
	function p1.validateFormCredentials(Text: string): boolean
		return #Text:gsub("%s+", "") > 0
	end
	
	function p1.handleLoginWithFormData(p2, p3, p4, p5)
		-- upvalues: p1 (copy), LoginErrorCodesModule (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), Flag (ref), AppStorageService (upval), LocalStorageKey (upval), LoginResultModule (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), EventStreamConstantsModule (upval), TelemetryConfigs (upval), HttpService (upval), IsNonTerminalLoginErrorFunction (upval), GetFFlagEnableLoginAccountSelectorModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (upval), FFlagEnableLuaAccountSwitchModule (upval), CoarseLoginErrorBucketFunction (upval)
		if not p1.cvalueRef.current or not p1.passwordRef.current then return end
		local Text = p1.cvalueRef.current.Text
		local Text1 = p1.passwordRef.current.Text
		
		if game:GetFastFlag("LuaLoginManualCredentialValidation") and not p1.validateFormCredentials(Text) then
			p1.handleLoginError({
				errorKey = "Authentication.Login.Response.IncorrectUsernamePassword",
				errorCode = LoginErrorCodesModule.IncorrectCValueOrPassword
			}, Text, Text1)
			p1.updateCValueText("")
			
			return
		end
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		p1.unfocusTextBoxes()
		SetBackNavigationDisabledFunction(true)
		local LoginFunction = p1.props.login
		local HandleCaptchaResult = p1.handleCaptchaResult
		local Networking = p1.props.networking
		local SecurityQuestionsLoginWithFormDataCallback = p1.getSecurityQuestionsLoginWithFormDataCallback()
		local ForceLoginByUsername = p1.state.forceLoginByUsername
		
		if FFlagEnableNavigateToLoginAfterLogoutAll then
			Flag = true
		end
		return LoginFunction(Networking, Text, Text1, HandleCaptchaResult, p2, SecurityQuestionsLoginWithFormDataCallback, p3, p4, ForceLoginByUsername):andThen(function(Result)
			-- upvalues: AppStorageService (upval), LocalStorageKey (upval), Text (copy), LoginResultModule (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), p5 (copy), p1 (upval), EventStreamConstantsModule (upval), TelemetryConfigs (upval), HttpService (upval), Text1 (copy)
			AppStorageService:SetItem(LocalStorageKey.CredentialValue, Text)
			AppStorageService:flush()
			
			if LoginResultModule.hasTwoStepData(Result) then
				IosAuthServiceHealthCounters.reportLoginTwoStepRequired({
					credentialType = "password",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			else
				IosAuthServiceHealthCounters.reportLoginSuccess({
					credentialType = "password",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			end
			if p5 then
				p1.props.authAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.CMPasswordLogin, nil, "success")
				
				if IsIosAuthServiceEnabledFunction() and not LoginResultModule.hasTwoStepData(Result) then
					p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginSuccessConfig, 1, { credentialType = "password" })
				end
				if p1.passwordManagerUsageStore then
					p1.passwordManagerUsageStore.setLoggedinUsingSavedPassword(true)
				end
			end
			p1.handleLoginResult(Result, if p5 then nil else HttpService:JSONEncode({ authType = "login", cvalue = Text, password = Text1 }), "password")
		end, function(p6)
			-- upvalues: IsNonTerminalLoginErrorFunction (upval), GetFFlagEnableLoginAccountSelectorModule (upval), p1 (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (upval), FFlagEnableLuaAccountSwitchModule (upval), IosAuthServiceHealthCounters (upval), CoarseLoginErrorBucketFunction (upval), IsIosAuthServiceEnabledFunction (upval), p5 (copy), EventStreamConstantsModule (upval), TelemetryConfigs (upval), Text (copy), Text1 (copy)
			local Inverted = not IsNonTerminalLoginErrorFunction(p6, {
				accountSelectorEnabled = GetFFlagEnableLoginAccountSelectorModule() and not p1.props.appPolicy.getAccountDisambiguationDisabled(),
				securityQuestionsEnabled = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule(),
				accountSwitchEnabled = FFlagEnableLuaAccountSwitchModule
			})
			
			if Inverted then
				IosAuthServiceHealthCounters.reportLoginFailure({
					credentialType = "password",
					errorCode = CoarseLoginErrorBucketFunction(p6),
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			end
			if p5 then
				p1.props.authAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.CMPasswordLogin, nil, "error")
				
				if IsIosAuthServiceEnabledFunction() and Inverted then
					local config = { credentialType = "password" }
					
					if p6 and p6.errorCode ~= nil then
						config.errorCode = tostring(p6.errorCode)
					end
					p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginFailureConfig, 1, config)
				end
			end
			p1.handleLoginError(p6, Text, Text1)
		end)
	end
	
	function p1:renderSecurityQuestions(_, Callback, SecurityQuestionsData)
		-- upvalues: p1 (copy), TypeModule (upval)
		p1.props.renderChallenge({
			forceWebViewVisible = true,
			challengeType = TypeModule.SecurityQuestions,
			challengeParameters = {
				sessionId = SecurityQuestionsData.sessionId,
				userId = SecurityQuestionsData.userId,
				onChallengeCompleted = function(p2)
					-- upvalues: SecurityQuestionsData (copy), Callback (copy)
					Callback({
						sessionId = SecurityQuestionsData.sessionId,
						redemptionToken = p2.redemptionToken
					})
				end,
				onChallengeInvalidated = function(p2)
					-- upvalues: p1 (upval)
					p1.updateIsLoginInProgress(false)
					
					if p1.isMounted then
						if p2.errorCode ~= 0 then
							p1:setState({
								errorKey = false,
								localizedErrorMessage = p2.errorMessage
							})
							
							return
						end
						p1:setState({
							errorKey = "Authentication.Login.Response.SomethingWentWrong"
						})
					end
				end
			},
			onChallengeAbandoned = function()
				-- upvalues: p1 (upval)
				p1.updateIsLoginInProgress(false)
			end,
			onChallengeLoadFailed = function()
				-- upvalues: p1 (upval)
				p1.updateIsLoginInProgress(false)
				
				if p1.isMounted then
					p1:setState({
						errorKey = "Authentication.Login.Response.SomethingWentWrong"
					})
				end
			end
		})
	end
	
	function p1.renderTwoStepChallenge(p2, Value, CredentialType)
		-- upvalues: p1 (copy), GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule (upval), GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule (upval), EnableTwoStepLoginChallengeAnalytics (upval), EventStreamConstantsModule (upval), TypeModule (upval), ActionTypeModule (upval), GetFFlagEnable2SVRecoveryFunction (upval), TwoStepRequestsModule (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), GetFFlagEnableCredentialsProtocolPasswordsModule (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), FFlagEnableLuaAccountSwitchModule (upval), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 (upval), HttpService (upval), TwoStepErrorCodes (upval), GetTwoStepLoginErrorKeyFunction (upval), AccountLinkingAlertType (upval)
		local LaunchAppFunction = p1.props.launchApp
		local Networking = p1.props.networking
		local AppPolicy = p1.props.appPolicy
		local Analytics = p1.props.analytics
		local OmniRecommendationsRequest = p1.props.omniRecommendationsRequest
		local Ticket = p2.twoStepVerificationData.ticket
		local Id = p2.user.id
		local HandleLoginCompletionWithAccountSwitchingFunction = p1.props.handleLoginCompletionWithAccountSwitching
		local ClearApp = p1.props.clearApp
		
		if GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule() then
			wait(GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule())
		end
		if EnableTwoStepLoginChallengeAnalytics then
			p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.TwoStepLoginChallengeRenderInitiated, Ticket)
		end
		p1.props.renderChallenge({
			forceWebViewVisible = true,
			challengeType = TypeModule.TwoStepVerification,
			challengeParameters = {
				allowRememberDevice = true,
				actionType = ActionTypeModule.Login,
				challengeId = Ticket,
				userId = Id,
				clientSupports2svRecovery = if GetFFlagEnable2SVRecoveryFunction() then true else false,
				onChallengeCompleted = function(p3)
					-- upvalues: EnableTwoStepLoginChallengeAnalytics (upval), p1 (upval), EventStreamConstantsModule (upval), Ticket (copy), TwoStepRequestsModule (upval), Networking (copy), Id (copy), Value (copy), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), GetFFlagEnableCredentialsProtocolPasswordsModule (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), CredentialType (copy), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), FFlagEnableLuaAccountSwitchModule (upval), HandleLoginCompletionWithAccountSwitchingFunction (copy), OmniRecommendationsRequest (copy), Analytics (copy), AppPolicy (copy), ClearApp (copy), LaunchAppFunction (copy), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 (upval), HttpService (upval), TwoStepErrorCodes (upval), GetTwoStepLoginErrorKeyFunction (upval), AccountLinkingAlertType (upval)
					if EnableTwoStepLoginChallengeAnalytics then
						p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.TwoStepLoginChallengeCompleted, Ticket)
					end
					TwoStepRequestsModule.login(Networking, Id, Ticket, p3.verificationToken, p3.rememberDevice):andThen(function(Result)
						-- upvalues: Value (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), GetFFlagEnableCredentialsProtocolPasswordsModule (upval), p1 (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), CredentialType (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), FFlagEnableLuaAccountSwitchModule (upval), HandleLoginCompletionWithAccountSwitchingFunction (upval), Networking (upval), OmniRecommendationsRequest (upval), Analytics (upval), AppPolicy (upval), ClearApp (upval), LaunchAppFunction (upval)
						if Value then
							if not FFlagDisableMemStorageServicePasswordEvent then
								MemStorageService:Fire(MemStorageKeysModule.AuthenticatedCredentials, Value)
							end
							if GetFFlagEnableCredentialsProtocolPasswordsModule() and p1.state.isCredentialsProtocolRegisterPasswordAvailable then
								p1.credentialsProtocolRegisterPassword(Value):await()
							end
						end
						ReportEphemeralCounterModule(AppLoginCounterNamesModule.Success, 1)
						
						if CredentialType then
							IosAuthServiceHealthCounters.reportLoginSuccess({
								credentialType = CredentialType,
								iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
							})
						end
						if FFlagEnableLuaAccountSwitchModule then
							HandleLoginCompletionWithAccountSwitchingFunction(Networking, OmniRecommendationsRequest, Analytics, AppPolicy, Result.responseBody.accountBlob, ClearApp, LaunchAppFunction)
							
							return
						else
							LaunchAppFunction(Networking, OmniRecommendationsRequest, Analytics, AppPolicy)
						end
					end, function(p4)
						-- upvalues: ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), CredentialType (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 (upval), HttpService (upval), TwoStepErrorCodes (upval), GetTwoStepLoginErrorKeyFunction (upval), p1 (upval), AccountLinkingAlertType (upval)
						ReportEphemeralCounterModule(AppLoginCounterNamesModule.Failure, 1)
						
						if CredentialType then
							IosAuthServiceHealthCounters.reportLoginFailure({
								errorCode = "twoStepFailed",
								credentialType = CredentialType,
								iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
							})
						end
						local ErrorKey = "Authentication.Login.Response.SomethingWentWrong"
						
						if EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1 then
							local _, Result = pcall(function()
								-- upvalues: HttpService (upval), p4 (copy)
								return HttpService:JSONDecode(p4.Body).errors[1].code
							end)
							
							if Result == TwoStepErrorCodes.IllegalChildAccountLinking then
								ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureTwoStepVerification, 1)
							else
								ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureUnknownError, 1)
							end
							ErrorKey = GetTwoStepLoginErrorKeyFunction(Result)
						else
							ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureUnknownError, 1)
						end
						p1.updateIsLoginInProgress(false)
						
						if p1.isMounted then
							p1:setState({ errorKey = ErrorKey })
						end
						if p4 and p4.Body then
							local Data = HttpService:JSONDecode(p4.Body)
							local Code = Data and (Data.errors and (Data.errors[1] and Data.errors[1].code))
							local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
							
							if Code == TwoStepErrorCodes.AccountLinkingRequired then
								p1.props.showAccountLinkingAlert(AccountLinkingAlertType.IncompatibleAccounts, UserFacingMessage)
							end
							if Code == TwoStepErrorCodes.AccountLinkingFailed then
								p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInConnectionFailure)
							end
						end
					end)
				end,
				onChallengeInvalidated = function(p3)
					-- upvalues: EnableTwoStepLoginChallengeAnalytics (upval), p1 (upval), EventStreamConstantsModule (upval), Ticket (copy)
					if EnableTwoStepLoginChallengeAnalytics then
						p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.TwoStepLoginChallengeInvalidated, Ticket)
					end
					p1.updateIsLoginInProgress(false)
					
					if p1.isMounted then
						if p3.errorCode ~= 0 then
							p1:setState({
								errorKey = false,
								localizedErrorMessage = p3.errorMessage
							})
							
							return
						end
						p1:setState({
							errorKey = "Authentication.Login.Response.SomethingWentWrong"
						})
					end
				end
			},
			onChallengeAbandoned = function()
				-- upvalues: EnableTwoStepLoginChallengeAnalytics (upval), p1 (upval), EventStreamConstantsModule (upval), Ticket (copy)
				if EnableTwoStepLoginChallengeAnalytics then
					p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.TwoStepLoginChallengeAbandoned, Ticket)
				end
				p1.updateIsLoginInProgress(false)
			end,
			onChallengeLoadFailed = function()
				-- upvalues: EnableTwoStepLoginChallengeAnalytics (upval), p1 (upval), EventStreamConstantsModule (upval), Ticket (copy)
				if EnableTwoStepLoginChallengeAnalytics then
					p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.TwoStepLoginChallengeLoadFailed, Ticket)
				end
				p1.updateIsLoginInProgress(false)
				
				if p1.isMounted then
					p1:setState({
						errorKey = "Authentication.Login.Response.SomethingWentWrong"
					})
				end
			end
		})
	end
	
	function p1.handleMultipleUsersPerCredentialError(Users)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), IsStringEmailFunction (upval), IsStringPhoneFunction (upval), AwaitLoginCompletionForDisambiguationFlow (upval), GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction (upval), GetFFlagShouldUsePeekViewForLoginDisambiguationModule (upval)
		local config = {
			titleTextKey = "Authentication.Login.Label.AccountSelectorTitle",
			helpTextKey = "Authentication.Login.Description.AccountSelectorHelp",
			origin = EventStreamConstantsModule.Context.Login,
			context = if p1.state.isLoginByOtp then EventStreamConstantsModule.Context.DisambiguationOTP elseif IsStringEmailFunction(p1.props.cvalue) then EventStreamConstantsModule.Context.DisambiguationEmail elseif IsStringPhoneFunction(p1.props.cvalue) then EventStreamConstantsModule.Context.DisambiguationPhone else "",
			users = Users,
			onAccountSelection = function(p2)
				-- upvalues: p1 (upval), AwaitLoginCompletionForDisambiguationFlow (upval)
				if p1.state.isLoginByOtp then
					if AwaitLoginCompletionForDisambiguationFlow then
						p1.handleLoginWithOtp(nil, p2):await()
						
						return
					else
						p1.handleLoginWithOtp(nil, p2)
						
						return
					end
				elseif AwaitLoginCompletionForDisambiguationFlow then
					p1.handleLoginWithFormData(nil, nil, p2):await()
					
					return
				else
					p1.handleLoginWithFormData(nil, nil, p2)
				end
			end,
			onAccountSelectionAbandoned = function()
				-- upvalues: p1 (upval)
				p1.updateIsLoginInProgress(false)
				p1.state.otpSessionToken = ""
				p1.state.otpCode = ""
				p1.state.isLoginByOtp = false
				p1.props.closeCentralOverlay()
			end,
			screenSize = p1.props.screenSize
		}
		local FFlagEnableLoginDisambiguationFoundationSwitcher = p1.props.showFoundationDisambiguationSelector and GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction()
		
		if FFlagEnableLoginDisambiguationFoundationSwitcher then
			config.hideActions = true
			config.showFoundationDisambiguationSelector = true
		end
		if GetFFlagShouldUsePeekViewForLoginDisambiguationModule() then
			p1.props.closeCentralOverlay()
		end
		p1.props.openAccountSelector(config, FFlagEnableLoginDisambiguationFoundationSwitcher)
	end
	
	function p1.performKeystoreOperations(Networking, PendingLoginRetryCredentials)
		-- upvalues: PromiseModule (upval), FFlagEnableIosKeychainLoginLuaModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), p1 (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), DeleteAllCredentialsFromKeystoreModule (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
		return PromiseModule.new(function(Callback: () -> (), Callback1)
			-- upvalues: FFlagEnableIosKeychainLoginLuaModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), PendingLoginRetryCredentials (ref), GetFFlagRemoveKeystoreIxpLogicFunction (upval), p1 (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), Networking (copy), DeleteAllCredentialsFromKeystoreModule (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), PromiseModule (upval)
			if (FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction()) == false or PendingLoginRetryCredentials == nil then
				Callback()
				
				return
			else
				local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else p1.props.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
				local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
				PendingLoginRetryCredentials = HttpService:JSONDecode(PendingLoginRetryCredentials)
				GetUserByUsernameFunction(Networking, PendingLoginRetryCredentials.cvalue)():andThen(function(Result)
					-- upvalues: Callback1 (copy), GetFFlagKeystoreAutoLoginAvailableFunction (upval), DeleteAllCredentialsFromKeystoreModule (upval), Json (copy), Default (upval), KeystoreConstants (upval)
					return if Result and Result.id then if GetFFlagKeystoreAutoLoginAvailableFunction() then DeleteAllCredentialsFromKeystoreModule(Json):andThen(function()
						-- upvalues: Result (copy)
						return Result
					end) else Default:deleteAllCredentialsFromiOSKeychain(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout):andThen(function()
						-- upvalues: Result (copy)
						return Result
					end) else Callback1("Invalid usernameInfo")
				end):andThen(function(Result)
					-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), PendingLoginRetryCredentials (upval), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), Default (upval), PromiseModule (upval)
					local Json = nil
					
					if GetFFlagRemoveKeystoreIxpLogicFunction() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
						end
						Json = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(PendingLoginRetryCredentials.cvalue),
							userId = tostring(Result.id),
							password = tostring(PendingLoginRetryCredentials.password)
						})
					else
						local Experiment = nil
						if ShouldLoginWithKeystoreCredentials == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(Result.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(Result.id)))
						end
						Json = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(PendingLoginRetryCredentials.cvalue),
							userId = tostring(Result.id),
							password = tostring(PendingLoginRetryCredentials.password),
							experimentGroup = tostring(Experiment)
						})
					end
					return if GetFFlagKeystoreAutoLoginAvailableFunction() then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
						-- upvalues: Default (upval), Json (ref), KeystoreConstants (upval), PromiseModule (upval)
						return if Result and Result.keystore and Result.keystore.isAvailable then Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
					end) else Default:registerCredentials(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_)
					-- upvalues: Callback (copy)
					Callback()
				end):catch(function(Err)
					-- upvalues: GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), Callback1 (copy)
					if GetFFlagAddPromCounterToKeystoreOpsFunction() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "error" } }, 1)
					end
					Callback1(Err)
				end)
			end
		end)
	end
	
	function p1.handleLoginResult(p2, Json, CredentialType)
		-- upvalues: p1 (copy), LoginResultModule (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), GetFFlagEnableCredentialsProtocolPasswordsModule (upval), FFlagEnableLuaAccountSwitchModule (upval), SystemThemeFeatureModule (upval), GetFFlagEnableLoginAccountSelectorModule (upval)
		p1.props.setBackNavigationDisabled(false)
		local SetLoginResultFunction = p1.props.setLoginResult
		local LaunchAppFunction = p1.props.launchApp
		local Networking = p1.props.networking
		local AppPolicy = p1.props.appPolicy
		local Analytics = p1.props.analytics
		local OmniRecommendationsRequest = p1.props.omniRecommendationsRequest
		
		if p1.passwordRef.current then
			p1.passwordRef.current.Text = ""
		end
		local ClearApp = p1.props.clearApp
		local HandleLoginCompletionWithAccountSwitchingFunction = p1.props.handleLoginCompletionWithAccountSwitching
		p1.performKeystoreOperations(Networking, Json):finally(function()
			-- upvalues: LoginResultModule (upval), p2 (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (copy), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), p1 (upval), Json (copy), CredentialType (copy), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), GetFFlagEnableCredentialsProtocolPasswordsModule (upval), FFlagEnableLuaAccountSwitchModule (upval), HandleLoginCompletionWithAccountSwitchingFunction (copy), Networking (copy), OmniRecommendationsRequest (copy), Analytics (copy), AppPolicy (copy), ClearApp (copy), LaunchAppFunction (copy), SystemThemeFeatureModule (upval), GetFFlagEnableLoginAccountSelectorModule (upval)
			if LoginResultModule.hasTwoStepData(p2) then
				if not FFlagRemoveUnusedLoginResultRoduxSlice then
					SetLoginResultFunction(p2)
				end
				ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureTwoStepVerification, 1)
				spawn(function()
					-- upvalues: p1 (upval), p2 (upval), Json (upval), CredentialType (upval)
					p1.renderTwoStepChallenge(p2, Json, CredentialType)
				end)
			else
				if Json then
					if not FFlagDisableMemStorageServicePasswordEvent then
						MemStorageService:Fire(MemStorageKeysModule.AuthenticatedCredentials, Json)
					end
					if GetFFlagEnableCredentialsProtocolPasswordsModule() and p1.state.isCredentialsProtocolRegisterPasswordAvailable then
						p1.credentialsProtocolRegisterPassword(Json):await()
					end
				end
				ReportEphemeralCounterModule(AppLoginCounterNamesModule.Success, 1)
				
				if FFlagEnableLuaAccountSwitchModule then
					HandleLoginCompletionWithAccountSwitchingFunction(Networking, OmniRecommendationsRequest, Analytics, AppPolicy, p2.accountBlob, ClearApp, LaunchAppFunction)
				else
					LaunchAppFunction(Networking, OmniRecommendationsRequest, Analytics, AppPolicy)
					SystemThemeFeatureModule.ClearThemeOverride()
				end
			end
			if GetFFlagEnableLoginAccountSelectorModule() then
				p1.props.closeCentralOverlay()
			end
		end)
	end
	
	function p1.credentialsProtocolRegisterPassword(Input)
		-- upvalues: HttpService (upval), Default (upval), Constants (upval), p1 (copy), EventStreamConstantsModule (upval), Logger (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
		local Data = HttpService:JSONDecode(Input)
		
		if Data.cvalue == nil or Data.password == nil then return end
		return Default:registerCredentials(Default.CredentialsTypes.password, HttpService:JSONEncode({ username = Data.cvalue, password = Data.password }), Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
			-- upvalues: HttpService (upval), p1 (upval), EventStreamConstantsModule (upval), Logger (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
			if Result then
				local Data = HttpService:JSONDecode(Result)
				
				if Data.errorCode == nil then
					if p1.passwordManagerUsageStore then
						p1.passwordManagerUsageStore.setSavedPasswordAfterLogin(true)
					end
					p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.CMPasswordLogin, EventStreamConstantsModule.Button.SavePassword)
					Logger:info("Successfully registered password.")
					IosAuthServiceHealthCounters.reportPasswordSaveSuccess({
						credentialType = "password",
						iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
					})
					
					return
				else
					Logger:warning("Error registering password: " .. tostring(Data.errorMsg))
					IosAuthServiceHealthCounters.reportPasswordSaveFailure({
						credentialType = "password",
						errorCode = tostring(Data.errorCode),
						iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
					})
				end
			end
		end, function(p2)
			-- upvalues: Logger (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
			Logger:warning("Error registering password: " .. tostring(p2))
			IosAuthServiceHealthCounters.reportPasswordSaveFailure({
				credentialType = "password",
				errorCode = "transportError",
				iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
			})
		end)
	end
	
	function p1.logoutAllLoggedInUsersCallback()
		-- upvalues: p1 (copy), AppStorageUtilitiesModule (upval), UserModule (upval), LogoutAllLoggedInUsersModule (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), LoginResultModule (upval), FFlagEnableLuaAccountSwitchModule (upval), AppStorageService (upval), LocalStorageKey (upval), AccountSwitcherConstants (upval), GuiService (upval)
		local Networking = p1.props.networking
		local AccountBlob = AppStorageUtilitiesModule.getAccountBlob()
		local IsNotUserIdMatch = UserModule.fromLocalStorage().userId ~= -1
		p1:setState({
			errorKey = false,
			loginButtonDisabled = true,
			isLoginInProgress = false
		})
		LogoutAllLoggedInUsersModule(Networking, AccountBlob):await()
		local Flag = false
		
		if FFlagEnableNavigateToLoginAfterLogoutAll and p1.pendingLoginRetryCredentials then
			local PendingLoginRetryCredentials = p1.pendingLoginRetryCredentials
			p1.pendingLoginRetryCredentials = nil
			
			if PendingLoginRetryCredentials.isPasswordLogin then
				local Success, Result = pcall(function()
					-- upvalues: p1 (upval), Networking (copy), PendingLoginRetryCredentials (copy)
					return p1.props.login(Networking, PendingLoginRetryCredentials.cvalue, PendingLoginRetryCredentials.password):expect()
				end)
				
				if Success and Result and not LoginResultModule.hasTwoStepData(Result) then
					if FFlagEnableLuaAccountSwitchModule then
						p1.props.handleLoginCompletionWithAccountSwitching(Networking, p1.props.omniRecommendationsRequest, p1.props.analytics, p1.props.appPolicy, Result.accountBlob, p1.props.clearApp, p1.props.launchApp)
						
						return
					else
						p1.props.launchApp(Networking, p1.props.omniRecommendationsRequest, p1.props.analytics, p1.props.appPolicy)
						
						return
					end
				end
			elseif type(PendingLoginRetryCredentials.cvalue) == "table" then
				Flag = true
			end
		end
		if IsNotUserIdMatch == true then
			p1.props.resetAppState()
			AppStorageService:SetItem(LocalStorageKey.CredentialValue, "")
			AppStorageService:flush()
			
			if FFlagEnableNavigateToLoginAfterLogoutAll then
				AppStorageUtilitiesModule.setAccountSwitchStatus(if Flag then AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV1AfterLogoutAll else AccountSwitcherConstants.AccountSwitcherPendingLoginAfterLogoutAll)
				AppStorageUtilitiesModule.flush()
			end
			p1.props.logoutWithoutShowConfirmation(Networking, GuiService)
		end
		p1:setState({ loginButtonDisabled = false })
		p1.props.closeCentralOverlay()
	end
	
	function p1.handleLoginError(p2, Cvalue, Password)
		-- upvalues: FFlagEnableNavigateToLoginAfterLogoutAll (upval), Flag (ref), p1 (copy), GetFFlagEnableLoginAccountSelectorModule (upval), LoginErrorCodesModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule (upval), ReportEphemeralCounterModule (upval), AppLoginCounterNamesModule (upval), StatusCodes (upval), FFlagEnableLuaAccountSwitchModule (upval), AppStorageUtilitiesModule (upval), ConstantsModule (upval), IsStringEmailFunction (upval), CredentialTypeModule (upval), GetFFlagEnableVNGNewAppAvailableModalModule (upval), GetFStringVNGDownloadNowUrlModule (upval), AccountLinkingAlertType (upval)
		local IsPasswordLogin = false
		
		if FFlagEnableNavigateToLoginAfterLogoutAll then
			IsPasswordLogin = Flag
			Flag = false
		end
		local Cvalue1 = if IsPasswordLogin then if type(Cvalue) == "string" then Cvalue else "" else (if p1.cvalueRef and p1.cvalueRef.current then p1.cvalueRef.current.Text else "") or ""
		p1.props.setBackNavigationDisabled(false)
		local ForceLoginByUsername = p1.state.forceLoginByUsername
		local ErrorHandlingInfo = p1.errorHandlingInfoList[p2.errorCode]
		
		if ErrorHandlingInfo then
			ForceLoginByUsername = ErrorHandlingInfo.forceLoginByUsername or ForceLoginByUsername
		end
		local IsLoginInProgress = false
		local Inverted: boolean = GetFFlagEnableLoginAccountSelectorModule() and (p2.errorCode == LoginErrorCodesModule.MultipleUsersPerCredential and not p1.props.appPolicy.getAccountDisambiguationDisabled())
		local IsErrorCodeMatch: boolean = p1.props.appPolicy.getLinkedAuthEndpointsEnabled() and (p2.errorCode == LoginErrorCodesModule.AccountLinkingRequired or p2.errorCode == LoginErrorCodesModule.AccountLinkingFailed)
		local IsErrorCodeMatch1: boolean = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule() and p2.errorCode == LoginErrorCodesModule.SecurityQuestions
		
		if Inverted or IsErrorCodeMatch1 or p2.errorCode == LoginErrorCodesModule.Captcha then
			IsLoginInProgress = true
		end
		ReportEphemeralCounterModule(AppLoginCounterNamesModule.Failure, 1)
		
		if p2.errorCode == LoginErrorCodesModule.Captcha then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureCaptcha, 1)
		elseif p2.errorCode == LoginErrorCodesModule.IncorrectCValueOrPassword then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureCredentials, 1)
		elseif p2.errorCode == LoginErrorCodesModule.AccountLocked then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailurePasswordReset, 1)
		elseif p2.errorCode == LoginErrorCodesModule.CTypeNotSupported then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureBadRequest, 1)
		elseif p2.errorCode == LoginErrorCodesModule.CValueAndPasswordRequired then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureBadRequest, 1)
		elseif IsErrorCodeMatch1 then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureSecurityQuestions, 1)
		elseif p2.errorCode == LoginErrorCodesModule.MultipleUsersPerCredential then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureMultipleUsersPerCredential, 1)
		elseif p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureThrottled, 1)
		elseif p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.REQUEST_TIMEOUT then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureTimeout, 1)
		elseif p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.BAD_REQUEST then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureBadRequest, 1)
		elseif p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.NOT_FOUND then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureNotFound, 1)
		elseif p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureInternalServerError, 1)
		else
			ReportEphemeralCounterModule(AppLoginCounterNamesModule.FailureUnknownError, 1)
		end
		if FFlagEnableLuaAccountSwitchModule == true and p2.errorCode == LoginErrorCodesModule.EmptyAccountSwitchBlobRequired then
			p1:setState({ errorKey = false })
			
			if FFlagEnableNavigateToLoginAfterLogoutAll then
				p1.pendingLoginRetryCredentials = {
					cvalue = Cvalue,
					password = Password,
					isPasswordLogin = IsPasswordLogin
				}
				AppStorageUtilitiesModule.setAccountSwitchTargetUsername(Cvalue1)
			end
			p1.props.openAccountSwitchingErrorOverlay(if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.LogoutConfirmation", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, ConstantsModule.Auth.AccountSwitcherLoginEmptyBlobRequiredError, Cvalue or nil)
		end
		if FFlagEnableLuaAccountSwitchModule == true and p2.errorCode == LoginErrorCodesModule.ParentEmptyAccountSwitchBlobRequired then
			p1:setState({ errorKey = false })
			
			if FFlagEnableNavigateToLoginAfterLogoutAll then
				p1.pendingLoginRetryCredentials = {
					cvalue = Cvalue,
					password = Password,
					isPasswordLogin = IsPasswordLogin
				}
				AppStorageUtilitiesModule.setAccountSwitchTargetUsername(Cvalue1)
			end
			p1.props.openAccountSwitchingErrorOverlay(if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", if p1.props.showAccountSwitcherFoundationDesign then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, ConstantsModule.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError, Cvalue or nil)
		end
		if p2.errorCode == LoginErrorCodesModule.AccountLocked then
			p1.props.openPasswordResetPrompt()
		end
		if p2.errorCode == LoginErrorCodesModule.AccountNotVerified and IsStringEmailFunction(Cvalue) and p1.canVerifyCredentials(CredentialTypeModule.Email, Cvalue, Password) then
			p1.props.openEmailVerificationPrompt(Cvalue, Password, p1.closeVerificationEmailModal)
		end
		if GetFFlagEnableVNGNewAppAvailableModalModule() and p2.errorCode == LoginErrorCodesModule.GlobalAppAccessDeniedVNG and p1.isMounted then
			p1.props.openNewAppAvailableModal(function()
				-- upvalues: GetFStringVNGDownloadNowUrlModule (upval), p1 (upval)
				p1.props.linking:openURL((GetFStringVNGDownloadNowUrlModule()))
			end)
		end
		if GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginModule() and p2.errorCode == LoginErrorCodesModule.SecurityQuestions and (p2.securityQuestionsData and p2.securityQuestionsCallback) then
			task.spawn(function()
				-- upvalues: p1 (upval), Cvalue (copy), Password (copy), p2 (copy)
				if p1.isMounted then
					p1.renderSecurityQuestions(Cvalue, Password, p2.securityQuestionsCallback, p2.securityQuestionsData)
				end
			end)
		end
		if Inverted then
			if p2.usersData then
				p1.handleMultipleUsersPerCredentialError(p2.usersData)
			end
		elseif p2.errorCode == LoginErrorCodesModule.MultipleUsersPerCredential then
			p2.errorKey = "Authentication.Login.Response.MoreThanOneUsername"
		end
		if p2.errorCode == LoginErrorCodesModule.PlatformNotSupported then
			p2.errorKey = "Authentication.Login.Error.PlatformAccountConnectionFailure"
		end
		if IsErrorCodeMatch then
			if p2.errorCode == LoginErrorCodesModule.AccountLinkingRequired then
				p1.props.showAccountLinkingAlert(AccountLinkingAlertType.IncompatibleAccounts, p2.userFacingMessage)
			elseif p2.errorCode == LoginErrorCodesModule.AccountLinkingFailed then
				p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInConnectionFailure)
			end
		end
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy), ForceLoginByUsername (ref)
			if p1.isMounted then
				p1:setState({
					errorKey = p2.errorKey,
					errorCode = p2.errorCode,
					forceLoginByUsername = ForceLoginByUsername
				})
			end
		end)
		p1.updateIsLoginInProgress(IsLoginInProgress)
	end
	
	function p1.onLoginButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.state.loginButtonDisabled then return end
		if not p1.state.isLoginInProgress then
			p1.updateIsLoginInProgress(true)
			p1.props.authAnalytics.reportLogInButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
			p1.handleLoginWithFormData()
			
			return
		end
	end
	
	function p1.onForgetButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), GetFFlagEnableLuafiedRecoveryFlowFunction (upval), EnrolledInLuafiedRecoveryExperimentFunction (upval), AppPageModule (upval), ContentProvider (upval), TransitionAnimationModule (upval)
		if p1.state.isLoginInProgress then return end
		p1.unfocusTextBoxes()
		p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Button.ForgotPassword)
		p1.props.authAnalytics.reportForgotPasswordButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
		
		if GetFFlagEnableLuafiedRecoveryFlowFunction() and EnrolledInLuafiedRecoveryExperimentFunction() then
			p1.props.navigateToPage({
				name = AppPageModule.AccountRecovery,
				extraProps = {
					recoverPassword = true,
					identifier = p1.cvalueRef and p1.cvalueRef.current and p1.cvalueRef.current.Text or (p1.cvalueText and p1.cvalueText:getValue() or "")
				}
			})
			
			return
		end
		if p1.props.appPolicy.shouldUseExternalBrowserForDisclaimerLinks() then
			p1.props.linking:openURL(ContentProvider.BaseUrl .. "login/forgot-password-or-username")
			
			return
		else
			p1.props.navigateToPage({
				name = AppPageModule.GenericWebPage,
				detail = ContentProvider.BaseUrl .. "login/forgot-password-or-username",
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.SlideInFromRight
				}
			})
		end
	end
	
	function p1.onCrossDeviceLoginActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), GetFFlagReportCrossAppLoginAttemptModule (upval), RbxAnalyticsService (upval)
		if p1.state.isLoginInProgress then return end
		p1.unfocusTextBoxes()
		p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Button.QuickLogin)
		p1.props.authAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.Login, EventStreamConstantsModule.Button.LoginOtherDevice)
		
		if not p1.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton() then
			p1.props.openCrossDeviceLoginPrompt(p1.handleLoginWithCode)
			
			return
		end
		if GetFFlagReportCrossAppLoginAttemptModule() then
			RbxAnalyticsService:ReportCounter("CrossAppLoginAttempt", 1)
		end
		p1.props.openCrossAppLoginPrompt(p1.handleLoginWithCode)
	end
	
	function p1.topButtonActivatedTracking()
		-- upvalues: FFlagEnableLuaAccountSwitchModule (upval), p1 (copy), EventStreamConstantsModule (upval)
		if FFlagEnableLuaAccountSwitchModule == true and p1.isAlreadyAuthenticated == true then
			resetDefaultTheme()
		end
		p1.props.authAnalytics.reportDismissCornerXButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
	end
	
	function p1.onEmailOtpLoginAbandoned()
		-- upvalues: p1 (copy)
		p1.state.isLoginByOtp = false
	end
	
	function p1.onEmailOtpLoginCompleted(OtpSessionToken, OtpCode)
		-- upvalues: p1 (copy)
		p1.state.otpSessionToken = OtpSessionToken
		p1.state.otpCode = OtpCode
		
		return p1.handleLoginWithOtp(nil, nil)
	end
	
	function p1.onEmailOtpLoginActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if not p1.state.isLoginInProgress then
			p1.unfocusTextBoxes()
			p1.props.openEmailOtp({
				origin = "login",
				codeLength = 6,
				enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode",
				enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp",
				enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode",
				enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2",
				onSubmitCode = p1.onEmailOtpLoginCompleted,
				onModalAbandoned = p1.onEmailOtpLoginAbandoned,
				screenSize = p1.props.screenSize
			})
			p1.state.isLoginByOtp = true
			p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Button.EmailOtp)
			p1.props.authAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.Login, EventStreamConstantsModule.Button.OneTimePasscode)
			
			return
		end
	end
	
	function p1.closeVerificationEmailModal(p2)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.updateCValueText(p2)
			
			if p2 ~= "" and p1.passwordRef.current then
				p1.passwordRef.current:CaptureFocus()
			end
			p1:setState({
				errorCode = -1,
				errorKey = "",
				forceLoginByUsername = false
			})
		end
	end
	
	p1.events = {}
	p1.props.authAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.LoginScreen)
end

function LoginView.didMount(p1)
	-- upvalues: EventStreamConstantsModule (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), FFlagEnableLuaAccountSwitchModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), SystemThemeFeatureModule (copy), FFlagEnableVNGDUARSignupComplianceModule (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), LoginButtonAutoDisabled (copy), UiMode (copy), UserInputService (copy), FixLoginSelection (copy), GuiService (copy), AppPageModule (copy), HttpService (copy), GetFFlagLuaAppEnableDesktopDualLoginABTestFunction (copy), GetIXPLayerParametersModule (copy), GetFFlagEnableCredentialsProtocolPasswordsModule (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), IsIosAuthServiceEnabledFunction (copy), TelemetryConfigs (copy), Logger (copy), LocalizationService (copy)
	p1.isMounted = true
	p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.LoginForm)
	p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.LoginScreen, if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL())
	
	if FFlagEnableLuaAccountSwitchModule == true and p1.isAlreadyAuthenticated == true then
		MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, "dark")
	end
	SystemThemeFeatureModule.SetDarkThemeOverride()
	
	if FFlagEnableVNGDUARSignupComplianceModule and p1.props.appPolicy.getLoginUsernameOnly() then
		p1:setState({ forceLoginByUsername = true })
	end
	if FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction() then
		if p1.props.usernameFromIosKeychain then
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.autoPopulatedUsername)
			p1.updateCValueText(p1.props.usernameFromIosKeychain)
		end
		if p1.props.passwordFromIosKeychain then
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.autoPopulatedPassword)
			p1.updatePasswordText(p1.props.passwordFromIosKeychain)
		end
		if LoginButtonAutoDisabled then
			p1:setState({
				loginButtonDisabled = not (p1.props.usernameFromIosKeychain and p1.props.passwordFromIosKeychain)
			})
		else
			p1:setState({ loginButtonDisabled = false })
		end
	end
	local function isWithinBounds(Position, Frame: Frame): boolean
		-- upvalues: p1 (copy), UiMode (upval)
		if p1.props.uiModeInfo.uiMode == UiMode.VR then
			error("Input position is not supported in VR")
		end
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		
		return AbsolutePosition.X < Position.X and (Position.X < AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < Position.Y) and Position.Y < AbsolutePosition.Y + AbsoluteSize.Y
	end
	
	local function getNextSelectedObject(Current)
		-- upvalues: UserInputService (upval), FixLoginSelection (upval), p1 (copy)
		return if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then if FixLoginSelection then p1.focusRef and (p1.focusRef.current and p1.focusRef.current.NextSelectionUp) else Current.NextSelectionUp elseif FixLoginSelection then p1.focusRef and (p1.focusRef.current and p1.focusRef.current.NextSelectionDown) else Current.NextSelectionDown
	end
	
	local function getNewSelectedObject()
		-- upvalues: FixLoginSelection (upval), p1 (copy), GuiService (upval), getNextSelectedObject (copy)
		local NextSelectedObject = getNextSelectedObject(if FixLoginSelection then p1.focusRef and p1.focusRef.current else GuiService.SelectedObject)
		
		if NextSelectedObject == p1.loginButtonRef.current and p1.state.loginButtonDisabled then
			NextSelectedObject = getNextSelectedObject(NextSelectedObject)
		end
		if p1.isMounted then
			p1:setState({
				forgotLinkFocused = NextSelectedObject == p1.forgotLinkRef.current
			})
		end
		return NextSelectedObject
	end
	
	table.insert(p1.events, UserInputService.InputBegan:connect(function(Input, _)
		-- upvalues: p1 (copy), AppPageModule (upval), FixLoginSelection (upval), GuiService (upval), getNewSelectedObject (copy)
		if p1.props.currentPageName ~= AppPageModule.Login then return end
		if Input.UserInputType == Enum.UserInputType.Keyboard then
			if Input.KeyCode ~= Enum.KeyCode.Return then
				if Input.KeyCode == Enum.KeyCode.Tab then
					local Current = if FixLoginSelection then p1.focusRef and p1.focusRef.current else GuiService.SelectedObject
					
					if not Current then return end
					local NewSelectedObject = getNewSelectedObject()
					
					if not NewSelectedObject then return end
					if Current:IsA("TextBox") and Current.ManualFocusRelease then
						Current:ReleaseFocus()
					end
					if FixLoginSelection then
						p1.focusRef.current = NewSelectedObject
					else
						GuiService.SelectedObject = NewSelectedObject
					end
					if NewSelectedObject:IsA("TextBox") then
						NewSelectedObject:CaptureFocus()
					end
				end
			elseif p1.state.forgotLinkFocused then
				p1.onForgetButtonActivated()
				
				return
			else
				p1.onLoginButtonActivated()
				
				return
			end
		end
	end))
	table.insert(p1.events, UserInputService.InputEnded:connect(function(Input, _)
		-- upvalues: p1 (copy), AppPageModule (upval), UiMode (upval), UserInputService (upval), isWithinBounds (copy)
		if p1.props.currentPageName ~= AppPageModule.Login then return end
		if p1.props.uiModeInfo.uiMode == UiMode.VR then return end
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			local Position = Input.Position
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if not p1.cvalueRef.current or not p1.passwordRef.current then return end
			if not FocusedTextBox then return end
			local IsWithinBounds = isWithinBounds(Position, p1.cvalueRef.current)
			local IsWithinBounds1 = isWithinBounds(Position, p1.passwordRef.current)
			
			if FocusedTextBox == p1.cvalueRef.current and IsWithinBounds1 then
				p1.cvalueRef.current:ReleaseFocus()
				p1.passwordRef.current:CaptureFocus()
				
				return
			end
			if FocusedTextBox == p1.passwordRef.current and IsWithinBounds then
				p1.passwordRef.current:ReleaseFocus()
				p1.cvalueRef.current:CaptureFocus()
				
				return
			end
			if not IsWithinBounds and not IsWithinBounds1 and (FocusedTextBox == p1.cvalueRef.current or FocusedTextBox == p1.passwordRef.current) then
				FocusedTextBox:ReleaseFocus()
			end
		end
	end))
	table.insert(p1.events, UserInputService.TextBoxFocused:connect(function(TextBox)
		-- upvalues: p1 (copy), AppPageModule (upval), FixLoginSelection (upval), GuiService (upval)
		if p1.props.currentPageName ~= AppPageModule.Login then return end
		if p1.state.isLoginInProgress then
			TextBox:ReleaseFocus()
			
			return
		end
		if FixLoginSelection then
			p1.focusRef.current = TextBox
			
			return
		else
			GuiService.SelectedObject = TextBox
		end
	end))
	table.insert(p1.events, UserInputService.TextBoxFocusReleased:connect(function(_)
		-- upvalues: p1 (copy), AppPageModule (upval), FixLoginSelection (upval), GuiService (upval)
		if p1.props.currentPageName ~= AppPageModule.Login then return end
		if FixLoginSelection then
			p1.focusRef.current = nil
			
			return
		else
			GuiService.SelectedObject = nil
		end
	end))
	table.insert(p1.events, MemStorageService:bind(MemStorageKeysModule.AutoFillCredentials, function(Input)
		-- upvalues: p1 (copy), AppPageModule (upval), HttpService (upval)
		if p1.props.currentPageName ~= AppPageModule.Login then return end
		if p1.state.isLoginInProgress then return end
		local Data = HttpService:JSONDecode(Input)
		
		if Data then
			p1.updateCValueText(Data.cvalue)
			p1.updatePasswordText(Data.password)
		end
	end))
	
	if GetFFlagLuaAppEnableDesktopDualLoginABTestFunction() then
		GetIXPLayerParametersModule(p1.props.networking, "PlayerApp.Login", { "isDesktopDualLoginEnabled" }):andThen(function(Result)
			-- upvalues: p1 (copy)
			local ResponseBody = Result and Result.responseBody
			
			if ResponseBody and p1.isMounted then
				local IsDesktopDualLoginEnabled = ResponseBody.isDesktopDualLoginEnabled
				
				if IsDesktopDualLoginEnabled then
					p1:setState({ isDesktopDualLoginEnabled = IsDesktopDualLoginEnabled })
				end
			end
		end, function() end)
	end
	if GetFFlagEnableCredentialsProtocolPasswordsModule() then
		local SupportsDeviceBoundOnly = false
		local IsAvailable = false
		local HasPassword = false
		Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
			-- upvalues: SupportsDeviceBoundOnly (ref), IsAvailable (ref), HasPassword (ref), p1 (copy), IsIosAuthServiceEnabledFunction (upval), TelemetryConfigs (upval)
			if Result.FIDO2 == nil then
				SupportsDeviceBoundOnly = Result.isAvailable and Result.supportsDeviceBoundOnly
			else
				SupportsDeviceBoundOnly = Result.FIDO2.isAvailable and Result.FIDO2.supportsDeviceBoundOnly
				IsAvailable = Result.password and Result.password.isAvailable
				HasPassword = Result.password ~= nil
				
				if p1.isMounted then
					p1:setState({
						isCredentialsProtocolRegisterPasswordAvailable = IsAvailable
					})
				end
			end
			if HasPassword then
				p1.showGenericCredentialLoginPopup(SupportsDeviceBoundOnly, IsAvailable)
				
				return
			end
			if SupportsDeviceBoundOnly then
				p1.showPasskeyLoginPopup()
				
				return
			end
			if IsIosAuthServiceEnabledFunction() then
				p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "protocolNotSupported" })
			end
		end):catch(function(Err)
			-- upvalues: Logger (upval), IsIosAuthServiceEnabledFunction (upval), p1 (copy), TelemetryConfigs (upval)
			Logger:warning("Error checking for available credential types. Error: {}", Err)
			
			if IsIosAuthServiceEnabledFunction() then
				p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "protocolUnavailable" })
			end
		end):finally(function()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval), IsAvailable (ref), SupportsDeviceBoundOnly (ref)
			p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.CMPasswordLogin, (tostring(IsAvailable)))
			p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.PasskeyLogin, if SupportsDeviceBoundOnly == nil then "timeout" else tostring(SupportsDeviceBoundOnly))
		end)
	else
		local SupportsDeviceBoundOnly1 = false
		Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
			-- upvalues: SupportsDeviceBoundOnly1 (ref), p1 (copy)
			SupportsDeviceBoundOnly1 = Result.isAvailable and Result.supportsDeviceBoundOnly
			
			if SupportsDeviceBoundOnly1 then
				p1.showPasskeyLoginPopup()
			end
		end):catch(function(Err)
			warn("Error checking if FIDO2 passkeys is available. Error: ", Err)
		end):finally(function()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval), SupportsDeviceBoundOnly1 (ref)
			p1.props.authAnalytics.reportAuthPageload(EventStreamConstantsModule.Context.PasskeyLogin, if SupportsDeviceBoundOnly1 == nil then "timeout" else tostring(SupportsDeviceBoundOnly1))
		end)
	end
	if LocalizationService.RobloxLocaleId:match("^en") then
		GetIXPLayerParametersModule(p1.props.networking, "PlayerApp.Login", { "CrossDeviceButtonText" }):andThen(function(Result)
			-- upvalues: p1 (copy)
			local ResponseBody = Result and Result.responseBody
			
			if ResponseBody and p1.isMounted then
				local CrossDeviceButtonText = ResponseBody.CrossDeviceButtonText
				
				if CrossDeviceButtonText then
					p1:setState({ quickLoginButtonTextOverride = CrossDeviceButtonText })
				end
			end
		end, function() end)
	end
	p1.props.loggingProtocol:logEventOnce("login_view_did_mount")
	p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LoginPageMountTelemetryConfig, 1, { version = 1 })
end

function LoginView.willUnmount(p1)
	-- upvalues: FFlagEnableLuaAccountSwitchModule (copy)
	if FFlagEnableLuaAccountSwitchModule == true and p1.isAlreadyAuthenticated == true then
		resetDefaultTheme()
	end
	p1.unfocusTextBoxes()
	
	for _, event in ipairs(p1.events) do
		event:Disconnect()
	end
	p1.events = {}
	p1.isMounted = false
end

function LoginView.didUpdate(p2, _, p3)
	if p2.state.errorCode == -1 then return end
	local IsLoginInProgress = p2.state.isLoginInProgress
	
	if p3.isLoginInProgress and not IsLoginInProgress then
		local ErrorHandlingInfo = p2.errorHandlingInfoList[p2.state.errorCode]
		
		if not ErrorHandlingInfo then return end
		if ErrorHandlingInfo.textBoxesToClear then
			for _, value in pairs(ErrorHandlingInfo.textBoxesToClear) do
				if value == 1 then
					p2.updateCValueText("")
				elseif value == 2 then
					p2.updatePasswordText("")
				end
			end
		end
		if ErrorHandlingInfo.newFocusedTextBox == 1 and p2.cvalueRef.current then
			p2.cvalueRef.current:CaptureFocus()
			
			return
		end
		if ErrorHandlingInfo.newFocusedTextBox == 2 and p2.passwordRef.current then
			p2.passwordRef.current:CaptureFocus()
		end
	end
end

function LoginView.render(p4)
	-- upvalues: UiMode (copy), GetFFlagLuaAppEnableDesktopDualLoginABTestFunction (copy), FFlagEnableVNGDUARSignupComplianceModule (copy), FFlagAuthSecExclusions (copy), GetFFlagEnableOtpEmailLoginModule (copy), FFlagEnableKoreaKISAComplianceModule (copy), WithStyleFunction (copy), FlagSettingsModule (copy), WithLocalizationModule (copy), DualLoginWithContentsLayoutModule (copy), LogoWithContentsLayoutModule (copy), RoactModule (copy), AlignmentModule (copy), CredentialLoginContainerModule (copy), LoginCodePromptModule (copy), LinkButton (copy), DisclaimerLinksModule (copy), YOffset (copy)
	local ErrorKey = if p4.state.errorKey == "" then nil else p4.state.errorKey or nil
	local LocalizedErrorMessage = p4.state.errorKey == false and p4.state.localizedErrorMessage or nil
	local IsNotUiModeMatch: boolean = not p4.props.appPolicy.getWebViewSupport() and p4.props.uiModeInfo.uiMode ~= UiMode.VR
	local IsUiModeMatch: boolean = p4.props.uiModeInfo.uiMode == UiMode.TenFoot or p4.props.uiModeInfo.uiMode == UiMode.VR
	local IsDesktopDualLoginEnabled = GetFFlagLuaAppEnableDesktopDualLoginABTestFunction() and p4.state.isDesktopDualLoginEnabled
	local IsUiModeMatch1 = IsUiModeMatch or p4.props.appPolicy.getEnableDualLogin() and IsDesktopDualLoginEnabled
	local FFlagEnableVNGDUARSignupComplianceModule1 = p4.props.appPolicy.getDisableEmailOTPLogin() and (FFlagEnableVNGDUARSignupComplianceModule or FFlagAuthSecExclusions)
	local NoFFlagEnableVNGDUARSignupComplianceModule1: boolean = GetFFlagEnableOtpEmailLoginModule() and (p4.props.isLoginWithOtpEnabled and not FFlagEnableVNGDUARSignupComplianceModule1)
	local UseVNGUserAgreementPopup = p4.props.appPolicy.getUseVNGUserAgreementPopup()
	local UseKoreaKISAUserAgreementPopup = FFlagEnableKoreaKISAComplianceModule and p4.props.appPolicy.getUseKoreaKISAUserAgreementPopup()
	local DisableLoginForgotButton = FFlagEnableVNGDUARSignupComplianceModule and p4.props.appPolicy.getDisableLoginForgotButton()
	
	return WithStyleFunction(function(p5)
		-- upvalues: FlagSettingsModule (upval), IsUiModeMatch1 (copy), FFlagAuthSecExclusions (upval), p4 (copy), IsNotUiModeMatch (ref), WithLocalizationModule (upval), ErrorKey (copy), IsUiModeMatch (copy), DualLoginWithContentsLayoutModule (upval), LogoWithContentsLayoutModule (upval), UiMode (upval), RoactModule (upval), AlignmentModule (upval), CredentialLoginContainerModule (upval), LocalizedErrorMessage (copy), UseVNGUserAgreementPopup (copy), UseKoreaKISAUserAgreementPopup (copy), NoFFlagEnableVNGDUARSignupComplianceModule1 (copy), LoginCodePromptModule (upval), DisableLoginForgotButton (copy), LinkButton (upval), DisclaimerLinksModule (upval), YOffset (upval)
		local NoIsUiModeMatch1: boolean = FlagSettingsModule.CrossDeviceLoginRolloutEnabledForDevice() and not IsUiModeMatch1
		local NoIsUiModeMatch1_1: boolean = (not FFlagAuthSecExclusions or not p4.props.appPolicy.getExcludeCrossDeviceSignIn()) and NoIsUiModeMatch1
		local ShowVNGLoginWithExistingAccountQuickLoginButton = p4.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton()
		
		if p4.props.appPolicy.getDisableRegularLogin() == false then
			IsNotUiModeMatch = false
		end
		return WithLocalizationModule({
			logInText = "Authentication.Login.Action.SignIn",
			forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized",
			passwordPlaceholder = "CommonUI.Messages.Label.Password",
			twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification",
			crossDeviceLoginHeader = "Authentication.CrossDevice.Heading.QuickLogin",
			loginWithExistingAccountButtonText = "Authentication.CrossDevice.Heading.QuickLogin",
			orText = "CommonUI.Messages.Label.OR",
			localizedError = ErrorKey,
			cvaluePlaceholder = if p4.state.forceLoginByUsername then "Authentication.Login.Label.Username" else "Authentication.Login.Label.UsernameEmailPhone"
		})(function(p6)
			-- upvalues: p4 (upval), ShowVNGLoginWithExistingAccountQuickLoginButton (copy), IsUiModeMatch (upval), DualLoginWithContentsLayoutModule (upval), LogoWithContentsLayoutModule (upval), UiMode (upval), RoactModule (upval), AlignmentModule (upval), IsUiModeMatch1 (upval), CredentialLoginContainerModule (upval), NoIsUiModeMatch1_1 (ref), LocalizedErrorMessage (upval), IsNotUiModeMatch (upval), UseVNGUserAgreementPopup (upval), UseKoreaKISAUserAgreementPopup (upval), NoFFlagEnableVNGDUARSignupComplianceModule1 (upval), p5 (copy), LoginCodePromptModule (upval), DisableLoginForgotButton (upval), LinkButton (upval), DisclaimerLinksModule (upval), YOffset (upval)
			local LoginWithExistingAccountButtonText = if p4.state.quickLoginButtonTextOverride == "" then if ShowVNGLoginWithExistingAccountQuickLoginButton then p6.loginWithExistingAccountButtonText else p6.crossDeviceLoginHeader elseif ShowVNGLoginWithExistingAccountQuickLoginButton then p6.loginWithExistingAccountButtonText else p4.state.quickLoginButtonTextOverride or p6.crossDeviceLoginHeader
			local IsNotUiModeMatch1: boolean = IsUiModeMatch and p4.props.uiModeInfo.uiMode ~= UiMode.VR
			
			return RoactModule.createElement(if IsUiModeMatch then DualLoginWithContentsLayoutModule else LogoWithContentsLayoutModule, {
				ContentAlign = AlignmentModule.Top,
				topButtonActivatedTracking = p4.topButtonActivatedTracking,
				topButtonEnabled = not p4.state.isLoginInProgress,
				statusBarHeight = p4.props.statusBarHeight,
				globalGuiInset = p4.props.globalGuiInset,
				screenSize = p4.props.screenSize,
				isDualLayout = IsUiModeMatch1,
				navigateBack = if IsUiModeMatch then p4.props.navigateBack else nil,
				buttonRef = p4.props.containerRef
			}, {
				UIListLayout = IsUiModeMatch1 and RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}) or RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 15)
				}),
				Form = if IsUiModeMatch1 then RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0.5, 0, 1, 0)
				}, {
					FormContent = RoactModule.createElement(CredentialLoginContainerModule, {
						Size = UDim2.new(0, 0, 1, 0),
						crossDeviceLoginEnabled = NoIsUiModeMatch1_1,
						quickLoginButtonText = LoginWithExistingAccountButtonText,
						loginWithExistingAccountVariantEnabled = ShowVNGLoginWithExistingAccountQuickLoginButton,
						handleLoginWithFormDataCallback = p4.handleLoginWithFormData,
						updateIsLoginInProgress = p4.updateIsLoginInProgress,
						cvalueText = p4.cvalueText,
						passwordText = p4.passwordText,
						onTextBoxesChanged = p4.onTextBoxesChanged,
						buttonRef = p4.props.defaultRef,
						cvalueRef = p4.cvalueRef,
						passwordRef = p4.passwordRef,
						loginButtonRef = p4.loginButtonRef,
						forgotLinkRef = p4.forgotLinkRef,
						crossDeviceButtonRef = p4.crossDeviceButtonRef,
						emailOtpRef = p4.emailOtpRef,
						localizedError = p6.localizedError,
						localizedErrorMessage = LocalizedErrorMessage,
						forceLoginByUsername = p4.state.forceLoginByUsername or IsUiModeMatch,
						onCrossDeviceLoginActivated = p4.onCrossDeviceLoginActivated,
						onEmailOtpActivated = p4.onEmailOtpLoginActivated,
						loginButtonDisabled = p4.state.loginButtonDisabled,
						isLoginInProgress = p4.state.isLoginInProgress,
						authAnalytics = p4.props.authAnalytics,
						disableRegularLogin = IsNotUiModeMatch,
						showLinkAccountText = IsNotUiModeMatch1,
						showForgotButton = not IsNotUiModeMatch and not IsUiModeMatch,
						onForgetButtonActivated = p4.onForgetButtonActivated,
						maxSizeX = 1e999,
						showDisclaimerLinks = not IsUiModeMatch and not (UseVNGUserAgreementPopup or UseKoreaKISAUserAgreementPopup),
						showDisclaimerButtons = IsUiModeMatch and not UseVNGUserAgreementPopup,
						showCredentialHeader = not IsUiModeMatch,
						isDualLayout = true,
						isTenFootUiMode = IsUiModeMatch,
						emailOtpEnabled = NoFFlagEnableVNGDUARSignupComplianceModule1,
						LayoutOrder = 2
					})
				}) else RoactModule.createElement(CredentialLoginContainerModule, {
					crossDeviceLoginEnabled = NoIsUiModeMatch1_1,
					quickLoginButtonText = LoginWithExistingAccountButtonText,
					loginWithExistingAccountVariantEnabled = ShowVNGLoginWithExistingAccountQuickLoginButton,
					handleLoginWithFormDataCallback = p4.handleLoginWithFormData,
					updateIsLoginInProgress = p4.updateIsLoginInProgress,
					cvalueText = p4.cvalueText,
					passwordText = p4.passwordText,
					onTextBoxesChanged = p4.onTextBoxesChanged,
					buttonRef = p4.props.defaultRef,
					cvalueRef = p4.cvalueRef,
					passwordRef = p4.passwordRef,
					loginButtonRef = p4.loginButtonRef,
					forgotLinkRef = p4.forgotLinkRef,
					crossDeviceButtonRef = p4.crossDeviceButtonRef,
					emailOtpRef = p4.emailOtpRef,
					localizedError = p6.localizedError,
					localizedErrorMessage = LocalizedErrorMessage,
					forceLoginByUsername = p4.state.forceLoginByUsername or IsUiModeMatch,
					onCrossDeviceLoginActivated = p4.onCrossDeviceLoginActivated,
					onEmailOtpActivated = p4.onEmailOtpLoginActivated,
					loginButtonDisabled = p4.state.loginButtonDisabled,
					isLoginInProgress = p4.state.isLoginInProgress,
					authAnalytics = p4.props.authAnalytics,
					disableRegularLogin = IsNotUiModeMatch,
					showLinkAccountText = p4.props.appPolicy.getUseSingleSignOn(),
					showForgotButton = not IsNotUiModeMatch and (IsUiModeMatch1 and not IsUiModeMatch),
					onForgetButtonActivated = p4.onForgetButtonActivated,
					maxSizeX = if IsUiModeMatch1 then 1e999 else 360,
					showDisclaimerLinks = IsUiModeMatch1 and (not IsUiModeMatch and not (UseVNGUserAgreementPopup or UseKoreaKISAUserAgreementPopup)),
					showDisclaimerButtons = IsUiModeMatch1 and (IsUiModeMatch and not UseVNGUserAgreementPopup),
					showCredentialHeader = IsUiModeMatch1 and not IsUiModeMatch,
					isDualLayout = IsUiModeMatch1,
					isTenFootUiMode = IsUiModeMatch,
					emailOtpEnabled = NoFFlagEnableVNGDUARSignupComplianceModule1
				}),
				Divider = IsUiModeMatch1 and RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p5.Tokens.Size.Size_1000, 1, 0)
				}, {
					RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, p5.Tokens.Size.Size_300)
					}),
					RoactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 1,
						Size = UDim2.new(0, p5.Tokens.Size.Size_50, 0.5, 0),
						BackgroundColor3 = p5.Tokens.Color.Extended.Gray.Gray_800.Color3
					}),
					RoactModule.createElement("TextLabel", {
						TextTransparency = 0,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = p6.orText,
						TextSize = p5.Tokens.Size.Size_400,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextColor3 = p5.Tokens.Color.Extended.Gray.Gray_800.Color3
					}),
					RoactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						LayoutOrder = 3,
						Size = UDim2.new(0, p5.Tokens.Size.Size_50, 0.5, 0),
						BackgroundColor3 = p5.Tokens.Color.Extended.Gray.Gray_800.Color3
					})
				}) or nil,
				LoginCode = IsUiModeMatch1 and RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0.5, 0, 1, 0)
				}, {
					RoactModule.createElement(LoginCodePromptModule, {
						isOverlay = false,
						isDualLayout = true,
						loginCallback = p4.handleLoginWithCode,
						hideDeviceCode = not IsUiModeMatch,
						showLockIcon = not IsUiModeMatch
					})
				}),
				Forgot = if IsNotUiModeMatch or IsUiModeMatch1 or DisableLoginForgotButton then nil else RoactModule.createElement(LinkButton, {
					fontStyle = "Footer",
					colorStyleDefault = "TextDefault",
					colorStyleHover = "TextDefault",
					text = p6.forgotText,
					size = UDim2.new(0, 0, 0, 30),
					onActivated = p4.onForgetButtonActivated
				}),
				DisclaimerLinks = if IsUiModeMatch1 or (UseVNGUserAgreementPopup or UseKoreaKISAUserAgreementPopup) then nil else RoactModule.createElement(DisclaimerLinksModule, {
					LayoutOrder = 60,
					fillDirection = Enum.FillDirection.Vertical
				}),
				Padding = if IsUiModeMatch1 then nil else RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 61,
					Size = UDim2.new(1, 0, 0, YOffset)
				}) or nil
			})
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p4, _)
	-- upvalues: FFlagSignalsNavP3eAuth (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local Name = nil
	
	if not FFlagSignalsNavP3eAuth then
		if FFlagUseNavigationSelectors then
			Name = Selectors.selectCurrentPageName(p4)
		else
			local HistoryEntry = p4.Navigation.history[#p4.Navigation.history]
			Name = HistoryEntry[#HistoryEntry].name
		end
	end
	return {
		currentPageName = if FFlagSignalsNavP3eAuth then nil else Name,
		screenSize = p4.ScreenSize,
		statusBarHeight = p4.TopBar.statusBarHeight,
		globalGuiInset = p4.GlobalGuiInset
	}
end, function(Callback)
	-- upvalues: LoginModule (copy), LoginByCodeModule (copy), LoginByPasskeyModule (copy), LoginByOtpModule (copy), LaunchAppModule (copy), LaunchContextModule (copy), ResetAppStateModule (copy), PromiseModule (copy), UserModule (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), ConstantsModule (copy), AppStorageUtilitiesModule (copy), FFlagLuaEnableDidSwitchAccountModule (copy), GuiService (copy), NotificationTypeModule (copy), FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetLoginResultModule (copy), OpenCentralOverlayForLoginPasswordResetPromptModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), GetFFlagEnableVNGNewAppAvailableModalModule (copy), CrossDeviceLoginModule (copy), OpenAccountSelectorModule (copy), GetFFlagShouldUsePeekViewForLoginDisambiguationModule (copy), OpenEmailOtpModule (copy), CloseCentralOverlayModule (copy), RenderChallengeModule (copy), StartPasskeyAuthenticationModule (copy), LogoutAllLoggedInUsersModule (copy), LogoutModule (copy), OpenAccountSwitchingErrorOverlayModule (copy), NavigateBackModule (copy)
	return {
		login = function(...)
			-- upvalues: Callback (copy), LoginModule (upval)
			return Callback(LoginModule(...))
		end,
		loginByCode = function(...)
			-- upvalues: Callback (copy), LoginByCodeModule (upval)
			return Callback(LoginByCodeModule(...))
		end,
		loginByPasskey = function(...)
			-- upvalues: Callback (copy), LoginByPasskeyModule (upval)
			return Callback(LoginByPasskeyModule(...))
		end,
		loginByOtp = function(...)
			-- upvalues: Callback (copy), LoginByOtpModule (upval)
			return Callback(LoginByOtpModule(...))
		end,
		launchApp = function(p4, p5, p6, p7)
			-- upvalues: Callback (copy), LaunchAppModule (upval), LaunchContextModule (upval)
			return Callback(LaunchAppModule(p4, p5, p6, p7, LaunchContextModule.Login))
		end,
		clearApp = function()
			-- upvalues: Callback (copy), ResetAppStateModule (upval), PromiseModule (upval)
			Callback(ResetAppStateModule())
			
			return PromiseModule.resolve(true)
		end,
		handleLoginCompletionWithAccountSwitching = function(p4, p5, p6, p7, p8, Callback, Callback1: (any, any, any, any) -> ())
			-- upvalues: UserModule (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), ConstantsModule (upval), AppStorageUtilitiesModule (upval), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval)
			if UserModule.fromLocalStorage().userId == -1 then
				AppStorageUtilitiesModule.setAccountBlob(p8)
				AppStorageUtilitiesModule.flush()
				Callback1(p4, p5, p6, p7)
				
				return
			else
				Callback():andThen(function(_)
					-- upvalues: FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), ConstantsModule (upval), AppStorageUtilitiesModule (upval), p8 (copy), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval)
					AppStorageUtilitiesModule.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus else ConstantsModule.Auth.AccountSwitcherSwitchedStatus)
					AppStorageUtilitiesModule.setAccountBlob(p8)
					AppStorageUtilitiesModule.flush()
					
					if FFlagLuaEnableDidSwitchAccountModule then
						GuiService:BroadcastNotification("", NotificationTypeModule.DID_SWITCH_ACCOUNT)
						
						return
					else
						GuiService:BroadcastNotification("", NotificationTypeModule.DID_LOG_OUT)
					end
				end, function(_)
					-- upvalues: AppStorageUtilitiesModule (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), p8 (copy), Callback1 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy)
					AppStorageUtilitiesModule.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus else "switched")
					AppStorageUtilitiesModule.setAccountBlob(p8)
					AppStorageUtilitiesModule.flush()
					Callback1(p4, p5, p6, p7)
				end)
			end
		end,
		setBackNavigationDisabled = function(p4)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p4) else Callback(SetBackNavigationDisabledModule(p4))
		end,
		navigateToPage = function(p4)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p4)) else Callback(NavigateDownModule(p4))
		end,
		setLoginResult = function(p4)
			-- upvalues: Callback (copy), SetLoginResultModule (upval)
			Callback(SetLoginResultModule(p4))
		end,
		openPasswordResetPrompt = function()
			-- upvalues: Callback (copy), OpenCentralOverlayForLoginPasswordResetPromptModule (upval)
			Callback(OpenCentralOverlayForLoginPasswordResetPromptModule())
		end,
		openEmailVerificationPrompt = function(CredentialValue, Password, OnClose)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.LoginEmailVerificationPrompt, {
				credentialValue = CredentialValue,
				password = Password,
				onClose = OnClose
			}))
		end,
		openNewAppAvailableModal = function(OnButtonActivated)
			-- upvalues: GetFFlagEnableVNGNewAppAvailableModalModule (upval), Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			if GetFFlagEnableVNGNewAppAvailableModalModule() then
				Callback(SetCentralOverlayModule(OverlayTypeModule.NewAppAvailableModal, { onButtonActivated = OnButtonActivated }))
			end
		end,
		openCrossDeviceLoginPrompt = function(LoginCallback)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			Callback(CrossDeviceLoginModule.OpenLoginCodePrompt({ isOverlay = true, loginCallback = LoginCallback }))
		end,
		openCrossAppLoginPrompt = function(LoginCallback)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			Callback(CrossDeviceLoginModule.OpenLoginCodePrompt({
				isOverlay = true,
				isCrossApp = true,
				loginCallback = LoginCallback
			}))
		end,
		openAccountSelector = function(p4, p5)
			-- upvalues: Callback (copy), OpenAccountSelectorModule (upval), GetFFlagShouldUsePeekViewForLoginDisambiguationModule (upval)
			if p5 then
				Callback(OpenAccountSelectorModule(p4, true, true))
				
				return
			else
				Callback(OpenAccountSelectorModule(p4, GetFFlagShouldUsePeekViewForLoginDisambiguationModule(), false))
			end
		end,
		openEmailOtp = function(p4)
			-- upvalues: Callback (copy), OpenEmailOtpModule (upval)
			Callback(OpenEmailOtpModule(p4))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		resetAppState = function()
			-- upvalues: Callback (copy), ResetAppStateModule (upval)
			return Callback(ResetAppStateModule())
		end,
		renderChallenge = function(p4, p5)
			-- upvalues: Callback (copy), RenderChallengeModule (upval)
			return Callback(RenderChallengeModule(p4, p5))
		end,
		startPasskeyAuthentication = function(p4)
			-- upvalues: Callback (copy), StartPasskeyAuthenticationModule (upval)
			return Callback(StartPasskeyAuthenticationModule(p4))
		end,
		logoutAllLoggedInUsers = function(p4, p5)
			-- upvalues: Callback (copy), LogoutAllLoggedInUsersModule (upval)
			return Callback(LogoutAllLoggedInUsersModule(p4, p5))
		end,
		logoutWithoutShowConfirmation = function(p4, p5)
			-- upvalues: Callback (copy), LogoutModule (upval)
			return Callback(LogoutModule(p4, p5))
		end,
		openAccountSwitchingErrorOverlay = function(p4, p5, p6, p7, p8, p9, p10, p11)
			-- upvalues: Callback (copy), OpenAccountSwitchingErrorOverlayModule (upval)
			return Callback(OpenAccountSwitchingErrorOverlayModule(p4, p5, p6, p7, p8, p9, p10, p11))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end,
		showAccountLinkingAlert = function(AlertType, UserFacingMessage)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.AccountLinkingAlert, {
				alertType = AlertType,
				userFacingMessage = UserFacingMessage
			}))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	authAnalytics = RoactAnalyticsAuthEventsModule,
	loggingProtocol = AppLogging,
	linking = AppLinking
})(LoginView)))

if FFlagSignalsNavP3eAuth then
	v1 = (function(p4)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), RoactModule (copy), CryoModule (copy)
		return function(p5)
			-- upvalues: GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), RoactModule (upval), p4 (copy), CryoModule (upval)
			local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage)
			
			return RoactModule.createElement(p4, CryoModule.Dictionary.union(p5, {
				currentPageName = UseSignalStateResult and UseSignalStateResult.name
			}))
		end
	end)(v1)
end
local v2 = WithNavigationPropsFunction(function(_, p4)
	return p4
end)((RoactAppExperimentModule.connectBrowserTrackerLayer({
	AppBtidLayers.LoginLayer,
	AppBtidLayers.AccountSwitcherLayer
}, function(p4, _)
	-- upvalues: AppBtidLayers (copy), GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), DebugOTPBypass (copy)
	local v3 = p4[AppBtidLayers.LoginLayer] or {}
	local Inverted1 = nil
	
	if GetFFlagEnableAccountSwitcherIXPTextGatingFixFunction() then
		local v4 = p4[AppBtidLayers.AccountSwitcherLayer] or {}
		local Inverted: boolean = not GetFFlagEnableAccountSwitcherRedesignIXPFunction() or v4.enableAccountSwitcherFoundationDesign == true
		Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction() and Inverted
	else
		Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction()
	end
	return {
		isLoginWithOtpEnabled = DebugOTPBypass or v3.IsLoginWithOtpEnabled,
		shouldLoginWithKeystoreCredentials = v3.shouldLoginWithKeystoreCredentials,
		showAccountSwitcherFoundationDesign = Inverted1,
		showFoundationDisambiguationSelector = v3.showFoundationDisambiguationSelector or false
	}
end)((RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)(v1)))))

return function(p4)
	-- upvalues: UseUiModeInfoFunction (copy), ReactFocusNavigationModule (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	
	return RoactModule.createElement(v2, CryoModule.Dictionary.join({
		uiModeInfo = UseUiModeInfoResult,
		defaultRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2
	}, p4))
end