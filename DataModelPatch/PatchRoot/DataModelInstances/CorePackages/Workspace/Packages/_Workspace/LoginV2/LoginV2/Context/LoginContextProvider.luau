local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local MemStorageService = game:GetService("MemStorageService")
local ContentProvider = game:GetService("ContentProvider")
local _ = require(LoginV2.Components.Types)
local UserIdentifierType = require(LoginV2.Enums).UserIdentifierType
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local AuthCommonModule = require(Parent.AuthCommon)
local BackDisableStoreModule = require(Parent.BackDisableStore)
local OtpLoginModule = require(Parent.OtpLogin)
local _ = require(Parent.LuauPolyfill)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local OpenAccountSwitchingErrorOverlayFunction = require(Parent.AccountSwitcher).OpenAccountSwitchingErrorOverlay
local RenderChallengeFunction = require(Parent.GenericChallenges).Middleware.RenderChallenge
local ChallengeType = require(Parent.GenericChallenges).Types.ChallengeType
local TwoStepVerificationActionType = require(Parent.GenericChallenges).Types.TwoStepVerificationActionType
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local StatusCodes = require(Parent.Http).StatusCodes
local EventStreamConstants = require(Parent.AuthAnalytics).EventStreamConstants
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppLinking = RoactServiceTagsModule.AppLinking
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local CredentialsProtocolErrorCodes = CredentialsProtocolModule.CredentialsProtocolErrorCodes
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableLoginAccountSelectorFunction = SharedFlagsModule.GetFFlagEnableLoginAccountSelector
local FFlagEnableLuaAccountSwitch = SharedFlagsModule.FFlagEnableLuaAccountSwitch
local FFlagLuaEnableDidSwitchAccount = SharedFlagsModule.FFlagLuaEnableDidSwitchAccount
local GetFStringVNGDownloadNowUrlFunction = SharedFlagsModule.GetFStringVNGDownloadNowUrl
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local FFlagAddReasonToEveryLogout = SharedFlagsModule.FFlagAddReasonToEveryLogout
local FFlagEnablePasskeyLoginErrorLogging = SharedFlagsModule.FFlagEnablePasskeyLoginErrorLogging
local FFlagDisableMemStorageServicePasswordEvent = SharedFlagsModule.FFlagDisableMemStorageServicePasswordEvent
local FFlagEnableLoginV2ForcedUsernameOverride = SharedFlagsModule.FFlagEnableLoginV2ForcedUsernameOverride
local FFlagEnablePWManagerSignupCheck = SharedFlagsModule.FFlagEnablePWManagerSignupCheck
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagBypassKeystoreLoginIxpV2Function = SharedFlagsModule.GetFFlagBypassKeystoreLoginIxpV2
local GetFFlagRemoveKeystoreIxpLogicFunction = SharedFlagsModule.GetFFlagRemoveKeystoreIxpLogic
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherRedesignIXP
local GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction = SharedFlagsModule.GetFFlagEnableLoginDisambiguationFoundationSwitcher
local FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlagsModule.FFlagEnableNavigateToLoginAfterLogoutAll
local FFlagEnable2SVRecovery = SharedFlagsModule.FFlagEnable2SVRecovery
local FFlagUseBackDisableSignalStore = SharedFlagsModule.FFlagUseBackDisableSignalStore
local FFlagRemoveUnusedLoginResultRoduxSlice = SharedFlagsModule.FFlagRemoveUnusedLoginResultRoduxSlice
local LoginV2AwaitPasswordRegistration = game:DefineFastFlag("LoginV2AwaitPasswordRegistration", false)
local EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2", false)
local LoginContextModule = require(LoginV2.Context.LoginContext)
local LoginStateReducerModule = require(LoginV2.Reducers.LoginStateReducer)
local StartAuthenticationByUserModule = require(LoginV2.Thunks.StartAuthenticationByUser)
local StartPasskeyAuthenticationModule = require(LoginV2.Thunks.StartPasskeyAuthentication)
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)
local Base64 = AuthCommonModule.Utils.Base64
local AccountSwitcherConstants = AuthCommonModule.Common.AccountSwitcherConstants
local LoginResult = AuthCommonModule.Models.LoginResult
local SetLoginResultFunction = AuthCommonModule.Actions.SetLoginResult
local SetBackNavigationDisabledFunction = AuthCommonModule.Actions.SetBackNavigationDisabled
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local ReportEphemeralCounterFunction = AuthCommonModule.Analytics.reportEphemeralCounter
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local LoginByPasskeyFunction = AuthCommonModule.Thunks.LoginByPasskey
local LoginByCodeFunction = AuthCommonModule.Thunks.LoginByCode
local LoginByOtpFunction = AuthCommonModule.Thunks.LoginByOtp
local LoginFunction = AuthCommonModule.Thunks.Login
local User = AuthCommonModule.Thunks.User
local AppLoginCounterNames = AuthCommonModule.Enums.AppLoginCounterNames
local LoginErrorCodes = AuthCommonModule.Enums.LoginErrorCodes
local GetTwoStepLoginErrorKeyFunction = AuthCommonModule.Utils.getTwoStepLoginErrorKey
local OpenCentralOverlayForLoginPasswordResetPromptFunction = AuthCommonModule.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt
local LogoutAllLoggedInUsersFunction = AuthCommonModule.Thunks.LogoutAllLoggedInUsers
local AuthLocalStorageKeys = AuthCommonModule.Enums.AuthLocalStorageKeys
local OpenAccountSelectorFunction = AuthCommonModule.Thunks.OpenAccountSelector
local AuthMemStorageKeys = AuthCommonModule.Enums.AuthMemStorageKeys
local TwoStepRequests = AuthCommonModule.Http.Requests.TwoStepRequests
local LogoutReasonNames = AuthCommonModule.Enums.LogoutReasonNames
local PasskeyConstants = AuthCommonModule.Common.PasskeyConstants
local Record2svCompletionFunction = AuthCommonModule.Utils.record2svCompletion
local RecordLoginFunction = AuthCommonModule.Utils.recordLogin
local TwoStepErrorCodes = AuthCommonModule.Enums.TwoStepErrorCodes
local GetUserByUsernameFunction = AuthCommonModule.Thunks.GetUserByUsername
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local FFlagEnableRecordLogin = require(Parent.SharedFlags).FFlagEnableRecordLogin
local LoginMethods = AuthCommonModule.Enums.LoginMethods
local GetPasswordManagerUsageStoreFunction = AuthCommonModule.Stores.GetPasswordManagerUsageStore
local SendCodeFunction = OtpLoginModule.Thunks.SendCode
local ResendCodeFunction = OtpLoginModule.Thunks.ResendCode
local Constants1 = OtpLoginModule.Constants
local Logger = require(Parent.Loggers).Logger
local Default1 = require(Parent.LoggingProtocol).default
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local IosAuthServiceHealthCounters = require(Parent.AuthAnalytics).RobloxTelemetry.IosAuthServiceHealthCounters
local KeystoreSaveCredentialsTelemetryConfig = TelemetryConfigs.KeystoreSaveCredentialsTelemetryConfig
local TelemetryService = game:GetService("TelemetryService")
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local IsIosAuthServiceEnabledFunction = AuthCommonModule.Utils.isIosAuthServiceEnabled
local CoarseLoginErrorBucketFunction = AuthCommonModule.Utils.coarseLoginErrorBucket
local IsNonTerminalLoginErrorFunction = AuthCommonModule.Utils.isNonTerminalLoginError
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps

