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
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local AppPageModule = require(Modules.LuaApp.AppPage)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local CloseAccountAuthenticationFailureOverlayModule = require(Modules.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local ApiFetchUsersRolesModule = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ReceivedUserCountryCodeFunction = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local HttpService = game:GetService("HttpService")
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local ContentProvider = game:GetService("ContentProvider")
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local HandlePreHomePageRoutingFunction = require(CorePackages.Workspace.Packages.PreHomePage).HandlePreHomePageRouting
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPreHomePageRoutingEnabled = SharedFlagsModule.FFlagPreHomePageRoutingEnabled
local FFlagPasskeyUpsellEnabled = SharedFlagsModule.FFlagPasskeyUpsellEnabled
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local TelemetryService = game:GetService("TelemetryService")
local KeystoreDeleteCredentialsTelemetryConfig = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs.KeystoreDeleteCredentialsTelemetryConfig
local ShowAccountAuthenticationFailureOverlayModule = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local DeleteAllCredentialsFromKeystoreModule = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local FetchLocaleModule = require(Modules.LuaApp.Thunks.FetchLocale)
local PreloadApplicationDataModule = require(Modules.LuaApp.Thunks.PreloadApplicationData)
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local InvoluntaryLogoutAnalyticsEvents = AuthCommonModule.Analytics.InvoluntaryLogoutAnalyticsEvents
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)

local function _(p1, p2)
	-- upvalues: InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstantsModule (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckDidLogin)
	GuiService:BroadcastNotification(p1:toJsonData(), NotificationTypeModule.DID_LOG_IN)
	p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
end

