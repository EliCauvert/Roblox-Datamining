local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthCommonModule = require(Parent.AuthCommon)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AuthenticationMethodTypeModule = require(LoginV2.Enums.AuthenticationMethodType)
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)
local UserIdentifierTypeModule = require(LoginV2.Enums.UserIdentifierType)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local TextInput = require(Parent.Foundation).TextInput
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLastLoginMethodTracking = SharedFlagsModule.FFlagEnableLastLoginMethodTracking
local FFlagEnableLoginV2ForcedUsernameOverride = SharedFlagsModule.FFlagEnableLoginV2ForcedUsernameOverride
local FFlagAuthSecExclusions = SharedFlagsModule.FFlagAuthSecExclusions
local FFlagFixLoginV2LandscapeLayout = SharedFlagsModule.FFlagFixLoginV2LandscapeLayout
local FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlagsModule.FFlagEnableNavigateToLoginAfterLogoutAll
local NeedHelpButtonModule = require(LoginV2.Components.NeedHelpButton)
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local LoginContextModule = require(LoginV2.Context.LoginContext)
local InitializeLoginModule = require(LoginV2.Thunks.InitializeLogin)
local ConstantsModule = require(LoginV2.Components.Constants)
local IsStringEmailFunction = AuthCommonModule.Utils.isStringEmail
local IsStringPhoneFunction = AuthCommonModule.Utils.isStringPhone
local CrossDeviceLogin = AuthCommonModule.Thunks.CrossDeviceLogin
local ApiFetchAuthMetaDataFunction = AuthCommonModule.Thunks.ApiFetchAuthMetaData
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local LoginMethods = AuthCommonModule.Enums.LoginMethods
local IsIosAuthServiceEnabledFunction = AuthCommonModule.Utils.isIosAuthServiceEnabled
local Logger = require(Parent.Loggers).Logger
local Default1 = require(Parent.LoggingProtocol).default
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local config = {
	disableLoginForgotButton = false,
	excludeUsernamePasswordSignIn = false,
	excludeEmailPasswordSignIn = false,
	excludePhoneNumberPasswordSignIn = false,
	excludePasskeyLogin = false,
	excludeCrossDeviceSignIn = false
}

function getUserIdentifierType(p1)
	-- upvalues: IsStringEmailFunction (copy), UserIdentifierTypeModule (copy), IsStringPhoneFunction (copy)
	return if IsStringEmailFunction(p1) then UserIdentifierTypeModule.Email elseif IsStringPhoneFunction(p1) then UserIdentifierTypeModule.Phone else UserIdentifierTypeModule.Username
end

