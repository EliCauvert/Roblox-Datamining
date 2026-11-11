local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Players = game:GetService("Players")
local MemStorageService = game:GetService("MemStorageService")
local CorePackages = game:GetService("CorePackages")
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local LogoutModule = require(Modules.LuaApp.Http.Requests.Logout)
local SetAuthenticationStatusFunction = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local ClearAppModule = require(script.Parent.ClearApp)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local GetLocaleAndGotoLoginPageModule = require(script.Parent.GetLocaleAndGotoLoginPage)
local UserModule = require(script.Parent.User)
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local AppStorageService = game:GetService("AppStorageService")
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local GetFFlagDebugResetSurveyStorageModule = require(Modules.LuaApp.Flags.GetFFlagDebugResetSurveyStorage)
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local LuaLogoutReasonsModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local CsatSurveyConstantsModule = require(Modules.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local DeleteAllCredentialsFromKeystoreModule = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local AuthLocalStorageKeys = require(CorePackages.Workspace.Packages.AuthCommon).Enums.AuthLocalStorageKeys
local LoginMethods = require(CorePackages.Workspace.Packages.AuthCommon).Enums.LoginMethods
local TelemetryService = game:GetService("TelemetryService")
local UseResetAppStateForLogout2 = game:DefineFastFlag("UseResetAppStateForLogout2", false)
local FFlagEnableIosKeychainLoginLuaModule = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local DefaultUnauthenticatedConstants = AuthCommonModule.Common.DefaultUnauthenticatedConstants
local AuthClientErrorFunction = require(CorePackages.Workspace.Packages.AuthAnalytics).Events.authClientError
local FFlagEnableInvoluntaryLogoutEventModule = require(Modules.LuaApp.Flags.FFlagEnableInvoluntaryLogoutEvent)
local FFlagEnableLogoutV3 = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLogoutV3
local FFlagEnableLastLoginMethodTracking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLastLoginMethodTracking
local GetFFlagEnableStorePreviousAccountDataFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableStorePreviousAccountData
local StorePreviousAccountDataFunction = AuthCommonModule.Thunks.StorePreviousAccountData
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagEnableMagicLogin = SharedFlagsModule.FFlagEnableMagicLogin
local SetMagicLoginAdvertisementFunction = require(CorePackages.Workspace.Packages.LoginV2.Thunks).SetMagicLoginAdvertisement
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local LuaLogoutTelemetryConfig = TelemetryConfigs.LuaLogoutTelemetryConfig
local KeystoreDeleteCredentialsTelemetryConfig = TelemetryConfigs.KeystoreDeleteCredentialsTelemetryConfig
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local EnableRecordSignOut = game:DefineFastFlag("EnableRecordSignOut", false)
local RecordSignOutFunction = AuthCommonModule.Utils.recordSignOut

return function(p1, GuiService, ManageAccountsRemoveCurrentUser, p2)
	-- upvalues: Logger (copy), EnableRecordSignOut (copy), LuaLogoutReasonNamesModule (copy), RecordSignOutFunction (copy), FFlagEnableMagicLogin (copy), SetMagicLoginAdvertisementFunction (copy), FFlagEnableInvoluntaryLogoutEventModule (copy), FFlagEnableLogoutV3 (copy), UserModule (copy), AuthClientErrorFunction (copy), DefaultUnauthenticatedConstants (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethods (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), GetFFlagEnableStorePreviousAccountDataFunction (copy), StorePreviousAccountDataFunction (copy), LogoutModule (copy), FFlagEnableBlackbirdCheck (copy), Players (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), HttpService (copy), ContentProvider (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), DeleteAllCredentialsFromKeystoreModule (copy), Default (copy), KeystoreConstants (copy), PromiseUtilitiesModule (copy), UseResetAppStateForLogout2 (copy), ResetAppStateModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), GetLocaleAndGotoLoginPageModule (copy), LoggingProtocolModule (copy), LuaLogoutReasonsModule (copy), LuaLogoutTelemetryConfig (copy), NotificationTypeModule (copy), ClearAppModule (copy), ExperimentCacheManager (copy), GetFFlagDebugResetSurveyStorageModule (copy), CsatSurveyConstantsModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), RoactAppExperimentModule (copy)
	return function(p3)
		-- upvalues: Logger (upval), EnableRecordSignOut (upval), ManageAccountsRemoveCurrentUser (copy), LuaLogoutReasonNamesModule (upval), RecordSignOutFunction (upval), FFlagEnableMagicLogin (upval), SetMagicLoginAdvertisementFunction (upval), FFlagEnableInvoluntaryLogoutEventModule (upval), FFlagEnableLogoutV3 (upval), UserModule (upval), AuthClientErrorFunction (upval), DefaultUnauthenticatedConstants (upval), p2 (copy), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethods (upval), AppStorageService (upval), AuthLocalStorageKeys (upval), GetFFlagEnableStorePreviousAccountDataFunction (upval), StorePreviousAccountDataFunction (upval), LogoutModule (upval), p1 (copy), FFlagEnableBlackbirdCheck (upval), Players (upval), FFlagEnableIosKeychainLoginLuaModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), HttpService (upval), ContentProvider (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreDeleteCredentialsTelemetryConfig (upval), DeleteAllCredentialsFromKeystoreModule (upval), Default (upval), KeystoreConstants (upval), PromiseUtilitiesModule (upval), UseResetAppStateForLogout2 (upval), ResetAppStateModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), GetLocaleAndGotoLoginPageModule (upval), LoggingProtocolModule (upval), LuaLogoutReasonsModule (upval), LuaLogoutTelemetryConfig (upval), GuiService (copy), NotificationTypeModule (upval), ClearAppModule (upval), ExperimentCacheManager (upval), GetFFlagDebugResetSurveyStorageModule (upval), CsatSurveyConstantsModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), RoactAppExperimentModule (upval)
		Logger:info(string.format("[%f] Logout() (Universal App)", tick()))
		
		if EnableRecordSignOut then
			local IsNotManageAccountsRemoveCurrentUserMatch = ManageAccountsRemoveCurrentUser ~= LuaLogoutReasonNamesModule.ManageAccountsRemoveCurrentUser
			pcall(function()
				-- upvalues: RecordSignOutFunction (upval), IsNotManageAccountsRemoveCurrentUserMatch (copy)
				RecordSignOutFunction(nil, IsNotManageAccountsRemoveCurrentUserMatch)
			end)
		end
		local v1 = nil
		local v2: string? = nil
		
		if FFlagEnableMagicLogin then
			SetMagicLoginAdvertisementFunction(false)
		end
		if FFlagEnableInvoluntaryLogoutEventModule or FFlagEnableLogoutV3 then
			v1 = ManageAccountsRemoveCurrentUser or LuaLogoutReasonNamesModule.Unknown
			v2 = tostring(UserModule.fromLocalStorage().userId)
		end
		if FFlagEnableInvoluntaryLogoutEventModule then
			AuthClientErrorFunction(DefaultUnauthenticatedConstants.DefaultClientErrorReason, v1, p2, v2)
		end
		local IsEmailMatch = false
		
		if FFlagEnableLastLoginMethodTracking then
			local LastSuccessfulSignInMethod = AppStorageUtilitiesModule.getLastSuccessfulSignInMethod()
			IsEmailMatch = LastSuccessfulSignInMethod == LoginMethods.Email or (LastSuccessfulSignInMethod == LoginMethods.EmailOtp or LastSuccessfulSignInMethod == LoginMethods.Phone)
		end
		if not IsEmailMatch then
			local Username = UserModule.fromLocalStorage() and UserModule.fromLocalStorage().username
			
			if Username and Username ~= "" then
				AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, Username)
			end
		end
		if GetFFlagEnableStorePreviousAccountDataFunction() then
			StorePreviousAccountDataFunction()
		end
		local LogoutModuleResult = if FFlagEnableLogoutV3 then LogoutModule(p1, v1, p2, v2) else LogoutModule(p1)
		
		if FFlagEnableBlackbirdCheck then
			Players:SetLocalPlayerInfo(-1, "", "", 0, true, false)
		else
			Players:SetLocalPlayerInfo(-1, "", "", 0, true)
		end
		if FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction() then
			local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.intentionalLogoutDelete)
			
			if GetFFlagAddPromCounterToKeystoreOpsFunction() then
				TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, { customFields = { reason = "intentional_logout" } }, 1)
			end
			if GetFFlagKeystoreAutoLoginAvailableFunction() then
				DeleteAllCredentialsFromKeystoreModule(Json)
			else
				Default:deleteAllCredentialsFromiOSKeychain(Default.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
			end
		end
		PromiseUtilitiesModule.Batch({ LogoutModuleResult }):andThen(function()
			-- upvalues: UseResetAppStateForLogout2 (upval), p3 (copy), ResetAppStateModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), GetLocaleAndGotoLoginPageModule (upval), p1 (upval), AppStorageService (upval), LoggingProtocolModule (upval), LuaLogoutReasonsModule (upval), ManageAccountsRemoveCurrentUser (upval), LuaLogoutReasonNamesModule (upval), TelemetryService (upval), LuaLogoutTelemetryConfig (upval), GuiService (upval), NotificationTypeModule (upval), ClearAppModule (upval), UserModule (upval), ExperimentCacheManager (upval), GetFFlagDebugResetSurveyStorageModule (upval), CsatSurveyConstantsModule (upval), AppStorageUtilitiesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), RoactAppExperimentModule (upval)
			if UseResetAppStateForLogout2 then
				p3:dispatch(ResetAppStateModule())
				p3:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
				p3:dispatch(GetLocaleAndGotoLoginPageModule(p1))
				AppStorageService:flush()
				LoggingProtocolModule.default:logRobloxTelemetryEvent(LuaLogoutReasonsModule, nil, {
					lualogoutreasons = ManageAccountsRemoveCurrentUser or LuaLogoutReasonNamesModule.Unknown
				})
				TelemetryService:LogCounter(LuaLogoutTelemetryConfig, {
					customFields = {
						reason = ManageAccountsRemoveCurrentUser or LuaLogoutReasonNamesModule.Unknown
					}
				}, 1)
				GuiService:BroadcastNotification("", NotificationTypeModule.DID_LOG_OUT)
				
				return
			end
			p3:dispatch(ClearAppModule())
			p3:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
			p3:dispatch(GetLocaleAndGotoLoginPageModule(p1))
			UserModule.clearLocalStorage()
			ExperimentCacheManager.default:clearCache()
			
			if GetFFlagDebugResetSurveyStorageModule() then
				AppStorageService:SetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}")
			end
			AppStorageUtilitiesModule.setRobloxLocaleId("")
			AppStorageUtilitiesModule.setDiscoveryClientFallbackCache("")
			AppStorageService:flush()
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, "dark")
			MemStorageService:SetItem(MemStorageKeysModule.RobuxBalance, "0")
			MemStorageService:SetItem(MemStorageKeysModule.RobuxBalanceLocalized, "--")
			RoactAppExperimentModule.clearUserLayers()
			LoggingProtocolModule.default:logRobloxTelemetryEvent(LuaLogoutReasonsModule, nil, {
				lualogoutreasons = ManageAccountsRemoveCurrentUser or LuaLogoutReasonNamesModule.Unknown
			})
			TelemetryService:LogCounter(LuaLogoutTelemetryConfig, {
				customFields = {
					reason = ManageAccountsRemoveCurrentUser or LuaLogoutReasonNamesModule.Unknown
				}
			}, 1)
			GuiService:BroadcastNotification("", NotificationTypeModule.DID_LOG_OUT)
		end)
	end
end