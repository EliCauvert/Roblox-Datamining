local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserModule = require(script.Parent.User)
local GetLocalUserFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local SetLaunchContextFunction = require(CorePackages.Workspace.Packages.AppStartup).Actions.SetLaunchContext
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FetchLocaleModule = require(Modules.LuaApp.Thunks.FetchLocale)
local PreloadApplicationDataModule = require(Modules.LuaApp.Thunks.PreloadApplicationData)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local AppPageModule = require(Modules.LuaApp.AppPage)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local WebLoginModule = require(script.Parent.WebLogin)
local WebLaunchOptionModule = require(Modules.LuaApp.Enum.WebLaunchOption)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local PostSignUpAttribution = require(CorePackages.Workspace.Packages.ExternalAttribution).PostSignUpAttribution
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local ResetOnNoAccountInfoFoundModule = require(Modules.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound)
local ConstantsModule = require(Modules.LuaApp.Constants)
local AccountSwitcherConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants
local GetUserAppLaunchInfoModule = require(Modules.LuaApp.Http.Requests.GetUserAppLaunchInfo)
local GetCredentialsAvailabilityStoreFunction = require(CorePackages.Workspace.Packages.AuthCommon).Stores.GetCredentialsAvailabilityStore
local ParseCredentialsProtocolIsAvailableResponseFunction = require(CorePackages.Workspace.Packages.AuthCommon).Utils.parseCredentialsProtocolIsAvailableResponse
local ReceivedUserCountryCodeFunction = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local GetFFlagPasskeySignupEnabledModule = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local FFlagApplyLaunchContextForNewAccountSwitches = SharedFlagsModule.FFlagApplyLaunchContextForNewAccountSwitches
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local FFlagUseIsAvailableCheckForIOSKeychainFetch = SharedFlagsModule.FFlagUseIsAvailableCheckForIOSKeychainFetch
local FFlagEnableIosKeychainLoginLuaModule = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local AttemptLoginWithKeystoreCredentialsModule = require(Modules.LuaApp.Thunks.Authentication.AttemptLoginWithKeystoreCredentials)
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local LoginModule = require(Modules.LuaApp.Thunks.Authentication.Login)
local KeystoreConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.KeystoreConstants
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local CheckForAndFireValidCookieForNoCachedUserEventFunction = AuthAnalyticsModule.RobloxTelemetry.CheckForAndFireValidCookieForNoCachedUserEvent
local TelemetryConfigs = AuthAnalyticsModule.TelemetryConfigs
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local HandleAccountInfoModule = require(Modules.LuaApp.Thunks.Authentication.HandleAccountInfo)
local GetFFlagEnableHandleEngineSessionCheckAtStartupModule = require(Modules.LuaApp.Flags.GetFFlagEnableHandleEngineSessionCheckAtStartup)
local DisableListenToSessionTerminalStatus = game:DefineFastFlag("DisableListenToSessionTerminalStatus", false)
local LuaAppDeferLaunch = game:DefineFastFlag("LuaAppDeferLaunch", false)
local SessionCheckManagerModule = require(Modules.LuaApp.Thunks.Authentication.SessionCheckManager.SessionCheckManager)
local Status = SessionCheckManagerModule.Status
local SessionCheckUtilsModule = require(Modules.LuaApp.Thunks.Authentication.SessionCheckUtils)
local HandleSessionCheckSuccessFunction = SessionCheckUtilsModule.handleSessionCheckSuccess
local HandleSessionCheckFailureFunction = SessionCheckUtilsModule.handleSessionCheckFailure
local PromiseModule = require(CorePackages.Packages.Promise)
local CredentialsProtocolModule = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Default1 = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local FFlagMorePageGateAccountSwitcherByCachedVariantId = SharedFlagsModule.FFlagMorePageGateAccountSwitcherByCachedVariantId
local FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlagsModule.FFlagEnableNavigateToLoginAfterLogoutAll