function LoginScreenV2(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagAuthSecExclusions (copy), UniversalAppPolicyModule (copy), config (copy), LoginActionTypeModule (copy), LoginPageStateModule (copy), InitializeLoginModule (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), UserIdentifierTypeModule (copy), CryoModule (copy), AuthenticationMethodTypeModule (copy), Logger (copy), HttpService (copy), AuthClientErrorFunction (copy), EventStreamConstants (copy), AppStorageUtilities (copy), AuthButtonClickFunction (copy), FFlagEnableLastLoginMethodTracking (copy), LoginMethods (copy), Default1 (copy), TelemetryConfigs (copy), ApiFetchAuthMetaDataFunction (copy), AuthPageloadFunction (copy), IsIosAuthServiceEnabledFunction (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), UseLocalizationFunction (copy), ButtonType (copy), CrossDeviceLogin (copy), Images (copy), StandardButtonSize (copy), NeedHelpButtonModule (copy), FullscreenPageWithSafeArea (copy), FFlagFixLoginV2LandscapeLayout (copy), IconButton (copy), StyledTextLabel (copy), ConstantsModule (copy), TextInput (copy), AuthFormInteractionFunction (copy), Button (copy), ButtonStack (copy)
	local UseContextResult = ReactModule.useContext(LoginContextModule)
	local Utils = UseContextResult.utils
	local State = UseContextResult.state
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	
	if FFlagAuthSecExclusions then
		UniversalAppPolicyModule.useAppPolicy(function(p2)
			-- upvalues: config (upval)
			config.disableLoginForgotButton = p2.getDisableLoginForgotButton()
			config.excludeUsernamePasswordSignIn = p2.getExcludeUsernamePasswordSignIn()
			config.excludeEmailPasswordSignIn = p2.getExcludeEmailPasswordSignIn()
			config.excludePhoneNumberPasswordSignIn = p2.getExcludePhoneNumberPasswordSignIn()
			config.excludePasskeyLogin = p2.getExcludePasskeyLogin()
			config.excludeCrossDeviceSignIn = p2.getExcludeCrossDeviceSignIn()
		end)
	end
	local function v50(Payload)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.LoginScreenV2,
				payload = Payload
			}
		})
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UserIdentifier = State and State.componentState[LoginPageStateModule.LoginScreenV2].userIdentifier or ""
	
	local function _(UserIdentifier)
		-- upvalues: v50 (copy)
		v50({ userIdentifier = UserIdentifier })
	end
	
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UserIdentifier)
	local ErrorKey = State and State.componentState[LoginPageStateModule.LoginScreenV2].errorKey or ""
	
	local _ = function(Cvalue)
		-- upvalues: UseDispatchResult (copy), InitializeLoginModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(InitializeLoginModule(UseRoactServiceResult, { cvalue = Cvalue, ctype = getUserIdentifierType(Cvalue) }))
	end
	
	local function v59(DefaultUsername)
		-- upvalues: UseStateResult1 (copy), FFlagEnableLoginV2ForcedUsernameOverride (upval), State (copy), UseContextResult (copy), LoginActionTypeModule (upval), UseStateResult2 (copy), v50 (copy), UseStateResult2_1 (copy), FFlagEnableNavigateToLoginAfterLogoutAll (upval), UserIdentifierTypeModule (upval), UseDispatchResult (copy), InitializeLoginModule (upval), UseRoactServiceResult (copy), CryoModule (upval), AuthenticationMethodTypeModule (upval), p1 (copy), LoginPageStateModule (upval), Logger (upval), HttpService (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval)
		local DefaultUsername1 = DefaultUsername or UseStateResult1
		
		if FFlagEnableLoginV2ForcedUsernameOverride and State and State.extraProps and State.extraProps.forcedUsernameOverride and State.extraProps.forcedUsernameOverride ~= "" then
			DefaultUsername1 = State.extraProps.forcedUsernameOverride
			UseContextResult.dispatch({ type = LoginActionTypeModule.ClearForcedUsernameOverride })
		end
		UseStateResult2(true)
		v50({ userIdentifier = DefaultUsername1 })
		UseStateResult2_1(DefaultUsername1)
		
		if FFlagEnableNavigateToLoginAfterLogoutAll then
			UseContextResult.dispatch({
				type = LoginActionTypeModule.SetUserIdentifierAndType,
				data = {
					userIdentifier = DefaultUsername1,
					userIdentifierType = if State.forceLoginByUsername then UserIdentifierTypeModule.Username else getUserIdentifierType(DefaultUsername1)
				}
			})
		end
		local Cvalue = DefaultUsername1
		UseDispatchResult(InitializeLoginModule(UseRoactServiceResult, { cvalue = Cvalue, ctype = getUserIdentifierType(Cvalue) })):andThen(function(Result)
			-- upvalues: CryoModule (upval), AuthenticationMethodTypeModule (upval), UseContextResult (upval), LoginActionTypeModule (upval), DefaultUsername1 (ref), State (upval), UserIdentifierTypeModule (upval), DefaultUsername (copy), v50 (upval), UseStateResult2 (upval), p1 (upval), LoginPageStateModule (upval)
			local MapResult = CryoModule.List.map(Result.loginMethods, function(p2)
				-- upvalues: AuthenticationMethodTypeModule (upval)
				return AuthenticationMethodTypeModule[p2.method]
			end)
			UseContextResult.dispatch({
				type = LoginActionTypeModule.SetUserIdentifierAndType,
				data = {
					userIdentifier = DefaultUsername1,
					userIdentifierType = if State.forceLoginByUsername then UserIdentifierTypeModule.Username else getUserIdentifierType(DefaultUsername1)
				}
			})
			UseContextResult.dispatch({
				type = LoginActionTypeModule.SetAvailableLoginMethods,
				data = MapResult
			})
			
			if DefaultUsername == nil then
				UseContextResult.dispatch({
					type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
					data = { shouldShowAuthScreenUserSpecificPasskeyPopup = true }
				})
			else
				UseContextResult.dispatch({
					type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
					data = { shouldShowAuthScreenCredentialsPopup = true }
				})
			end
			v50({ errorKey = "" })
			UseStateResult2(false)
			p1.navigation.navigate(LoginPageStateModule.AuthenticationScreen)
		end, function(Input)
			-- upvalues: Logger (upval), HttpService (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), v50 (upval), UseStateResult2 (upval)
			Logger:warning("Error initializing login: {}", HttpService:JSONEncode(Input))
			AuthClientErrorFunction(EventStreamConstants.Context.LoginFormV2Username, Input.errorCode)
			v50({
				errorKey = Input.errorKey or "Authentication.Login.Response.SomethingWentWrong"
			})
			UseStateResult2(false)
		end)
	end
	
	local config1 = {
		isLoginByOtp = false,
		setInProgress = UseStateResult2,
		setErrorKey = function(ErrorKey)
			-- upvalues: v50 (copy)
			v50({ errorKey = ErrorKey })
		end,
		navigation = p1.navigation,
		eventContext = EventStreamConstants.Context.LoginFormV2Username
	}
	
	local _ = function(): boolean
		-- upvalues: AppStorageUtilities (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), State (copy), UseStateResult1 (copy)
		local AccountBlob = AppStorageUtilities.getAccountBlob()
		local DefaultUsername = AppStorageUtilities.getDefaultUsername()
		local IsNotAccountBlobMatch: boolean = AccountBlob and AccountBlob ~= ""
		local IsNotDefaultUsernameMatch: boolean = DefaultUsername and DefaultUsername ~= ""
		
		return if FFlagEnableLoginV2ForcedUsernameOverride and State.extraProps and State.extraProps.forcedUsernameOverride then State.extraProps.forcedUsernameOverride ~= "" else IsNotDefaultUsernameMatch and not (IsNotAccountBlobMatch or UseStateResult1 ~= "")
	end
	
	ReactModule.useEffect(function()
		-- upvalues: State (copy), LoginPageStateModule (upval), AppStorageUtilities (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), UseStateResult1 (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), FFlagEnableLastLoginMethodTracking (upval), LoginMethods (upval), v50 (copy), UseStateResult2_1 (copy), FFlagEnableNavigateToLoginAfterLogoutAll (upval), UseContextResult (copy), LoginActionTypeModule (upval), v59 (copy)
		if State and State.componentState[LoginPageStateModule.LoginScreenV2].shouldAttemptCredentialPrefill or false then
			local AccountBlob = AppStorageUtilities.getAccountBlob()
			local DefaultUsername = AppStorageUtilities.getDefaultUsername()
			local IsNotAccountBlobMatch: boolean = AccountBlob and AccountBlob ~= ""
			local IsNotDefaultUsernameMatch: boolean = DefaultUsername and DefaultUsername ~= ""
			
			if if FFlagEnableLoginV2ForcedUsernameOverride and State.extraProps and State.extraProps.forcedUsernameOverride then State.extraProps.forcedUsernameOverride ~= "" else IsNotDefaultUsernameMatch and not (IsNotAccountBlobMatch or UseStateResult1 ~= "") then
				local DefaultUsername1 = AppStorageUtilities.getDefaultUsername()
				AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Button.PrefilledNext, nil, nil)
				
				if not FFlagEnableLastLoginMethodTracking then
					v59(DefaultUsername1)
				elseif AppStorageUtilities.getLastSuccessfulSignInMethod() ~= LoginMethods.QuickLogin then
					v59(DefaultUsername1)
					
					return
				else
					v50({ userIdentifier = DefaultUsername1 })
					UseStateResult2_1(DefaultUsername1)
					
					if FFlagEnableNavigateToLoginAfterLogoutAll then
						UseContextResult.dispatch({
							type = LoginActionTypeModule.SetUserIdentifierAndType,
							data = {
								userIdentifier = DefaultUsername1,
								userIdentifierType = getUserIdentifierType(DefaultUsername1)
							}
						})
						
						return
					end
				end
				return
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Default1 (upval), TelemetryConfigs (upval), Utils (copy), HttpService (upval), ApiFetchAuthMetaDataFunction (upval), UseRoactServiceResult (copy), AuthPageloadFunction (upval), EventStreamConstants (upval), Logger (upval)
		Default1:logRobloxTelemetryCounter(TelemetryConfigs.LoginPageMountTelemetryConfig, 1, { version = 2 })
		local Json = HttpService:JSONEncode({ isAuthenticated = Utils.isUserAuthenticated() })
		ApiFetchAuthMetaDataFunction(UseRoactServiceResult):andThen(function(Result)
			-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval), Json (copy)
			AuthPageloadFunction(EventStreamConstants.Context.LoginFormV2Username, Json, Result and Result.IsAltBrowserTracker)
		end, function(p2)
			-- upvalues: Logger (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), Json (copy)
			Logger:warning("Error auth metadata: {}", p2)
			AuthPageloadFunction(EventStreamConstants.Context.LoginFormV2Username, Json, nil)
		end)
	end, {})
	local InitialStateUpdated = State.credentialsProtocolStatus.initialStateUpdated
	local Fido2Supported = State.credentialsProtocolStatus.fido2Supported
	ReactModule.useEffect(function()
		-- upvalues: InitialStateUpdated (copy), State (copy), FFlagAuthSecExclusions (upval), config (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), UseContextResult (copy), LoginActionTypeModule (upval), AppStorageUtilities (upval), LoginMethods (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), UseStateResult1 (copy), Utils (copy), config1 (copy), IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval), Logger (upval), HttpService (upval), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval)
		if InitialStateUpdated or not State.shouldAutoShowCredentialPopup then return end
		local function v82(CredProtocolIsAvailableResponse)
			-- upvalues: FFlagAuthSecExclusions (upval), config (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), UseContextResult (upval), LoginActionTypeModule (upval), AppStorageUtilities (upval), LoginMethods (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), State (upval), UseStateResult1 (upval), Utils (upval), config1 (upval), IsIosAuthServiceEnabledFunction (upval), Default1 (upval), TelemetryConfigs (upval)
			local IsAvailable = false
			local HasPassword = false
			local SupportsDeviceBoundOnly = nil
			
			if CredProtocolIsAvailableResponse.FIDO2 == nil then
				SupportsDeviceBoundOnly = CredProtocolIsAvailableResponse.isAvailable and CredProtocolIsAvailableResponse.supportsDeviceBoundOnly or false
			else
				SupportsDeviceBoundOnly = CredProtocolIsAvailableResponse.FIDO2.isAvailable and CredProtocolIsAvailableResponse.FIDO2.supportsDeviceBoundOnly
				IsAvailable = CredProtocolIsAvailableResponse.password and CredProtocolIsAvailableResponse.password.isAvailable
				HasPassword = CredProtocolIsAvailableResponse.password ~= nil
			end
			if FFlagAuthSecExclusions and config.excludePasskeyLogin then
				SupportsDeviceBoundOnly = false
			end
			AuthPageloadFunction(EventStreamConstants.Context.PasskeyLoginV2, if SupportsDeviceBoundOnly == nil then "timeout" else tostring(SupportsDeviceBoundOnly))
			UseContextResult.dispatch({
				type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
				data = {
					fido2Supported = SupportsDeviceBoundOnly,
					passwordsSupported = IsAvailable,
					v2InterfaceSupported = HasPassword
				}
			})
			UseContextResult.dispatch({ type = LoginActionTypeModule.SetCredentialAutoPopupShown })
			
			if AppStorageUtilities.getLastSuccessfulSignInMethod() ~= LoginMethods.QuickLogin then
				local AccountBlob = AppStorageUtilities.getAccountBlob()
				local DefaultUsername = AppStorageUtilities.getDefaultUsername()
				local IsNotAccountBlobMatch: boolean = AccountBlob and AccountBlob ~= ""
				local IsNotDefaultUsernameMatch: boolean = DefaultUsername and DefaultUsername ~= ""
				
				if if FFlagEnableLoginV2ForcedUsernameOverride and State.extraProps and State.extraProps.forcedUsernameOverride then State.extraProps.forcedUsernameOverride ~= "" else IsNotDefaultUsernameMatch and not (IsNotAccountBlobMatch or UseStateResult1 ~= "") then return end
			end
			if HasPassword then
				Utils.showGenericCredentialLoginPopup(SupportsDeviceBoundOnly, IsAvailable, false, config1)
				
				return
			end
			if SupportsDeviceBoundOnly then
				Utils.showPasskeyLoginPopup(config1, false, true)
				
				return
			end
			if IsIosAuthServiceEnabledFunction() then
				Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "protocolNotSupported" })
			end
		end
		
		local ExtraProps = State.extraProps
		
		if ExtraProps.credProtocolIsAvailableResponse and ExtraProps.credProtocolIsAvailableResponse.isAvailable ~= nil then
			Logger:info("Using prefetched credentials protocol response: {}", HttpService:JSONEncode(ExtraProps.credProtocolIsAvailableResponse))
			AuthPageloadFunction(EventStreamConstants.Context.LoginRevampIsAvailableFetch, "0")
			v82(ExtraProps.credProtocolIsAvailableResponse)
			
			return
		else
			local ClockTime = os.clock()
			Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
				-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval), ClockTime (copy), v82 (copy)
				AuthPageloadFunction(EventStreamConstants.Context.LoginRevampIsAvailableFetch, (tostring(os.clock() - ClockTime)))
				v82(Result)
			end):catch(function(Err)
				-- upvalues: UseContextResult (upval), LoginActionTypeModule (upval), Logger (upval), IsIosAuthServiceEnabledFunction (upval), AppStorageUtilities (upval), LoginMethods (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), State (upval), UseStateResult1 (upval), Default1 (upval), TelemetryConfigs (upval)
				UseContextResult.dispatch({
					type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
					data = {
						fido2Supported = false,
						passwordsSupported = false,
						v2InterfaceSupported = false
					}
				})
				Logger:warning("Error checking for available credential types. Error: {}", Err)
				
				if IsIosAuthServiceEnabledFunction() then
					if AppStorageUtilities.getLastSuccessfulSignInMethod() ~= LoginMethods.QuickLogin then
						local AccountBlob = AppStorageUtilities.getAccountBlob()
						local DefaultUsername = AppStorageUtilities.getDefaultUsername()
						local IsNotAccountBlobMatch: boolean = AccountBlob and AccountBlob ~= ""
						local IsNotDefaultUsernameMatch: boolean = DefaultUsername and DefaultUsername ~= ""
						
						if not (if FFlagEnableLoginV2ForcedUsernameOverride and State.extraProps and State.extraProps.forcedUsernameOverride then State.extraProps.forcedUsernameOverride ~= "" else IsNotDefaultUsernameMatch and not (IsNotAccountBlobMatch or UseStateResult1 ~= "")) then
							Default1:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetUnavailableConfig, 1, { errorCode = "protocolUnavailable" })
						end
					end
				end
			end)
		end
	end, {})
	
	local _ = function(): string
		-- upvalues: FFlagAuthSecExclusions (upval), config (upval)
		if FFlagAuthSecExclusions then
			if config.excludeEmailPasswordSignIn and config.excludePhoneNumberPasswordSignIn then
				return "Authentication.Login.Label.Username"
			elseif config.excludeEmailPasswordSignIn and config.excludeUsernamePasswordSignIn then
				return "Authentication.Login.Label.Phone"
			elseif config.excludeUsernamePasswordSignIn and config.excludePhoneNumberPasswordSignIn then
				return "Authentication.Login.Label.Email"
			elseif config.excludeEmailPasswordSignIn then
				return "Authentication.Login.Label.UsernameOrPhone"
			elseif config.excludeUsernamePasswordSignIn then
				return "Authentication.Login.Label.EmailOrPhone"
			elseif config.excludePhoneNumberPasswordSignIn then
				return "Authentication.Login.Label.UsernameOrEmail"
			end
		end
		return "Authentication.Login.Label.UsernameEmailOrPhoneNumber"
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		signInHeadingText = "Authentication.Login.Heading.SignIn",
		orText = "Authentication.SignUp.Description.Or",
		nextActionText = "Authentication.Login.Action.Next",
		quickSignInActionText = "Authentication.Login.Action.QuickSignIn",
		usePasskeyActionText = "Authentication.Login.Action.UsePasskey",
		passkeyIncompatibleText = "Authentication.Login.Label.PasskeyIncompatible",
		identifierLabelText = if FFlagAuthSecExclusions then if config.excludeEmailPasswordSignIn and config.excludePhoneNumberPasswordSignIn then "Authentication.Login.Label.Username" elseif config.excludeEmailPasswordSignIn and config.excludeUsernamePasswordSignIn then "Authentication.Login.Label.Phone" elseif config.excludeUsernamePasswordSignIn and config.excludePhoneNumberPasswordSignIn then "Authentication.Login.Label.Email" elseif config.excludeEmailPasswordSignIn then "Authentication.Login.Label.UsernameOrPhone" elseif config.excludeUsernamePasswordSignIn then "Authentication.Login.Label.EmailOrPhone" elseif config.excludePhoneNumberPasswordSignIn then "Authentication.Login.Label.UsernameOrEmail" else "Authentication.Login.Label.UsernameEmailOrPhoneNumber" else "Authentication.Login.Label.UsernameEmailOrPhoneNumber",
		errorText = if ErrorKey == "" then nil else ErrorKey
	})
	local List = {}
	
	if not config.excludeCrossDeviceSignIn then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), UseDispatchResult (copy), CrossDeviceLogin (upval), Utils (copy), config1 (copy)
					AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Button.QuickLogin, nil, nil)
					UseDispatchResult(CrossDeviceLogin.OpenLoginCodePrompt({
						isOverlay = true,
						loginCallback = function(p2, p3, p4, p5)
							-- upvalues: Utils (upval), config1 (upval)
							Utils.handleLoginWithCode(p2, p3, p4, p5, config1)
						end
					}))
				end,
				text = UseLocalizationResult.quickSignInActionText,
				icon = Images["icons/menu/scanqr"],
				standardSize = StandardButtonSize.Regular,
				isLoading = UseStateResult
			}
		})
	end
	local NoFFlagAuthSecExclusions: boolean = not FFlagAuthSecExclusions or not config.excludeEmailPasswordSignIn or not config.excludePhoneNumberPasswordSignIn or not config.excludeUsernamePasswordSignIn
	
	if (Fido2Supported or not InitialStateUpdated) and not config.excludePasskeyLogin then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), FFlagEnableNavigateToLoginAfterLogoutAll (upval), UseStateResult1 (copy), UseContextResult (copy), LoginActionTypeModule (upval), Utils (copy), config1 (copy)
					AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Button.UsePasskey, nil, nil)
					
					if FFlagEnableNavigateToLoginAfterLogoutAll and UseStateResult1 ~= "" then
						UseContextResult.dispatch({
							type = LoginActionTypeModule.SetUserIdentifierAndType,
							data = {
								userIdentifier = UseStateResult1,
								userIdentifierType = getUserIdentifierType(UseStateResult1)
							}
						})
					end
					Utils.showPasskeyLoginPopup(config1, false, false)
				end,
				text = UseLocalizationResult.usePasskeyActionText,
				icon = Images["icons/menu/passkey"],
				standardSize = StandardButtonSize.Regular,
				isLoading = not InitialStateUpdated or UseStateResult
			}
		})
	end
	local Element = if config.disableLoginForgotButton then nil else ReactModule.createElement(NeedHelpButtonModule, {
		layoutOrder = 10,
		textKey = "Authentication.Login.Action.ForgotUsername",
		isDisabled = UseStateResult,
		originPage = EventStreamConstants.Context.LoginFormV2Username,
		identifierAutofill = UseStateResult1
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement(if FFlagFixLoginV2LandscapeLayout then "ScrollingFrame" else "Frame", if FFlagFixLoginV2LandscapeLayout then {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y
		} else {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if FFlagFixLoginV2LandscapeLayout then Enum.HorizontalAlignment.Center else nil
			}),
			Header = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BackButton = ReactModule.createElement(IconButton, {
					icon = Images["icons/navigation/close"],
					onActivated = function()
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), UseContextResult (copy)
						AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Button.Back)
						UseContextResult.parentNavigation.goBack()
					end,
					size = UDim2.new(0, 36, 0, 36),
					isDisabled = UseStateResult
				}),
				SignInHeadingFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					SignInHeadingText = ReactModule.createElement(StyledTextLabel, {
						text = UseLocalizationResult.signInHeadingText,
						fontStyle = UseStyleResult.Font.Header1,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Center
					})
				})
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UISizeConstraint = FFlagFixLoginV2LandscapeLayout and ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(ConstantsModule.CONTENT_MAX_WIDTH, 1e999)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingBottom = if FFlagFixLoginV2LandscapeLayout then UDim.new(0, UseDesignTokensResult.Size.Size_800) else nil
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
				}),
				SignInHeadingSpacing = NoFFlagAuthSecExclusions and ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_800)
				}),
				IdentifierLabel = NoFFlagAuthSecExclusions and ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 3,
					text = UseLocalizationResult.identifierLabelText,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					automaticSize = Enum.AutomaticSize.XY
				}),
				IdentifierLabelSpacing = NoFFlagAuthSecExclusions and ReactModule.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
				}),
				UserIdentifierTextField = NoFFlagAuthSecExclusions and ReactModule.createElement(TextInput, {
					LayoutOrder = 5,
					label = "",
					text = UserIdentifier,
					width = UDim.new(1, 0),
					textInputType = Enum.TextInputType.Username,
					onChanged = function(p2)
						-- upvalues: ErrorKey (copy), v50 (copy), UseStateResult2_1 (copy)
						if ErrorKey ~= "" then
							v50({ errorKey = "" })
						end
						UseStateResult2_1(p2)
					end,
					onFocusGained = function()
						-- upvalues: AuthFormInteractionFunction (upval), EventStreamConstants (upval), UseStateResult1 (copy)
						AuthFormInteractionFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Field.Username, nil, nil, #UseStateResult1 > 0)
					end,
					isDisabled = UseStateResult
				}),
				ErrorTextSpacing = NoFFlagAuthSecExclusions and (UseLocalizationResult.errorText and ReactModule.createElement("Frame", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
				})),
				ErrorTextLabel = NoFFlagAuthSecExclusions and (UseLocalizationResult.errorText and ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 7,
					textWrapped = true,
					text = UseLocalizationResult.errorText,
					fontStyle = UseStyleResult.Font.BodySmall,
					colorStyle = UseStyleResult.Theme.Alert,
					automaticSize = Enum.AutomaticSize.XY
				})),
				NextButtonSpacing = NoFFlagAuthSecExclusions and ReactModule.createElement("Frame", {
					LayoutOrder = 8,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
				}),
				NextButton = NoFFlagAuthSecExclusions and ReactModule.createElement(Button, {
					layoutOrder = 9,
					standardSize = StandardButtonSize.Regular,
					buttonType = ButtonType.PrimaryContextual,
					text = UseLocalizationResult.nextActionText,
					buttonTextOverride = ConstantsModule.getButtonTextOverrideConfig(),
					onActivated = function()
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), v59 (copy)
						AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Username, EventStreamConstants.Button.Next, nil, nil)
						v59()
					end,
					isDisabled = UseStateResult1 == "",
					isLoading = UseStateResult
				}),
				HelpButton = NoFFlagAuthSecExclusions and Element,
				AlternativeLoginDivider = #List > 0 and (NoFFlagAuthSecExclusions and ReactModule.createElement("Frame", {
					LayoutOrder = 11,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					DividerText = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 1,
						text = UseLocalizationResult.orText,
						fontStyle = UseStyleResult.Font.Header2,
						colorStyle = UseStyleResult.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Center
					})
				})),
				Spacing = ReactModule.createElement("Frame", {
					LayoutOrder = 12,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
				}),
				AlternativeLoginButtonFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 13,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					AlternativeLoginButtons = ReactModule.createElement(ButtonStack, {
						forcedFillDirection = Enum.FillDirection.Vertical,
						buttons = List
					})
				})
			})
		})
	})
end

return LoginScreenV2