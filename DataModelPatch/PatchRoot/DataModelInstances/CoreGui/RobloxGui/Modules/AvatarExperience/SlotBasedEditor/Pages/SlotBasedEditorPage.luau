local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusOnMountFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useFocusOnMount
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local SetCategoryAndSubcategoryModule1 = require(Modules.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local NormalizeAvatarModule = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CreateInventoryStoresFromCategoriesModule = require(Modules.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories)
local CreateSortAndFiltersStore = AvatarExperienceSlotBasedEditorModule.Stores.createSortAndFiltersStore
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSlotBasedEditorContextValueModule = require(script.Parent.useSlotBasedEditorContextValue)
local AvatarEditorTopBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local AvatarNavigationItemsViewModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView)
local SlotsContainerModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer)
local UndoRedoBar = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar).UndoRedoBar
local SaveButton = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Components.SaveButton
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local SlotBasedEditorContext = AvatarExperienceSlotBasedEditorModule.Context.SlotBasedEditorContext
local ScreenLayout = AvatarExperienceSlotBasedEditorModule.Enums.ScreenLayout
local ItemView = AvatarExperienceSlotBasedEditorModule.Enums.ItemView
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local NavigationParams = AvatarExperienceSlotBasedEditorModule.Enums.NavigationParams
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local GetFlagAXEnableInitialTopLevelPageCounterModule = require(Modules.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter)
local FFlagAXCustomizeOverhaulEditorExposureModule = require(Modules.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure)
local FFlagAXModerationFeatureExposureModule = require(Modules.AvatarExperience.Flags.FFlagAXModerationFeatureExposure)
local GetFStringAXCatalogAndEditorExposureLayerNameModule = require(Modules.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName)
local FFlagAXCatalogAndEditorExposureUseFStringLayerModule = require(Modules.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer)
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext
local FFlagAXFixCatalogSearchRedirectModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXSlotsPeekViewScrollFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix
local FFlagAXResetAvatarButton = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXSlotsDesktopRedesign = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign
local FFlagAXEnableEnhancedAvatarHeadsFtux = AvatarExperienceFlagsModule.FFlagAXEnableEnhancedAvatarHeadsFtux
local AXModerationFeatureLayer = game:DefineFastString("AXModerationFeatureLayer", "AvatarExperience.UA.CustomizeView")
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXEnableEditorCategoryDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink
local FFlagAXFixEditorCategoryRenavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixEditorCategoryRenavigation
local FFlagAXMigrateSlotsSignals = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateSlotsSignals
local FFlagAXSlotsDesignUpdatesExposureLogging = AvatarExperienceFlagsModule.FFlagAXSlotsDesignUpdatesExposureLogging
local FStringAXSlotsDesignUpdatesExposureLayer = AvatarExperienceFlagsModule.FStringAXSlotsDesignUpdatesExposureLayer
local AXEditorBackendLayerExposure = game:DefineFastFlag("AXEditorBackendLayerExposure", false)
local AXEditorBackendLayerName = game:DefineFastString("AXEditorBackendLayerName", "AvatarMarketplace.Editor")
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local UseEnhancedAvatarHeadsFtuxFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useEnhancedAvatarHeadsFtux

local function _(NavigationKey, SlotItems)
	-- upvalues: ItemView (copy), GetAvatarEditorCategoriesModule (copy)
	if SlotItems == ItemView.SlotItems then
		for _, value in GetAvatarEditorCategoriesModule() do
			if value.NavigationKey == NavigationKey then
				return value.Title or "Feature.Avatar.Label.Title.MyInventory"
			end
		end
	end
	return "Feature.Avatar.Label.Title.MyInventory"
end

local _ = function(p1)
	-- upvalues: ItemView (copy), ScreenLayout (copy)
	local ItemView1 = p1.itemView
	
	return if p1.isPortrait then if ItemView1 == ItemView.Off then ScreenLayout.PortraitSlots else ScreenLayout.PortraitItems else ScreenLayout.LandscapeSplit
end