local function initializeForCachedUser(p1, p2, p3, p4, FromLocalStorageResult, Name, p5, p6, p7, p8, p9, p10)
	-- upvalues: AppStorageUtilitiesModule (copy), GetFFlagPasskeySignupEnabledModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), RoactAppExperimentModule (copy), LuaAppDeferLaunch (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), PreloadApplicationDataModule (copy), HandleAccountInfoModule (copy)
	FromLocalStorageResult:setToLocalPlayer()
	local SignupActionRequired = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else ""
	local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
	local FFlagPasskeySignupEnabledModule = SignupActionRequired == "auth" and (GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule())
	
	if AuthenticatedTheme ~= "" and not FFlagPasskeySignupEnabledModule then
		MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AuthenticatedTheme)
	end
	RoactAppExperimentModule.initializeUserLayers(FromLocalStorageResult.userId);
	(if LuaAppDeferLaunch then task.defer else spawn)(function()
		-- upvalues: p5 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), p8 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), SignupActionRequired (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), Name (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), HandleAccountInfoModule (upval), p6 (copy)
		p5:dispatch(GetLocalUserFunction())
		p5:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
		
		if p8 and FromLocalStorageResult.isUnder13 then
			p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
		elseif SignupActionRequired == "auth" then
			if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
				p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
			else
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.flush()
				p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
			end
		else
			p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
		end
		local function v56()
			-- upvalues: p5 (upval), PreloadApplicationDataModule (upval), p1 (upval), p2 (upval), p3 (upval), p4 (upval), p7 (upval), p9 (upval), p10 (upval)
			return p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
		end
		
		local _ = p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
		HandleAccountInfoModule(p1, FromLocalStorageResult, p6, true, p5, Name, v56, p7, p8, true)
	end)
end

local function _(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), GetFFlagPasskeySignupEnabledModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), AppStorageUtilitiesModule (copy), PreloadApplicationDataModule (copy), HandleAccountInfoModule (copy)
	spawn(function()
		-- upvalues: p1 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), p2 (copy), p3 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), p4 (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), p5 (copy), PreloadApplicationDataModule (upval), p6 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), p11 (copy), p12 (copy), HandleAccountInfoModule (upval), p14 (copy), p13 (copy)
		p1:dispatch(GetLocalUserFunction())
		p1:dispatch(ReceivedUserCountryCodeFunction(p2.countryCode))
		
		if p3 and p2.isUnder13 then
			p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
		elseif p4 == "auth" then
			if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
				p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
			else
				AppStorageUtilitiesModule.setSignupActionRequired("")
				AppStorageUtilitiesModule.flush()
				p1:dispatch(ResetNavigationHistoryModule({ { name = p5 } }))
			end
		else
			p1:dispatch(ResetNavigationHistoryModule({ { name = p5 } }))
		end
		local function v58()
			-- upvalues: p1 (upval), PreloadApplicationDataModule (upval), p6 (upval), p7 (upval), p8 (upval), p9 (upval), p10 (upval), p11 (upval), p12 (upval)
			return p1:dispatch(PreloadApplicationDataModule(p6, p7, p8, p9, p10, p11, p12))
		end
		
		local _ = p1:dispatch(PreloadApplicationDataModule(p6, p7, p8, p9, p10, p11, p12))
		HandleAccountInfoModule(p6, p2, p14, p13, p1, p5, v58, p10, p3, true)
	end)
end

