local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(p1, p2)
	-- upvalues: SearchUuidModule (copy), SetSearchTypeModule (copy), RobloxAppEnumsModule (copy), FilterUtilsModule (copy), DashModule (copy), SetSearchParametersModule (copy), NavigationUtilsModule (copy)
	return function(p3)
		-- upvalues: SearchUuidModule (upval), SetSearchTypeModule (upval), RobloxAppEnumsModule (upval), p2 (copy), FilterUtilsModule (upval), DashModule (upval), SetSearchParametersModule (upval), NavigationUtilsModule (upval), p1 (copy)
		local SearchUuidModuleResult = SearchUuidModule()
		p3:dispatch(SetSearchTypeModule(SearchUuidModuleResult, RobloxAppEnumsModule.SearchTypes.Catalog))
		local JoinResult = DashModule.join(p2 or {}, {
			sortAndFilters = FilterUtilsModule.selectSortAndFilters(p3:getState())
		})
		p3:dispatch(SetSearchParametersModule(SearchUuidModuleResult, JoinResult))
		NavigationUtilsModule.navigateToSearch(p1, SearchUuidModuleResult, JoinResult)
	end
end