local function v41()
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), DeleteAllCredentialsFromKeystoreModule (copy), Default (copy), KeystoreConstants (copy)
	local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
	
	return if GetFFlagKeystoreAutoLoginAvailableFunction() then DeleteAllCredentialsFromKeystoreModule(Json) else Default:deleteAllCredentialsFromiOSKeychain(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
end

local function navigateToPostAuthPage(p1, Name, _, p2)
	-- upvalues: AppStorageUtilitiesModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRoutingFunction (copy)
	if (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else "") == "auth" then
		if GetFFlagEnableMultiPageSignupExperimentModule() then
			p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
			
			return
		else
			AppStorageUtilitiesModule.setSignupActionRequired("")
			AppStorageUtilitiesModule.flush()
			p1:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
			
			return
		end
	elseif FFlagPreHomePageRoutingEnabled or FFlagPasskeyUpsellEnabled then
		HandlePreHomePageRoutingFunction(p2, p1, ResetNavigationHistoryModule):andThen(function(Result)
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

local _ = function(p1)
	local Moderation = p1:getState().Moderation
	
	return Moderation and Moderation.userModerated or false
end

local function sessionCheck(p1, p2, Promise, p3, _, p4)
	-- upvalues: InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstantsModule (copy), FetchLocaleModule (copy), AppPageModule (copy), AppStartupSequenceTag (copy), AppPrefetch (copy), PreloadApplicationDataModule (copy), GetUserAppLaunchInfoModule (copy), UserModule (copy), OverlayTypeModule (copy), CloseAccountAuthenticationFailureOverlayModule (copy), navigateToPostAuthPage (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), AppStorageUtilitiesModule (copy), LocalizationService (copy), FetchThemeModule (copy), ApiFetchUsersRolesModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), PromiseUtilitiesModule (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), StatusCodes (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v41 (copy), ShowAccountAuthenticationFailureOverlayModule (copy), sessionCheck (copy)
	return function(p5)
		-- upvalues: InvoluntaryLogoutAnalyticsEvents (upval), EventStreamConstantsModule (upval), FetchLocaleModule (upval), p1 (copy), AppPageModule (upval), AppStartupSequenceTag (upval), AppPrefetch (upval), PreloadApplicationDataModule (upval), Promise (copy), p3 (copy), p4 (copy), GetUserAppLaunchInfoModule (upval), UserModule (upval), OverlayTypeModule (upval), CloseAccountAuthenticationFailureOverlayModule (upval), p2 (copy), navigateToPostAuthPage (upval), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), AppStorageUtilitiesModule (upval), LocalizationService (upval), FetchThemeModule (upval), ApiFetchUsersRolesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), PromiseUtilitiesModule (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), StatusCodes (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreDeleteCredentialsTelemetryConfig (upval), v41 (upval), ShowAccountAuthenticationFailureOverlayModule (upval), sessionCheck (upval)
		local Moderation = p5:getState().Moderation
		
		if Moderation and Moderation.userModerated or false then
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckSkippedForModeratedUser)
			
			return
		end
		local LocaleModule = FetchLocaleModule(p1)
		local Home = AppPageModule.Home
		
		local function v50()
			-- upvalues: p5 (copy), PreloadApplicationDataModule (upval), p1 (upval), Promise (upval), p3 (upval), p4 (upval), AppStartupSequenceTag (copy), AppPrefetch (copy)
			return p5:dispatch(PreloadApplicationDataModule(p1, p1, Promise, p3, p4, AppStartupSequenceTag, AppPrefetch))
		end
		
		return GetUserAppLaunchInfoModule(p1):andThen(function(Result)
			-- upvalues: InvoluntaryLogoutAnalyticsEvents (upval), EventStreamConstantsModule (upval), UserModule (upval), p5 (copy), OverlayTypeModule (upval), CloseAccountAuthenticationFailureOverlayModule (upval), p2 (upval), navigateToPostAuthPage (upval), Home (copy), p1 (upval), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), LocaleModule (copy), AppStorageUtilitiesModule (upval), LocalizationService (upval), FetchThemeModule (upval), ApiFetchUsersRolesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), PromiseUtilitiesModule (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckSuccess)
			local FromUserInfoRequestResult = UserModule.fromUserInfoRequest(Result)
			
			if p5:getState().CentralOverlay.OverlayType == OverlayTypeModule.AccountAuthenticationFailureOverlay then
				p5:dispatch(CloseAccountAuthenticationFailureOverlayModule())
				
				if FromUserInfoRequestResult:isEqual(p2) then
					InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckLocalPlayerMatch)
					navigateToPostAuthPage(p5, Home, FromUserInfoRequestResult, p1)
				end
			end
			if not FromUserInfoRequestResult:isEqual(p2) then
				InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckLocalPlayerMismatch)
				FromUserInfoRequestResult:setToLocalPlayer()
				FromUserInfoRequestResult:setToLocalStorage()
				p5:dispatch(GetLocalUserFunction())
				p5:dispatch(ReceivedUserCountryCodeFunction(FromUserInfoRequestResult.countryCode))
				navigateToPostAuthPage(p5, Home, FromUserInfoRequestResult, p1)
			end
			local List = {}
			table.insert(List, LocaleModule:andThen(function(Result)
				-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
				AppStorageUtilitiesModule.setRobloxLocaleId(Result.generalExperienceLocale)
				AppStorageUtilitiesModule.setGameLocaleId(Result.ugcLocale)
				LocalizationService:SetRobloxLocaleId(Result.generalExperienceLocale)
			end))
			local ThemeModule = FetchThemeModule(p1, FromUserInfoRequestResult.userId)
			p5:dispatch(ApiFetchUsersRolesModule(p1))
			local IsAuth = (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else "") == "auth"
			table.insert(List, ThemeModule:andThen(function(Result)
				-- upvalues: AppStorageUtilitiesModule (upval), IsAuth (copy), MemStorageService (upval), MemStorageKeysModule (upval)
				AppStorageUtilitiesModule.setAuthenticatedTheme(Result)
				
				if not IsAuth then
					MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, Result)
				end
			end))
			PromiseUtilitiesModule.Batch(List):andThen(function()
				-- upvalues: AppStorageUtilitiesModule (upval)
				AppStorageUtilitiesModule.flush()
			end)
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckDidLogin)
			GuiService:BroadcastNotification(FromUserInfoRequestResult:toJsonData(), NotificationTypeModule.DID_LOG_IN)
			p5:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
		end, function(p6)
			-- upvalues: StatusCodes (upval), InvoluntaryLogoutAnalyticsEvents (upval), EventStreamConstantsModule (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreDeleteCredentialsTelemetryConfig (upval), v41 (upval), ShowAccountAuthenticationFailureOverlayModule (upval), p5 (copy), sessionCheck (upval), p1 (upval), p2 (upval), LocaleModule (copy), Home (copy), v50 (copy)
			if p6.StatusCode ~= StatusCodes.UNAUTHORIZED then
				InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, "ErrorCode: " .. tostring(p6.StatusCode) .. " Msg: " .. tostring(p6))
				ShowAccountAuthenticationFailureOverlayModule(p5, function()
					-- upvalues: sessionCheck (upval), p1 (upval), p2 (upval), LocaleModule (upval), Home (upval), v50 (upval)
					sessionCheck(p1, p2, LocaleModule, true, Home, v50)
				end)
				
				return
			end
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, EventStreamConstantsModule.Context.SessionCheckUnauthorized)
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.remoteLogoutDelete)
			
			if GetFFlagAddPromCounterToKeystoreOpsFunction() then
				TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, { customFields = { reason = "remote_logout" } }, 1)
			end
			v41()
		end)
	end
end

return sessionCheck