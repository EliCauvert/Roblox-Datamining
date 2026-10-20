local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetUserAppLaunchInfoModule = require(Modules.LuaApp.Http.Requests.GetUserAppLaunchInfo)
local UserModule = require(script.Parent.User)
local GetLocalUserFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local SetAuthenticationStatusFunction = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FetchThemeModule = require(Modules.LuaApp.Thunks.FetchTheme)
local ClearAppModule = require(script.Parent.ClearApp)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local AppPageModule = require(Modules.LuaApp.AppPage)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local AppSessionCheckCounterNamesModule = require(Modules.LuaApp.Analytics.Events.AppSessionCheckCounterNames)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local CloseAccountAuthenticationFailureOverlayModule = require(Modules.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local ResetOnNoAccountInfoFoundModule = require(Modules.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound)
local ShowAccountAuthenticationFailureOverlayModule = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local DeleteAllCredentialsFromKeystoreModule = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local ApiFetchUsersRolesModule = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ReceivedUserCountryCodeFunction = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local TracerService = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local GetFFlagPasskeySignupEnabledModule = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local FFlagEnableIosKeychainLoginLuaModule = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local HttpService = game:GetService("HttpService")
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local ContentProvider = game:GetService("ContentProvider")
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local KeystoreDeleteCredentialsTelemetryConfig = TelemetryConfigs.KeystoreDeleteCredentialsTelemetryConfig
local TelemetryService = game:GetService("TelemetryService")
local Default1 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local HandlePreHomePageRoutingFunction = require(CorePackages.Workspace.Packages.PreHomePage).HandlePreHomePageRouting
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPreHomePageRoutingEnabled = SharedFlagsModule.FFlagPreHomePageRoutingEnabled
local FFlagPasskeyUpsellEnabled = SharedFlagsModule.FFlagPasskeyUpsellEnabled
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps

local function _(p1, p2)
	-- upvalues: GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	GuiService:BroadcastNotification(p1:toJsonData(), NotificationTypeModule.DID_LOG_IN)
	p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
end

local function navigateToPostAuthLandingPage(p1, p2, Name, p3, p4)
	-- upvalues: AppStorageUtilitiesModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), GetFFlagPasskeySignupEnabledModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRoutingFunction (copy)
	local SignupActionRequired = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else ""
	
	if p2 and p3.isUnder13 then
		p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
		
		return
	end
	if SignupActionRequired == "auth" then
		if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
			p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
			
			return
		else
			AppStorageUtilitiesModule.setSignupActionRequired("")
			AppStorageUtilitiesModule.flush()
			p1:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
			
			return
		end
	elseif FFlagPreHomePageRoutingEnabled or FFlagPasskeyUpsellEnabled then
		HandlePreHomePageRoutingFunction(p4, p1, ResetNavigationHistoryModule):andThen(function(Result)
			-- upvalues: p1 (copy), ResetNavigationHistoryModule (upval), Name (copy)
			if not Result then
				p1:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
			end
		end)
		
		return
	else
		p1:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
	end
end

local function clearAuthFailureOverlayOnSuccess(p1, FromLocalStorageResult, p2, p3, Name, p4)
	-- upvalues: OverlayTypeModule (copy), CloseAccountAuthenticationFailureOverlayModule (copy), navigateToPostAuthLandingPage (copy)
	if p1:getState().CentralOverlay.OverlayType == OverlayTypeModule.AccountAuthenticationFailureOverlay then
		p1:dispatch(CloseAccountAuthenticationFailureOverlayModule())
		
		if FromLocalStorageResult:isEqual(p2) then
			navigateToPostAuthLandingPage(p1, p3, Name, FromLocalStorageResult, p4)
		end
	end
end

local function handleUserMismatchAndUpdatePreloadStarted(FromLocalStorageResult, p1, p2, p3, p4: boolean, p5, Name, p6): boolean
	-- upvalues: ClearAppModule (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), navigateToPostAuthLandingPage (copy), RoactAppExperimentModule (copy)
	if not FromLocalStorageResult:isEqual(p1) then
		FromLocalStorageResult:setToLocalPlayer()
		FromLocalStorageResult:setToLocalStorage()
		
		if p3 then
			p2:dispatch(ClearAppModule())
			p4 = false
		end
		p2:dispatch(GetLocalUserFunction())
		p2:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
		navigateToPostAuthLandingPage(p2, p5, Name, FromLocalStorageResult, p6)
		RoactAppExperimentModule.initializeUserLayers(FromLocalStorageResult.userId)
	end
	return p4
end