return function(p1)
	-- upvalues: UseNavigationPropsFunction (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), UserIdentifierType (copy), ReactModule (copy), LoginStateReducerModule (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), AppLinking (copy), UseAppPolicyFunction (copy), StartPasskeyAuthenticationModule (copy), StartAuthenticationByUserModule (copy), SetLoginResultFunction (copy), FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledFunction (copy), LaunchContext (copy), PromiseModule (copy), LoginActionTypeModule (copy), LoginPageStateModule (copy), GetPasswordManagerUsageStoreFunction (copy), FFlagEnablePWManagerSignupCheck (copy), LoginByPasskeyFunction (copy), LoginByCodeFunction (copy), LoginByOtpFunction (copy), CloseCentralOverlayFunction (copy), LoginFunction (copy), GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction (copy), OpenAccountSelectorFunction (copy), User (copy), RenderChallengeFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), AppStorageUtilities (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy), Default1 (copy), TelemetryConfigs (copy), HttpService (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), AuthMemStorageKeys (copy), Default (copy), Constants (copy), Logger (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), IosAuthServiceHealthCounters (copy), IsIosAuthServiceEnabledFunction (copy), GetTwoStepLoginErrorKeyFunction (copy), TwoStepErrorCodes (copy), ReportEphemeralCounterFunction (copy), AppLoginCounterNames (copy), ChallengeType (copy), TwoStepVerificationActionType (copy), FFlagEnable2SVRecovery (copy), TwoStepRequests (copy), LoginV2AwaitPasswordRegistration (copy), FFlagEnableRecordLogin (copy), Record2svCompletionFunction (copy), FFlagEnableLuaAccountSwitch (copy), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), GetFFlagRemoveKeystoreIxpLogicFunction (copy), GetFFlagBypassKeystoreLoginIxpV2Function (copy), ContentProvider (copy), GetUserByUsernameFunction (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), FFlagRemoveUnusedLoginResultRoduxSlice (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), IsNonTerminalLoginErrorFunction (copy), CoarseLoginErrorBucketFunction (copy), RecordLoginFunction (copy), LoginMethods (copy), Constants1 (copy), SendCodeFunction (copy), ResendCodeFunction (copy), UserInputService (copy), Base64 (copy), CredentialsProtocolErrorCodes (copy), AuthClientErrorFunction (copy), PasskeyConstants (copy), FFlagEnablePasskeyLoginErrorLogging (copy), OpenAccountSwitchingErrorOverlayFunction (copy), OpenCentralOverlayForLoginPasswordResetPromptFunction (copy), LogoutAllLoggedInUsersFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetFStringVNGDownloadNowUrlFunction (copy), LoginErrorCodes (copy), StatusCodes (copy), FFlagAddReasonToEveryLogout (copy), LogoutReasonNames (copy), LoginContextModule (copy)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(LoginStateReducerModule, {
		userIdentifier = "",
		numLoginAttempts = 0,
		forceLoginByUsername = false,
		shouldAutoShowCredentialPopup = true,
		userIdentifierType = UserIdentifierType.Unknown,
		availableLoginMethods = {},
		credentialsProtocolStatus = {
			fido2Supported = false,
			passwordsSupported = false,
			v2InterfaceSupported = false,
			shouldShowAuthScreenCredentialsPopup = false,
			shouldShowAuthScreenUserSpecificPasskeyPopup = false,
			initialStateUpdated = false
		},
		componentState = {
			LoginScreenV2 = {
				errorKey = "",
				userIdentifier = "",
				shouldAttemptCredentialPrefill = true
			},
			AuthenticationScreen = { errorKey = "", errorType = nil, password = "" },
			EmailOtpScreen = { errorKey = "", emailOtp = "", sessionToken = "" }
		},
		monoDeps = p1.monoDeps,
		extraProps = UseNavigationPropsFunction(function(_, p2)
			-- upvalues: FFlagEnableLoginV2ForcedUsernameOverride (upval)
			return {
				credProtocolIsAvailableResponse = p2.credProtocolIsAvailableResponse,
				forcedUsernameOverride = if FFlagEnableLoginV2ForcedUsernameOverride then p2.forcedUsernameOverride else nil
			}
		end)
	})
	local UseRefResult = nil
	
	if FFlagEnableNavigateToLoginAfterLogoutAll then
		UseRefResult = ReactModule.useRef(UseReducerResult.userIdentifier)
		UseRefResult.current = UseReducerResult.userIdentifier
	end
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.LoginLayer }, function(p2)
		-- upvalues: AppBtidLayers (upval)
		local v1 = p2[AppBtidLayers.LoginLayer] or {}
		
		return {
			shouldLoginWithKeystoreCredentials = v1.shouldLoginWithKeystoreCredentials or false,
			showFoundationDisambiguationSelector = v1.showFoundationDisambiguationSelector or false
		}
	end)
	local Inverted = not GetFFlagEnableAccountSwitcherRedesignIXPFunction() or RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AccountSwitcherLayer }, function(p2): boolean
		-- upvalues: AppBtidLayers (upval)
		return (p2[AppBtidLayers.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true
	end)
	local Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction() and Inverted
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppLinking)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2
	end)
	local LaunchAppFunction = UseReducerResult.monoDeps.LaunchApp
	local ResetAppStateFunction = UseReducerResult.monoDeps.ResetAppState
	local LogoutFunction = UseReducerResult.monoDeps.Logout
	
	local function v94()
		-- upvalues: UseDispatchResult (copy), StartPasskeyAuthenticationModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(StartPasskeyAuthenticationModule(UseRoactServiceResult))
	end
	
	local function v95(p2)
		-- upvalues: UseDispatchResult (copy), StartAuthenticationByUserModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(StartAuthenticationByUserModule(UseRoactServiceResult, p2))
	end
	
	local function _(p2)
		-- upvalues: UseDispatchResult (copy), SetLoginResultFunction (upval)
		return UseDispatchResult(SetLoginResultFunction(p2))
	end
	
	local _ = function(p2)
		-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval)
		return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p2) else UseDispatchResult(SetBackNavigationDisabledFunction(p2))
	end
	
	local _ = function()
		-- upvalues: UseDispatchResult (copy), LaunchAppFunction (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval)
		return UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
	end
	
	local function ClearApp()
		-- upvalues: UseDispatchResult (copy), ResetAppStateFunction (copy), PromiseModule (upval)
		UseDispatchResult(ResetAppStateFunction())
		
		return PromiseModule.resolve()
	end
	
	local function v100()
		-- upvalues: UseReducerResult2 (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval), UserIdentifierType (upval)
		UseReducerResult2({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.AuthenticationScreen,
				payload = { errorKey = "", errorType = nil, password = "" }
			}
		})
		UseReducerResult2({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.LoginScreenV2,
				payload = { errorKey = "", userIdentifier = "" }
			}
		})
		UseReducerResult2({
			type = LoginActionTypeModule.SetUserIdentifierAndType,
			data = {
				userIdentifier = "",
				userIdentifierType = UserIdentifierType.Unknown
			}
		})
	end
	
	local PasswordManagerUsageStore = GetPasswordManagerUsageStoreFunction(false)
	
	if FFlagEnablePWManagerSignupCheck and PasswordManagerUsageStore then
		PasswordManagerUsageStore.resetAll()
	elseif PasswordManagerUsageStore then
		PasswordManagerUsageStore.setLoggedinUsingSavedPassword(false)
		PasswordManagerUsageStore.setSavedPasswordAfterLogin(false)
	end
	local _ = function(p2, p3)
		-- upvalues: UseDispatchResult (copy), LoginByPasskeyFunction (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(LoginByPasskeyFunction(UseRoactServiceResult, p2, p3))
	end
	
	local _ = function(p2, p3, p4, p5, p6, p7)
		-- upvalues: UseDispatchResult (copy), LoginByCodeFunction (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(LoginByCodeFunction(UseRoactServiceResult, p2, p3, p4, p5, p6, p7))
	end
	
	local _ = function(p2, p3, p4, p5, p6)
		-- upvalues: UseDispatchResult (copy), LoginByOtpFunction (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(LoginByOtpFunction(UseRoactServiceResult, p2, p3, p4, p5, p6))
	end
	
	local function v105(...)
		-- upvalues: UseDispatchResult (copy), LoginFunction (upval)
		return UseDispatchResult(LoginFunction(...))
	end
	
	local function v106(Tbl)
		-- upvalues: GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction (upval), UseBrowserTrackerExperimentResult (copy), UseDispatchResult (copy), OpenAccountSelectorFunction (upval)
		if GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction() and UseBrowserTrackerExperimentResult.showFoundationDisambiguationSelector then
			local Copy = table.clone(Tbl)
			Copy.hideActions = true
			Copy.showFoundationDisambiguationSelector = true
			
			return UseDispatchResult(OpenAccountSelectorFunction(Copy, true, true))
		else
			return UseDispatchResult(OpenAccountSelectorFunction(Tbl, true, false))
		end
	end
	
	local _ = function(p2)
		-- upvalues: RenderChallengeFunction (upval)
		return RenderChallengeFunction(p2)
	end
	
	local function HandleLoginCompletionWithAccountSwitching(AccountBlob)
		-- upvalues: User (upval), UseDispatchResult (copy), ResetAppStateFunction (copy), PromiseModule (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), AppStorageUtilities (upval), FFlagLuaEnableDidSwitchAccount (upval), GuiService (upval), NotificationType (upval), LaunchAppFunction (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval)
		if User.fromLocalStorage().userId ~= -1 then
			UseDispatchResult(ResetAppStateFunction())
			PromiseModule.resolve():andThen(function(_)
				-- upvalues: FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), AppStorageUtilities (upval), AccountBlob (copy), FFlagLuaEnableDidSwitchAccount (upval), GuiService (upval), NotificationType (upval)
				AppStorageUtilities.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus else AccountSwitcherConstants.AccountSwitcherSwitchedStatus)
				AppStorageUtilities.setAccountBlob(AccountBlob)
				AppStorageUtilities.flush()
				
				if FFlagLuaEnableDidSwitchAccount then
					GuiService:BroadcastNotification("", NotificationType.DID_SWITCH_ACCOUNT)
					
					return
				else
					GuiService:BroadcastNotification("", NotificationType.DID_LOG_OUT)
				end
			end, function(_)
				-- upvalues: AppStorageUtilities (upval), AccountBlob (copy), UseDispatchResult (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval)
				AppStorageUtilities.setAccountSwitchStatus("switched")
				AppStorageUtilities.setAccountBlob(AccountBlob)
				AppStorageUtilities.flush()
				local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
			end)
			
			return
		else
			AppStorageUtilities.setAccountBlob(AccountBlob)
			AppStorageUtilities.flush()
			local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
		end
	end
	
	local function RegisterPassword(Input)
		-- upvalues: Default1 (upval), TelemetryConfigs (upval), HttpService (upval), UseReducerResult (copy), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), AuthMemStorageKeys (upval), Default (upval), Constants (upval), PasswordManagerUsageStore (copy), Logger (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
		if Input == nil then
			Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, { reason = "missingCredentialsJson" })
			
			return nil
		end
		local Data = HttpService:JSONDecode(Input)
		
		if Data.cvalue == nil or Data.password == nil then
			Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, { reason = "missingUsernameOrPassword" })
			
			return nil
		end
		if UseReducerResult.credentialsProtocolStatus.passwordsSupported then
			local Json = HttpService:JSONEncode({ username = Data.cvalue, password = Data.password })
			Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveAttemptedConfig, 1)
			
			return Default:registerCredentials(Default.CredentialsTypes.password, Json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
				-- upvalues: HttpService (upval), PasswordManagerUsageStore (upval), Logger (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), Default1 (upval), TelemetryConfigs (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
				if Result then
					local Data = HttpService:JSONDecode(Result)
					
					if Data.errorCode == nil then
						if PasswordManagerUsageStore then
							PasswordManagerUsageStore.setSavedPasswordAfterLogin(true)
						end
						Logger:info("Successfully registered password.")
						AuthButtonClickFunction(EventStreamConstants.Context.CMPasswordLogin, EventStreamConstants.Button.SavePassword)
						Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSuccessConfig, 1)
						IosAuthServiceHealthCounters.reportPasswordSaveSuccess({
							credentialType = "password",
							iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
						})
						
						return
					else
						Logger:warning("Error registering password: {}", Data.errorMsg)
						Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveFailureConfig, 1, { errorCode = tostring(Data.errorCode) })
						IosAuthServiceHealthCounters.reportPasswordSaveFailure({
							credentialType = "password",
							errorCode = tostring(Data.errorCode),
							iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
						})
					end
				end
			end, function(p2)
				-- upvalues: Logger (upval), Default1 (upval), TelemetryConfigs (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval)
				Logger:warning("Error registering password: {}", p2)
				Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveFailureConfig, 1, { error = tostring(p2) })
				IosAuthServiceHealthCounters.reportPasswordSaveFailure({
					credentialType = "password",
					errorCode = "transportError",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			end)
		end
		if not FFlagDisableMemStorageServicePasswordEvent then
			MemStorageService:Fire(AuthMemStorageKeys.AuthenticatedCredentials, Input)
		end
		Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, { reason = "passwordsNotSupported" })
		
		return nil
	end
	
	local function v110(IllegalChildAccountLinking, p2)
		-- upvalues: GetTwoStepLoginErrorKeyFunction (upval), TwoStepErrorCodes (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval)
		local TwoStepLoginErrorKey = GetTwoStepLoginErrorKeyFunction(IllegalChildAccountLinking)
		
		if IllegalChildAccountLinking and IllegalChildAccountLinking == TwoStepErrorCodes.IllegalChildAccountLinking then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
		else
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureUnknownError, 1)
		end
		p2.setInProgress(false)
		p2.setErrorKey(TwoStepLoginErrorKey)
	end
	
	local function v111(p2, p3, p4, CredentialType)
		-- upvalues: ChallengeType (upval), TwoStepVerificationActionType (upval), FFlagEnable2SVRecovery (upval), TwoStepRequests (upval), UseRoactServiceResult (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableRecordLogin (upval), Record2svCompletionFunction (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 (upval), HttpService (upval), v110 (copy), RenderChallengeFunction (upval)
		local Ticket = p2.twoStepVerificationData.ticket
		local Id = p2.user.id
		local _ = RenderChallengeFunction({
			title = "Authentication.Login.Label.TwoStepVerification",
			challengeType = ChallengeType.TwoStepVerification,
			challengeParameters = {
				allowRememberDevice = true,
				actionType = TwoStepVerificationActionType.Login,
				challengeId = Ticket,
				userId = Id,
				clientSupports2svRecovery = if FFlagEnable2SVRecovery then true else false
			},
			callbacks = {
				OnChallengeCompleted = function(p5)
					-- upvalues: TwoStepRequests (upval), UseRoactServiceResult (upval), Id (copy), Ticket (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), CredentialType (copy), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), p3 (copy), FFlagEnableRecordLogin (upval), Record2svCompletionFunction (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 (upval), HttpService (upval), v110 (upval), p4 (copy)
					TwoStepRequests.login(UseRoactServiceResult, Id, Ticket, p5.data.verificationToken, p5.data.rememberDevice):andThen(function(Result)
						-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), CredentialType (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), p3 (upval), FFlagEnableRecordLogin (upval), Record2svCompletionFunction (upval), Id (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval)
						local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
						ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
						
						if CredentialType then
							IosAuthServiceHealthCounters.reportLoginSuccess({
								credentialType = CredentialType,
								iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
							})
						end
						if LoginV2AwaitPasswordRegistration then
							local RegisterPasswordResult = RegisterPassword(p3)
							
							if RegisterPasswordResult then
								RegisterPasswordResult:await()
							end
						end
						if FFlagEnableRecordLogin then
							pcall(function()
								-- upvalues: Record2svCompletionFunction (upval), Id (upval)
								Record2svCompletionFunction(Id)
							end)
						end
						if FFlagEnableLuaAccountSwitch then
							HandleLoginCompletionWithAccountSwitching(Result.responseBody and Result.responseBody.accountBlob)
							
							return
						else
							local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
						end
					end, function(p6)
						-- upvalues: ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), CredentialType (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 (upval), HttpService (upval), v110 (upval), p4 (upval)
						ReportEphemeralCounterFunction(AppLoginCounterNames.Failure, 1)
						
						if CredentialType then
							IosAuthServiceHealthCounters.reportLoginFailure({
								errorCode = "twoStepFailed",
								credentialType = CredentialType,
								iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
							})
						end
						if EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2 then
							local Success, Result = pcall(function()
								-- upvalues: HttpService (upval), p6 (copy)
								return HttpService:JSONDecode(p6.Body).errors[1].code
							end)
							v110(if Success then Result else nil, p4)
							
							return
						else
							ReportEphemeralCounterFunction(AppLoginCounterNames.FailureUnknownError, 1)
							p4.setInProgress(false)
							p4.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
						end
					end):finally(function()
						-- upvalues: LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), p3 (upval)
						if not LoginV2AwaitPasswordRegistration then
							RegisterPassword(p3)
						end
					end)
				end,
				OnChallengeAbandoned = function()
					-- upvalues: p4 (copy)
					p4.setInProgress(false)
				end,
				OnChallengeInvalidated = function()
					-- upvalues: p4 (copy)
					p4.setInProgress(false)
					p4.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end,
				OnChallengeLoadFailed = function()
					-- upvalues: p4 (copy)
					p4.setInProgress(false)
					p4.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end
			}
		})
	end
	
	local function v112(_, _, SecurityQuestionsData, Callback, p2)
		-- upvalues: ChallengeType (upval), RenderChallengeFunction (upval)
		local _ = RenderChallengeFunction({
			challengeType = ChallengeType.SecurityQuestions,
			challengeParameters = {
				sessionId = SecurityQuestionsData.sessionId,
				userId = SecurityQuestionsData.userId
			},
			callbacks = {
				OnChallengeCompleted = function(p3)
					-- upvalues: SecurityQuestionsData (copy), Callback (copy)
					Callback({
						sessionId = SecurityQuestionsData.sessionId,
						redemptionToken = p3.data.redemptionToken
					})
				end,
				OnChallengeAbandoned = function()
					-- upvalues: p2 (copy)
					p2.setInProgress(false)
				end,
				OnChallengeInvalidated = function()
					-- upvalues: p2 (copy)
					p2.setInProgress(false)
					p2.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end,
				OnChallengeLoadFailed = function()
					-- upvalues: p2 (copy)
					p2.setInProgress(false)
					p2.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end
			}
		})
	end
	
	local _ = function(p2)
		-- upvalues: PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (copy), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
		return PromiseModule.new(function(Callback: () -> (), Callback1)
			-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), p2 (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
			if GetFFlagKeystoreAutoLoginAvailableFunction() == false or p2 == nil then
				Callback()
				
				return
			else
				local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
				local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
				local Data = HttpService:JSONDecode(p2)
				GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
					-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
					return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
						-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
						return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
					end):andThen(function()
						-- upvalues: Result (copy)
						return Result
					end) else Callback1("Invalid usernameInfo")
				end):andThen(function(Result)
					-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
					local Json = nil
					if GetFFlagRemoveKeystoreIxpLogicFunction() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
						end
						Json = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(Data.cvalue),
							userId = tostring(Result.id),
							password = tostring(Data.password)
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
							username = tostring(Data.cvalue),
							userId = tostring(Result.id),
							password = tostring(Data.password),
							experimentGroup = tostring(Experiment)
						})
					end
					return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
	
	local Callback = nil
	
	local function handleLoginWithFormData(Username, Password, p2, p3, p4, p5, p6)
		-- upvalues: Callback (ref), UseReducerResult (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), handleLoginWithFormData (copy), v105 (copy), UseRoactServiceResult (copy), AppStorageService (upval), AuthLocalStorageKeys (upval), LoginResult (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval), PasswordManagerUsageStore (copy), HttpService (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval), IsNonTerminalLoginErrorFunction (upval), CoarseLoginErrorBucketFunction (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval)
		local CallbackResult = Callback(p6)
		local Username1 = if Username then Username else UseReducerResult.userIdentifier
		local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
		
		return v105(UseRoactServiceResult, Username1, Password, function(p7, p8)
			-- upvalues: handleLoginWithFormData (upval), Username (copy), Password (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy)
			if p7 then
				handleLoginWithFormData(Username, Password, p8, p3, p4, p5, p6)
			end
		end, p2, function(p7)
			-- upvalues: handleLoginWithFormData (upval), Username (copy), Password (copy), p2 (copy), p4 (copy), p5 (copy), p6 (copy)
			handleLoginWithFormData(Username, Password, p2, p7, p4, p5, p6)
		end, p3, p4, UseReducerResult.forceLoginByUsername):andThen(function(Result)
			-- upvalues: AppStorageService (upval), AuthLocalStorageKeys (upval), Username1 (copy), LoginResult (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), p5 (copy), Default1 (upval), TelemetryConfigs (upval), PasswordManagerUsageStore (upval), HttpService (upval), Password (copy), p6 (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
			AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, Username1)
			AppStorageService:Flush()
			
			if LoginResult.hasTwoStepData(Result) then
				IosAuthServiceHealthCounters.reportLoginTwoStepRequired({
					credentialType = "password",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			else
				IosAuthServiceHealthCounters.reportLoginSuccess({
					credentialType = "password",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p5 and IsIosAuthServiceEnabledFunction() then
					Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginSuccessConfig, 1, { credentialType = "password" })
				end
			end
			if PasswordManagerUsageStore and p5 then
				PasswordManagerUsageStore.setLoggedinUsingSavedPassword(true)
			end
			local Json = if p5 then nil else HttpService:JSONEncode({
				authType = "login",
				cvalue = Username1,
				password = Password
			})
			local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
			local CredentialType = "password"
			PromiseModule.new(function(Callback: () -> (), Callback1)
				-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), Json (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
				if GetFFlagKeystoreAutoLoginAvailableFunction() == false or Json == nil then
					Callback()
					
					return
				else
					local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
					local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
					local Data = HttpService:JSONDecode(Json)
					GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
						-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
						return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
							-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
							return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
						end):andThen(function()
							-- upvalues: Result (copy)
							return Result
						end) else Callback1("Invalid usernameInfo")
					end):andThen(function(Result)
						-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
						local Json = nil
						if GetFFlagRemoveKeystoreIxpLogicFunction() then
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
							
							if GetFFlagAddPromCounterToKeystoreOpsFunction() then
								TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
							end
							Json = HttpService:JSONEncode({
								server = tostring(ContentProvider.BaseUrl),
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password)
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
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password),
								experimentGroup = tostring(Experiment)
							})
						end
						return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
			end):finally(function()
				-- upvalues: LoginResult (upval), Result (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), UseDispatchResult (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), Json (copy), p6 (copy), CredentialType (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
				if LoginResult.hasTwoStepData(Result) then
					if not FFlagRemoveUnusedLoginResultRoduxSlice then
						local _ = UseDispatchResult(SetLoginResultFunction(Result))
					end
					ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function()
						-- upvalues: v111 (upval), Result (upval), Json (upval), p6 (upval), CredentialType (upval)
						v111(Result, Json, p6, CredentialType)
					end)
				else
					ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
					
					if Json then
						if LoginV2AwaitPasswordRegistration then
							local Promise = RegisterPassword(Json)
							
							if Promise then
								Promise:await()
							end
						else
							RegisterPassword(Json)
						end
					end
					if FFlagEnableLuaAccountSwitch then
						HandleLoginCompletionWithAccountSwitching(Result.accountBlob)
					else
						local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
					end
				end
				if GetFFlagEnableLoginAccountSelectorFunction() then
					local _ = UseDispatchResult(CloseCentralOverlayFunction())
				end
			end)
		end, function(p7)
			-- upvalues: IsNonTerminalLoginErrorFunction (upval), Username1 (copy), Password (copy), FFlagEnableLuaAccountSwitch (upval), IosAuthServiceHealthCounters (upval), CoarseLoginErrorBucketFunction (upval), IsIosAuthServiceEnabledFunction (upval), p5 (copy), Default1 (upval), TelemetryConfigs (upval), CallbackResult (copy), FFlagEnableNavigateToLoginAfterLogoutAll (upval)
			if not IsNonTerminalLoginErrorFunction(p7, {
				accountSelectorRequiresCredentials = true,
				credentialValue = Username1,
				password = Password,
				accountSwitchEnabled = FFlagEnableLuaAccountSwitch
			}) then
				IosAuthServiceHealthCounters.reportLoginFailure({
					credentialType = "password",
					errorCode = CoarseLoginErrorBucketFunction(p7),
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p5 and IsIosAuthServiceEnabledFunction() then
					local config = { credentialType = "password" }
					
					if p7 and p7.errorCode ~= nil then
						config.errorCode = tostring(p7.errorCode)
					end
					Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginFailureConfig, 1, config)
				end
			end
			CallbackResult(p7, Username1, Password, if FFlagEnableNavigateToLoginAfterLogoutAll then true else nil)
		end)
	end
	
	local function HandleLoginWithPasskey(Response, SessionId, p2, p3)
		-- upvalues: Callback (ref), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), LoginByPasskeyFunction (upval), UseRoactServiceResult (copy), LoginResult (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval), IsNonTerminalLoginErrorFunction (upval), CoarseLoginErrorBucketFunction (upval)
		local CallbackResult = Callback(p2)
		local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
		
		return UseDispatchResult(LoginByPasskeyFunction(UseRoactServiceResult, Response, SessionId)):andThen(function(Result)
			-- upvalues: LoginResult (upval), IosAuthServiceHealthCounters (upval), IsIosAuthServiceEnabledFunction (upval), p3 (copy), Default1 (upval), TelemetryConfigs (upval), p2 (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
			if LoginResult.hasTwoStepData(Result) then
				IosAuthServiceHealthCounters.reportLoginTwoStepRequired({
					credentialType = "passkey",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
			else
				IosAuthServiceHealthCounters.reportLoginSuccess({
					credentialType = "passkey",
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p3 and IsIosAuthServiceEnabledFunction() then
					Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginSuccessConfig, 1, { credentialType = "passkey" })
				end
			end
			local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
			local v1 = nil
			local v2 = nil
			local CredentialType = "passkey"
			PromiseModule.new(function(Callback: () -> (), Callback1)
				-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), v1 (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
				if GetFFlagKeystoreAutoLoginAvailableFunction() == false or v1 == nil then
					Callback()
					
					return
				else
					local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
					local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
					local Data = HttpService:JSONDecode(v1)
					GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
						-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
						return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
							-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
							return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
						end):andThen(function()
							-- upvalues: Result (copy)
							return Result
						end) else Callback1("Invalid usernameInfo")
					end):andThen(function(Result)
						-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
						local Json = nil
						if GetFFlagRemoveKeystoreIxpLogicFunction() then
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
							
							if GetFFlagAddPromCounterToKeystoreOpsFunction() then
								TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
							end
							Json = HttpService:JSONEncode({
								server = tostring(ContentProvider.BaseUrl),
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password)
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
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password),
								experimentGroup = tostring(Experiment)
							})
						end
						return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
			end):finally(function()
				-- upvalues: LoginResult (upval), Result (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), UseDispatchResult (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), v2 (copy), p2 (copy), CredentialType (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
				if LoginResult.hasTwoStepData(Result) then
					if not FFlagRemoveUnusedLoginResultRoduxSlice then
						local _ = UseDispatchResult(SetLoginResultFunction(Result))
					end
					ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function()
						-- upvalues: v111 (upval), Result (upval), v2 (upval), p2 (upval), CredentialType (upval)
						v111(Result, v2, p2, CredentialType)
					end)
				else
					ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
					
					if v2 then
						if LoginV2AwaitPasswordRegistration then
							local Promise = RegisterPassword(v2)
							
							if Promise then
								Promise:await()
							end
						else
							RegisterPassword(v2)
						end
					end
					if FFlagEnableLuaAccountSwitch then
						HandleLoginCompletionWithAccountSwitching(Result.accountBlob)
					else
						local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
					end
				end
				if GetFFlagEnableLoginAccountSelectorFunction() then
					local _ = UseDispatchResult(CloseCentralOverlayFunction())
				end
			end)
		end, function(p4)
			-- upvalues: IsNonTerminalLoginErrorFunction (upval), FFlagEnableLuaAccountSwitch (upval), IosAuthServiceHealthCounters (upval), CoarseLoginErrorBucketFunction (upval), IsIosAuthServiceEnabledFunction (upval), p3 (copy), Default1 (upval), TelemetryConfigs (upval), CallbackResult (copy), Response (copy)
			if not IsNonTerminalLoginErrorFunction(p4, {
				accountSelectorRequiresCredentials = true,
				accountSwitchEnabled = FFlagEnableLuaAccountSwitch
			}) then
				IosAuthServiceHealthCounters.reportLoginFailure({
					credentialType = "passkey",
					errorCode = CoarseLoginErrorBucketFunction(p4),
					iosAuthServiceEnabled = IsIosAuthServiceEnabledFunction()
				})
				
				if p3 and IsIosAuthServiceEnabledFunction() then
					local config = { credentialType = "passkey" }
					
					if p4 and p4.errorCode ~= nil then
						config.errorCode = tostring(p4.errorCode)
					end
					Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetLoginFailureConfig, 1, config)
				end
			end
			CallbackResult(p4, Response, nil)
		end)
	end
	
	local function handleLoginWithCode(p2, p3, p4, p5, p6)
		-- upvalues: Callback (ref), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), handleLoginWithCode (copy), LoginByCodeFunction (upval), UseRoactServiceResult (copy), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), LoginResult (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
		local CallbackResult = Callback(p6)
		local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
		
		return UseDispatchResult(LoginByCodeFunction(UseRoactServiceResult, p2, p3, function(p7, p8)
			-- upvalues: handleLoginWithCode (upval), p2 (copy), p3 (copy), p6 (copy)
			if p7 then
				handleLoginWithCode(p2, p3, p8, nil, p6)
			end
		end, p4, function(p7)
			-- upvalues: handleLoginWithCode (upval), p2 (copy), p3 (copy), p6 (copy)
			handleLoginWithCode(p2, p3, nil, p7, p6)
		end, p5)):andThen(function(Result)
			-- upvalues: p6 (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), LoginResult (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
			local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
			local v1 = nil
			local v2 = nil
			local CredentialType = nil
			PromiseModule.new(function(Callback: () -> (), Callback1)
				-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), v1 (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
				if GetFFlagKeystoreAutoLoginAvailableFunction() == false or v1 == nil then
					Callback()
					
					return
				else
					local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
					local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
					local Data = HttpService:JSONDecode(v1)
					GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
						-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
						return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
							-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
							return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
						end):andThen(function()
							-- upvalues: Result (copy)
							return Result
						end) else Callback1("Invalid usernameInfo")
					end):andThen(function(Result)
						-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
						local Json = nil
						if GetFFlagRemoveKeystoreIxpLogicFunction() then
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
							
							if GetFFlagAddPromCounterToKeystoreOpsFunction() then
								TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
							end
							Json = HttpService:JSONEncode({
								server = tostring(ContentProvider.BaseUrl),
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password)
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
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password),
								experimentGroup = tostring(Experiment)
							})
						end
						return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
			end):finally(function()
				-- upvalues: LoginResult (upval), Result (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), UseDispatchResult (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), v2 (copy), p6 (copy), CredentialType (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
				if LoginResult.hasTwoStepData(Result) then
					if not FFlagRemoveUnusedLoginResultRoduxSlice then
						local _ = UseDispatchResult(SetLoginResultFunction(Result))
					end
					ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function()
						-- upvalues: v111 (upval), Result (upval), v2 (upval), p6 (upval), CredentialType (upval)
						v111(Result, v2, p6, CredentialType)
					end)
				else
					ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
					
					if v2 then
						if LoginV2AwaitPasswordRegistration then
							local Promise = RegisterPassword(v2)
							
							if Promise then
								Promise:await()
							end
						else
							RegisterPassword(v2)
						end
					end
					if FFlagEnableLuaAccountSwitch then
						HandleLoginCompletionWithAccountSwitching(Result.accountBlob)
					else
						local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
					end
				end
				if GetFFlagEnableLoginAccountSelectorFunction() then
					local _ = UseDispatchResult(CloseCentralOverlayFunction())
				end
			end)
		end, function(p7)
			-- upvalues: ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), CallbackResult (copy), p2 (copy), p3 (copy)
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureAuthCode, 1)
			CallbackResult(p7, p2, p3)
		end)
	end
	
	local function handleLoginWithOtp(p2, p3, p4, p5, p6)
		-- upvalues: Callback (ref), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), handleLoginWithOtp (copy), LoginByOtpFunction (upval), UseRoactServiceResult (copy), AppStorageService (upval), AuthLocalStorageKeys (upval), UseReducerResult (copy), FFlagEnableRecordLogin (upval), RecordLoginFunction (upval), LoginMethods (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), LoginResult (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
		local CallbackResult = Callback(p6)
		local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
		
		return UseDispatchResult(LoginByOtpFunction(UseRoactServiceResult, p2, p3, function(p7)
			-- upvalues: handleLoginWithOtp (upval), p2 (copy), p3 (copy), p5 (copy), p6 (copy)
			handleLoginWithOtp(p2, p3, p7, p5, p6)
		end, p4, p5)):andThen(function(Result)
			-- upvalues: AppStorageService (upval), AuthLocalStorageKeys (upval), UseReducerResult (upval), FFlagEnableRecordLogin (upval), RecordLoginFunction (upval), LoginMethods (upval), p6 (copy), FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (upval), SetBackNavigationDisabledFunction (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), LoginResult (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
			AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, UseReducerResult.userIdentifier)
			
			if FFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: RecordLoginFunction (upval), Result (copy), LoginMethods (upval), UseReducerResult (upval)
					RecordLoginFunction(Result, LoginMethods.EmailOtp, UseReducerResult.userIdentifier)
				end)
			end
			local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
			local Input = nil
			local v1 = nil
			local CredentialType = nil
			PromiseModule.new(function(Callback: () -> (), Callback1)
				-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), Input (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
				if GetFFlagKeystoreAutoLoginAvailableFunction() == false or Input == nil then
					Callback()
					
					return
				else
					local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
					local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
					local Data = HttpService:JSONDecode(Input)
					GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
						-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
						return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
							-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
							return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
						end):andThen(function()
							-- upvalues: Result (copy)
							return Result
						end) else Callback1("Invalid usernameInfo")
					end):andThen(function(Result)
						-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
						local Json = nil
						if GetFFlagRemoveKeystoreIxpLogicFunction() then
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
							
							if GetFFlagAddPromCounterToKeystoreOpsFunction() then
								TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
							end
							Json = HttpService:JSONEncode({
								server = tostring(ContentProvider.BaseUrl),
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password)
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
								username = tostring(Data.cvalue),
								userId = tostring(Result.id),
								password = tostring(Data.password),
								experimentGroup = tostring(Experiment)
							})
						end
						return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
			end):finally(function()
				-- upvalues: LoginResult (upval), Result (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), UseDispatchResult (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), v1 (copy), p6 (copy), CredentialType (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
				if LoginResult.hasTwoStepData(Result) then
					if not FFlagRemoveUnusedLoginResultRoduxSlice then
						local _ = UseDispatchResult(SetLoginResultFunction(Result))
					end
					ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function()
						-- upvalues: v111 (upval), Result (upval), v1 (upval), p6 (upval), CredentialType (upval)
						v111(Result, v1, p6, CredentialType)
					end)
				else
					ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
					
					if v1 then
						if LoginV2AwaitPasswordRegistration then
							local Promise = RegisterPassword(v1)
							
							if Promise then
								Promise:await()
							end
						else
							RegisterPassword(v1)
						end
					end
					if FFlagEnableLuaAccountSwitch then
						HandleLoginCompletionWithAccountSwitching(Result.accountBlob)
					else
						local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
					end
				end
				if GetFFlagEnableLoginAccountSelectorFunction() then
					local _ = UseDispatchResult(CloseCentralOverlayFunction())
				end
			end)
		end, function(p7)
			-- upvalues: CallbackResult (copy), p2 (copy), p3 (copy)
			CallbackResult(p7, p2, p3)
		end)
	end
	
	local function OpenNewAppAvailableModal()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseRoactServiceResult2 (copy), GetFStringVNGDownloadNowUrlFunction (upval)
		return UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.NewAppAvailableModal, {
			onButtonActivated = function()
				-- upvalues: UseRoactServiceResult2 (upval), GetFStringVNGDownloadNowUrlFunction (upval)
				UseRoactServiceResult2:openURL(GetFStringVNGDownloadNowUrlFunction())
			end
		}))
	end
	
	local function OpenAccountSelector(Users, p2, Password, p3)
		-- upvalues: EventStreamConstants (upval), UseReducerResult (copy), UserIdentifierType (upval), handleLoginWithOtp (copy), handleLoginWithFormData (copy), UseDispatchResult (copy), CloseCentralOverlayFunction (upval), v106 (copy)
		v106({
			titleTextKey = "Authentication.Login.Label.AccountSelectorTitle",
			origin = EventStreamConstants.Context.Login,
			context = if p3.isLoginByOtp then EventStreamConstants.Context.DisambiguationOTP elseif UseReducerResult.userIdentifierType == UserIdentifierType.Email then EventStreamConstants.Context.DisambiguationEmail elseif UseReducerResult.userIdentifierType == UserIdentifierType.Phone then EventStreamConstants.Context.DisambiguationPhone else "",
			users = Users,
			onAccountSelection = function(p4)
				-- upvalues: p3 (copy), handleLoginWithOtp (upval), p2 (copy), Password (copy), handleLoginWithFormData (upval)
				if p3.isLoginByOtp then
					handleLoginWithOtp(p2, Password, nil, p4, p3)
					
					return
				else
					handleLoginWithFormData(p2, Password, nil, nil, p4, false, p3):await()
				end
			end,
			onAccountSelectionAbandoned = function()
				-- upvalues: p3 (copy), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				p3.setInProgress(false)
				local _ = UseDispatchResult(CloseCentralOverlayFunction())
			end
		})
	end
	
	local function HandleCredentialsCollision(p2)
		-- upvalues: v100 (copy), UseReducerResult2 (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		v100()
		UseReducerResult2({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.LoginScreenV2,
				payload = { errorKey = p2.errorKey }
			}
		})
		UseReducerResult2({ type = LoginActionTypeModule.ForceLoginByUsername })
	end
	
	local function v121(p2)
		-- upvalues: LoginErrorCodes (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), StatusCodes (upval)
		if p2.errorCode == LoginErrorCodes.IncorrectCValueOrPassword then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureCredentials, 1)
			
			return
		end
		if p2.errorCode == LoginErrorCodes.AccountLocked then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailurePasswordReset, 1)
			
			return
		end
		if p2.errorCode == LoginErrorCodes.CTypeNotSupported then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureBadRequest, 1)
			
			return
		end
		if p2.errorCode == LoginErrorCodes.CValueAndPasswordRequired then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureBadRequest, 1)
			
			return
		end
		if p2.errorCode == LoginErrorCodes.SecurityQuestions then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureSecurityQuestions, 1)
			
			return
		end
		if p2.errorCode == LoginErrorCodes.MultipleUsersPerCredential then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureMultipleUsersPerCredential, 1)
			
			return
		end
		if p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureThrottled, 1)
			
			return
		end
		if p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.REQUEST_TIMEOUT then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTimeout, 1)
			
			return
		end
		if p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.BAD_REQUEST then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureBadRequest, 1)
			
			return
		end
		if p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.NOT_FOUND then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureNotFound, 1)
			
			return
		end
		if p2.HttpError == Enum.HttpError.OK and p2.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureInternalServerError, 1)
			
			return
		else
			ReportEphemeralCounterFunction(AppLoginCounterNames.FailureUnknownError, 1)
		end
	end
	
	Callback = function(p2)
		-- upvalues: LoginErrorCodes (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v121 (copy), AuthClientErrorFunction (upval), UseDispatchResult (copy), CloseCentralOverlayFunction (upval), AppStorageUtilities (upval), User (upval), UseRoactServiceResult (copy), LogoutAllLoggedInUsersFunction (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), v105 (copy), LoginResult (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), ResetAppStateFunction (copy), PromiseModule (upval), AppStorageService (upval), AuthLocalStorageKeys (upval), AccountSwitcherConstants (upval), FFlagAddReasonToEveryLogout (upval), GuiService (upval), LogoutReasonNames (upval), LogoutFunction (copy), UseRefResult (ref), Inverted1 (copy), OpenAccountSwitchingErrorOverlayFunction (upval), HandleCredentialsCollision (copy), LoginPageStateModule (upval), OpenCentralOverlayForLoginPasswordResetPromptFunction (upval), OpenNewAppAvailableModal (copy), v112 (copy), OpenAccountSelector (copy)
		return function(p3, p4, p5, p6)
			-- upvalues: LoginErrorCodes (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v121 (upval), AuthClientErrorFunction (upval), p2 (copy), UseDispatchResult (upval), CloseCentralOverlayFunction (upval), AppStorageUtilities (upval), User (upval), UseRoactServiceResult (upval), LogoutAllLoggedInUsersFunction (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), v105 (upval), LoginResult (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), ResetAppStateFunction (upval), PromiseModule (upval), AppStorageService (upval), AuthLocalStorageKeys (upval), AccountSwitcherConstants (upval), FFlagAddReasonToEveryLogout (upval), GuiService (upval), LogoutReasonNames (upval), LogoutFunction (upval), UseRefResult (upval), Inverted1 (upval), OpenAccountSwitchingErrorOverlayFunction (upval), HandleCredentialsCollision (upval), LoginPageStateModule (upval), OpenCentralOverlayForLoginPasswordResetPromptFunction (upval), OpenNewAppAvailableModal (upval), v112 (upval), OpenAccountSelector (upval)
			local Flag = false
			local IsErrorCodeMatch = p3.errorCode == LoginErrorCodes.MultipleUsersPerCredential
			local IsErrorCodeMatch1 = p3.errorCode == LoginErrorCodes.SecurityQuestions
			
			if IsErrorCodeMatch or IsErrorCodeMatch1 then
				Flag = true
			end
			ReportEphemeralCounterFunction(AppLoginCounterNames.Failure, 1)
			v121(p3)
			AuthClientErrorFunction(p2.eventContext, p3.errorCode)
			
			local function v199()
				-- upvalues: p2 (upval), Flag (ref), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				p2.setInProgress(Flag)
				local _ = UseDispatchResult(CloseCentralOverlayFunction())
			end
			
			local function v200()
				-- upvalues: AppStorageUtilities (upval), User (upval), p2 (upval), UseRoactServiceResult (upval), LogoutAllLoggedInUsersFunction (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), p6 (copy), v105 (upval), p4 (copy), p5 (copy), LoginResult (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), UseDispatchResult (upval), LaunchAppFunction (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), ResetAppStateFunction (upval), PromiseModule (upval), AppStorageService (upval), AuthLocalStorageKeys (upval), AccountSwitcherConstants (upval), FFlagAddReasonToEveryLogout (upval), GuiService (upval), LogoutReasonNames (upval), LogoutFunction (upval), CloseCentralOverlayFunction (upval)
				local AccountBlob = AppStorageUtilities.getAccountBlob()
				local IsNotUserIdMatch = User.fromLocalStorage().userId ~= -1
				p2.setInProgress(true)
				LogoutAllLoggedInUsersFunction(UseRoactServiceResult, AccountBlob):await()
				local Flag = false
				
				if FFlagEnableNavigateToLoginAfterLogoutAll then
					if p6 then
						local Success, Result = pcall(function()
							-- upvalues: v105 (upval), UseRoactServiceResult (upval), p4 (upval), p5 (upval)
							return v105(UseRoactServiceResult, p4, p5):expect()
						end)
						
						if Success and Result and not LoginResult.hasTwoStepData(Result) then
							if FFlagEnableLuaAccountSwitch then
								HandleLoginCompletionWithAccountSwitching(Result.accountBlob)
								
								return
							else
								local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
								
								return
							end
						end
					elseif type(p4) ~= "string" then
						Flag = true
					end
				end
				if IsNotUserIdMatch == true then
					UseDispatchResult(ResetAppStateFunction())
					local _ = PromiseModule.resolve()
					AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, "")
					AppStorageService:Flush()
					
					if FFlagEnableNavigateToLoginAfterLogoutAll then
						AppStorageUtilities.setAccountSwitchStatus(if Flag then AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV2AfterLogoutAll else AccountSwitcherConstants.AccountSwitcherPendingLoginV2AfterLogoutAll)
						AppStorageUtilities.flush()
					end
					if FFlagAddReasonToEveryLogout then
						local _ = UseDispatchResult(LogoutFunction(UseRoactServiceResult, GuiService, LogoutReasonNames.LoginContextAccountSwitchingErrorOverlay))
					else
						local _ = UseDispatchResult(LogoutFunction(UseRoactServiceResult, GuiService, nil))
					end
				end
				p2.setInProgress(false)
				local _ = UseDispatchResult(CloseCentralOverlayFunction())
			end
			
			if FFlagEnableLuaAccountSwitch and p3.errorCode == LoginErrorCodes.EmptyAccountSwitchBlobRequired then
				p2.setErrorKey("")
				local Current = if FFlagEnableNavigateToLoginAfterLogoutAll and not p6 then UseRefResult.current else p4
				
				if FFlagEnableNavigateToLoginAfterLogoutAll then
					AppStorageUtilities.setAccountSwitchTargetUsername(Current)
				end
				local _ = UseDispatchResult(OpenAccountSwitchingErrorOverlayFunction(if Inverted1 then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if Inverted1 then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.LogoutConfirmation", if Inverted1 then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v200, v199, AccountSwitcherConstants.AccountSwitcherLoginEmptyBlobRequiredError, Current or nil))
				
				return
			elseif FFlagEnableLuaAccountSwitch and p3.errorCode == LoginErrorCodes.ParentEmptyAccountSwitchBlobRequired then
				p2.setErrorKey("")
				local Current = if FFlagEnableNavigateToLoginAfterLogoutAll and not p6 then UseRefResult.current else p4
				
				if FFlagEnableNavigateToLoginAfterLogoutAll then
					AppStorageUtilities.setAccountSwitchTargetUsername(Current)
				end
				local _ = UseDispatchResult(OpenAccountSwitchingErrorOverlayFunction(if Inverted1 then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts", if Inverted1 then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" else "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", if Inverted1 then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v200, v199, AccountSwitcherConstants.AccountSwitcherParentLoginEmptyBlobRequiredError, Current or nil))
				
				return
			else
				if p3.errorCode == LoginErrorCodes.MoreThanOneUsername then
					HandleCredentialsCollision(p3)
					p2.navigation.navigate(LoginPageStateModule.LoginScreenV2)
					
					return
				end
				if p3.errorCode == LoginErrorCodes.AccountLocked then
					local _ = UseDispatchResult(OpenCentralOverlayForLoginPasswordResetPromptFunction())
				end
				if p3.errorCode == LoginErrorCodes.GlobalAppAccessDeniedVNG then
					OpenNewAppAvailableModal()
				end
				if IsErrorCodeMatch1 and p3.securityQuestionsData and p3.securityQuestionsCallback then
					spawn(function()
						-- upvalues: v112 (upval), p4 (copy), p5 (copy), p3 (copy), p2 (upval)
						v112(p4, p5, p3.securityQuestionsData, p3.securityQuestionsCallback, p2)
					end)
					
					return
				end
				if IsErrorCodeMatch and p3.usersData and p4 and p5 then
					OpenAccountSelector(p3.usersData, p4, p5, p2)
					
					return
				else
					p2.setErrorKey(p3.errorKey or "Authentication.Login.Response.SomethingWentWrong")
					p2.setInProgress(Flag)
				end
			end
		end
	end
	
	return ReactModule.createElement(LoginContextModule.Provider, {
		value = {
			state = UseReducerResult,
			dispatch = UseReducerResult2,
			parentNavigation = p1.parentNavigation,
			utils = {
				handleLoginCompletionWithAccountSwitching = HandleLoginCompletionWithAccountSwitching,
				handleLoginResult = function(p2, p3, p4, CredentialType)
					-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), PromiseModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (copy), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (copy), Default (upval), KeystoreConstants (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), LoginResult (upval), FFlagRemoveUnusedLoginResultRoduxSlice (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (copy), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (copy), LaunchAppFunction (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
					local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(false) else UseDispatchResult(SetBackNavigationDisabledFunction(false))
					PromiseModule.new(function(Callback: () -> (), Callback1)
						-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), p3 (copy), GetFFlagRemoveKeystoreIxpLogicFunction (upval), UseBrowserTrackerExperimentResult (upval), GetFFlagBypassKeystoreLoginIxpV2Function (upval), HttpService (upval), ContentProvider (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (upval), Default (upval), KeystoreConstants (upval), PromiseModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval)
						if GetFFlagKeystoreAutoLoginAvailableFunction() == false or p3 == nil then
							Callback()
							
							return
						else
							local ShouldLoginWithKeystoreCredentials = if GetFFlagRemoveKeystoreIxpLogicFunction() then true else UseBrowserTrackerExperimentResult.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2Function()
							local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
							local Data = HttpService:JSONDecode(p3)
							GetUserByUsernameFunction(UseRoactServiceResult, Data.cvalue)():andThen(function(Result)
								-- upvalues: Callback1 (copy), Default (upval), KeystoreConstants (upval), Json (copy), PromiseModule (upval)
								return if Result and Result.id then Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
									-- upvalues: Default (upval), Json (upval), KeystoreConstants (upval), PromiseModule (upval)
									return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
								end):andThen(function()
									-- upvalues: Result (copy)
									return Result
								end) else Callback1("Invalid usernameInfo")
							end):andThen(function(Result)
								-- upvalues: GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreSaveCredentialsTelemetryConfig (upval), HttpService (upval), ContentProvider (upval), Data (copy), ShouldLoginWithKeystoreCredentials (copy), KeystoreConstants (upval), Default (upval)
								local Json = nil
								if GetFFlagRemoveKeystoreIxpLogicFunction() then
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(Result.id)))
									
									if GetFFlagAddPromCounterToKeystoreOpsFunction() then
										TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, { customFields = { result = "attempt" } }, 1)
									end
									Json = HttpService:JSONEncode({
										server = tostring(ContentProvider.BaseUrl),
										username = tostring(Data.cvalue),
										userId = tostring(Result.id),
										password = tostring(Data.password)
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
										username = tostring(Data.cvalue),
										userId = tostring(Result.id),
										password = tostring(Data.password),
										experimentGroup = tostring(Experiment)
									})
								end
								return Default:registerCredentials(Default.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout)
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
					end):finally(function()
						-- upvalues: LoginResult (upval), p2 (copy), FFlagRemoveUnusedLoginResultRoduxSlice (upval), UseDispatchResult (upval), SetLoginResultFunction (upval), ReportEphemeralCounterFunction (upval), AppLoginCounterNames (upval), v111 (upval), p3 (copy), p4 (copy), CredentialType (copy), LoginV2AwaitPasswordRegistration (upval), RegisterPassword (upval), FFlagEnableLuaAccountSwitch (upval), HandleLoginCompletionWithAccountSwitching (upval), LaunchAppFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), UseAppPolicyResult (upval), LaunchContext (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), CloseCentralOverlayFunction (upval)
						if LoginResult.hasTwoStepData(p2) then
							if not FFlagRemoveUnusedLoginResultRoduxSlice then
								local _ = UseDispatchResult(SetLoginResultFunction(p2))
							end
							ReportEphemeralCounterFunction(AppLoginCounterNames.FailureTwoStepVerification, 1)
							spawn(function()
								-- upvalues: v111 (upval), p2 (upval), p3 (upval), p4 (upval), CredentialType (upval)
								v111(p2, p3, p4, CredentialType)
							end)
						else
							ReportEphemeralCounterFunction(AppLoginCounterNames.Success, 1)
							
							if p3 then
								if LoginV2AwaitPasswordRegistration then
									local Promise = RegisterPassword(p3)
									
									if Promise then
										Promise:await()
									end
								else
									RegisterPassword(p3)
								end
							end
							if FFlagEnableLuaAccountSwitch then
								HandleLoginCompletionWithAccountSwitching(p2.accountBlob)
							else
								local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
							end
						end
						if GetFFlagEnableLoginAccountSelectorFunction() then
							local _ = UseDispatchResult(CloseCentralOverlayFunction())
						end
					end)
				end,
				showPasskeyLoginPopup = function(p2, p3, DeviceBoundOnly)
					-- upvalues: v95 (copy), UseReducerResult (copy), v94 (copy), HttpService (upval), Constants (upval), UserInputService (upval), Base64 (upval), Default (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PasskeyConstants (upval), HandleLoginWithPasskey (copy)
					local Flag = false
					
					return (if p3 then function()
						-- upvalues: v95 (upval), UseReducerResult (upval)
						return v95({
							cvalue = UseReducerResult.userIdentifier,
							ctype = UseReducerResult.userIdentifierType
						})
					end else function()
						-- upvalues: v94 (upval)
						return v94()
					end)():andThen(function(Result)
						-- upvalues: HttpService (upval), Constants (upval), DeviceBoundOnly (copy), UserInputService (upval), Base64 (upval), Default (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PasskeyConstants (upval), p2 (copy), Flag (ref), HandleLoginWithPasskey (upval)
						local Data = HttpService:JSONDecode(Result.authenticationOptions)
						local SessionId = Result.sessionId
						local Number: number? = tonumber(Data.publicKey.timeout)
						local NumberRatio = if Number then Number / 1000 else Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
						Data.keyType = "platform"
						Data.deviceBoundOnly = DeviceBoundOnly
						
						if UserInputService:GetPlatform() ~= Enum.Platform.Android then
							Data.publicKey.challenge = Base64.FromUrlSafeBase64(Data.publicKey.challenge)
							
							if Data.publicKey.allowCredentials then
								for _, allowCredential in ipairs(Data.publicKey.allowCredentials) do
									allowCredential.id = Base64.FromUrlSafeBase64(allowCredential.id)
								end
							end
						end
						Default:getCredentials(Default.CredentialsTypes.FIDO2, HttpService:JSONEncode(Data), NumberRatio):andThen(function(Result)
							-- upvalues: HttpService (upval), Logger (upval), CredentialsProtocolErrorCodes (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PasskeyConstants (upval), Base64 (upval), p2 (upval), Flag (upval), HandleLoginWithPasskey (upval), SessionId (copy)
							if Result ~= nil then
								local Data = HttpService:JSONDecode(Result)
								
								if Data == nil or next(Data) == nil then
									Logger:info("Passkey credential signing failed. No result returned.")
									
									return
								end
								if Data.errorCode ~= nil then
									Logger:info("Passkey credential signing failed. Error {} (msg: {}) returned.", Data.errorCode, Data.errorMsg)
									AuthClientErrorFunction(EventStreamConstants.Context.PasskeyLoginAttempt, CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[tonumber(Data.errorCode) or -1] or string.format(CredentialsProtocolErrorCodes.UNMAPPED_ERROR_CODE, (tostring(Data.errorCode))), PasskeyConstants.PASSKEY_FETCH_LOGIN_V2)
									
									return
								end
								Logger:info("Passkey credential signing completed. Attempting login.")
								Data.id = Base64.ToUrlSafeBase64(Data.id)
								Data.rawId = Base64.ToUrlSafeBase64(Data.rawId)
								Data.response.signature = Base64.ToUrlSafeBase64(Data.response.signature)
								Data.response.userHandle = Base64.ToUrlSafeBase64(Data.response.userHandle)
								Data.response.authenticatorData = Base64.ToUrlSafeBase64(Data.response.authenticatorData)
								Data.response.clientDataJSON = Base64.ToUrlSafeBase64(Data.response.clientDataJSON)
								p2.setInProgress(true)
								Flag = true
								HandleLoginWithPasskey(Data, SessionId, p2)
							end
						end, function(p4)
							-- upvalues: Logger (upval)
							Logger:warning("Passkey credential signing failed. Error: {}", p4)
						end):await()
					end, function(p4)
						-- upvalues: Logger (upval), p3 (copy), DeviceBoundOnly (copy), p2 (copy)
						Logger:warning("Fetching passkey login options failed with error code: {}", p4.errorCode)
						
						if p3 and not DeviceBoundOnly then
							p2.setErrorKey("Authentication.Login.Response.UnableToSignIn")
						end
					end):finally(function()
						-- upvalues: p2 (copy), Flag (ref)
						if p2.onCredentialsPopupAbandoned and not Flag then
							p2.onCredentialsPopupAbandoned()
						end
					end)
				end,
				showGenericCredentialLoginPopup = function(p4, p5, p6, p7)
					-- upvalues: IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval), v95 (copy), UseReducerResult (copy), v94 (copy), HttpService (upval), Constants (upval), UserInputService (upval), Base64 (upval), Logger (upval), Default (upval), CredentialsProtocolErrorCodes (upval), FFlagEnablePasskeyLoginErrorLogging (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PasskeyConstants (upval), handleLoginWithFormData (copy), HandleLoginWithPasskey (copy)
					if p4 or p5 then
						local Callback = if p6 then function()
							-- upvalues: v95 (upval), UseReducerResult (upval)
							return v95({
								cvalue = UseReducerResult.userIdentifier,
								ctype = UseReducerResult.userIdentifierType
							})
						end else function()
							-- upvalues: v94 (upval)
							return v94()
						end
						local Data = nil
						local SessionId = nil
						local Number: number? = nil
						local Input = {}
						
						if p4 then
							Callback():andThen(function(Result)
								-- upvalues: Data (ref), HttpService (upval), SessionId (ref), Number (ref), Constants (upval), UserInputService (upval), Base64 (upval)
								Data = HttpService:JSONDecode(Result.authenticationOptions)
								SessionId = Result.sessionId
								Number = tonumber(Data.publicKey.timeout) or Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
								Data.keyType = "platform"
								Data.deviceBoundOnly = true
								
								if UserInputService:GetPlatform() ~= Enum.Platform.Android then
									Data.publicKey.challenge = Base64.FromUrlSafeBase64(Data.publicKey.challenge)
									
									if Data.publicKey.allowCredentials then
										for _, allowCredential in ipairs(Data.publicKey.allowCredentials) do
											allowCredential.id = Base64.FromUrlSafeBase64(allowCredential.id)
										end
									end
								end
							end, function(p8)
								-- upvalues: Logger (upval)
								Logger:warning("Fetching passkey login options failed with error code: {}", p8.errorCode)
							end):await()
							
							if Data ~= nil then
								Input.FIDO2 = Data
							end
						end
						if p5 then
							Input.password = {}
							
							if p6 then
								Input.password.username = UseReducerResult.userIdentifier
							end
						end
						local NumberRatio = if Number then Number / 1000 else Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
						local Flag = false
						local Json = HttpService:JSONEncode(Input)
						
						if IsIosAuthServiceEnabledFunction() then
							Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetShownConfig, 1)
						end
						return Default:getCredentials(Default.CredentialsTypes.all, Json, NumberRatio):andThen(function(Result)
							-- upvalues: HttpService (upval), Logger (upval), IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval), CredentialsProtocolErrorCodes (upval), FFlagEnablePasskeyLoginErrorLogging (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PasskeyConstants (upval), Default (upval), p7 (copy), Flag (ref), handleLoginWithFormData (upval), Base64 (upval), HandleLoginWithPasskey (upval), SessionId (ref)
							if Result ~= nil then
								local Data = HttpService:JSONDecode(Result)
								
								if Data == nil or not Data.response and not Data.errorCode then
									Logger:info("Generic credential fetch failed. No result returned.")
									
									if IsIosAuthServiceEnabledFunction() then
										Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
										
										return
									end
								elseif Data.errorCode == nil then
									if Data.credentialType == Default.CredentialsTypes.password then
										if IsIosAuthServiceEnabledFunction() then
											Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig, 1)
										end
										p7.setInProgress(true)
										Flag = true
										handleLoginWithFormData(Data.response.username, Data.response.password, nil, nil, nil, true, p7)
										
										return
									else
										if Data.credentialType == Default.CredentialsTypes.FIDO2 then
											if IsIosAuthServiceEnabledFunction() then
												Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig, 1)
											end
											Data.response.id = Base64.ToUrlSafeBase64(Data.response.id)
											Data.response.rawId = Base64.ToUrlSafeBase64(Data.response.rawId)
											Data.response.response.signature = Base64.ToUrlSafeBase64(Data.response.response.signature)
											Data.response.response.userHandle = Base64.ToUrlSafeBase64(Data.response.response.userHandle)
											Data.response.response.authenticatorData = Base64.ToUrlSafeBase64(Data.response.response.authenticatorData)
											Data.response.response.clientDataJSON = Base64.ToUrlSafeBase64(Data.response.response.clientDataJSON)
											p7.setInProgress(true)
											Flag = true
											HandleLoginWithPasskey(Data.response, SessionId, p7, true)
										end
									end
								else
									Logger:info("Generic credential fetch failed. Error {} (msg: {}) returned.", Data.errorCode, Data.errorMsg)
									
									if IsIosAuthServiceEnabledFunction() then
										local GetCredentialsErrorCode = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[tonumber(Data.errorCode) or -1]
										
										if GetCredentialsErrorCode == "CANCELLATION_ERROR" then
											Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
										else
											Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetErrorConfig, 1, {
												errorCode = GetCredentialsErrorCode or tostring(Data.errorCode)
											})
										end
									end
									if FFlagEnablePasskeyLoginErrorLogging and type(Data.errorMsg) == "string" then
										AuthClientErrorFunction(EventStreamConstants.Context.PasskeyLoginAttempt, Data.errorMsg, PasskeyConstants.GENERIC_CREDENTIAL_FETCH_LOGIN_V2)
										
										return
									end
								end
							end
						end, function(p8)
							-- upvalues: Logger (upval), IsIosAuthServiceEnabledFunction (upval), CredentialsProtocolErrorCodes (upval), Default1 (upval), TelemetryConfigs (upval)
							Logger:warning("Generic credential signing failed. Error: {}", p8)
							
							if IsIosAuthServiceEnabledFunction() then
								local GetCredentialsErrorCode = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[(if typeof(p8) == "table" then tonumber(p8.errorCode) else tonumber(p8)) or -1]
								
								if GetCredentialsErrorCode == "CANCELLATION_ERROR" then
									Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
									
									return
								end
								Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetErrorConfig, 1, { errorCode = GetCredentialsErrorCode or "rejected" })
							end
						end):andThen(function(_)
							-- upvalues: p7 (copy), Flag (ref)
							if p7.onCredentialsPopupAbandoned and not Flag then
								p7.onCredentialsPopupAbandoned()
							end
						end):catch(function(_)
							-- upvalues: p7 (copy), Flag (ref)
							if p7.onCredentialsPopupAbandoned and not Flag then
								p7.onCredentialsPopupAbandoned()
							end
						end)
					elseif IsIosAuthServiceEnabledFunction() then
						Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "noSupportedCredentials" })
					end
				end,
				handleLoginWithCode = handleLoginWithCode,
				handleLoginWithFormData = handleLoginWithFormData,
				handleLoginWithPasskey = HandleLoginWithPasskey,
				handleLoginWithOtp = handleLoginWithOtp,
				handleSendEmailOtp = function(Callback, p8)
					-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), Constants1 (upval), UseReducerResult (copy), SendCodeFunction (upval), UseRoactServiceResult (copy)
					local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
					
					return UseDispatchResult(SendCodeFunction(UseRoactServiceResult, {
						origin = Constants1.otpServiceOrigin,
						contactType = Constants1.otpServiceContactType,
						contactValue = UseReducerResult.userIdentifier
					})):andThen(function(Result)
						-- upvalues: Callback (copy)
						Callback(Result.otpSessionToken)
					end, function(p9)
						-- upvalues: p8 (copy), Constants1 (upval)
						p8.setInProgress(false)
						p8.setErrorKey(Constants1.errorMessageKeys[Constants1.statusCodeMap[tonumber(p9) or 0] or "Unknown"] or Constants1.errorMessageKeys.Unknown)
					end)
				end,
				handleResendEmailOtp = function(OtpSessionToken, Callback, p8)
					-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), UseDispatchResult (copy), SetBackNavigationDisabledFunction (upval), Constants1 (upval), ResendCodeFunction (upval), UseRoactServiceResult (copy)
					local _ = if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(true) else UseDispatchResult(SetBackNavigationDisabledFunction(true))
					
					return UseDispatchResult(ResendCodeFunction(UseRoactServiceResult, {
						origin = Constants1.otpServiceOrigin,
						contactType = Constants1.otpServiceContactType,
						otpSessionToken = OtpSessionToken
					})):andThen(function(Result)
						-- upvalues: Callback (copy)
						Callback(Result.otpSessionToken)
					end, function(p9)
						-- upvalues: p8 (copy), Constants1 (upval)
						p8.setInProgress(false)
						p8.setErrorKey(Constants1.errorMessageKeys[Constants1.statusCodeMap[tonumber(p9) or 0] or "Unknown"] or Constants1.errorMessageKeys.Unknown)
					end)
				end,
				openAccountSwitchingErrorOverlay = function(p8, p9, p10, p11, p12, p13, p14, p15)
					-- upvalues: UseDispatchResult (copy), OpenAccountSwitchingErrorOverlayFunction (upval)
					return UseDispatchResult(OpenAccountSwitchingErrorOverlayFunction(p8, p9, p10, p11, p12, p13, p14, p15))
				end,
				openPasswordResetPrompt = function()
					-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForLoginPasswordResetPromptFunction (upval)
					return UseDispatchResult(OpenCentralOverlayForLoginPasswordResetPromptFunction())
				end,
				openWebView = function(Detail)
					-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
					local config = {
						name = AppPage.GenericWebPage,
						detail = Detail,
						extraProps = { title = "", transitionAnimation = "SlideInFromBottom" }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				end,
				openAccountRecovery = function(Identifier)
					-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
					local config = {
						name = AppPage.AccountRecovery,
						extraProps = { recoverPassword = true, identifier = Identifier }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				end,
				logoutAllLoggedInUsers = function(p8, p9)
					-- upvalues: LogoutAllLoggedInUsersFunction (upval)
					return LogoutAllLoggedInUsersFunction(p8, p9)
				end,
				logoutWithoutShowConfirmation = function(p8, p9, p10)
					-- upvalues: UseDispatchResult (copy), LogoutFunction (copy)
					return UseDispatchResult(LogoutFunction(p8, p9, p10))
				end,
				openNewAppAvailableModal = OpenNewAppAvailableModal,
				closeCentralOverlay = function()
					-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
					return UseDispatchResult(CloseCentralOverlayFunction())
				end,
				clearApp = ClearApp,
				openAccountSelector = OpenAccountSelector,
				handleCredentialsCollision = HandleCredentialsCollision,
				registerPassword = RegisterPassword,
				isUserAuthenticated = function(): boolean
					-- upvalues: User (upval)
					return User.fromLocalStorage().userId ~= -1
				end
			}
		}
	}, p1.children)
end