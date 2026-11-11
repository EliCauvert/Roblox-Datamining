local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = AvatarExperienceCommonModule.Enums.FullView
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals

return function()
	-- upvalues: UseRouteNameFunction (copy), ReactModule (copy), SelectIsFullViewModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseDispatchFunction (copy), SetFullViewModule (copy)
	local UseRouteNameResult = UseRouteNameFunction()
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p1)
		-- upvalues: SelectIsFullViewModule (upval), UseRouteNameResult (copy)
		return SelectIsFullViewModule(p1, UseRouteNameResult)
	end, { UseRouteNameResult }), GetUseSelectorDeepEqualsFunction())
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseDispatchResult = UseDispatchFunction()
	
	return UseSelectorResult, (ReactModule.useCallback(function(p1)
		-- upvalues: UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceModuleResult (copy), UseRouteNameResult (copy)
		UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult, UseRouteNameResult, p1))
	end, {
		UseRoactServiceModuleResult,
		UseRouteNameResult,
		UseDispatchResult
	}))
end