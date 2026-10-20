local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local MemStorageService = game:GetService("MemStorageService")
local UserModule = require(script.Parent.User)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetFFlagDebugResetSurveyStorageModule = require(Modules.LuaApp.Flags.GetFFlagDebugResetSurveyStorage)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local ClearAppModule = require(Modules.LuaApp.Thunks.Authentication.ClearApp)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local CsatSurveyConstantsModule = require(Modules.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants)
local ConstantsModule = require(Modules.LuaApp.Constants)

return function()
	-- upvalues: ClearAppModule (copy), UserModule (copy), ExperimentCacheManager (copy), GetFFlagDebugResetSurveyStorageModule (copy), AppStorageService (copy), CsatSurveyConstantsModule (copy), ConstantsModule (copy), AppStorageUtilitiesModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), RoactAppExperimentModule (copy)
	return function(p1)
		-- upvalues: ClearAppModule (upval), UserModule (upval), ExperimentCacheManager (upval), GetFFlagDebugResetSurveyStorageModule (upval), AppStorageService (upval), CsatSurveyConstantsModule (upval), ConstantsModule (upval), AppStorageUtilitiesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval), RoactAppExperimentModule (upval)
		p1:dispatch(ClearAppModule())
		UserModule.clearLocalStorage()
		ExperimentCacheManager.default:clearCache()
		
		if GetFFlagDebugResetSurveyStorageModule() then
			AppStorageService:SetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, ConstantsModule.Auth.DefaultUnauthenticatedCsatCompletedSurveyIds)
		end
		AppStorageUtilitiesModule.setRobloxLocaleId(ConstantsModule.Auth.DefaultUnauthenticatedRobloxLocaleId)
		AppStorageUtilitiesModule.setDiscoveryClientFallbackCache("")
		MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, ConstantsModule.Auth.DefaultUnauthenticatedAppTheme)
		MemStorageService:SetItem(MemStorageKeysModule.RobuxBalance, ConstantsModule.Auth.DefaultUnauthenticatedRobuxBalance)
		MemStorageService:SetItem(MemStorageKeysModule.RobuxBalanceLocalized, ConstantsModule.Auth.DefaultUnauthenticatedRobuxBalanceLocalized)
		RoactAppExperimentModule.clearUserLayers()
	end
end