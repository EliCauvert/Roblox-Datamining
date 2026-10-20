local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
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
local RestrictionSourceModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionSource)
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
local DeleteAllCredentialsFromKeystoreModule = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local ShowAccountAuthenticationFailureOverlayModule = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local ApiFetchUsersRolesModule = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local ReceivedUserCountryCodeFunction = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local TracerService = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local GetFFlagPasskeySignupEnabledModule = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local EnableLaunchAppCheckForAccountSwitchGameParams = game:DefineFastFlag("EnableLaunchAppCheckForAccountSwitchGameParams", false)
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
local FFlagEnableMagicLogin = SharedFlagsModule.FFlagEnableMagicLogin
local FFlagEnablePostAuthRoutingInAllCases = SharedFlagsModule.FFlagEnablePostAuthRoutingInAllCases
local GetFFlagFixPlatformRestrictedHomeClobberFunction = SharedFlagsModule.GetFFlagFixPlatformRestrictedHomeClobber
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local SetMagicLoginAdvertisementFunction = require(CorePackages.Workspace.Packages.LoginV2.Thunks).SetMagicLoginAdvertisement
local FFlagEnableRecordLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRecordLogin
local UpdateLoginEntryDataFunction = AuthCommonModule.Utils.updateLoginEntryData

local function _(p1, p2)
	-- upvalues: GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	GuiService:BroadcastNotification(p1:toJsonData(), NotificationTypeModule.DID_LOG_IN)
	p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
end

local function navigateToPostAuthLandingPage(p1, p2, Name, FromUserInfoRequestResult, p3)
	-- upvalues: LinkingProtocol (copy), AppStorageUtilitiesModule (copy), RestrictionSourceModule (copy), GetFFlagFixPlatformRestrictedHomeClobberFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), GetFFlagPasskeySignupEnabledModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRoutingFunction (copy)
	local IsNotLastLuaURLMatch: boolean = LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= ""
	local SignupActionRequired = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else ""
	
	local function _(): boolean
		-- upvalues: p1 (copy), RestrictionSourceModule (upval)
		local UserAccess = p1:getState().UserAccess
		
		return UserAccess ~= nil and (UserAccess.restrictionDetail ~= nil and UserAccess.restrictionDetail.source == RestrictionSourceModule.PlatformAccess)
	end
	
	local function resetToPostAuthLanding()
		-- upvalues: GetFFlagFixPlatformRestrictedHomeClobberFunction (upval), p1 (copy), RestrictionSourceModule (upval), ResetNavigationHistoryModule (upval), Name (copy)
		if GetFFlagFixPlatformRestrictedHomeClobberFunction() then
			local UserAccess = p1:getState().UserAccess
			
			if UserAccess ~= nil and (UserAccess.restrictionDetail ~= nil and UserAccess.restrictionDetail.source == RestrictionSourceModule.PlatformAccess) then return end
		end
		p1:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
	end
	
	if p2 and FromUserInfoRequestResult.isUnder13 then
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
		HandlePreHomePageRoutingFunction(p3, p1, ResetNavigationHistoryModule):andThen(function(Result)
			-- upvalues: IsNotLastLuaURLMatch (copy), resetToPostAuthLanding (copy)
			if not Result and not IsNotLastLuaURLMatch then
				resetToPostAuthLanding()
			end
		end)
		
		return
	else
		if not IsNotLastLuaURLMatch then
			resetToPostAuthLanding()
		end
	end
end

