local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMutedErrorLoggingForCategorySelection = AvatarExperienceFlagsModule.FFlagAXMutedErrorLoggingForCategorySelection
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory)
local NavigationFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavigationFrame)
local PillsNavigationFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.PillsNavigationFrame)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local NavigatedToDeepLinkCatalogFilterModule = require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter)
local NavigateToDeepLinkCatalogFilterThunkModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToDeepLinkCatalogFilterThunk)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlagsModule.FFlagAXFixPrefetchMarketplaceStartupCrash
local CatalogNavigation = RoactModule.PureComponent:extend("CatalogNavigation")
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AXDisableCategoryPillsOnCatalogSearch = game:DefineFastFlag("AXDisableCategoryPillsOnCatalogSearch", false)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local GetFFlagAXEnableCategoryPillsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXLogNilCategoryAndSubcategorySelection = AvatarExperienceFlagsModule.FFlagAXLogNilCategoryAndSubcategorySelection
CatalogNavigation.validateProps = TModule.strictInterface({
	analytics = TModule.table,
	axAnalytics = TModule.table,
	layoutOrderMain = TModule.number,
	layoutOrderSub = TModule.number,
	navHeightMain = TModule.number,
	navHeightSub = TModule.number,
	absoluteSizeChanged = TModule.optional(TModule.callback),
	navBarRef = TModule.table,
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	backToTopSignal = TModule.optional(TModule.table),
	showingTopics = TModule.optional(TModule.boolean),
	fromSearch = TModule.optional(TModule.boolean),
	onCategoryOrSubcategoryChange = TModule.optional(TModule.callback),
	onCategoryOrSubcategoryChangeById = TModule.optional(TModule.callback),
	categories = if FFlagAXCatalogCategoriesSDUI then TModule.optional(TModule.table) else nil,
	selectedCategoryId = TModule.string,
	selectedSubcategoryId = TModule.optional(TModule.string),
	externalNavigationRequest = TModule.table,
	setCategoryAndSubcategory = TModule.callback,
	setSearchCategoryAndSubcategory = TModule.callback,
	applyDeepLinkCatalogFilters = TModule.callback,
	exit3DFullView = TModule.callback,
	navigation = TModule.table
})

