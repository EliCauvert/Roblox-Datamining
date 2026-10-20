local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local _ = require(CorePackages.Packages.LuauPolyfill)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetRecommendedAssetsModule = require(Modules.AvatarExperience.Catalog.Thunks.GetRecommendedAssets)
local GetRecommendedBundlesModule = require(Modules.AvatarExperience.Catalog.Thunks.GetRecommendedBundles)
local BaseItemCardModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local NavigateDownToAvatarScreenModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SendDetailedCatalogAnalyticsModule = require(Modules.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics)
local MaybePromptForR15UpgradeModule = require(Modules.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local GetFFlagAXHideRecommendationsOnFetchFailureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXMigrateRecommendedItemsGridToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateRecommendedItemsGridToFocusNavigation
local FFlagAXItemDetailsIxpExposure = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local RecommendedItemsGrid = RoactModule.PureComponent:extend("RecommendedItemsGrid")
RecommendedItemsGrid.validateProps = TModule.strictInterface({
	itemId = TModule.string,
	itemType = TModule.string,
	itemSubType = TModule.optional(TModule.string),
	LayoutOrder = TModule.optional(TModule.integer),
	hideItemTitle = TModule.optional(TModule.boolean),
	getItemMetrics = TModule.optional(TModule.callback),
	onActivatedMountAsFullView = TModule.optional(TModule.boolean),
	onFetchRecommendationsFailed = if GetFFlagAXHideRecommendationsOnFetchFailureModule() then TModule.optional(TModule.callback) else nil,
	focusNavigationRef = if FFlagAXMigrateRecommendedItemsGridToFocusNavigation then TModule.union(TModule.callback, TModule.table) else nil,
	recommendedItemSummaries = TModule.optional(TModule.array(TModule.strictInterface({
		id = TModule.string,
		type = TModule.string,
		subType = TModule.string,
		gridInformation = TModule.optional(TModule.table)
	}))),
	resultsListRef = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	itemDetailsPeekViewRefs = TModule.optional(TModule.table),
	getRecommendedAssets = TModule.callback,
	getRecommendedBundles = TModule.callback,
	sendDetailedCatalogAnalytics = TModule.callback,
	maybePromptForR15Upgrade = TModule.callback,
	navigateDownToAvatarScreen = TModule.callback,
	navigation = TModule.table,
	analytics = TModule.table
})
RecommendedItemsGrid.defaultProps = { itemType = ConstantsModule.ItemType.Asset }
local config = {
	[Enum.KeyCode.ButtonR2] = FocusNavigationEventNameEnum.MoveToActionBar
}

local function useRecommendedItemsGridFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.MoveToActionBar] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

