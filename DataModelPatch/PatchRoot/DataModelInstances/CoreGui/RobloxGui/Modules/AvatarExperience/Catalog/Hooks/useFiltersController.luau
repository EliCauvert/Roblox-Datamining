local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CreatorFilterModule = require(Modules.AvatarExperience.Common.Enum.CreatorFilter)
local PriceFilterModule = require(Modules.AvatarExperience.Common.Enum.PriceFilter)
local SalesTypeFilterModule = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilterModule = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SetSalesTypeFilterModule = require(Modules.AvatarExperience.Catalog.Actions.SetSalesTypeFilter)
local SetCreatorFilterModule = require(Modules.AvatarExperience.Catalog.Actions.SetCreatorFilter)
local SetPriceRangeModule = require(Modules.AvatarExperience.Catalog.Actions.SetPriceRange)
local SetUnavailableItemFilterModule = require(Modules.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter)
local SetWearTimeFilterModule = require(Modules.AvatarExperience.Catalog.Actions.SetWearTimeFilter)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WearTimeFilter = AvatarExperienceCommonModule.Enums.WearTimeFilter
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FFlagMinMaxPriceValidation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagMinMaxPriceValidation

local function _(p1, p2)
	-- upvalues: CatalogConstantsModule (copy), PriceFilterModule (copy)
	return if CatalogConstantsModule.MinPriceFilter < p1 or p2 < CatalogConstantsModule.MaxPriceFilter then PriceFilterModule.PriceRange else PriceFilterModule.AnyPrice
end

local _ = function(p1)
	-- upvalues: CreatorFilterModule (copy)
	return if p1 == nil or p1 == "" then CreatorFilterModule.AllCreators else CreatorFilterModule.Username
end

local function wearTimeFilterChanged(p1, p2): boolean
	return p1 ~= p2
end

return function()
	-- upvalues: UseSelectorFunction (copy), FilterUtilsModule (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), CreatorFilterModule (copy), CatalogConstantsModule (copy), PriceFilterModule (copy), UseDispatchFunction (copy), SalesTypeFilterModule (copy), UnavailableItemFilterModule (copy), WearTimeFilter (copy), wearTimeFilterChanged (copy), FFlagMinMaxPriceValidation (copy), SetSalesTypeFilterModule (copy), SetCreatorFilterModule (copy), SetPriceRangeModule (copy), SetUnavailableItemFilterModule (copy), SetWearTimeFilterModule (copy)
	local UseSelectorResult = UseSelectorFunction(FilterUtilsModule.selectSalesTypeFilter, GetUseSelectorDeepEqualsFunction())
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult)
	local UseSelectorResult1 = UseSelectorFunction(FilterUtilsModule.selectCreatorFilter, GetUseSelectorDeepEqualsFunction())
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if UseSelectorResult1 == nil or UseSelectorResult1 == "" then CreatorFilterModule.AllCreators else CreatorFilterModule.Username)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseSelectorResult1)
	local UseSelectorResult2 = UseSelectorFunction(FilterUtilsModule.selectMinPrice, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(FilterUtilsModule.selectMaxPrice, GetUseSelectorDeepEqualsFunction())
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(if CatalogConstantsModule.MinPriceFilter < UseSelectorResult2 or UseSelectorResult3 < CatalogConstantsModule.MaxPriceFilter then PriceFilterModule.PriceRange else PriceFilterModule.AnyPrice)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(UseSelectorResult2)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(UseSelectorResult3)
	local UseSelectorResult4 = UseSelectorFunction(FilterUtilsModule.selectUnavailableItemFilter, GetUseSelectorDeepEqualsFunction())
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(UseSelectorResult4)
	local UseSelectorResult5 = UseSelectorFunction(FilterUtilsModule.selectWearTimeFilter, GetUseSelectorDeepEqualsFunction())
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(UseSelectorResult5)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult9 = if UseStateResult1 == CreatorFilterModule.AllCreators then "" else UseStateResult3
	local MinPriceFilter = if UseStateResult4 == PriceFilterModule.AnyPrice then CatalogConstantsModule.MinPriceFilter else UseStateResult5
	local MaxPriceFilter = if UseStateResult4 == PriceFilterModule.AnyPrice then CatalogConstantsModule.MaxPriceFilter else UseStateResult6
	
	return {
		salesTypeFilter = UseStateResult,
		setSalesTypeFilter = UseStateResult2,
		creatorFilter = UseStateResult1,
		setCreatorFilter = UseStateResult2_1,
		creatorUsername = UseStateResult3,
		setCreatorUsername = UseStateResult2_2,
		priceFilter = UseStateResult4,
		setPriceFilter = UseStateResult2_3,
		minPrice = UseStateResult5,
		setMinPrice = UseStateResult2_4,
		maxPrice = UseStateResult6,
		setMaxPrice = UseStateResult2_5,
		wearTimeFilter = UseStateResult8,
		setWearTimeFilter = UseStateResult2_7,
		unavailableItemFilter = UseStateResult7,
		setUnavailableItemFilter = UseStateResult2_6,
		canReset = UseStateResult ~= SalesTypeFilterModule.All or (UseStateResult1 ~= CreatorFilterModule.AllCreators or (UseStateResult4 ~= PriceFilterModule.AnyPrice or UseStateResult7 ~= UnavailableItemFilterModule.Hide)) or UseStateResult8 ~= WearTimeFilter.All,
		canApply = if UseStateResult == UseSelectorResult then (not FFlagMinMaxPriceValidation or MaxPriceFilter >= MinPriceFilter) and (UseStateResult9 ~= UseSelectorResult1 or (MinPriceFilter ~= UseSelectorResult2 or (MaxPriceFilter ~= UseSelectorResult3 or (UseStateResult7 ~= UseSelectorResult4 or wearTimeFilterChanged and UseStateResult8 ~= UseSelectorResult5)))) else not FFlagMinMaxPriceValidation or MaxPriceFilter >= MinPriceFilter,
		reset = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), SalesTypeFilterModule (upval), UseStateResult2_1 (copy), CreatorFilterModule (upval), UseStateResult2_3 (copy), PriceFilterModule (upval), UseStateResult2_6 (copy), UnavailableItemFilterModule (upval), UseStateResult2_7 (copy), WearTimeFilter (upval)
			UseStateResult2(SalesTypeFilterModule.All)
			UseStateResult2_1(CreatorFilterModule.AllCreators)
			UseStateResult2_3(PriceFilterModule.AnyPrice)
			UseStateResult2_6(UnavailableItemFilterModule.Hide)
			UseStateResult2_7(WearTimeFilter.All)
		end),
		apply = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SetSalesTypeFilterModule (upval), UseStateResult (copy), SetCreatorFilterModule (upval), UseStateResult9 (copy), SetPriceRangeModule (upval), MinPriceFilter (copy), MaxPriceFilter (copy), SetUnavailableItemFilterModule (upval), UseStateResult7 (copy), SetWearTimeFilterModule (upval), UseStateResult8 (copy)
			UseDispatchResult(SetSalesTypeFilterModule(UseStateResult))
			UseDispatchResult(SetCreatorFilterModule(UseStateResult9))
			UseDispatchResult(SetPriceRangeModule(MinPriceFilter, MaxPriceFilter))
			UseDispatchResult(SetUnavailableItemFilterModule(UseStateResult7))
			UseDispatchResult(SetWearTimeFilterModule(UseStateResult8))
		end, {
			UseStateResult, UseStateResult9, MinPriceFilter, MaxPriceFilter,
			UseStateResult7, UseStateResult8
		})
	}
end