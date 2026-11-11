local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local CreateInventoryStoresFromCategoriesModule = require(Modules.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CreateSlotBasedEditorStoreFunction = AvatarExperienceSlotBasedEditorModule.Stores.createSlotBasedEditorStore
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local CreateSortAndFiltersStore = AvatarExperienceSlotBasedEditorModule.Stores.createSortAndFiltersStore
local ScreenLayout = AvatarExperienceSlotBasedEditorModule.Enums.ScreenLayout
local ItemView = AvatarExperienceSlotBasedEditorModule.Enums.ItemView
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local NavigationParams = AvatarExperienceSlotBasedEditorModule.Enums.NavigationParams
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local FFlagAXFixCatalogSearchRedirectModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect)
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext

local function _(p1)
	-- upvalues: ItemView (copy), ScreenLayout (copy)
	local ItemView1 = p1.itemView
	
	return if p1.isPortrait then if ItemView1 == ItemView.Off then ScreenLayout.PortraitSlots else ScreenLayout.PortraitItems else ScreenLayout.LandscapeSplit
end

return function()
	-- upvalues: UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), DeviceOrientationMode (copy), NavigationParams (copy), ItemView (copy), ScreenLayout (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), ReactModule (copy), CreateInventoryStoresFromCategoriesModule (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), CreateSortAndFiltersStore (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), FFlagAXFixCatalogSearchRedirectModule (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy), SetCategoryAndSubcategoryModule (copy), Exit3DFullViewModule (copy), AvatarScreen (copy), NavigateToSearchModule (copy), SetFullViewModule (copy), FullView (copy), UseStoreFunction (copy), CreateSlotBasedEditorStoreFunction (copy), FFlagAXAvatarEditorStoresContext (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		-- upvalues: DeviceOrientationMode (upval)
		return p1.DeviceOrientation == DeviceOrientationMode.Portrait
	end)
	local Param = UseNavigationResult.getParam(NavigationParams.itemView) or (UseSelectorResult and ItemView.SlotItems or not UseSelectorResult and ItemView.Off)
	local config = { isPortrait = UseSelectorResult, itemView = Param }
	local ItemView1 = config.itemView
	local PortraitSlots = if config.isPortrait then if ItemView1 == ItemView.Off then ScreenLayout.PortraitSlots else ScreenLayout.PortraitItems else ScreenLayout.LandscapeSplit
	local UseMemoResult = if GetFFlagAXEnableNewInventoryItemsListModule() then ReactModule.useMemo(CreateInventoryStoresFromCategoriesModule, {}) else nil
	local UseMemoResult1 = if GetFFlagAXEnableInventorySortsAndFiltersModule() then ReactModule.useMemo(CreateSortAndFiltersStore, {}) else nil
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local Param1 = UseNavigationResult.getParam(NavigationParams.fromScreen)
	local Param2 = if FFlagAXFixCatalogSearchRedirectModule then UseNavigationResult.getParam(NavigationParams.params) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetAvatarEditorCategoriesModule (upval), AvatarEditorCategories (upval), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult1 (copy), Exit3DFullViewModule (upval), UseRoactServiceModuleResult (copy), UseNavigationResult (copy)
		for _, value in GetAvatarEditorCategoriesModule() do
			if value.NavigationKey == AvatarEditorCategories.All then
				UseDispatchResult(SetCategoryAndSubcategoryModule(value.Category, nil, UseRoactServiceModuleResult1))
				break
			end
		end
		UseDispatchResult(Exit3DFullViewModule(UseRoactServiceModuleResult, UseNavigationResult.state.routeName))
	end, {
		UseDispatchResult,
		UseRoactServiceModuleResult,
		UseNavigationResult.state.routeName,
		UseRoactServiceModuleResult1
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy), NavigationParams (upval), ItemView (upval), UseResult (copy), FFlagAXFixCatalogSearchRedirectModule (upval), Param1 (copy), Param2 (copy), UseDispatchResult (copy), NavigateToSearchModule (upval), SetFullViewModule (upval), UseRoactServiceModuleResult (copy), FullView (upval)
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails
		UseNavigationResult.navigate(AvatarScreen.AvatarEditor, { [NavigationParams.itemView] = ItemView.Off })
		
		if IsNameMatch then
			UseNavigationResult.navigate(AvatarScreen.LookDetails)
		end
		UseResult()
		
		if FFlagAXFixCatalogSearchRedirectModule and Param1 == AvatarScreen.CatalogSearch and Param1 ~= UseAvatarRouteResult.opaque.name then
			if Param2 and Param2.searchParams then
				UseDispatchResult(NavigateToSearchModule(UseNavigationResult, {
					isKeywordSuggestionEnabled = true,
					searchKeyword = Param2.searchParams.searchKeyword
				}))
			end
		elseif Param1 and Param1 ~= UseAvatarRouteResult.opaque.name then
			UseNavigationResult.navigate(Param1)
		end
		UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult, UseNavigationResult.state.routeName, FullView.None))
	end, { UseResult, UseNavigationResult, Param1 })
	local UseStoreResult = UseStoreFunction()
	
	return {
		handleExitPortraitItems = UseResult1,
		itemView = Param,
		signalStore = ReactModule.useMemo(function()
			-- upvalues: CreateSlotBasedEditorStoreFunction (upval), UseStoreResult (copy)
			return CreateSlotBasedEditorStoreFunction(UseStoreResult)
		end, { UseStoreResult }),
		screenLayout = PortraitSlots,
		categoryInventoryStores = if GetFFlagAXEnableNewInventoryItemsListModule() and not FFlagAXAvatarEditorStoresContext then UseMemoResult else nil,
		sortAndFiltersStore = if GetFFlagAXEnableInventorySortsAndFiltersModule() and not FFlagAXAvatarEditorStoresContext then UseMemoResult1 else nil
	}
end