function RecommendedItemsGrid.init(p1)
	-- upvalues: WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), FFlagAXEnableHomeTryOnComplexView (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ConstantsModule (copy), FFlagAXTryOnScreenImprovements (copy), AvatarScreen (copy), CatalogConstantsModule (copy), RoactModule (copy), BaseItemCardModule (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (copy), FFlagAXItemDetailsIxpExposure (copy)
	function p1.selectRecommendedItem(p2, p3, _)
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), p1 (copy)
		local Id = p2.id
		local Type = p2.type
		local SubType = p2.subType
		
		local function v42()
			-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval)
			LogOnOverlayClosedFunction("RecommendedItemsGrid", (WasLastInputGamepadFunction()))
		end
		
		local function v43()
			-- upvalues: p1 (upval), Id (copy), Type (copy), SubType (copy), p3 (copy)
			p1.navigateToRecommendedItem(Id, Type, SubType, p3)
		end
		
		local function _()
			-- upvalues: p1 (upval), Id (copy), Type (copy), v42 (copy), v43 (copy)
			return p1.props.maybePromptForR15Upgrade(p1.props.navigation, Id, Type, v42, v43)
		end
		
		if not p1.props.maybePromptForR15Upgrade(p1.props.navigation, Id, Type, v42, v43) then
			p1.navigateToRecommendedItem(Id, Type, SubType, p3)
			
			return
		end
	end
	
	function p1.navigateToRecommendedItem(ItemId, ItemType, ItemSubType, p2)
		-- upvalues: p1 (copy), FFlagAXEnableHomeTryOnComplexView (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ConstantsModule (upval), FFlagAXTryOnScreenImprovements (upval), AvatarScreen (upval), CatalogConstantsModule (upval)
		if not ItemId or not ItemType or not ItemSubType then return end
		local FromProfileParam = p1.props.navigation.getParam("fromProfile")
		local FromHomeParam = if FFlagAXEnableHomeTryOnComplexView then p1.props.navigation.getParam("fromHome") else nil
		local config = {
			mountAnimation = false,
			isFirstItemDetails = false,
			itemId = ItemId,
			itemType = ItemType,
			itemSubType = ItemSubType,
			mountAsFullView = p1.props.onActivatedMountAsFullView == nil or p1.props.onActivatedMountAsFullView,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.resultsListRef,
			fromProfile = FromProfileParam,
			showFullWithNoPeekView = p1.props.navigation.getParam("showFullWithNoPeekView"),
			fromSurface = if FFlagAXFixPurchaseSurfaceLogging and p1.props.navigation then p1.props.navigation.getParam(ConstantsModule.NavigationParams.fromSurface) else nil
		}
		
		if FFlagAXTryOnScreenImprovements then
			if FromProfileParam then
				config.mountAnimation = false
				config.isFirstItemDetails = false
				p1.props.navigateDownToAvatarScreen(AvatarScreen.ItemDetails, ItemType .. ItemId, config)
			elseif p1.props.navigation.getParam("shouldNavigateDown") then
				config.mountAnimation = p1.props.navigation.getParam("mountAnimation")
				config.showRobuxBalance = p1.props.navigation.getParam("showRobuxBalance")
				config.showDropDownTopBar = p1.props.navigation.getParam("showDropDownTopBar")
				config.shouldNavigateDown = p1.props.navigation.getParam("shouldNavigateDown")
				config.hideTab = p1.props.navigation.getParam("hideTab")
				config.simpleView = p1.props.navigation.getParam("simpleView")
				p1.props.navigateDownToAvatarScreen(p1.props.navigation.state.routeName, ItemType .. ItemId, config)
			else
				config.mountAnimation = false
				config.isFirstItemDetails = false
				p1.props.navigation.push(AvatarScreen.ItemDetails, config)
			end
		elseif FFlagAXEnableHomeTryOnComplexView and FromHomeParam then
			p1.props.navigateDownToAvatarScreen(AvatarScreen.TryOnItem, ItemType .. ItemId, {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				fromHome = true,
				itemId = ItemId,
				itemType = ItemType,
				itemSubType = ItemSubType
			})
		elseif FromProfileParam then
			p1.props.navigateDownToAvatarScreen(AvatarScreen.ItemDetails, ItemType .. ItemId, config)
		else
			p1.props.navigation.push(AvatarScreen.ItemDetails, config)
		end
		p1.props.sendDetailedCatalogAnalytics(CatalogConstantsModule.AnalyticsContext.ItemDetailsRecommendedItem, p1.props.analytics.clickCatalogItem, ItemId, ItemType, p2, ConstantsModule.NumRecommendedItems, FromProfileParam)
	end
	
	function p1.renderRecommendedItem(p2, p3, _)
		-- upvalues: RoactModule (upval), BaseItemCardModule (upval), p1 (copy)
		return RoactModule.createElement(BaseItemCardModule, {
			itemId = p2.id,
			itemType = p2.type,
			itemSubType = p2.subtype,
			hideItemTitle = p1.props.hideItemTitle,
			gridInformation = p2.gridInformation,
			onActivated = function()
				-- upvalues: p1 (upval), p2 (copy), p3 (copy)
				p1.selectRecommendedItem(p2, p3)
			end
		})
	end
	
	function p1.fetchRecommended()
		-- upvalues: p1 (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (upval), ConstantsModule (upval), FFlagAXItemDetailsIxpExposure (upval)
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local ItemSubType = p1.props.itemSubType
		
		if not ItemId or not ItemType or not ItemSubType then
			return nil
		end
		if GetFFlagAXHideRecommendationsOnFetchFailureModule() then
			local RecommendedAssets = if ItemType == ConstantsModule.ItemType.Asset then p1.props.getRecommendedAssets(ItemId, ItemSubType, ConstantsModule.NumRecommendedItems, true) else p1.props.getRecommendedBundles(ItemId, ItemSubType, ConstantsModule.NumRecommendedItems, true)
			RecommendedAssets:catch(function()
				-- upvalues: p1 (upval)
				if p1.props.onFetchRecommendationsFailed then
					p1.props.onFetchRecommendationsFailed()
				end
			end)
			
			return if FFlagAXItemDetailsIxpExposure then RecommendedAssets else nil
		end
		if ItemType == ConstantsModule.ItemType.Asset then
			p1.props.getRecommendedAssets(ItemId, ItemSubType, ConstantsModule.NumRecommendedItems, true)
		else
			p1.props.getRecommendedBundles(ItemId, ItemSubType, ConstantsModule.NumRecommendedItems, true)
		end
		return nil
	end
end

function RecommendedItemsGrid.didMount(p1)
	-- upvalues: FFlagAXItemDetailsIxpExposure (copy), AddUnifiedEventLoggingFunction (copy)
	if FFlagAXItemDetailsIxpExposure then
		local Recommended = p1.fetchRecommended()
		
		if Recommended then
			Recommended:andThen(function()
				-- upvalues: p1 (copy), AddUnifiedEventLoggingFunction (upval)
				if p1.props.forwardRef then
					AddUnifiedEventLoggingFunction(p1.props.forwardRef, {})
				end
			end)
			
			return
		end
	else
		p1.fetchRecommended()
	end
end

function RecommendedItemsGrid.didUpdate(p1, p2)
	local ItemSubType = p2.itemSubType
	
	if p1.props.itemSubType and not ItemSubType then
		p1.fetchRecommended()
	end
end

function RecommendedItemsGrid.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactGamepadModule (copy), FFlagAXMigrateRecommendedItemsGridToFocusNavigation (copy), RoactModule (copy), LoadableGridViewModule (copy), FFlagAXItemDetailsIxpExposure (copy), CatalogUtilsModule (copy), ConstantsModule (copy), WithTextSizeOffsetFunction (copy)
	if p1.props.itemId == nil then return end
	local LayoutOrder = p1.props.LayoutOrder
	local RecommendedItemSummaries = p1.props.recommendedItemSummaries
	
	local function v56(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactGamepadModule (upval), FFlagAXMigrateRecommendedItemsGridToFocusNavigation (upval), RoactModule (upval), LayoutOrder (copy), LoadableGridViewModule (upval), RecommendedItemSummaries (copy), FFlagAXItemDetailsIxpExposure (upval), CatalogUtilsModule (upval), ConstantsModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), RoactGamepadModule (upval), FFlagAXMigrateRecommendedItemsGridToFocusNavigation (upval), RoactModule (upval), LayoutOrder (upval), LoadableGridViewModule (upval), RecommendedItemSummaries (upval), FFlagAXItemDetailsIxpExposure (upval), CatalogUtilsModule (upval), p2 (copy), ConstantsModule (upval)
			local _Font = p3.Font
			local ForwardRef = p1.props.forwardRef
			
			return RoactGamepadModule.withFocusController(function(_)
				-- upvalues: FFlagAXMigrateRecommendedItemsGridToFocusNavigation (upval), RoactModule (upval), LayoutOrder (upval), p1 (upval), LoadableGridViewModule (upval), RecommendedItemSummaries (upval), FFlagAXItemDetailsIxpExposure (upval), CatalogUtilsModule (upval), _Font (copy), p2 (upval), ConstantsModule (upval), ForwardRef (copy)
				return if FFlagAXMigrateRecommendedItemsGridToFocusNavigation then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					LayoutOrder = LayoutOrder,
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = p1.props.focusNavigationRef
				}, RoactModule.createElement(LoadableGridViewModule, {
					items = RecommendedItemSummaries,
					renderItem = function(p4, p5, GridInformation)
						-- upvalues: FFlagAXItemDetailsIxpExposure (upval), p1 (upval)
						if FFlagAXItemDetailsIxpExposure then
							p4.gridInformation = GridInformation
						end
						return p1.renderRecommendedItem(p4, p5)
					end,
					getItemHeight = function(p4: number): number
						-- upvalues: CatalogUtilsModule (upval), _Font (upval), p2 (upval)
						return p4 + 10 + CatalogUtilsModule.getRecommendedItemsGridItemTitleHeight(_Font, p2)
					end,
					totalNumItems = ConstantsModule.NumRecommendedItems,
					getItemMetrics = p1.props.getItemMetrics,
					[RoactModule.Ref] = ForwardRef
				})) else RoactModule.createElement(LoadableGridViewModule, {
					items = RecommendedItemSummaries,
					renderItem = function(p4, p5, GridInformation)
						-- upvalues: p1 (upval)
						p4.gridInformation = GridInformation
						
						return p1.renderRecommendedItem(p4, p5)
					end,
					getItemHeight = function(p4: number): number
						-- upvalues: CatalogUtilsModule (upval), _Font (upval), p2 (upval)
						return p4 + 10 + CatalogUtilsModule.getRecommendedItemsGridItemTitleHeight(_Font, p2)
					end,
					LayoutOrder = LayoutOrder,
					totalNumItems = ConstantsModule.NumRecommendedItems,
					getItemMetrics = p1.props.getItemMetrics,
					[RoactModule.Ref] = ForwardRef
				})
			end)
		end)
	end
	
	return WithTextSizeOffsetFunction(function(p2)
		-- upvalues: v56 (copy)
		return v56(p2)
	end)
