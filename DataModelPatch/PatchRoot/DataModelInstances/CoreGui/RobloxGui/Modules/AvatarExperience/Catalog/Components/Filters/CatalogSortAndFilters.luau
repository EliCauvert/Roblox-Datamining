local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseInitializedValueFunction = require(CorePackages.Packages.ReactUtils).useInitializedValue
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local FilterSectionModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterSection)
local FiltersModule = require(Modules.AvatarExperience.Catalog.Components.Filters.Filters)
local SortsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.Sorts)
local UseFiltersControllerModule = require(Modules.AvatarExperience.Catalog.Hooks.useFiltersController)
local UseSortsControllerModule = require(Modules.AvatarExperience.Catalog.Hooks.useSortsController)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local UseCloseFiltersSignalModule = require(Modules.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal)
local FormPeekviewModule = require(Modules.AvatarExperience.Common.Components.FormPeekview)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SendApplySortAndFiltersAnalyticsModule = require(Modules.AvatarExperience.Catalog.Thunks.SendApplySortAndFiltersAnalytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

local function _(p1: number): number
	return p1 + 24 + 24
end

local function useSearchParameters()
	-- upvalues: UseAvatarRouteFunction (copy), AvatarScreen (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local IsNameMatch = UseAvatarRouteResult.opaque.name == AvatarScreen.CatalogSearch
	local Detail = if IsNameMatch then UseAvatarRouteResult.opaque.params.detail else nil
	
	return (UseSelectorFunction(function(p1)
		-- upvalues: Detail (copy)
		return if Detail then p1.SearchesParameters[Detail] else nil
	end, GetUseSelectorDeepEqualsFunction()))
end

return function(_)
	-- upvalues: UseFiltersControllerModule (copy), UseSortsControllerModule (copy), UseNavigationFunction (copy), RoactGamepadModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseCloseFiltersSignalModule (copy), useSearchParameters (copy), SendApplySortAndFiltersAnalyticsModule (copy), NavigateToSearchModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FilterUtilsModule (copy), UseInitializedValueFunction (copy), FormPeekviewModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FilterSectionModule (copy), FiltersModule (copy), SortsModule (copy)
	local UseFiltersControllerModuleResult = UseFiltersControllerModule()
	local UseSortsControllerModuleResult = UseSortsControllerModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local CanApply = UseFiltersControllerModuleResult.canApply or UseSortsControllerModuleResult.canApply
	local CanReset = UseFiltersControllerModuleResult.canReset or UseSortsControllerModuleResult.canReset
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseCloseFiltersSignalModuleResult = UseCloseFiltersSignalModule()
	local UseSearchParametersResult = useSearchParameters()
	
	local function apply()
		-- upvalues: UseFiltersControllerModuleResult (copy), UseSortsControllerModuleResult (copy), UseCloseFiltersSignalModuleResult (copy), UseDispatchResult (copy), SendApplySortAndFiltersAnalyticsModule (upval), UseRoactServiceModuleResult (copy), UseSearchParametersResult (copy), NavigateToSearchModule (upval), UseNavigationResult (copy)
		UseFiltersControllerModuleResult.apply()
		UseSortsControllerModuleResult.apply()
		UseCloseFiltersSignalModuleResult:fire()
		UseDispatchResult(SendApplySortAndFiltersAnalyticsModule(UseRoactServiceModuleResult))
		
		if UseSearchParametersResult then
			UseDispatchResult(NavigateToSearchModule(UseNavigationResult, UseSearchParametersResult))
		end
	end
	
	local function reset()
		-- upvalues: UseFiltersControllerModuleResult (copy), UseSortsControllerModuleResult (copy)
		UseFiltersControllerModuleResult.reset()
		UseSortsControllerModuleResult.reset()
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		sorts = "Feature.Catalog.Label.Filter.Sorts",
		filters = "Feature.Catalog.Label.Filter.Filters"
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local MapResult = UseBindingResult:map(FilterUtilsModule.mapHeightToSize)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local MapResult1 = UseBindingResult1:map(FilterUtilsModule.mapHeightToSize)
	
	return ReactModule.createElement(FormPeekviewModule, {
		canApply = CanApply,
		canReset = CanReset,
		onApply = apply,
		onReset = reset,
		closePeekViewSignal = UseCloseFiltersSignalModuleResult,
		totalSize = UseInitializedValueFunction(function()
			-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy)
			return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry): UDim2
				return UDim2.new(1, 0, 0, Entry[1] + 24 + 24 + (Entry[2] + 24 + 24))
			end)
		end),
		shouldCaptureFocus = not FFlagAXMigrateAXToGlobalAutofocus and nil
	}, {
		FiltersSection = ReactModule.createElement(FilterSectionModule, {
			title = UseLocalizationResult.filters,
			Size = UseBindingResult:map(function(p1: number): UDim2
				return UDim2.new(1, 0, 0, p1 + 24 + 24)
			end),
			contentSize = MapResult
		}, {
			Filters = ReactModule.createElement(FiltersModule, {
				Size = MapResult,
				filtersController = UseFiltersControllerModuleResult,
				frameRef = UseRefCacheResult.Filters,
				NextSelectionDown = UseRefCacheResult.Sorts,
				onHeightChanged = UseBindingResult2
			})
		}),
		SortsSection = ReactModule.createElement(FilterSectionModule, {
			title = UseLocalizationResult.sorts,
			Size = UseBindingResult1:map(function(p1: number): UDim2
				return UDim2.new(1, 0, 0, p1 + 24 + 24)
			end),
			contentSize = MapResult1
		}, {
			Sorts = ReactModule.createElement(SortsModule, {
				Size = MapResult1,
				sortsController = UseSortsControllerModuleResult,
				frameRef = UseRefCacheResult.Sorts,
				NextSelectionUp = UseRefCacheResult.Filters,
				onHeightChanged = UseBindingResult2_1
			})
		})
	})
end