local function v74(p1): boolean
	-- upvalues: CryoModule (copy)
	return not CryoModule.isEmpty(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end

local _ = function(p1, p2)
	return if p2 and p1.Subcategories and p1.Subcategories[p2] then p1.Subcategories[p2].NavigationKey else nil
end

local _ = function(List, EditorSubcategory)
	for i, value in List do
		if value.editorSubcategory == EditorSubcategory then
			return i
		end
	end
	return nil
end

local v1 = if FFlagAXCustomizeMakeupSupport then function(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.category
end else nil

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseTokensFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), FFlagAXMigrateSlotsSignals (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), CreateInventoryStoresFromCategoriesModule (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), CreateSortAndFiltersStore (copy), FFlagAXSlotsPeekViewScrollFix (copy), UseSelectorFunction (copy), v74 (copy), SelectIsFullViewModule (copy), DeviceOrientationMode (copy), FullView (copy), NavigationParams (copy), ItemView (copy), FFlagAXFixCatalogSearchRedirectModule (copy), UseSlotBasedEditorContextValueModule (copy), SignalsReactModule (copy), FFlagAXSlotsDesktopRedesign (copy), AvatarExperienceSlotBasedEditorModule (copy), UseLocalizationFunction (copy), GetAvatarEditorCategoriesModule (copy), ScreenLayout (copy), FFlagAXCustomizeMakeupSupport (copy), v1 (copy), FFlagAXEnableEditorCategoryDeepLink (copy), FFlagAXRootSlotBasedEditorFlag (copy), SetCategoryAndSubcategoryModule1 (copy), SetCategoryAndSubcategoryModule (copy), FFlagAXFixEditorCategoryRenavigation (copy), RoactNavigationModule (copy), AvatarEditorCategories (copy), Exit3DFullViewModule (copy), AvatarScreen (copy), NavigateToSearchModule (copy), SetFullViewModule (copy), AvatarEditorTopBarModule (copy), FFlagAXResetAvatarButton (copy), CatalogConstantsModule (copy), FoundationModule (copy), UndoRedoBar (copy), SaveButton (copy), SlotsContainerModule (copy), GetFlagAXEnableInitialTopLevelPageCounterModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXEnableEnhancedAvatarHeadsFtux (copy), UseEnhancedAvatarHeadsFtuxFunction (copy), FFlagAXCustomizeOverhaulEditorExposureModule (copy), IxpUtilsModule (copy), FFlagAXCatalogAndEditorExposureUseFStringLayerModule (copy), GetFStringAXCatalogAndEditorExposureLayerNameModule (copy), AppUserLayers (copy), FFlagAXModerationFeatureExposureModule (copy), AXModerationFeatureLayer (copy), AXEditorBackendLayerExposure (copy), AXEditorBackendLayerName (copy), NormalizeAvatarModule (copy), FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), UseFocusOnMountFunction (copy), Focusable (copy), SlotBasedEditorContext (copy), FFlagAXAvatarEditorStoresContext (copy), AvatarExperienceViewModule (copy), AvatarNavigationItemsViewModule (copy), FFlagAXSlotsDesignUpdatesExposureLogging (copy), OnFocusExperimentExposureLoggerModule (copy), FStringAXSlotsDesignUpdatesExposureLayer (copy)
	local UseTokensResult = UseTokensFunction()
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseRefResult = ReactModule.useRef(nil)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = if FFlagAXMigrateSlotsSignals then nil else UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseMemoResult = if FFlagAXMigrateSlotsSignals or not GetFFlagAXEnableNewInventoryItemsListModule() then nil else ReactModule.useMemo(CreateInventoryStoresFromCategoriesModule, {})
	local UseMemoResult1 = if FFlagAXMigrateSlotsSignals or not GetFFlagAXEnableInventorySortsAndFiltersModule() then nil else ReactModule.useMemo(CreateSortAndFiltersStore, {})
	local v2 = nil
	local v3 = nil
	
	if FFlagAXSlotsPeekViewScrollFix then
		v2, v90 = ReactModule.useBinding(false)
	end
	local UseSelectorResult = UseSelectorFunction(v74)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy)
		return SelectIsFullViewModule(p1, UseAvatarRouteResult.opaque.name)
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1): boolean
		-- upvalues: DeviceOrientationMode (upval)
		return p1.DeviceOrientation == DeviceOrientationMode.Portrait
	end)
	local IsUseSelectorResultMatch = UseSelectorResult1 == FullView.SceneFullView
	local IsUseSelectorResultMatch1 = UseSelectorResult1 == FullView.UIFullView
	local Param = UseNavigationResult.getParam(NavigationParams.itemView) or (UseSelectorResult2 and ItemView.SlotItems or not UseSelectorResult2 and ItemView.Off)
	local Param1 = if FFlagAXMigrateSlotsSignals then nil else UseNavigationResult.getParam(NavigationParams.fromScreen)
	local Param2 = if FFlagAXMigrateSlotsSignals or not FFlagAXFixCatalogSearchRedirectModule then nil else UseNavigationResult.getParam(NavigationParams.params)
	local UseSignalStateResult = nil
	local SetSlotCategoryFunction = nil
	local SlotIndex = nil
	local SetSlotIndexFunction = nil
	local UseSlotBasedEditorContextValueModuleResult = if FFlagAXMigrateSlotsSignals then UseSlotBasedEditorContextValueModule() else nil
	
	if FFlagAXMigrateSlotsSignals then
		UseSignalStateResult = SignalsReactModule.useSignalState(UseSlotBasedEditorContextValueModuleResult.signalStore.getSlotCategory)
		SetSlotCategoryFunction = UseSlotBasedEditorContextValueModuleResult.signalStore.setSlotCategory
		SetSlotIndexFunction = UseSlotBasedEditorContextValueModuleResult.signalStore.setSlotIndex
	else
		UseSignalStateResult, SetSlotCategoryFunction = ReactModule.useState(if FFlagAXSlotsDesktopRedesign then if UseSelectorResult2 then AvatarExperienceSlotBasedEditorModule.Enums.Categories.Avatars else AvatarExperienceSlotBasedEditorModule.Enums.Categories.All elseif UseSelectorResult2 then AvatarExperienceSlotBasedEditorModule.Enums.Categories.Avatars else AvatarExperienceSlotBasedEditorModule.Enums.Categories.Body)
		SlotIndex, SetSlotIndexFunction = ReactModule.useState(1)
	end
	local t = {}
	local NavigationKey = UseSignalStateResult
	local Title = nil
	repeat
		if Param == ItemView.SlotItems then
			for _, value in GetAvatarEditorCategoriesModule() do
				if value.NavigationKey == NavigationKey then
					Title = value.Title or "Feature.Avatar.Label.Title.MyInventory"
					break
				end
			end
		end
		Title = "Feature.Avatar.Label.Title.MyInventory"
	until true
	t.itemScreenTitle = Title
	local UseLocalizationResult = UseLocalizationFunction(t)
	local ScreenLayout1 = nil
	
	if FFlagAXMigrateSlotsSignals then
		ScreenLayout1 = UseSlotBasedEditorContextValueModuleResult.screenLayout
	else
		local config = { isPortrait = UseSelectorResult2, itemView = Param }
		local ItemView1 = config.itemView
		ScreenLayout1 = if config.isPortrait then if ItemView1 == ItemView.Off then ScreenLayout.PortraitSlots else ScreenLayout.PortraitItems else ScreenLayout.LandscapeSplit
	end
	local UseSelectorResult3 = if FFlagAXCustomizeMakeupSupport then UseSelectorFunction(v1) else nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagAXEnableEditorCategoryDeepLink (upval), UseNavigationResult (copy), NavigationParams (upval), FFlagAXRootSlotBasedEditorFlag (upval), UseSelectorResult2 (copy), FFlagAXCustomizeMakeupSupport (upval), UseSignalStateResult (ref), AvatarExperienceSlotBasedEditorModule (upval), UseSelectorResult3 (copy), SetSlotCategoryFunction (ref), UseDispatchResult (copy), SetCategoryAndSubcategoryModule1 (upval)
		if FFlagAXEnableEditorCategoryDeepLink and UseNavigationResult.getParam(NavigationParams.category) ~= nil then return end
		if FFlagAXRootSlotBasedEditorFlag and UseSelectorResult2 and (not FFlagAXCustomizeMakeupSupport or UseSignalStateResult == AvatarExperienceSlotBasedEditorModule.Enums.Categories.All or UseSelectorResult3 == 1) then
			if FFlagAXCustomizeMakeupSupport then
				SetSlotCategoryFunction(AvatarExperienceSlotBasedEditorModule.Enums.Categories.Avatars)
			end
			UseDispatchResult(SetCategoryAndSubcategoryModule1(2, nil))
		end
	end, if FFlagAXCustomizeMakeupSupport then {
		UseSelectorResult2,
		UseSignalStateResult,
		UseSelectorResult3
	} else { UseSelectorResult2 })
	
	if FFlagAXEnableEditorCategoryDeepLink then
		local UseResult = ReactModule.useCallback(function(p1, p2)
			-- upvalues: GetAvatarEditorCategoriesModule (upval), SetSlotCategoryFunction (ref), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult1 (copy), AvatarExperienceSlotBasedEditorModule (upval), SetSlotIndexFunction (ref)
			local AvatarEditorCategoriesModuleEntry = p1 and GetAvatarEditorCategoriesModule()[p1]
			
			if not AvatarEditorCategoriesModuleEntry or not AvatarEditorCategoriesModuleEntry.NavigationKey then return end
			SetSlotCategoryFunction(AvatarEditorCategoriesModuleEntry.NavigationKey)
			UseDispatchResult(SetCategoryAndSubcategoryModule(p1, p2, UseRoactServiceModuleResult1))
			local NavigationKey = if p2 and AvatarEditorCategoriesModuleEntry.Subcategories and AvatarEditorCategoriesModuleEntry.Subcategories[p2] then AvatarEditorCategoriesModuleEntry.Subcategories[p2].NavigationKey else nil
			
			if NavigationKey then
				local SlotEditorCategory = AvatarExperienceSlotBasedEditorModule.Constants.SlotEditorCategories[AvatarEditorCategoriesModuleEntry.NavigationKey]
				
				if SlotEditorCategory and SlotEditorCategory.slots then
					local v4 = nil
					
					for i, slot in SlotEditorCategory.slots do
						if slot.editorSubcategory == NavigationKey then
							v4 = i
							break
						end
					end
					if v4 then
						SetSlotIndexFunction(v4)
					end
				end
			end
		end, { UseDispatchResult, UseRoactServiceModuleResult1 })
		local Param3 = UseNavigationResult.getParam(NavigationParams.category)
		local Param4 = UseNavigationResult.getParam(NavigationParams.subcategory)
		ReactModule.useEffect(function()
			-- upvalues: Param3 (copy), UseResult (copy), Param4 (copy), FFlagAXFixEditorCategoryRenavigation (upval), UseNavigationResult (copy), NavigationParams (upval), RoactNavigationModule (upval)
			if Param3 == nil then return end
			UseResult(Param3, Param4)
			
			if FFlagAXFixEditorCategoryRenavigation then
				UseNavigationResult.setParams({
					[NavigationParams.category] = RoactNavigationModule.None,
					[NavigationParams.subcategory] = RoactNavigationModule.None
				})
			end
		end, { Param3, Param4, UseResult })
	end
	local UseResult1 = if FFlagAXMigrateSlotsSignals then nil else ReactModule.useCallback(function()
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
	local UseResult2 = if FFlagAXMigrateSlotsSignals then nil else ReactModule.useCallback(function()
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy), NavigationParams (upval), ItemView (upval), UseResult1 (copy), FFlagAXFixCatalogSearchRedirectModule (upval), Param1 (copy), Param2 (copy), UseDispatchResult (copy), NavigateToSearchModule (upval), SetFullViewModule (upval), UseRoactServiceModuleResult (copy), FullView (upval)
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails
		UseNavigationResult.navigate(AvatarScreen.AvatarEditor, { [NavigationParams.itemView] = ItemView.Off })
		
		if IsNameMatch then
			UseNavigationResult.navigate(AvatarScreen.LookDetails)
		end
		UseResult1()
		
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
	end, { UseResult1, UseNavigationResult, Param1 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), AvatarEditorTopBarModule (upval), UseNavigationResult (copy), UseAvatarRouteResult (copy)
		return ReactModule.createElement(AvatarEditorTopBarModule, {
			navigation = UseNavigationResult,
			avatarRoute = UseAvatarRouteResult
		})
	end, {
		UseNavigationResult, UseAvatarRouteResult, ScreenLayout1, UseSignalStateResult,
		UseLocalizationResult, Param
	})
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: FFlagAXResetAvatarButton (upval), UseSelectorResult (copy), CatalogConstantsModule (upval), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), UndoRedoBar (upval), SaveButton (upval), SlotsContainerModule (upval)
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col anchor-bottom-left auto-xy size-full-0",
			ZIndex = 2,
			Position = UDim2.new(0, 0, 1, UseTokensResult.Radius.Medium),
			padding = {
				bottom = UDim.new(0, if UseSelectorResult then CatalogConstantsModule.ActionBar.ActionBarHeight + CatalogConstantsModule.ActionBar.ActionBarPadding else 0)
			}
		}, {
			SceneButtons = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy size-full-0",
				padding = {
					left = UDim.new(0, UseTokensResult.Size.Size_500),
					bottom = UDim.new(0, UseTokensResult.Size.Size_400),
					right = UDim.new(0, UseTokensResult.Size.Size_500)
				}
			}, {
				BottomLeftButtons = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", Position = UDim2.fromScale(0, 0) }, {
					UndoRedoBar = not FFlagAXResetAvatarButton and (p1.showUndoRedo == nil or p1.showUndoRedo) and ReactModule.createElement(UndoRedoBar)
				}),
				BottomRightButtons = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy anchor-top-right",
					Position = UDim2.fromScale(1, 0)
				}, {
					SaveButton = p1.showSaveButton ~= nil and p1.showSaveButton and ReactModule.createElement(SaveButton)
				})
			}),
			SlotsContainer = ReactModule.createElement(SlotsContainerModule)
		})
	end, { UseSelectorResult })
	
	if GetFlagAXEnableInitialTopLevelPageCounterModule() then
		ReactModule.useEffect(function()
			-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval)
			SendAXCounterV2Function(ConstantsModule.Counter.TopLevelPageInitialView.SlotBasedEditor)
		end, {})
	end
	if FFlagAXEnableEnhancedAvatarHeadsFtux then
		UseEnhancedAvatarHeadsFtuxFunction()
	end
	if FFlagAXCustomizeOverhaulEditorExposureModule then
		ReactModule.useEffect(function()
			-- upvalues: IxpUtilsModule (upval), FFlagAXCatalogAndEditorExposureUseFStringLayerModule (upval), GetFStringAXCatalogAndEditorExposureLayerNameModule (upval), AppUserLayers (upval)
			IxpUtilsModule.logLayerExposure(if FFlagAXCatalogAndEditorExposureUseFStringLayerModule then GetFStringAXCatalogAndEditorExposureLayerNameModule() else AppUserLayers.AvatarExperienceUAAllViews)
		end, {})
	end
	if FFlagAXModerationFeatureExposureModule then
		ReactModule.useEffect(function()
			-- upvalues: IxpUtilsModule (upval), AXModerationFeatureLayer (upval)
			IxpUtilsModule.logLayerExposure(AXModerationFeatureLayer)
		end, {})
	end
	if AXEditorBackendLayerExposure then
		ReactModule.useEffect(function()
			-- upvalues: IxpUtilsModule (upval), AXEditorBackendLayerName (upval)
			IxpUtilsModule.logLayerExposure(AXEditorBackendLayerName)
		end, {})
	end
	if FFlagAXCustomizeMakeupSupport then
		ReactModule.useEffect(function()
			-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseDispatchResult (copy), NormalizeAvatarModule (upval)
			if UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor then
				UseDispatchResult(NormalizeAvatarModule())
			end
		end, { UseAvatarRouteResult.opaque.name })
	end
	local UseFocusOnMountResult = nil
	local UseMostRecentOrDefaultFocusBehaviorResult2 = nil
	
	if FFlagLuaAppsDefaultSelection then
		local UseMostRecentOrDefaultFocusBehaviorResult
		UseMostRecentOrDefaultFocusBehaviorResult, UseMostRecentOrDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
		UseFocusOnMountResult = UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult)
	end
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		ref = if FFlagLuaAppsDefaultSelection then UseMostRecentOrDefaultFocusBehaviorResult2 else nil
	}, {
		SlotBasedEditorContext = ReactModule.createElement(SlotBasedEditorContext.Provider, {
			value = if FFlagAXMigrateSlotsSignals then UseSlotBasedEditorContextValueModuleResult else {
				handleExitPortraitItems = UseResult2,
				itemView = Param,
				slotCategory = UseSignalStateResult,
				setSlotCategory = SetSlotCategoryFunction,
				screenLayout = ScreenLayout1,
				slotIndex = SlotIndex,
				setSlotIndex = SetSlotIndexFunction,
				categoryInventoryStores = if GetFFlagAXEnableNewInventoryItemsListModule() and not FFlagAXAvatarEditorStoresContext then UseMemoResult else nil,
				sortAndFiltersStore = if GetFFlagAXEnableInventorySortsAndFiltersModule() and not FFlagAXAvatarEditorStoresContext then UseMemoResult1 else nil
			}
		}, {
			AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
				bottomBarEnabled = false,
				showControlBar = true,
				showRobuxBalance = true,
				showUndoRedo = ScreenLayout1 == ScreenLayout.PortraitItems or ScreenLayout1 == ScreenLayout.LandscapeSplit,
				showSaveButton = ScreenLayout1 == ScreenLayout.PortraitItems,
				allowAdaptiveScrolling = ScreenLayout1 ~= ScreenLayout.PortraitSlots,
				isSceneFullView = IsUseSelectorResultMatch,
				isUIFullView = IsUseSelectorResultMatch1,
				topBar = UseMemoResult2,
				multiTryOnBottomBarRef = UseRefResult,
				disableScrollViewBindings = if FFlagAXSlotsPeekViewScrollFix then v2 else nil,
				sceneUi = if FFlagAXSlotsDesktopRedesign or (ScreenLayout1 ~= ScreenLayout.LandscapeSplit or IsUseSelectorResultMatch) then nil else UseResult3({ showUndoRedo = false })
			}, {
				Inventory = if ScreenLayout1 == ScreenLayout.LandscapeSplit then ReactModule.createElement(AvatarNavigationItemsViewModule, {
					updateDisableScrollView = if FFlagAXSlotsPeekViewScrollFix then v3 else nil,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then UseFocusOnMountResult else nil
				}) else ScreenLayout1 == ScreenLayout.PortraitItems and ReactModule.createElement(AvatarNavigationItemsViewModule, {
					updateDisableScrollView = if FFlagAXSlotsPeekViewScrollFix then v3 else nil,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then UseFocusOnMountResult else nil
				}),
				SlotsContainer = if ScreenLayout1 == ScreenLayout.PortraitSlots and not IsUseSelectorResultMatch then UseResult3({}) else nil
			})
		}),
		OnFocusExperimentExposureLogger = if FFlagAXSlotsDesignUpdatesExposureLogging then ReactModule.createElement(OnFocusExperimentExposureLoggerModule, {
			ixpTests = {},
			flagIXPTestLayers = if FFlagAXSlotsDesignUpdatesExposureLogging then {
				if FFlagAXSlotsDesignUpdatesExposureLogging then FStringAXSlotsDesignUpdatesExposureLayer else nil
			} else nil
		}) else nil
	})
end))