local function v55()
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), DeleteAllCredentialsFromKeystoreModule (copy), Default (copy), KeystoreConstants (copy)
	local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
	
	return if GetFFlagKeystoreAutoLoginAvailableFunction() then DeleteAllCredentialsFromKeystoreModule(Json) else Default:deleteAllCredentialsFromiOSKeychain(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
end

local function handleAccountInfo(p1, p2, Promise, p3, p4, Name, Callback, p5, p6, p7)
	-- upvalues: TracerService (copy), GetUserAppLaunchInfoModule (copy), RbxAnalyticsService (copy), ReportEphemeralCounterModule (copy), AppSessionCheckCounterNamesModule (copy), EnableLaunchAppCheckForAccountSwitchGameParams (copy), AppStorageUtilitiesModule (copy), ExperienceService (copy), UserModule (copy), FFlagEnableRecordLogin (copy), UpdateLoginEntryDataFunction (copy), OverlayTypeModule (copy), CloseAccountAuthenticationFailureOverlayModule (copy), FFlagEnablePostAuthRoutingInAllCases (copy), navigateToPostAuthLandingPage (copy), ClearAppModule (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), RoactAppExperimentModule (copy), LocalizationService (copy), FetchThemeModule (copy), ApiFetchUsersRolesModule (copy), GetFFlagPasskeySignupEnabledModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), PromiseUtilitiesModule (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), FFlagEnableMagicLogin (copy), SetMagicLoginAdvertisementFunction (copy), StatusCodes (copy), Default1 (copy), TelemetryConfigs (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v55 (copy), ResetOnNoAccountInfoFoundModule (copy), LuaLogoutReasonNamesModule (copy), ShowAccountAuthenticationFailureOverlayModule (copy), handleAccountInfo (copy)
	local LuaAccountInfo = if TracerService then TracerService:StartSpan("luaAccountInfo", "") else ""
	
	if p5 then
		p5:logEventOnce("lua_auth_request_begin")
	end
	GetUserAppLaunchInfoModule(p1):andThen(function(Result)
		-- upvalues: p5 (copy), TracerService (upval), LuaAccountInfo (ref), RbxAnalyticsService (upval), ReportEphemeralCounterModule (upval), AppSessionCheckCounterNamesModule (upval), EnableLaunchAppCheckForAccountSwitchGameParams (upval), AppStorageUtilitiesModule (upval), ExperienceService (upval), UserModule (upval), FFlagEnableRecordLogin (upval), UpdateLoginEntryDataFunction (upval), p4 (copy), OverlayTypeModule (upval), CloseAccountAuthenticationFailureOverlayModule (upval), FFlagEnablePostAuthRoutingInAllCases (upval), p2 (copy), navigateToPostAuthLandingPage (upval), p6 (copy), Name (copy), p1 (copy), p3 (copy), ClearAppModule (upval), p7 (ref), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), RoactAppExperimentModule (upval), Callback (copy), Promise (copy), LocalizationService (upval), FetchThemeModule (upval), ApiFetchUsersRolesModule (upval), GetFFlagPasskeySignupEnabledModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), PromiseUtilitiesModule (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), FFlagEnableMagicLogin (upval), SetMagicLoginAdvertisementFunction (upval)
		if p5 then
			p5:logEventOnce("lua_auth_request_end")
		end
		if TracerService and LuaAccountInfo ~= "" then
			TracerService:FinishSpan(LuaAccountInfo)
		end
		RbxAnalyticsService:ReportCounter("Network_AccountInfo_Ok")
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Success, 1)
		
		if EnableLaunchAppCheckForAccountSwitchGameParams then
			local AccountSwitchStartupGameParams = AppStorageUtilitiesModule.getAccountSwitchStartupGameParams()
			
			if AccountSwitchStartupGameParams then
				AppStorageUtilitiesModule.clearAccountSwitchStartupGameParams()
				AppStorageUtilitiesModule.flush()
				ExperienceService:LaunchExperience(AccountSwitchStartupGameParams, "AuthTicket", nil)
			end
		end
		local FromUserInfoRequestResult = UserModule.fromUserInfoRequest(Result)
		
		if FFlagEnableRecordLogin then
			pcall(function()
				-- upvalues: UpdateLoginEntryDataFunction (upval), FromUserInfoRequestResult (copy)
				UpdateLoginEntryDataFunction(FromUserInfoRequestResult.userId, { displayName = FromUserInfoRequestResult.displayName })
			end)
		end
		if p4:getState().CentralOverlay.OverlayType == OverlayTypeModule.AccountAuthenticationFailureOverlay then
			p4:dispatch(CloseAccountAuthenticationFailureOverlayModule())
			
			if not FFlagEnablePostAuthRoutingInAllCases and FromUserInfoRequestResult:isEqual(p2) then
				navigateToPostAuthLandingPage(p4, p6, Name, FromUserInfoRequestResult, p1)
			end
		end
		if not FromUserInfoRequestResult:isEqual(p2) then
			FromUserInfoRequestResult:setToLocalPlayer()
			FromUserInfoRequestResult:setToLocalStorage()
			
			if p3 then
				p4:dispatch(ClearAppModule())
				p7 = false
			end
			p4:dispatch(GetLocalUserFunction())
			p4:dispatch(ReceivedUserCountryCodeFunction(FromUserInfoRequestResult.countryCode))
			
			if not FFlagEnablePostAuthRoutingInAllCases then
				navigateToPostAuthLandingPage(p4, p6, Name, FromUserInfoRequestResult, p1)
			end
			RoactAppExperimentModule.initializeUserLayers(FromUserInfoRequestResult.userId)
		end
		if FFlagEnablePostAuthRoutingInAllCases then
			navigateToPostAuthLandingPage(p4, p6, Name, FromUserInfoRequestResult, p1)
		end
		if not p7 then
			p7 = true
			Callback()
		end
		local List = {}
		table.insert(List, Promise:andThen(function(Result)
			-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
			AppStorageUtilitiesModule.setRobloxLocaleId(Result.generalExperienceLocale)
			AppStorageUtilitiesModule.setGameLocaleId(Result.ugcLocale)
			LocalizationService:SetRobloxLocaleId(Result.generalExperienceLocale)
		end))
		local ThemeModule = FetchThemeModule(p1, FromUserInfoRequestResult.userId)
		p4:dispatch(ApiFetchUsersRolesModule(p1))
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
		GuiService:BroadcastNotification(FromUserInfoRequestResult:toJsonData(), NotificationTypeModule.DID_LOG_IN)
		p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
		
		if FFlagEnableMagicLogin then
			SetMagicLoginAdvertisementFunction(true)
		end
	end, function(p8)
		-- upvalues: RbxAnalyticsService (upval), StatusCodes (upval), ReportEphemeralCounterModule (upval), AppSessionCheckCounterNamesModule (upval), Default1 (upval), TelemetryConfigs (upval), FFlagEnableIosKeychainLoginLuaModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreDeleteCredentialsTelemetryConfig (upval), v55 (upval), EnableLaunchAppCheckForAccountSwitchGameParams (upval), AppStorageUtilitiesModule (upval), ResetOnNoAccountInfoFoundModule (upval), p3 (copy), p4 (copy), p1 (copy), Promise (copy), LuaLogoutReasonNamesModule (upval), ShowAccountAuthenticationFailureOverlayModule (upval), handleAccountInfo (upval), p2 (copy), Name (copy), Callback (copy)
		if p8.HttpError == Enum.HttpError.ConnectFail then
			RbxAnalyticsService:ReportCounter("Network_AccountInfo_None")
		else
			RbxAnalyticsService:ReportCounter("Network_AccountInfo_Error")
		end
		if p8.StatusCode == StatusCodes.UNAUTHORIZED then
			ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
		else
			ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.FailureUnknownError, 1)
		end
		ReportEphemeralCounterModule(AppSessionCheckCounterNamesModule.Failure, 1)
		
		if p8.StatusCode ~= StatusCodes.UNAUTHORIZED then
			ShowAccountAuthenticationFailureOverlayModule(p4, function()
				-- upvalues: handleAccountInfo (upval), p1 (upval), p2 (upval), Promise (upval), p3 (upval), p4 (upval), Name (upval), Callback (upval)
				handleAccountInfo(p1, p2, Promise, p3, p4, Name, Callback)
			end)
			
			return
		end
		pcall(function()
			-- upvalues: Default1 (upval), TelemetryConfigs (upval)
			Default1:logRobloxTelemetryCounter(TelemetryConfigs.NoCookieForCachedUserTelemetryConfig, 1)
		end)
		
		if FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction() then
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.remoteLogoutDelete)
			
			if GetFFlagAddPromCounterToKeystoreOpsFunction() then
				TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, { customFields = { reason = "remote_logout" } }, 1)
			end
			v55()
		end
		if EnableLaunchAppCheckForAccountSwitchGameParams then
			AppStorageUtilitiesModule.clearAccountSwitchStartupGameParams()
			AppStorageUtilitiesModule.flush()
		end
		ResetOnNoAccountInfoFoundModule(p3, p4, p1, Promise, LuaLogoutReasonNamesModule.UnauthorizedAutoLogin, nil, nil, false)
	end)
end

return handleAccountInfo