end

local WithNavigationResult = RoactNavigationModule.withNavigation((RoactServices.connect({ analytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, p2.itemType)
	
	return {
		recommendedItemSummaries = ItemDataModuleResult and ItemDataModuleResult.recommendedItemSummaries
	}
end, function(Callback)
	-- upvalues: GetFFlagAXHideRecommendationsOnFetchFailureModule (copy), GetRecommendedBundlesModule (copy), GetRecommendedAssetsModule (copy), SendDetailedCatalogAnalyticsModule (copy), MaybePromptForR15UpgradeModule (copy), NavigateDownToAvatarScreenModule (copy)
	return {
		getRecommendedAssets = function(p1, p2, p3, p4)
			-- upvalues: GetFFlagAXHideRecommendationsOnFetchFailureModule (upval), Callback (copy), GetRecommendedAssetsModule (upval)
			if GetFFlagAXHideRecommendationsOnFetchFailureModule() then
				return Callback(GetRecommendedAssetsModule(p1, p2, p3, p4))
			else
				Callback(GetRecommendedAssetsModule(p1, p2, p3, p4))
			end
		end,
		getRecommendedBundles = function(p1, p2, p3, p4)
			-- upvalues: GetFFlagAXHideRecommendationsOnFetchFailureModule (upval), Callback (copy), GetRecommendedBundlesModule (upval)
			if GetFFlagAXHideRecommendationsOnFetchFailureModule() then
				return Callback(GetRecommendedBundlesModule(p1, p2, p3, p4))
			else
				Callback(GetRecommendedBundlesModule(p1, p2, p3, p4))
			end
		end,
		sendDetailedCatalogAnalytics = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), SendDetailedCatalogAnalyticsModule (upval)
			Callback(SendDetailedCatalogAnalyticsModule(p1, p2, p3, p4, p5, p6, p7))
		end,
		maybePromptForR15Upgrade = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), MaybePromptForR15UpgradeModule (upval)
			return Callback(MaybePromptForR15UpgradeModule(p1, p2, p3, p4, p5, false))
		end,
		navigateDownToAvatarScreen = function(p1, p2, p3)
			-- upvalues: Callback (copy), NavigateDownToAvatarScreenModule (upval)
			return Callback(NavigateDownToAvatarScreenModule(p1, p2, p3))
		end
	}
end)(RecommendedItemsGrid)))))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: FFlagAXMigrateRecommendedItemsGridToFocusNavigation (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), useRecommendedItemsGridFocusNavigationBindings (copy), RoactModule (copy), WithNavigationResult (ref), CryoModule (copy)
	local v1 = nil
	
	if FFlagAXMigrateRecommendedItemsGridToFocusNavigation then
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		v1 = useRecommendedItemsGridFocusNavigationBindings(nil, (ReactModule.useCallback(function()
			-- upvalues: UseFocusGuiObjectResult (copy), p1 (copy)
			if UseFocusGuiObjectResult and p1.NextSelectionDown and p1.NextSelectionDown.current then
				UseFocusGuiObjectResult(p1.NextSelectionDown.current)
			end
		end, { p1.NextSelectionDown })))
	end
	return RoactModule.createElement(WithNavigationResult, CryoModule.Dictionary.join(p1, {
		forwardRef = ForwardRef,
		focusNavigationRef = if FFlagAXMigrateRecommendedItemsGridToFocusNavigation then v1 else nil
	}))
end)