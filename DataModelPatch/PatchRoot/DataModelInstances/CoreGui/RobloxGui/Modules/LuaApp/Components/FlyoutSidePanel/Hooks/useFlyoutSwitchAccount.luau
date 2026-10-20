local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OpenAccountSwitcherModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitcher)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppOmniRecommendationsRequest = RoactServiceTagsModule.AppOmniRecommendationsRequest
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableLuaLoginRevamp = SharedFlagsModule.FFlagEnableLuaLoginRevamp
local FStringLuaLoginRevampIxpLayer = SharedFlagsModule.FStringLuaLoginRevampIxpLayer

return function(p1, p2)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalyticsAuthEventsModule (copy), UseAppPolicyFunction (copy), AppOmniRecommendationsRequest (copy), UseDispatchFunction (copy), FFlagEnableLuaLoginRevamp (copy), RoactAppExperimentModule (copy), FStringLuaLoginRevampIxpLayer (copy), ReactModule (copy), OpenAccountSwitcherModule (copy), EventStreamConstantsModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalyticsAuthEventsModule)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return p3
	end)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppOmniRecommendationsRequest)
	local UseDispatchResult = UseDispatchFunction()
	local UseBrowserTrackerExperimentResult = if FFlagEnableLuaLoginRevamp then RoactAppExperimentModule.useBrowserTrackerExperiment({ FStringLuaLoginRevampIxpLayer }, function(p3)
		-- upvalues: FStringLuaLoginRevampIxpLayer (upval)
		return {
			showLoginRevamp = (p3[FStringLuaLoginRevampIxpLayer] or {}).showLoginRevamp
		}
	end) else { showLoginRevamp = false }
	
	return ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenAccountSwitcherModule (upval), UseRoactServiceResult (copy), EventStreamConstantsModule (upval), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), UseRoactServiceResult2 (copy), p1 (copy), p2 (copy), UseBrowserTrackerExperimentResult (ref)
		UseDispatchResult(OpenAccountSwitcherModule(true, UseRoactServiceResult, EventStreamConstantsModule.Origin.FlyoutSidePanel, UseRoactServiceResult1, UseAppPolicyResult, UseRoactServiceResult2, p1, p2, UseBrowserTrackerExperimentResult.showLoginRevamp))
		UseRoactServiceResult1.reportAuthButtonClick(EventStreamConstantsModule.Context.FlyoutSidePanel, EventStreamConstantsModule.Button.SwitchAccounts)
	end, {
		UseRoactServiceResult, UseRoactServiceResult1, UseAppPolicyResult,
		UseRoactServiceResult2, p1, p2,
		UseBrowserTrackerExperimentResult.showLoginRevamp, UseDispatchResult
	})
end