local function initializeForCachedUserV2(p1, p2, p3, p4, FromLocalStorageResult, Name, p5, p6, p7, p8, p9, p10)
	-- upvalues: AppStorageUtilitiesModule (copy), GetFFlagPasskeySignupEnabledModule (copy), GetFFlagEnableMultiPageSignupExperimentModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), RoactAppExperimentModule (copy), PreloadApplicationDataModule (copy), DisableListenToSessionTerminalStatus (copy), SessionCheckManagerModule (copy), Status (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), HandleSessionCheckSuccessFunction (copy), HandleSessionCheckFailureFunction (copy), HandleAccountInfoModule (copy)
	FromLocalStorageResult:setToLocalPlayer()
	local SignupActionRequired = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else ""
	local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
	local FFlagPasskeySignupEnabledModule = SignupActionRequired == "auth" and (GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule())
	MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, if AuthenticatedTheme == "light" or AuthenticatedTheme == "dark" then if FFlagPasskeySignupEnabledModule then "dark" else AuthenticatedTheme elseif FFlagPasskeySignupEnabledModule then "dark" else "dark")
	RoactAppExperimentModule.initializeUserLayers(FromLocalStorageResult.userId)
	
	local function v63()
		-- upvalues: p5 (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy)
		return p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
	end
	
	if DisableListenToSessionTerminalStatus then
		SessionCheckManagerModule:listenToSessionStatusChange(function(p11)
			-- upvalues: Status (upval), p5 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), p8 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), SignupActionRequired (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), Name (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), HandleSessionCheckSuccessFunction (upval), p6 (copy), v63 (copy), HandleSessionCheckFailureFunction (upval), HandleAccountInfoModule (upval)
			local Status1 = p11.status
			
			if Status1 == Status.Success then
				p5:dispatch(GetLocalUserFunction())
				p5:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
				
				if p8 and FromLocalStorageResult.isUnder13 then
					p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
				elseif SignupActionRequired == "auth" then
					if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
						p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
					else
						AppStorageUtilitiesModule.setSignupActionRequired("")
						AppStorageUtilitiesModule.flush()
						p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
					end
				else
					p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
				end
				local _ = p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
				HandleSessionCheckSuccessFunction(p1, FromLocalStorageResult, p6, true, p5, Name, v63, p7, p8, true)
				
				return
			elseif Status1 == Status.Failed then
				HandleSessionCheckFailureFunction(p11.httpStatusCode or p11.errorStatus, true, p5, p1, p6, FromLocalStorageResult, Name, v63)
				
				return
			else
				local v1 = true
				spawn(function()
					-- upvalues: p5 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), p8 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), SignupActionRequired (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), Name (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), HandleAccountInfoModule (upval), p6 (copy), v1 (copy)
					p5:dispatch(GetLocalUserFunction())
					p5:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
					
					if p8 and FromLocalStorageResult.isUnder13 then
						p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
					elseif SignupActionRequired == "auth" then
						if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
							p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
						else
							AppStorageUtilitiesModule.setSignupActionRequired("")
							AppStorageUtilitiesModule.flush()
							p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
						end
					else
						p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
					end
					local function v58()
						-- upvalues: p5 (upval), PreloadApplicationDataModule (upval), p1 (upval), p2 (upval), p3 (upval), p4 (upval), p7 (upval), p9 (upval), p10 (upval)
						return p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
					end
					
					local _ = p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
					HandleAccountInfoModule(p1, FromLocalStorageResult, p6, v1, p5, Name, v58, p7, p8, true)
				end)
			end
		end)
		
		return
	else
		SessionCheckManagerModule:registerSessionStatusChange()
		SessionCheckManagerModule:waitForSessionCheckTerminalStatus():andThen(function(Result)
			-- upvalues: Status (upval), p5 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), p8 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), SignupActionRequired (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), Name (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), HandleSessionCheckSuccessFunction (upval), p6 (copy), v63 (copy), HandleSessionCheckFailureFunction (upval)
			if Result and Result.status == Status.Success then
				p5:dispatch(GetLocalUserFunction())
				p5:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
				
				if p8 and FromLocalStorageResult.isUnder13 then
					p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
				elseif SignupActionRequired == "auth" then
					if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
						p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
					else
						AppStorageUtilitiesModule.setSignupActionRequired("")
						AppStorageUtilitiesModule.flush()
						p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
					end
				else
					p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
				end
				local _ = p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
				HandleSessionCheckSuccessFunction(p1, FromLocalStorageResult, p6, true, p5, Name, v63, p7, p8, true)
				
				return
			elseif Result and Result.status == Status.Failed then
				HandleSessionCheckFailureFunction(Result.errorStatus, true, p5, p1, p6, FromLocalStorageResult, Name, v63)
			end
		end, function(_)
			-- upvalues: p5 (copy), FromLocalStorageResult (copy), p8 (copy), SignupActionRequired (copy), Name (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), p6 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), PreloadApplicationDataModule (upval), HandleAccountInfoModule (upval)
			local v1 = true
			spawn(function()
				-- upvalues: p5 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), p8 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), SignupActionRequired (copy), GetFFlagPasskeySignupEnabledModule (upval), GetFFlagEnableMultiPageSignupExperimentModule (upval), AppStorageUtilitiesModule (upval), Name (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), HandleAccountInfoModule (upval), p6 (copy), v1 (copy)
				p5:dispatch(GetLocalUserFunction())
				p5:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
				
				if p8 and FromLocalStorageResult.isUnder13 then
					p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
				elseif SignupActionRequired == "auth" then
					if GetFFlagPasskeySignupEnabledModule() or GetFFlagEnableMultiPageSignupExperimentModule() then
						p5:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
					else
						AppStorageUtilitiesModule.setSignupActionRequired("")
						AppStorageUtilitiesModule.flush()
						p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
					end
				else
					p5:dispatch(ResetNavigationHistoryModule({ { name = Name } }))
				end
				local function v58()
					-- upvalues: p5 (upval), PreloadApplicationDataModule (upval), p1 (upval), p2 (upval), p3 (upval), p4 (upval), p7 (upval), p9 (upval), p10 (upval)
					return p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
				end
				
				local _ = p5:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
				HandleAccountInfoModule(p1, FromLocalStorageResult, p6, v1, p5, Name, v58, p7, p8, true)
			end)
		end)
	end
