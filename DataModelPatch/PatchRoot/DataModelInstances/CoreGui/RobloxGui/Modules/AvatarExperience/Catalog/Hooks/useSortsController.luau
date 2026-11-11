local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SortTypeModule = require(Modules.AvatarExperience.Common.Enum.SortType)
local SortAggregationModule = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local SetCatalogSortModule = require(Modules.AvatarExperience.Catalog.Actions.SetCatalogSort)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function()
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), UseSelectorFunction (copy), FilterUtilsModule (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), UseDispatchFunction (copy), SortTypeModule (copy), SortAggregationModule (copy), SetCatalogSortModule (copy)
	local _ = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorResult = UseSelectorFunction(FilterUtilsModule.selectCatalogSort, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(FilterUtilsModule.selectCatalogSortAggregation, GetUseSelectorDeepEqualsFunction())
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseSelectorResult1)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseSelectorResult1)
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		sortType = UseStateResult,
		setSortType = UseStateResult2,
		mostFavoritedAggregation = UseStateResult1,
		setMostFavoritedAggregation = UseStateResult2_1,
		bestSellingAggregation = UseStateResult3,
		setBestSellingAggregation = UseStateResult2_2,
		canReset = UseStateResult ~= SortTypeModule.Relevance,
		canApply = UseStateResult ~= UseSelectorResult or (UseStateResult == SortTypeModule.MostFavorited and UseStateResult1 ~= UseSelectorResult1 or UseStateResult == SortTypeModule.Bestselling and UseStateResult3 ~= UseSelectorResult1),
		reset = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), SortTypeModule (upval), UseStateResult2_1 (copy), SortAggregationModule (upval), UseStateResult2_2 (copy)
			UseStateResult2(SortTypeModule.Relevance)
			UseStateResult2_1(SortAggregationModule.AllTime)
			UseStateResult2_2(SortAggregationModule.AllTime)
		end),
		apply = ReactModule.useCallback(function()
			-- upvalues: SortAggregationModule (upval), UseStateResult (copy), SortTypeModule (upval), UseStateResult1 (copy), UseStateResult3 (copy), UseDispatchResult (copy), SetCatalogSortModule (upval)
			UseDispatchResult(SetCatalogSortModule(UseStateResult, if UseStateResult == SortTypeModule.MostFavorited then UseStateResult1 elseif UseStateResult == SortTypeModule.Bestselling then UseStateResult3 else SortAggregationModule.AllTime))
		end, { UseStateResult, UseStateResult1, UseStateResult3 })
	}
end