local LocalizationService = game:GetService("LocalizationService")
local MemStorageService = game:GetService("MemStorageService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local ClearAppModule = require(script.Parent.ClearApp)
local GuiService = game:GetService("GuiService")
local SetAuthenticationStatusFunction = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateToRouteModule = require(Modules.LuaApp.Thunks.NavigateToRoute)
local AppPageModule = require(Modules.LuaApp.AppPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local LuaLogoutReasonsModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons)
local TelemetryService = game:GetService("TelemetryService")
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableIosKeychainLoginLuaModule = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local GetFFlagKeystoreAutoLoginAvailableFunction = SharedFlagsModule.GetFFlagKeystoreAutoLoginAvailable
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local LuaLogoutTelemetryConfig = TelemetryConfigs.LuaLogoutTelemetryConfig
local KeystoreRedirectTelemetryConfig = TelemetryConfigs.KeystoreRedirectTelemetryConfig
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local GetFFlagEnableStorePreviousAccountDataFunction = SharedFlagsModule.GetFFlagEnableStorePreviousAccountData
local StorePreviousAccountDataFunction = AuthCommonModule.Thunks.StorePreviousAccountData
local FFlagEnableCallingLogoutOnResetIXP = SharedFlagsModule.FFlagEnableCallingLogoutOnResetIXP
local FFlagEnableLuaLoginRevamp = SharedFlagsModule.FFlagEnableLuaLoginRevamp
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IXPService = game:GetService("IXPService")

local function _()
	-- upvalues: IXPService (copy), AppBtidLayers (copy)
	local Success, Result = pcall(function()
		-- upvalues: IXPService (upval), AppBtidLayers (upval)
		return IXPService:GetBrowserTrackerLayerVariables(AppBtidLayers.LandingLayer)
	end)
	
	return not Success or Result == nil or Result.iOSEnableCallingLogoutOnReset == nil or Result.iOSEnableCallingLogoutOnReset
end

local _ = function(List): boolean
	if List == nil then
		return false
	end
	for _, value in pairs(List) do
		if value ~= nil then
			return true
		end
	end
	return false
end

return function(p1, p2, p3, p4, Lualogoutreasons, p5, p6, Enabled)
	-- upvalues: PromiseUtilitiesModule (copy), AppStorageUtilitiesModule (copy), LocalizationService (copy), FFlagEnableCallingLogoutOnResetIXP (copy), IXPService (copy), AppBtidLayers (copy), LuaLogoutReasonNamesModule (copy), LogoutModule (copy), GuiService (copy), GetFFlagEnableStorePreviousAccountDataFunction (copy), StorePreviousAccountDataFunction (copy), ClearAppModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), LoggingProtocolModule (copy), LuaLogoutReasonsModule (copy), TelemetryService (copy), LuaLogoutTelemetryConfig (copy), FlagSettingsModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), GetAppFeaturePoliciesFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateToRouteModule (copy), FFlagEnableIosKeychainLoginLuaModule (copy), GetFFlagKeystoreAutoLoginAvailableFunction (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), KeystoreRedirectTelemetryConfig (copy), FFlagEnableLuaLoginRevamp (copy), NavigateDownModule (copy), RoactAppExperimentModule (copy), ExperimentCacheManager (copy)
	PromiseUtilitiesModule.Batch({ p4 }):andThen(function(Entry)
		-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval), p1 (copy), FFlagEnableCallingLogoutOnResetIXP (upval), IXPService (upval), AppBtidLayers (upval), Lualogoutreasons (copy), LuaLogoutReasonNamesModule (upval), p2 (copy), LogoutModule (upval), p3 (copy), GuiService (upval), GetFFlagEnableStorePreviousAccountDataFunction (upval), StorePreviousAccountDataFunction (upval), ClearAppModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), LoggingProtocolModule (upval), LuaLogoutReasonsModule (upval), TelemetryService (upval), LuaLogoutTelemetryConfig (upval), FlagSettingsModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), GetAppFeaturePoliciesFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateToRouteModule (upval), p5 (copy), FFlagEnableIosKeychainLoginLuaModule (upval), GetFFlagKeystoreAutoLoginAvailableFunction (upval), Enabled (copy), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), KeystoreRedirectTelemetryConfig (upval), FFlagEnableLuaLoginRevamp (upval), p6 (copy), NavigateDownModule (upval), RoactAppExperimentModule (upval), ExperimentCacheManager (upval)
		if Entry and Entry[1] then
			Entry[1]:match(function(p7)
				-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
				AppStorageUtilitiesModule.setRobloxLocaleId(p7.signupAndLoginLocale)
				LocalizationService:SetRobloxLocaleId(p7.signupAndLoginLocale)
			end)
		end
		repeat
			if not p1 then break end
			if FFlagEnableCallingLogoutOnResetIXP then
				local Success, Result = pcall(function()
					-- upvalues: IXPService (upval), AppBtidLayers (upval)
					return IXPService:GetBrowserTrackerLayerVariables(AppBtidLayers.LandingLayer)
				end)
				
				if (not Success or Result == nil or Result.iOSEnableCallingLogoutOnReset == nil or Result.iOSEnableCallingLogoutOnReset) and Lualogoutreasons == LuaLogoutReasonNamesModule.UnauthorizedAutoLogin then
					p2:dispatch(LogoutModule(p3, GuiService, Lualogoutreasons))
					break
				end
			end
			if GetFFlagEnableStorePreviousAccountDataFunction() then
				StorePreviousAccountDataFunction()
			end
			p2:dispatch(ClearAppModule())
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, "dark")
		until true
		p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
		
		if Lualogoutreasons ~= nil then
			LoggingProtocolModule.default:logRobloxTelemetryEvent(LuaLogoutReasonsModule, nil, { lualogoutreasons = Lualogoutreasons })
		end
		TelemetryService:LogCounter(LuaLogoutTelemetryConfig, {
			customFields = {
				reason = Lualogoutreasons or LuaLogoutReasonNamesModule.Unknown
			}
		}, 1)
		
		if FlagSettingsModule.WeChatLoginEnabled() then
			p2:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.WeChatLoginWrapper } }))
		elseif FlagSettingsModule.LuaAppLoginUIEnabled() then
			if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then
				local list = { { name = AppPageModule.SingleSignOnContainer } }
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]))
				else
					p2:dispatch(NavigateToRouteModule(list))
				end
			else
				local Flag = nil
				if p5 == nil then
					Flag = false
				else
					Flag = false
					
					for _, value in pairs(p5) do
						if value ~= nil then
							Flag = true
							break
						end
					end
				end
				if (FFlagEnableIosKeychainLoginLuaModule or GetFFlagKeystoreAutoLoginAvailableFunction()) and p5 and Flag then
					local ExtraProps = {}
					
					if Enabled == nil or Enabled == false then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLandingPage)
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreRedirectTelemetryConfig, { customFields = { destination = "landing_page" } }, 1)
						end
						p2:dispatch(ResetNavigationHistoryModule({
							{ name = AppPageModule.Landing, extraProps = ExtraProps }
						}))
					else
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreRedirectTelemetryConfig, { customFields = { destination = "login_page" } }, 1)
						end
						if FFlagEnableLuaLoginRevamp then
							ExtraProps.forcedUsernameOverride = p5.username
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLoginPage)
							p2:dispatch(ResetNavigationHistoryModule({
								{ name = AppPageModule.Landing, extraProps = {} },
								{ name = AppPageModule.LoginV2, extraProps = ExtraProps }
							}))
						else
							ExtraProps.usernameFromIosKeychain = p5.username
							
							if p6 then
								ExtraProps.passwordFromIosKeychain = p5.password
							end
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLoginPage)
							p2:dispatch(ResetNavigationHistoryModule({
								{ name = AppPageModule.Landing, extraProps = {} },
								{ name = AppPageModule.Login, extraProps = ExtraProps }
							}))
						end
					end
				else
					if GetFFlagEnableStorePreviousAccountDataFunction() then
						StorePreviousAccountDataFunction()
					end
					p2:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Landing, extraProps = {} } }))
				end
			end
		elseif FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPageModule.LoginNative }))
		else
			p2:dispatch(NavigateDownModule({ name = AppPageModule.LoginNative }))
		end
		RoactAppExperimentModule.clearUserLayers()
		ExperimentCacheManager.default:clearCache()
	end)
end