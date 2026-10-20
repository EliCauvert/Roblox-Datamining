local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppUpdateService = RoactServiceTagsModule.AppUpdateService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local CheckForUpdateFunction = require(CorePackages.Workspace.Packages.RobloxAppUpdate).Thunks.CheckForUpdate
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)

return function(_)
	-- upvalues: UseRoactServiceModule (copy), RoactAnalytics (copy), AppUpdateService (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), LoginStatusModule (copy), CheckForUpdateFunction (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactAnalytics)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppUpdateService)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.AuthenticationStatus.status
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), LoginStatusModule (upval), UseDispatchResult (copy), CheckForUpdateFunction (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy)
		if game:GetEngineFeature("AutoUpgradeEngineFeatureOnly") and UseSelectorResult == LoginStatusModule.LOGGED_IN then
			UseDispatchResult(CheckForUpdateFunction(UseRoactServiceModuleResult1, false, UseRoactServiceModuleResult, function() end, { ctx = "AppUpdateManager" }))
		end
	end, {
		UseSelectorResult,
		UseRoactServiceModuleResult1,
		UseRoactServiceModuleResult
	})
	
	return nil
end