local function fetchAndApplyUserSettings(Promise, p1, FromLocalStorageResult, p2)
	-- upvalues: AppStorageUtilitiesModule (copy), LocalizationService (copy), FetchThemeModule (copy), ApiFetchUsersRolesModule (copy), GetFFlagPasskeySignupEnabledModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), PromiseUtilitiesModule (copy)
	local List = {}
	table.insert(List, Promise:andThen(function(Result)
		-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
		AppStorageUtilitiesModule.setRobloxLocaleId(Result.generalExperienceLocale)
		AppStorageUtilitiesModule.setGameLocaleId(Result.ugcLocale)
		LocalizationService:SetRobloxLocaleId(Result.generalExperienceLocale)
	end))
	local ThemeModule = FetchThemeModule(p1, FromLocalStorageResult.userId)
	p2:dispatch(ApiFetchUsersRolesModule(p1))
	local FFlagPasskeySignupEnabledModule = (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else "") == "auth" and GetFFlagPasskeySignupEnabledModule()
	table.insert(List, ThemeModule:andThen(function(Result)
		-- upvalues: AppStorageUtilitiesModule (upval), FFlagPasskeySignupEnabledModule (copy), MemStorageService (upval), MemStorageKeysModule (upval)
		AppStorageUtilitiesModule.setAuthenticatedTheme(Result)
		
		if not FFlagPasskeySignupEnabledModule then
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, Result)
		end
	end))
	PromiseUtilitiesModule.Batch(List):andThen(function()
		-- upvalues: AppStorageUtilitiesModule (upval)
		AppStorageUtilitiesModule.flush()
	end)
end

local function v50()
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), DeleteAllCredentialsFromKeystoreModule (copy), Default (copy), KeystoreConstants (copy)
	local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
	
	return if GetFFlagKeystoreAutoLoginAvailableFunction() then DeleteAllCredentialsFromKeystoreModule(Json) else Default:deleteAllCredentialsFromiOSKeychain(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
end

local _ = function(UNAUTHORIZED)
	-- upvalues: StatusCodes (copy), ReportEphemeralCounterModule (copy), AppSessionCheckCounterNamesModule (copy)
	if UNAUTHORIZED == StatusCodes.UNAUTHORIZED then
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
	else
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.FailureUnknownError, 1)
	end
	ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure, 1)
end

local function handleUnauthorizedError(p1, p2, p3, Promise)
	-- upvalues: Default1 (copy), TelemetryConfigs (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v50 (copy), ResetOnNoAccountInfoFoundModule (copy), LuaLogoutReasonNamesModule (copy)
	spawn(function()
		-- upvalues: Default1 (upval), TelemetryConfigs (upval)
		Default1:logRobloxTelemetryCounter(TelemetryConfigs.NoCookieForCachedUserTelemetryConfig, 1)
	end)
	
	if FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction() then
		KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.remoteLogoutDelete)
		
		if GetFFlagAddPromCounterToKeystoreOpsFunction() then
			TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, { customFields = { reason = "remote_logout" } }, 1)
		end
		v50()
	end
	ResetOnNoAccountInfoFoundModule(p1, p2, p3, Promise, LuaLogoutReasonNamesModule.UnauthorizedAutoLogin, nil, nil, false)
end

local _ = function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: ShowAccountAuthenticationFailureOverlayModule (copy)
	ShowAccountAuthenticationFailureOverlayModule(p1, function()
		-- upvalues: p3 (copy), p2 (copy), p4 (copy), p5 (copy), p1 (copy), p6 (copy), p7 (copy)
		handleAccountInfoFromLua(p3, p2, p4, p5, p1, p6, p7)
	end)
end

local _ = function(UNAUTHORIZED, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: StatusCodes (copy), ReportEphemeralCounterModule (copy), AppSessionCheckCounterNamesModule (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlayModule (copy)
	if UNAUTHORIZED == StatusCodes.UNAUTHORIZED then
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
	else
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.FailureUnknownError, 1)
	end
	ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure, 1)
	
	if UNAUTHORIZED == StatusCodes.UNAUTHORIZED then
		handleUnauthorizedError(p1, p2, p3, p4)
		
		return
	else
		ShowAccountAuthenticationFailureOverlayModule(p2, function()
			-- upvalues: p5 (copy), p3 (copy), p4 (copy), p1 (copy), p2 (copy), p6 (copy), p7 (copy)
			handleAccountInfoFromLua(p5, p3, p4, p1, p2, p6, p7)
		end)
	end
end