end

local function handleNoCachedUser(p1, p2, p3, p4, IsNotStartupMatch, FromLocalStorageResult, p5, p6, Home, p7, p8, p9, p10, p11)
	-- upvalues: FlagSettingsModule (copy), PreloadApplicationDataModule (copy), HandleAccountInfoModule (copy), AppStorageUtilitiesModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), FFlagEnableLuaAccountSwitchModule (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), AccountSwitcherConstants (copy), CheckForAndFireValidCookieForNoCachedUserEventFunction (copy), Default (copy), GetUserAppLaunchInfoModule (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), ResetOnNoAccountInfoFoundModule (copy), HttpService (copy), ContentProvider (copy), Default1 (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), KeystoreConstants (copy), PromiseModule (copy), FFlagUseIsAvailableCheckForIOSKeychainFetch (copy), LoginModule (copy), AttemptLoginWithKeystoreCredentialsModule (copy)
	local P54 = p11 or false
	
	if FlagSettingsModule.LuaAppLoginUIEnabled() and IsNotStartupMatch then
		HandleAccountInfoModule(p1, FromLocalStorageResult, p5, false, p6, Home, function()
			-- upvalues: p6 (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy)
			return p6:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
		end, p7, p8, false)
	elseif FlagSettingsModule.LuaAppLoginUIEnabled() then
		if (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then AppStorageUtilitiesModule.getSignupActionRequired() else "") == "auth" then
			p6:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
			
			return
		end
		if FFlagEnableLuaAccountSwitchModule and FFlagEnableNavigateToLoginAfterLogoutAll then
			local AccountSwitchStatus = AppStorageUtilitiesModule.getAccountSwitchStatus()
			local IsAccountSwitchStatusMatch = AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherPendingLoginV2AfterLogoutAll
			local IsAccountSwitchStatusMatch1 = AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV1AfterLogoutAll
			local IsAccountSwitchStatusMatch2 = AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV2AfterLogoutAll
			
			if AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherPendingLoginAfterLogoutAll or IsAccountSwitchStatusMatch or IsAccountSwitchStatusMatch1 or IsAccountSwitchStatusMatch2 then
				local AccountSwitchTargetUsername = AppStorageUtilitiesModule.getAccountSwitchTargetUsername()
				AppStorageUtilitiesModule.setAccountSwitchStatus("")
				AppStorageUtilitiesModule.setAccountSwitchTargetUsername("")
				AppStorageUtilitiesModule.flush()
				local ExtraProps = {}
				
				if AccountSwitchTargetUsername ~= "" then
					ExtraProps.forcedUsernameOverride = AccountSwitchTargetUsername
				end
				if IsAccountSwitchStatusMatch1 or IsAccountSwitchStatusMatch2 then
					ExtraProps.retryPasskey = true
				end
				if IsAccountSwitchStatusMatch or IsAccountSwitchStatusMatch2 then
					p6:dispatch(ResetNavigationHistoryModule({
						{ name = AppPageModule.LoginV2, extraProps = ExtraProps }
					}))
				else
					p6:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Login, extraProps = ExtraProps } }))
				end
				return
			end
		end
		spawn(function()
			-- upvalues: p6 (copy), CheckForAndFireValidCookieForNoCachedUserEventFunction (upval), p1 (copy), Default (upval), GetUserAppLaunchInfoModule (upval)
			p6:dispatch(CheckForAndFireValidCookieForNoCachedUserEventFunction(p1, Default, GetUserAppLaunchInfoModule))
		end)
		
		if (FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction()) and not P54 then
			local function _(p12, p13, p14)
				-- upvalues: ResetOnNoAccountInfoFoundModule (upval), p6 (copy), p1 (copy), p5 (copy)
				ResetOnNoAccountInfoFoundModule(false, p6, p1, p5, nil, p12, p13, p14)
			end
			
			local function getIosKeychainCredentials()
				-- upvalues: HttpService (upval), ContentProvider (upval), Default1 (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), KeystoreConstants (upval), PromiseModule (upval), FFlagUseIsAvailableCheckForIOSKeychainFetch (upval)
				local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
				local Callback = Default1:isAvailable(Default1.CredentialsTypes.iosKeychainPassword, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
					-- upvalues: Default1 (upval), Json (copy), KeystoreConstants (upval), PromiseModule (upval)
					return if Result and Result.isAvailable then Default1:getCredentials(Default1.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
				end)
				
				return if FFlagUseIsAvailableCheckForIOSKeychainFetch then Callback() else Default1:getCredentials(Default1.CredentialsTypes.iosKeychainPassword, Json, KeystoreConstants.KeystoreTimeout)
			end
			
			local function getKeystoreCredentials()
				-- upvalues: HttpService (upval), ContentProvider (upval), Default1 (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), KeystoreConstants (upval), PromiseModule (upval)
				local Json = HttpService:JSONEncode({ server = ContentProvider.BaseUrl })
				
				return (Default1:isAvailable(Default1.CredentialsTypes.keystore, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
					-- upvalues: Default1 (upval), Json (copy), KeystoreConstants (upval), PromiseModule (upval)
					return if Result and Result.keystore and Result.keystore.isAvailable then Default1:getCredentials(Default1.CredentialsTypes.keystore, Json, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
				end))
			end
			
			local function loginCallback(p12, p13)
				-- upvalues: LoginModule (upval)
				return function(p14)
					-- upvalues: LoginModule (upval), p12 (copy), p13 (copy)
					return p14:dispatch(LoginModule(p12, p13.username, p13.password, nil, nil, nil, nil, nil, false))
				end
			end
			
			local _ = function()
				-- upvalues: GetFFlagKeystoreAutoLoginAvailableFunction (upval), AttemptLoginWithKeystoreCredentialsModule (upval), p1 (copy), getKeystoreCredentials (copy), loginCallback (copy), p6 (copy), getIosKeychainCredentials (copy)
				return if GetFFlagKeystoreAutoLoginAvailableFunction() then AttemptLoginWithKeystoreCredentialsModule(p1, getKeystoreCredentials, loginCallback)(p6) else AttemptLoginWithKeystoreCredentialsModule(p1, getIosKeychainCredentials, loginCallback)(p6)
			end
			
			;(if GetFFlagKeystoreAutoLoginAvailableFunction() then AttemptLoginWithKeystoreCredentialsModule(p1, getKeystoreCredentials, loginCallback)(p6) else AttemptLoginWithKeystoreCredentialsModule(p1, getIosKeychainCredentials, loginCallback)(p6)):andThen(function(Result)
				-- upvalues: P54 (ref), AppStorageUtilitiesModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy), p6 (copy), ResetOnNoAccountInfoFoundModule (upval), p5 (copy)
				if Result.loginResult then
					P54 = true
					AppStorageUtilitiesModule.setAccountBlob(Result.loginResult.accountBlob)
					AppStorageUtilitiesModule.flush()
					launchApp(p1, p2, p3, p4, nil, p7, p9, p10, P54)(p6)
					
					return
				else
					ResetOnNoAccountInfoFoundModule(false, p6, p1, p5, nil, Result.credentials, Result.credentialsValidForLogin, Result.redirectToLoginPage)
				end
			end):catch(function(Err)
				-- upvalues: ResetOnNoAccountInfoFoundModule (upval), p6 (copy), p1 (copy), p5 (copy)
				ResetOnNoAccountInfoFoundModule(false, p6, p1, p5, nil, Err.credentials, Err.credentialsValidForLogin, Err.redirectToLoginPage)
			end)
		else
			ResetOnNoAccountInfoFoundModule(false, p6, p1, p5, nil, nil, nil, false)
		end
	else
		HandleAccountInfoModule(p1, FromLocalStorageResult, p5, false, p6, Home, function()
			-- upvalues: p6 (copy), PreloadApplicationDataModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p7 (copy), p9 (copy), p10 (copy)
			return p6:dispatch(PreloadApplicationDataModule(p1, p2, p3, p4, p7, p9, p10))
		end, p7, p8, false)
	end
end

function launchApp(p1, p2, p3, p4, LaunchContext, p5, p6, p7, p8)
	-- upvalues: FetchLocaleModule (copy), UserModule (copy), AppPageModule (copy), SetLaunchContextFunction (copy), Default1 (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), GetCredentialsAvailabilityStoreFunction (copy), ParseCredentialsProtocolIsAvailableResponseFunction (copy), Logger (copy), Default (copy), TelemetryConfigs (copy), FFlagEnableLuaAccountSwitchModule (copy), FFlagMorePageGateAccountSwitcherByCachedVariantId (copy), AppStorageUtilitiesModule (copy), AuthPageloadFunction (copy), WebLoginModule (copy), WebLaunchOptionModule (copy), handleNoCachedUser (copy), PostSignUpAttribution (copy), GetFFlagEnableHandleEngineSessionCheckAtStartupModule (copy), LaunchContextModule (copy), initializeForCachedUserV2 (copy), initializeForCachedUser (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), FFlagApplyLaunchContextForNewAccountSwitches (copy), AccountSwitcherConstants (copy), ConstantsModule (copy)
	return function(p9)
		-- upvalues: p8 (ref), FetchLocaleModule (upval), p1 (copy), UserModule (upval), AppPageModule (upval), SetLaunchContextFunction (upval), LaunchContext (copy), Default1 (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), GetCredentialsAvailabilityStoreFunction (upval), ParseCredentialsProtocolIsAvailableResponseFunction (upval), Logger (upval), Default (upval), TelemetryConfigs (upval), FFlagEnableLuaAccountSwitchModule (upval), FFlagMorePageGateAccountSwitcherByCachedVariantId (upval), AppStorageUtilitiesModule (upval), AuthPageloadFunction (upval), WebLoginModule (upval), WebLaunchOptionModule (upval), handleNoCachedUser (upval), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), PostSignUpAttribution (upval), GetFFlagEnableHandleEngineSessionCheckAtStartupModule (upval), LaunchContextModule (upval), initializeForCachedUserV2 (upval), initializeForCachedUser (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), FFlagApplyLaunchContextForNewAccountSwitches (upval), AccountSwitcherConstants (upval), ConstantsModule (upval)
		p8 = p8 or false
		local LocaleModule = FetchLocaleModule(p1)
		local FromLocalStorageResult = UserModule.fromLocalStorage()
		local Home = AppPageModule.Home
		p9:dispatch(SetLaunchContextFunction(LaunchContext))
		Default1:isAvailable(Default1.CredentialsTypes.all, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
			-- upvalues: GetCredentialsAvailabilityStoreFunction (upval), ParseCredentialsProtocolIsAvailableResponseFunction (upval)
			local CredentialsAvailabilityStore = GetCredentialsAvailabilityStoreFunction(false)
			local ParseCredentialsProtocolIsAvailableResponseResult = ParseCredentialsProtocolIsAvailableResponseFunction(Result)
			CredentialsAvailabilityStore.setFido2Available(ParseCredentialsProtocolIsAvailableResponseResult.fido2Available)
			CredentialsAvailabilityStore.setFido2SupportsDeviceBoundOnly(ParseCredentialsProtocolIsAvailableResponseResult.fido2SupportsDeviceBoundOnly)
			CredentialsAvailabilityStore.setPasswordsAvailable(ParseCredentialsProtocolIsAvailableResponseResult.passwordsAvailable)
			CredentialsAvailabilityStore.setV2InterfaceSupported(ParseCredentialsProtocolIsAvailableResponseResult.v2InterfaceSupported)
		end):catch(function(_)
			-- upvalues: Logger (upval)
			Logger:warning("Error prefetching CredentialsProtocol:isAvailable")
		end)
		pcall(function()
			-- upvalues: Default (upval), TelemetryConfigs (upval), LaunchContext (upval), FromLocalStorageResult (ref)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.LaunchAppThunkInitiatedConfig, 1, {
				launchContext = LaunchContext,
				hasCachedUser = tostring(if FromLocalStorageResult and FromLocalStorageResult.userId then FromLocalStorageResult.userId ~= -1 else false)
			})
		end)
		
		if FFlagEnableLuaAccountSwitchModule and FFlagMorePageGateAccountSwitcherByCachedVariantId then
			AuthPageloadFunction("launchAppCachedAsValue", (tostring((AppStorageUtilitiesModule.getAccountSwitcherAvailableByVariantId()))))
		end
		if WebLoginModule.getWebLogin() == WebLaunchOptionModule.NotFromWeb then
			PostSignUpAttribution.attributeV2(p1, LaunchContext)
			
			if FromLocalStorageResult.userId == -1 then
				Logger:info(string.format("[%f] LaunchApp::handleNoCachedUser()", tick()))
				local IsNotLaunchContextMatch = LaunchContext ~= LaunchContextModule.Startup
				
				if FFlagEnableLuaAccountSwitchModule then
					local AccountSwitchStatus = AppStorageUtilitiesModule.getAccountSwitchStatus()
					
					if (FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues or FFlagApplyLaunchContextForNewAccountSwitches) and AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherSwitchedStatus or (AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus or AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherSwitchedFromSignupStatus) then
						IsNotLaunchContextMatch = true
						AppStorageUtilitiesModule.setAccountSwitchStatus("")
						AppStorageUtilitiesModule.setAccountSwitchTargetUsername("")
					elseif not FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues and AccountSwitchStatus == ConstantsModule.Auth.AccountSwitcherSwitchedStatus then
						IsNotLaunchContextMatch = true
						AppStorageUtilitiesModule.setAccountSwitchStatus("")
						AppStorageUtilitiesModule.setAccountSwitchTargetUsername("")
					end
					if AppStorageUtilitiesModule.getSignupActionRequired() == "auth" then
						IsNotLaunchContextMatch = false
					end
				end
				handleNoCachedUser(p1, p2, p3, p4, IsNotLaunchContextMatch, FromLocalStorageResult, LocaleModule, p9, Home, p5, false, p6, p7, p8)
			else
				Logger:info(string.format("[%f] LaunchApp::initializeForCachedUser()", tick()))
				
				if GetFFlagEnableHandleEngineSessionCheckAtStartupModule() and LaunchContext == LaunchContextModule.Startup then
					initializeForCachedUserV2(p1, p2, p3, p4, FromLocalStorageResult, Home, p9, LocaleModule, p5, false, p6, p7)
				else
					initializeForCachedUser(p1, p2, p3, p4, FromLocalStorageResult, Home, p9, LocaleModule, p5, false, p6, p7)
				end
			end
		else
			Logger:info(string.format("[%f] LaunchApp::handleNoCachedUser(), WebLogin", tick()))
			UserModule.clearLocalStorage()
			AppStorageUtilitiesModule.flush()
			FromLocalStorageResult = UserModule.fromLocalStorage()
			handleNoCachedUser(p1, p2, p3, p4, WebLoginModule.getWebLogin() == WebLaunchOptionModule.FromWebBanner or (WebLoginModule.getWebLogin() == WebLaunchOptionModule.FromWebPlayGame or WebLoginModule.getWebLogin() == WebLaunchOptionModule.FromCommandLine), FromLocalStorageResult, LocaleModule, p9, Home, p5, false, p6, p7, p8)
		end
	end
end

return launchApp