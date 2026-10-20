local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local WidgetListItem = AvatarExperienceUIKitModule.WidgetComponents.WidgetListItem
local Grid = AvatarExperienceUIKitModule.GridComponents.Grid
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local FFlagAXSubscriptionRefetchEvictStores = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchEvictStores
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.LuaApp.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogItemCardContainerModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local _ = require(Modules.AvatarExperience.Common.Components.WidgetList.Types)
local GetFooterVisibilityFromItemFootersFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters
local UseCatalogCategoryImpressionsInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local AXCatalogPerfReduxReductionIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return (ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: RoactGamepadModule (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UseDispatchFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), UseCatalogCategoryImpressionsInfoModule (copy), CatalogConstantsModule (copy), AXCatalogPerfReduxReductionIXPModule (copy), IxpUtilsModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), ReactModule (copy), CatalogTilesLatencyTrackerModule (copy), UtilsModule (copy), GetFooterVisibilityFromItemFootersFunction (copy), UseTokensFunction (copy), CatalogItemCardContainerModule (copy), FFlagAXSubscriptionRefetchEvictStores (copy), Grid (copy), WidgetListItem (copy), WidgetLayout (copy), WidgetHeader (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Gui (copy)
		return p1.Search.SearchesInCatalog[Gui.searchUuid]
	end, GetUseSelectorDeepEqualsFunction())
	local UseDispatchResult = UseDispatchFunction()
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local EntryRowIndex = Gui.entryRowIndex
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.AvatarExperience.Common.Widgets.HydratedWidgetData.Look
	end, GetUseSelectorDeepEqualsFunction())
	local Row = Gui.row
	local ItemsPerRow = Gui.itemsPerRow
	local Key: string = UseNavigationResult.state.key
	local Text = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else "")
	local Keyword = UseSelectorResult and UseSelectorResult.keyword
	local ImpressionsCategory = nil
	local ImpressionsSubcategory = nil
	local ImpressionsTaxonomyId = nil
	local UseCatalogCategoryImpressionsInfoModuleResult = if FFlagAXCatalogCategoriesStoreImprovePerf then UseCatalogCategoryImpressionsInfoModule(Gui.fromSearch, Gui.selectedCategory, Gui.selectedSubcategory, Gui.selectedCategoryInfo) else UseCatalogCategoryImpressionsInfoModule(Gui.fromSearch)
	ImpressionsCategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsCategory
	ImpressionsSubcategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsSubcategory
	ImpressionsTaxonomyId = UseCatalogCategoryImpressionsInfoModuleResult.impressionsTaxonomyId
	local CatalogSearch = if Gui.fromSearch then CatalogConstantsModule.AnalyticsContext.CatalogSearch else CatalogConstantsModule.AnalyticsContext.Catalog
	local TestVariable = if AXCatalogPerfReduxReductionIXPModule.isEnabled() then IxpUtilsModule.readTestVariable(AXCatalogPerfReduxReductionIXPModule.EnabledForUser) else nil
	local UseResult = if GetFFlagEnableCatalogTileLoadingLatencyModule() then ReactModule.useCallback(function(p1)
		-- upvalues: TestVariable (copy), Gui (copy), UseDispatchResult (copy), CatalogTilesLatencyTrackerModule (upval)
		if p1 then
			if TestVariable and Gui.onThumbnailLoaded then
				Gui.onThumbnailLoaded(Gui.searchUuid, p1)
				
				return
			end
			UseDispatchResult(CatalogTilesLatencyTrackerModule.AppendThumbnail(Gui.searchUuid, p1))
		end
	end, {
		Gui.searchUuid,
		if TestVariable then Gui.onThumbnailLoaded else nil
	}) else nil
	local CreatorNameTileFooterEnabled = UtilsModule.getCreatorNameTileFooterEnabled(Gui.widgetConfiguration)
	local FooterVisibilityFromItemFooters = GetFooterVisibilityFromItemFootersFunction(if Gui.template then Gui.template.itemFooters else nil)
	local UseTokensResult = UseTokensFunction()
	local UseResult1 = ReactModule.useCallback(function(X)
		-- upvalues: Gui (copy)
		if Gui.gamepadNavigationFocusPos:getValue().Y ~= Gui.entryRowIndex then return end
		Gui.setGamepadNavigationFocusPos(Vector2.new(X, Gui.entryRowIndex))
		
		if Gui.onFocusGained then
			Gui.onFocusGained()
		end
	end, {
		Gui.gamepadNavigationFocusPos,
		Gui.setGamepadNavigationFocusPos,
		Gui.entryRowIndex,
		Gui.onFocusGained
	})
	
	return ReactModule.createElement(WidgetListItem, {
		horizontalMargin = 0,
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionRight = Gui.NextSelectionRight,
		onFocusGained = if FFlagAXMigrateAXToGlobalAutofocus then nil else function()
			-- upvalues: Gui (copy), UseRefCacheResult (copy), Row (copy), UseFocusControllerResult (copy)
			Gui.setGamepadNavigationFocusPos(Vector2.new(Gui.gamepadNavigationFocusPos:getValue().X, Gui.entryRowIndex))
			UseFocusControllerResult.moveFocusTo(UseRefCacheResult[math.min(Gui.gamepadNavigationFocusPos:getValue().X, #Row)])
		end,
		padding = Gui.padding
	}, {
		Widget = ReactModule.createElement(WidgetLayout, {
			headerSlot = if Gui.descriptionKey or Gui.titleKey then ReactModule.createElement(WidgetHeader, {
				LayoutOrder = 1,
				descriptionText = Gui.descriptionText,
				descriptionKey = Gui.descriptionKey,
				titleKey = Gui.titleKey,
				titleText = Gui.titleText
			}) else nil,
			contentSlot = ReactModule.createElement(Grid, {
				itemsPerRow = ItemsPerRow,
				getItemId = function(p1)
					return p1.id
				end,
				gapHorizontal = UseTokensResult.Gap.Medium,
				gapVertical = UseTokensResult.Gap.Large,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				items = Row,
				renderItem = ReactModule.useCallback(function(p1)
					-- upvalues: ReactModule (upval), RoactGamepadModule (upval), UseRefCacheResult (copy), ItemsPerRow (copy), UseResult1 (copy), CatalogItemCardContainerModule (upval), CatalogSearch (ref), CatalogConstantsModule (upval), EntryRowIndex (copy), Gui (copy), Text (copy), Keyword (copy), ImpressionsCategory (ref), ImpressionsSubcategory (ref), ImpressionsTaxonomyId (ref), CreatorNameTileFooterEnabled (copy), UseResult (copy), FooterVisibilityFromItemFooters (copy), FFlagAXSubscriptionRefetchEvictStores (upval), UseSelectorResult1 (copy)
					local Index: number = p1.index
					local Item = p1.item
					
					return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						ref = UseRefCacheResult[Index],
						NextSelectionRight = if Index < ItemsPerRow then UseRefCacheResult[Index + 1] else nil,
						NextSelectionLeft = if Index > 1 then UseRefCacheResult[Index - 1] else nil,
						onFocusGained = function()
							-- upvalues: UseResult1 (upval), Index (copy)
							UseResult1(Index)
						end
					}, {
						CatalogItemCard = ReactModule.createElement(CatalogItemCardContainerModule, {
							isSponsoredItem = false,
							impressionsSchema = "defaultItem",
							impressionsGroup = nil,
							isOrganic = true,
							analyticsContext = CatalogSearch,
							analyticsItemCountPerPage = CatalogConstantsModule.PageFetchLimit,
							index = (EntryRowIndex - 1) * ItemsPerRow + Index,
							itemType = Item.type,
							itemId = Item.id,
							adTrackingData = Item.encryptedAdTrackingData,
							cardStyle = Gui.cardStyle,
							itemDetailsPeekViewRefs = Gui.itemDetailsPeekViewRefs,
							resultsListRef = Gui.gridRef,
							impressionsTag = Text,
							impressionsSearch = Keyword,
							impressionsCategory = ImpressionsCategory,
							impressionsSubcategory = ImpressionsSubcategory,
							impressionsTaxonomyId = ImpressionsTaxonomyId,
							impressionsId = Item.id,
							gridInformation = {
								gridPositionRow = Gui.catalogRowIndex,
								gridPositionColumn = Index
							},
							thumbailAspectRatio = Gui.thumbnailAspectRatio,
							thumbnailScaleType = Gui.thumbnailScaleType,
							thumbnailSize = if Item.type == "Look" then "w=300&h=450" else Gui.thumbnailSize,
							creatorNameTileFooterEnabled = CreatorNameTileFooterEnabled,
							onThumbnailLoaded = UseResult,
							isCreatorNameVisible = FooterVisibilityFromItemFooters.isCreatorNameVisible,
							isTitleVisible = FooterVisibilityFromItemFooters.isTitleVisible,
							isPriceVisible = FooterVisibilityFromItemFooters.isPriceVisible,
							lookData = if Item.type == "Look" then if FFlagAXSubscriptionRefetchEvictStores then if UseSelectorResult1 then UseSelectorResult1[tostring(Item.id)] else nil else UseSelectorResult1[tostring(Item.id)] else nil
						})
					})
				end, {
					ItemsPerRow, UseResult1, CatalogSearch, EntryRowIndex, Gui.cardStyle,
					Gui.itemDetailsPeekViewRefs, Gui.gridRef, Text, Keyword, ImpressionsCategory,
					ImpressionsSubcategory, "defaultItem", nil, Gui.thumbnailAspectRatio,
					Gui.thumbnailScaleType, Gui.thumbnailSize, CreatorNameTileFooterEnabled,
					UseResult, UseSelectorResult1
				})
			})
		})
	})
end))