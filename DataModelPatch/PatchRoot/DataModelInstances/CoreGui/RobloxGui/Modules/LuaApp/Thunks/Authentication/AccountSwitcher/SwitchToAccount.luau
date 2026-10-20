local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local SwitchAccountModule = require(Modules.LuaApp.Http.Requests.AccountSwitcher.SwitchAccount)
local ClearAppModule = require(script.Parent.Parent.ClearApp)
local AppStorageUtilitiesModule = require(script.Parent.Parent.AppStorageUtilities)
local UserModule = require(script.Parent.Parent.User)
local PromiseModule = require(CorePackages.Packages.Promise)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local GetFFlagDebugResetSurveyStorageModule = require(Modules.LuaApp.Flags.GetFFlagDebugResetSurveyStorage)
local AppStorageService = game:GetService("AppStorageService")
local CsatSurveyConstantsModule = require(Modules.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local ConstantsModule = require(Modules.LuaApp.Constants)
local MemStorageService = game:GetService("MemStorageService")
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local OpenAccountSwitchingErrorOverlayModule = require(script.Parent.Parent.OpenAccountSwitchingErrorOverlay)
local GuiService = game:GetService("GuiService")
local CloseCentralOverlayModule = require(script.Parent.Parent.Parent.CloseCentralOverlay)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local FFlagLuaEnableDidSwitchAccountModule = require(Modules.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount)
local UseResetAppStateForSwitchToAccount2 = game:DefineFastFlag("UseResetAppStateForSwitchToAccount2", false)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign

return function(p1, p2, p3, p4, p5)
	-- upvalues: AppStorageUtilitiesModule (copy), UserModule (copy), CloseCentralOverlayModule (copy), OpenAccountSwitchingErrorOverlayModule (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), ConstantsModule (copy), SwitchAccountModule (copy), PromiseModule (copy), UseResetAppStateForSwitchToAccount2 (copy), ResetAppStateModule (copy), ClearAppModule (copy), ExperimentCacheManager (copy), GetFFlagDebugResetSurveyStorageModule (copy), AppStorageService (copy), CsatSurveyConstantsModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), RoactAppExperimentModule (copy), FFlagLuaEnableDidSwitchAccountModule (copy), GuiService (copy), NotificationTypeModule (copy), LaunchAppModule (copy), LaunchContextModule (copy)
	return function(p6)
		-- upvalues: AppStorageUtilitiesModule (upval), UserModule (upval), CloseCentralOverlayModule (upval), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), ConstantsModule (upval), SwitchAccountModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), UseResetAppStateForSwitchToAccount2 (upval), ResetAppStateModule (upval), ClearAppModule (upval), ExperimentCacheManager (upval), GetFFlagDebugResetSurveyStorageModule (upval), AppStorageService (upval), CsatSurveyConstantsModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), RoactAppExperimentModule (upval), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval), LaunchAppModule (upval), p4 (copy), p5 (copy), p3 (copy), LaunchContextModule (upval)
		local Text = tostring(UserModule.fromLocalStorage().userId)
		
		local function v25()
			-- upvalues: p6 (copy), CloseCentralOverlayModule (upval)
			p6:dispatch(CloseCentralOverlayModule())
		end
		
		local function _()
			-- upvalues: p6 (copy), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), v25 (copy), ConstantsModule (upval)
			p6:dispatch(OpenAccountSwitchingErrorOverlayModule(if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" else "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v25, nil, ConstantsModule.Auth.AccountSwitcherSwitchError))
		end
		
		return SwitchAccountModule(p1, p2, AppStorageUtilitiesModule.getAccountBlob(), Text):andThen(function(Result)
			-- upvalues: PromiseModule (upval), AppStorageUtilitiesModule (upval), p6 (copy), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), v25 (copy), ConstantsModule (upval), UseResetAppStateForSwitchToAccount2 (upval), ResetAppStateModule (upval), ClearAppModule (upval), UserModule (upval), ExperimentCacheManager (upval), GetFFlagDebugResetSurveyStorageModule (upval), AppStorageService (upval), CsatSurveyConstantsModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), RoactAppExperimentModule (upval)
			if Result == nil or Result.responseBody == nil or Result.responseBody.encrypted_users_data_blob == nil then
				return PromiseModule.reject(false)
			end
			local EncryptedUsersDataBlob = Result.responseBody.encrypted_users_data_blob
			AppStorageUtilitiesModule.setAccountBlob(EncryptedUsersDataBlob)
			AppStorageUtilitiesModule.flush()
			
			if Result.responseBody.errors ~= nil and #Result.responseBody.errors > 0 then
				p6:dispatch(OpenAccountSwitchingErrorOverlayModule(if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" else "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v25, nil, ConstantsModule.Auth.AccountSwitcherSwitchError))
				
				return PromiseModule.reject(false)
			end
			if EncryptedUsersDataBlob == nil then
				return PromiseModule.reject(false)
			end
			if UseResetAppStateForSwitchToAccount2 then
				p6:dispatch(ResetAppStateModule())
			else
				p6:dispatch(ClearAppModule())
				UserModule.clearLocalStorage()
				ExperimentCacheManager.default:clearCache()
				
				if GetFFlagDebugResetSurveyStorageModule() then
					AppStorageService:SetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}")
				end
				AppStorageUtilitiesModule.setRobloxLocaleId("")
				AppStorageUtilitiesModule.setDiscoveryClientFallbackCache("")
				MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, "dark")
				MemStorageService:SetItem(MemStorageKeysModule.RobuxBalance, "0")
				MemStorageService:SetItem(MemStorageKeysModule.RobuxBalanceLocalized, "--")
				RoactAppExperimentModule.clearUserLayers()
			end
			AppStorageUtilitiesModule.setAccountSwitchStatus(ConstantsModule.Auth.AccountSwitcherSwitchedStatus)
			
			return PromiseModule.resolve(true)
		end, function(_)
			-- upvalues: p6 (copy), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), v25 (copy), ConstantsModule (upval), PromiseModule (upval)
			p6:dispatch(OpenAccountSwitchingErrorOverlayModule(if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" else "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v25, nil, ConstantsModule.Auth.AccountSwitcherSwitchError))
			
			return PromiseModule.reject(false)
		end):andThen(function(Result)
			-- upvalues: Text (copy), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval), p6 (copy), LaunchAppModule (upval), p1 (upval), p4 (upval), p5 (upval), p3 (upval), LaunchContextModule (upval)
			if Result then
				if not Text or Text == "-1" or Text == "" then
					p6:dispatch(LaunchAppModule(p1, p4, p5, p3, LaunchContextModule.Login))
				elseif FFlagLuaEnableDidSwitchAccountModule then
					GuiService:BroadcastNotification("", NotificationTypeModule.DID_SWITCH_ACCOUNT)
					
					return
				else
					GuiService:BroadcastNotification("", NotificationTypeModule.DID_LOG_OUT)
					
					return
				end
			end
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(false)
		end)
	end
end