function handleAccountInfoFromLua(p1, p2, Promise, p3, p4, p5, Callback, p6, p7, p8)
	-- upvalues: TracerService (copy), GetUserAppLaunchInfoModule (copy), ReportEphemeralCounterModule (copy), AppSessionCheckCounterNamesModule (copy), UserModule (copy), clearAuthFailureOverlayOnSuccess (copy), handleUserMismatchAndUpdatePreloadStarted (copy), fetchAndApplyUserSettings (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), StatusCodes (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlayModule (copy)
	local LuaAccountInfo = if TracerService then TracerService:StartSpan("luaAccountInfo", "") else ""
	
	if p6 then
		p6:logEventOnce("lua_auth_request_begin")
	end
	GetUserAppLaunchInfoModule(p2):andThen(function(Result)
		-- upvalues: p6 (copy), TracerService (upval), LuaAccountInfo (ref), ReportEphemeralCounterModule (upval), AppSessionCheckCounterNamesModule (upval), UserModule (upval), clearAuthFailureOverlayOnSuccess (upval), p4 (copy), p1 (copy), p7 (copy), p5 (copy), p2 (copy), p8 (ref), handleUserMismatchAndUpdatePreloadStarted (upval), p3 (copy), Callback (copy), fetchAndApplyUserSettings (upval), Promise (copy), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
		if p6 then
			p6:logEventOnce("lua_auth_request_end")
		end
		if TracerService and LuaAccountInfo ~= "" then
			TracerService:FinishSpan(LuaAccountInfo)
		end
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Success, 1)
		local FromUserInfoRequestResult = UserModule.fromUserInfoRequest(Result)
		clearAuthFailureOverlayOnSuccess(p4, FromUserInfoRequestResult, p1, p7, p5, p2)
		p8 = handleUserMismatchAndUpdatePreloadStarted(FromUserInfoRequestResult, p1, p4, p3, p8, p7, p5, p2)
		
		if not p8 then
			p8 = true
			Callback()
		end
		fetchAndApplyUserSettings(Promise, p2, FromUserInfoRequestResult, p4)
		GuiService:BroadcastNotification(FromUserInfoRequestResult:toJsonData(), NotificationTypeModule.DID_LOG_IN)
		p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
	end, function(p9)
		-- upvalues: p3 (copy), p4 (copy), p2 (copy), Promise (copy), p1 (copy), p5 (copy), Callback (copy), StatusCodes (upval), ReportEphemeralCounterModule (upval), AppSessionCheckCounterNamesModule (upval), handleUnauthorizedError (upval), ShowAccountAuthenticationFailureOverlayModule (upval)
		local StatusCode = p9.StatusCode
		
		if StatusCode == StatusCodes.UNAUTHORIZED then
			ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
		else
			ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.FailureUnknownError, 1)
		end
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure, 1)
		
		if StatusCode == StatusCodes.UNAUTHORIZED then
			handleUnauthorizedError(p3, p4, p2, Promise)
			
			return
		else
			ShowAccountAuthenticationFailureOverlayModule(p4, function()
				-- upvalues: p1 (copy), p2 (copy), Promise (copy), p3 (copy), p4 (copy), p5 (copy), Callback (copy)
				handleAccountInfoFromLua(p1, p2, Promise, p3, p4, p5, Callback)
			end)
		end
	end)
end

function handleSessionCheckSuccess(p1, p2, Promise, p3, p4, p5, Callback: () -> (), _, p6, p7)
	-- upvalues: UserModule (copy), clearAuthFailureOverlayOnSuccess (copy), handleUserMismatchAndUpdatePreloadStarted (copy), fetchAndApplyUserSettings (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	local FromLocalStorageResult = UserModule.fromLocalStorage()
	clearAuthFailureOverlayOnSuccess(p4, FromLocalStorageResult, p2, p6, p5, p1)
	
	if not handleUserMismatchAndUpdatePreloadStarted(FromLocalStorageResult, p2, p4, p3, p7, p6, p5, p1) then
		Callback()
	end
	fetchAndApplyUserSettings(Promise, p1, FromLocalStorageResult, p4)
	GuiService:BroadcastNotification(FromLocalStorageResult:toJsonData(), NotificationTypeModule.DID_LOG_IN)
	p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
end

function handleSessionCheckFailure(UNAUTHORIZED, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: StatusCodes (copy), ReportEphemeralCounterModule (copy), AppSessionCheckCounterNamesModule (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlayModule (copy)
	if UNAUTHORIZED == StatusCodes.UNAUTHORIZED then
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
	else
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.FailureUnknownError, 1)
	end
	ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure, 1)
	
	if UNAUTHORIZED == StatusCodes.UNAUTHORIZED then
		handleUnauthorizedError(p1, p2, p3, p4)
		
		return
	else
		ShowAccountAuthenticationFailureOverlayModule(p2, function()
			-- upvalues: p5 (copy), p3 (copy), p4 (copy), p1 (copy), p2 (copy), p6 (copy), p7 (copy)
			handleAccountInfoFromLua(p5, p3, p4, p1, p2, p6, p7)
		end)
	end
end

return {
	handleSessionCheckSuccess = handleSessionCheckSuccess,
	handleSessionCheckFailure = handleSessionCheckFailure,
	handleAccountInfoFromLua = handleAccountInfoFromLua
}