function CatalogNavigation.init(p1)
	-- upvalues: GetFFlagAXEnableCategoryPillsModule (copy), FFlagAXLogNilCategoryAndSubcategorySelection (copy), MutedErrorModule (copy)
	function p1.selectCategory(SelectedCategoryIndex)
		-- upvalues: p1 (copy)
		if SelectedCategoryIndex == p1.props.selectedCategoryIndex then return end
		local OnCategoryOrSubcategoryChangeFunction: (any, any) -> () = p1.props.onCategoryOrSubcategoryChange
		
		if OnCategoryOrSubcategoryChangeFunction then
			OnCategoryOrSubcategoryChangeFunction(SelectedCategoryIndex, 0)
		end
		p1:setCategoryAndSubcategory(SelectedCategoryIndex, nil)
	end
	
	function p1:selectSubcategory(SelectedSubcategoryIndex)
		-- upvalues: p1 (copy)
		if SelectedSubcategoryIndex == p1.props.selectedSubcategoryIndex then return end
		local OnCategoryOrSubcategoryChangeFunction: (any, any) -> () = p1.props.onCategoryOrSubcategoryChange
		
		if OnCategoryOrSubcategoryChangeFunction then
			OnCategoryOrSubcategoryChangeFunction(p1.props.selectedCategoryIndex, SelectedSubcategoryIndex)
		end
		p1:setCategoryAndSubcategory(nil, SelectedSubcategoryIndex)
	end
	
	function p1.selectCategoryId(SelectedCategoryId)
		-- upvalues: GetFFlagAXEnableCategoryPillsModule (upval), p1 (copy), FFlagAXLogNilCategoryAndSubcategorySelection (upval), MutedErrorModule (upval)
		if GetFFlagAXEnableCategoryPillsModule() then
			if SelectedCategoryId == p1.props.selectedCategoryId then return end
		elseif SelectedCategoryId == p1.props.selectedCategoryId and p1.props.selectedSubcategoryId == nil then return end
		local OnCategoryOrSubcategoryChangeByIdFunction: (any, any) -> () = p1.props.onCategoryOrSubcategoryChangeById
		
		if OnCategoryOrSubcategoryChangeByIdFunction then
			OnCategoryOrSubcategoryChangeByIdFunction(SelectedCategoryId, nil)
		end
		if FFlagAXLogNilCategoryAndSubcategorySelection and SelectedCategoryId == nil then
			MutedErrorModule("CatalogNavigation:selectCategoryId called with nil categoryId", SelectedCategoryId)
		end
		p1:setCategoryAndSubcategoryById(SelectedCategoryId, nil)
	end
	
	function p1:selectSubcategoryId(SelectedSubcategoryId)
		-- upvalues: p1 (copy), FFlagAXLogNilCategoryAndSubcategorySelection (upval), MutedErrorModule (upval)
		if SelectedSubcategoryId == p1.props.selectedSubcategoryId then return end
		local OnCategoryOrSubcategoryChangeByIdFunction: (any, any) -> () = p1.props.onCategoryOrSubcategoryChangeById
		
		if OnCategoryOrSubcategoryChangeByIdFunction then
			OnCategoryOrSubcategoryChangeByIdFunction(p1.props.selectedCategoryId, SelectedSubcategoryId)
		end
		if FFlagAXLogNilCategoryAndSubcategorySelection and SelectedSubcategoryId == nil then
			MutedErrorModule("CatalogNavigation:selectSubcategoryId called with nil subCategoryId", SelectedSubcategoryId)
		end
		p1:setCategoryAndSubcategoryById(nil, SelectedSubcategoryId)
	end
	
	function p1.onSubNavigationPropsDidUpdate(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.selectedCategoryId ~= p2.selectedCategoryId and p3.current then
			p3.current.CanvasPosition = Vector2.new()
		end
	end
end

function CatalogNavigation.setCategoryAndSubcategoryById(p1, SelectedCategoryId, SelectedSubcategoryId)
	local Analytics = p1.props.analytics
	local AxAnalytics = p1.props.axAnalytics
	local Navigation = p1.props.navigation
	local BackToTopSignal = p1.props.backToTopSignal
	
	if BackToTopSignal and (SelectedCategoryId == nil or SelectedCategoryId == p1.props.selectedCategoryId) and (SelectedSubcategoryId == nil or SelectedSubcategoryId == p1.props.selectedSubcategoryId) then
		BackToTopSignal:fire()
	end
	if p1.props.fromSearch and p1.props.setSearchCategoryAndSubcategory then
		p1.props.setSearchCategoryAndSubcategory(SelectedCategoryId, SelectedSubcategoryId)
	else
		p1.props.setCategoryAndSubcategory(SelectedCategoryId, SelectedSubcategoryId, Analytics)
	end
	p1.props.exit3DFullView(AxAnalytics, Navigation.state.routeName)
end

function CatalogNavigation.processCatalogDeepLink(p1)
	-- upvalues: DeepLinkUtilsModule (copy)
	local ExternalNavigationRequest = p1.props.externalNavigationRequest
	local Params = ExternalNavigationRequest.params or {}
	
	if Params.keyword == nil and DeepLinkUtilsModule.catalogDeepLinkExists(ExternalNavigationRequest) then
		p1.props.applyDeepLinkCatalogFilters((DeepLinkUtilsModule.buildCatalogFilterFromDeepLinkParams(Params)))
	end
end

function CatalogNavigation.didUpdate(p1)
	p1:processCatalogDeepLink()
end

function CatalogNavigation.didMount(p1)
	p1:processCatalogDeepLink()
end

function CatalogNavigation.render(p1)
	-- upvalues: GetCatalogCategoriesFromStoreModule (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogUtilsModule (copy), GetFFlagAXEnableCategoryPillsModule (copy), AXDisableCategoryPillsOnCatalogSearch (copy), RoactModule (copy), PillsNavigationFrameModule (copy), NavigationFrameModule (copy)
	local LayoutOrderMain = p1.props.layoutOrderMain
	local LayoutOrderSub = p1.props.layoutOrderSub
	local NavHeightMain = p1.props.navHeightMain
	local NavHeightSub = p1.props.navHeightSub
	local SelectedCategoryIndex = p1.props.selectedCategoryIndex
	local SelectedSubcategoryIndex = p1.props.selectedSubcategoryIndex
	local SelectedCategoryId = p1.props.selectedCategoryId
	local SelectedSubcategoryId = p1.props.selectedSubcategoryId
	local AbsoluteSizeChanged = p1.props.absoluteSizeChanged
	local ShowingTopics = p1.props.showingTopics
	local SelectCategory = p1.selectCategory
	local SelectSubcategory = p1.selectSubcategory
	local SelectCategoryId = p1.selectCategoryId
	local SelectSubcategoryId = p1.selectSubcategoryId
	local Categories = if FFlagAXCatalogCategoriesSDUI then p1.props.categories else GetCatalogCategoriesFromStoreModule()
	local Subcategories = CatalogUtilsModule.getCategoryId(SelectedCategoryId).Subcategories
	local NavBarRef = p1.props.navBarRef
	
	return if GetFFlagAXEnableCategoryPillsModule() and (not AXDisableCategoryPillsOnCatalogSearch or not p1.props.fromSearch) then RoactModule.createElement(PillsNavigationFrameModule, {
		layoutOrderMain = LayoutOrderMain,
		navHeightMain = NavHeightMain,
		categoryTable = Categories,
		selectedCategoryId = SelectedCategoryId,
		selectCategoryId = SelectCategoryId,
		selectedSubcategoryId = SelectedSubcategoryId,
		selectSubcategoryId = SelectSubcategoryId,
		absoluteSizeChanged = AbsoluteSizeChanged,
		showingTopics = ShowingTopics,
		navigationFrameRef = NavBarRef,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown
	}) else RoactModule.createElement(NavigationFrameModule, {
		shouldUseCategoryId = true,
		layoutOrderMain = LayoutOrderMain,
		navHeightMain = NavHeightMain,
		layoutOrderSub = LayoutOrderSub,
		navHeightSub = NavHeightSub,
		categoryTable = Categories,
		selectedCategoryIndex = SelectedCategoryIndex,
		selectCategory = SelectCategory,
		selectedSubcategoryIndex = SelectedSubcategoryIndex,
		selectSubcategory = SelectSubcategory,
		selectedCategoryId = SelectedCategoryId,
		selectCategoryId = SelectCategoryId,
		selectedSubcategoryId = SelectedSubcategoryId,
		selectSubcategoryId = SelectSubcategoryId,
		subcategoryTable = Subcategories,
		onSubNavigationPropsDidUpdate = p1.onSubNavigationPropsDidUpdate,
		absoluteSizeChanged = AbsoluteSizeChanged,
		showingTopics = ShowingTopics,
		navigationFrameRef = NavBarRef,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown
	})
end

return RoactRoduxModule.connect(function(p1, _)
	return {
		externalNavigationRequest = p1.AvatarExperience.ExternalNavigationRequest or {}
	}
end, function(Callback)
	-- upvalues: SetCategoryAndSubcategoryModule (copy), GetCatalogCategoriesStoreModule (copy), FFlagAXMutedErrorLoggingForCategorySelection (copy), MutedErrorModule (copy), Exit3DFullViewModule (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy), NavigateToDeepLinkCatalogFilterThunkModule (copy), NavigatedToDeepLinkCatalogFilterModule (copy)
	return {
		setCategoryAndSubcategory = function(p1, SelectedCategoryIndex, SelectedSubcategoryIndex)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule (upval)
			Callback(SetCategoryAndSubcategoryModule(p1, SelectedCategoryIndex, SelectedSubcategoryIndex))
		end,
		setSearchCategoryAndSubcategory = function(p1, p2)
			-- upvalues: GetCatalogCategoriesStoreModule (upval), FFlagAXMutedErrorLoggingForCategorySelection (upval), MutedErrorModule (upval)
			if not GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore().changeCategory(p1, p2) then
				if FFlagAXMutedErrorLoggingForCategorySelection then
					MutedErrorModule("[SetSearchCategoryAndSubcategory] Failed to change to category: " .. tostring(p1) .. " and subcategory: " .. tostring(p2))
					
					return
				end
				MutedErrorModule("Failed to select subcategory in SetSearchCategoryAndSubcategory thunk")
			end
		end,
		exit3DFullView = function(p1, p2)
			-- upvalues: Callback (copy), Exit3DFullViewModule (upval)
			Callback(Exit3DFullViewModule(p1, p2))
		end,
		applyDeepLinkCatalogFilters = function(p1)
			-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (upval), Callback (copy), NavigateToDeepLinkCatalogFilterThunkModule (upval), NavigatedToDeepLinkCatalogFilterModule (upval)
			if FFlagAXFixPrefetchMarketplaceStartupCrash then
				Callback(NavigateToDeepLinkCatalogFilterThunkModule(p1))
				
				return
			else
				Callback(NavigatedToDeepLinkCatalogFilterModule(p1))
			end
		end
	}
end)((RoactNavigationModule.withNavigation(CatalogNavigation)))