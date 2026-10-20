local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local Grid = AvatarExperienceUIKitModule.GridComponents.Grid
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixSeeAllSpacing = AvatarExperienceFlagsModule.FFlagAXFixSeeAllSpacing
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local ScrollingAppCarousel = require(CorePackages.Workspace.Packages.AppBlox).ScrollingAppCarousel
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local WidgetTileWithImpressionsTaggingModule = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetTileWithImpressionsTagging)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FetchHydratedWidgetContentModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent)
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local WidgetEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local WidgetLoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetLoadableGridView)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local GetContentToHyderateModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate)
local GetWidgetTileFooterPropsModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetTileFooterProps)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseImpressionsTaggerFunction = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local GetFooterVisibilityFromItemFootersFunction = AvatarExperienceCatalogModule.Utils.getFooterVisibilityFromItemFooters
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FIntAXCarouselWidgetMaxItemsModule = require(Modules.AvatarExperience.Flags.FIntAXCarouselWidgetMaxItems)
local AXCarouselLoadingBuffer = game:DefineFastInt("AXCarouselLoadingBuffer", 1)
local GetFFlagAXAnimatedLooksThumbnailsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails)
local AXCarouselFixMissingAnalytics2 = game:DefineFastFlag("AXCarouselFixMissingAnalytics2", false)
local FFlagAXScrollingCarouselWidgetIndexBugfix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix
local AXSeeAllTreatmentType = game:DefineFastFlag("AXSeeAllTreatmentType", false)
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local FFlagAXTallTilesForAdvancedBodiesWidget = AvatarExperienceFlagsModule.FFlagAXTallTilesForAdvancedBodiesWidget
local AXCarouselItemsBasedOnFrameSize = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3)
local AXCarouselPeakFractionRatio = game:DefineFastInt("AXCarouselPeakFraction", 33) / 100
local StyleProps = { leftPosition = 28, rightPosition = 15 }
local t = {}

local function useItemCarouselWidgetViewModel(p1, p2, UseRefResult, ItemWidth, ItemGap)
	-- upvalues: ReactModule (copy), RetrievalStatusModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), GetContentToHyderateModule (copy), WidgetConstants (copy), FetchHydratedWidgetContentModule (copy), FFlagAXScrollingCarouselWidgetIndexBugfix (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ cardWindowStart = 1, cardWindowIndex = 1 })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(RetrievalStatusModule.NotStarted)
	local WidgetInfo = p1.widgetInfo
	local WidgetConfiguration = p1.widgetConfiguration
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local NoWidgetFocused: boolean = p1.displayAsItemGroupWidget and not p1.widgetFocused
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: NoWidgetFocused (copy), WidgetConfiguration (copy), GetContentToHyderateModule (upval), WidgetInfo (copy), p2 (copy), p1 (copy)
		return if NoWidgetFocused and WidgetConfiguration and WidgetConfiguration.customizedDataMap and WidgetConfiguration.customizedDataMap.hydrateOnlyVisibleItems then GetContentToHyderateModule(WidgetInfo, p2, p1.itemsPerRow) else GetContentToHyderateModule(WidgetInfo, p2)
	end, { p2, WidgetInfo, NoWidgetFocused, p1.itemsPerRow })
	ReactModule.useEffect(function()
		-- upvalues: WidgetInfo (copy), WidgetConstants (upval), UseMemoResult (copy), UseStateResult1 (copy), RetrievalStatusModule (upval), UseStateResult2_1 (copy), UseDispatchResult (copy), FetchHydratedWidgetContentModule (upval), UseRoactServiceModuleResult (copy)
		if WidgetInfo.type ~= WidgetConstants.Types.MySharedAvatarsWidget and UseMemoResult and #UseMemoResult > 0 and UseStateResult1 == RetrievalStatusModule.NotStarted then
			UseStateResult2_1(RetrievalStatusModule.Fetching)
			UseDispatchResult(FetchHydratedWidgetContentModule(UseRoactServiceModuleResult, UseMemoResult, WidgetInfo.id))
		end
	end, {
		UseMemoResult, WidgetInfo, UseMemoResult, UseStateResult1, UseDispatchResult,
		UseRoactServiceModuleResult
	})
	
	return UseStateResult, (ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: ItemWidth (copy), ItemGap (copy), FFlagAXScrollingCarouselWidgetIndexBugfix (upval), UseStateResult (copy), UseStateResult2 (copy), UseRefResult (copy)
		if not ScrollFrame then return end
		local X = ScrollFrame.CanvasPosition.X
		local Largest = math.max(1, (math.floor(X / ((ItemWidth or 0) + (ItemGap or 0)))))
		local NewLargest: number = if FFlagAXScrollingCarouselWidgetIndexBugfix then math.max(0, (math.floor(X / ((ItemWidth or 0) + (ItemGap or 0))))) + 1 else math.max(0, (math.floor(X / ((ItemWidth or 0) - (ItemGap or 0))))) + 1
		
		if Largest ~= UseStateResult.cardWindowStart or NewLargest ~= UseStateResult.cardWindowIndex then
			UseStateResult2({ cardWindowStart = Largest, cardWindowIndex = NewLargest })
			UseRefResult.current:fire()
		end
	end, { UseStateResult, ItemWidth, ItemGap, UseRefResult }))
end

local function _(p1, p2: number, p3): number
	return (math.floor((p1 - (p2 - 1) * p3) / p2))
end

local function useItemCarouselWidgetSizes(RowWidth, ItemsPerRow, Smallest: number, p1)
	-- upvalues: UseTokensFunction (copy)
	local Medium = UseTokensFunction().Gap.Medium
	local NewItemsPerRow = ItemsPerRow + p1
	local Floored = math.floor((RowWidth - (NewItemsPerRow - 1) * Medium) / NewItemsPerRow)
	
	return {
		itemWidth = Floored,
		itemGap = Medium,
		canvasWidth = Smallest * Floored + (Smallest - 1) * Medium
	}
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), FIntAXCarouselWidgetMaxItemsModule (copy), AXCarouselItemsBasedOnFrameSize (copy), useItemCarouselWidgetSizes (copy), FFlagAXFixSeeAllSpacing (copy), AXCarouselPeakFractionRatio (copy), AXSeeAllTreatmentType (copy), UnifiedEventLogEnums (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), ReactModule (copy), Signal (copy), UseLocalizationFunction (copy), RoactGamepadModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), useItemCarouselWidgetViewModel (copy), ConstantsModule (copy), GetWidgetTileFooterPropsModule (copy), GetFooterVisibilityFromItemFootersFunction (copy), UtilsModule (copy), FFlagAXTallTilesForAdvancedBodiesWidget (copy), AXCarouselFixMissingAnalytics2 (copy), CryoModule (copy), WidgetTileWithImpressionsTaggingModule (copy), FFlagAXLookAndFeelBackgrounds (copy), WidgetConstants (copy), GetFFlagAXAnimatedLooksThumbnailsModule (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), FFlagRenameDeprecatedUIBloxTokens (copy), AXCarouselLoadingBuffer (copy), Grid (copy), ScrollingAppCarousel (copy), StyleProps (copy), ScreenSizeImpressionsDetector (copy), t (copy), WidgetEventImpressionsReporterModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), WidgetHeader (copy), UseImpressionsTaggerFunction (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogConstants (copy), HttpService (copy), WidgetLayout (copy), WidgetLoadableGridViewModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local WidgetInfo = p1.widgetInfo
	local CountContent: number = WidgetInfo.content and #WidgetInfo.content or 0
	local Smallest = math.min(CountContent, FIntAXCarouselWidgetMaxItemsModule)
	local Smallest1 = math.min(CountContent, p1.itemsPerRow * AXCarouselItemsBasedOnFrameSize - AXCarouselItemsBasedOnFrameSize + 1)
	local YOffset = 0
	local UseItemCarouselWidgetSizesResult = useItemCarouselWidgetSizes(p1.rowWidth or 0, p1.itemsPerRow, Smallest1, if p1.displayAsItemGroupWidget or FFlagAXFixSeeAllSpacing and p1.widgetFocused then 0 else AXCarouselPeakFractionRatio)
	local WIDGETSEEALL = nil
	WIDGETSEEALL = if AXSeeAllTreatmentType and p1.widgetFocused then UnifiedEventLogEnums.WidgetUiTreatment.WIDGET_SEE_ALL elseif p1.displayAsItemGroupWidget then UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP else UnifiedEventLogEnums.WidgetUiTreatment.CAROUSEL
	local ItemGap = UseItemCarouselWidgetSizesResult.itemGap
	local ItemWidth: number = UseItemCarouselWidgetSizesResult.itemWidth
	local CanvasWidth: number = UseItemCarouselWidgetSizesResult.canvasWidth
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRefResult = ReactModule.useRef(Signal.new())
	local Text = "WIDGET_CAROUSEL" .. "_" .. p1.widgetInfo.id
	local WidgetConfiguration = p1.widgetConfiguration
	local SeeAllButton = WidgetInfo and WidgetInfo.template and WidgetInfo.template.seeAllButton or p1.widgetFocused
	local UseLocalizationResult = UseLocalizationFunction({
		widgetTitle = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.title else nil,
		widgetDescription = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.description else nil
	})
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.Common.Widgets.HydratedWidgetData
	end, GetUseSelectorDeepEqualsFunction())
	local UseItemCarouselWidgetViewModelResult, UseItemCarouselWidgetViewModelResult2 = useItemCarouselWidgetViewModel(p1, UseSelectorResult, UseRefResult, ItemWidth, ItemGap)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current:fire()
	end, {})
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), ConstantsModule (upval), UseRefResult (copy)
		local function scheduleNextTimer()
			-- upvalues: UseRefResult1 (upval), ConstantsModule (upval), UseRefResult (upval), scheduleNextTimer (copy)
			UseRefResult1.current = task.delay(ConstantsModule.ImpressionsDetectionInterval, function()
				-- upvalues: UseRefResult (upval), scheduleNextTimer (upval)
				UseRefResult.current:fire()
				scheduleNextTimer()
			end)
		end
		
		UseRefResult1.current = task.delay(ConstantsModule.ImpressionsDetectionInterval, function()
			-- upvalues: UseRefResult (upval), scheduleNextTimer (copy)
			UseRefResult.current:fire()
			scheduleNextTimer()
		end)
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current then
				task.cancel(UseRefResult1.current)
				UseRefResult1.current = nil
			end
		end
	end, {})
	local Items = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, ItemGap),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}
	local WidgetTileFooterPropsModule = GetWidgetTileFooterPropsModule(WidgetInfo, WidgetConfiguration)
	local CreatorNameFooterEnabled = WidgetTileFooterPropsModule.creatorNameFooterEnabled
	local PriceFooterEnabled = WidgetTileFooterPropsModule.priceFooterEnabled
	local CreatorNameTileFooterEnabled = WidgetTileFooterPropsModule.creatorNameTileFooterEnabled
	local FooterVisibilityFromItemFooters = GetFooterVisibilityFromItemFootersFunction(if p1.widgetInfo then p1.widgetInfo.template.itemFooters else nil)
	local IsLooksWidget = if p1.widgetInfo then UtilsModule.isLooksWidget(p1.widgetInfo.type) else nil
	local IsTallBundleWidget = if FFlagAXTallTilesForAdvancedBodiesWidget and p1.widgetInfo then UtilsModule.isTallBundleWidget(p1.widgetInfo.type) else nil
	
	local function RenderItem(ContentEntry, Index)
		-- upvalues: AXCarouselFixMissingAnalytics2 (upval), CryoModule (upval), p1 (copy), ConstantsModule (upval), UseSelectorResult (copy), WidgetInfo (copy), WIDGETSEEALL (ref), ReactModule (upval), WidgetTileWithImpressionsTaggingModule (upval), ItemWidth (copy), YOffset (ref), FFlagAXLookAndFeelBackgrounds (upval), WidgetConstants (upval), UseRefCacheResult (copy), CreatorNameFooterEnabled (ref), PriceFooterEnabled (copy), CreatorNameTileFooterEnabled (copy), FooterVisibilityFromItemFooters (copy), FFlagAXTallTilesForAdvancedBodiesWidget (upval), IsTallBundleWidget (copy), Text (copy), GetFFlagAXAnimatedLooksThumbnailsModule (upval), FFlagAXCatalogCategoriesStoreImprovePerf (upval)
		local JoinResult = if AXCarouselFixMissingAnalytics2 then CryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
			itemPosition = Index,
			itemId = ContentEntry.id,
			itemType = ContentEntry.type,
			lookType = if ContentEntry.type == ConstantsModule.ItemType.Look and UseSelectorResult and UseSelectorResult[ConstantsModule.ItemType.Look] and UseSelectorResult[ConstantsModule.ItemType.Look][ContentEntry.id] then UseSelectorResult[ConstantsModule.ItemType.Look][ContentEntry.id].lookType else nil,
			themeId = WidgetInfo.tagId,
			gridPositionRow = if p1.widgetFocused and ContentEntry.gridInformation then ContentEntry.gridInformation.row else p1.widgetRow,
			gridPositionColumn = if p1.widgetFocused and ContentEntry.gridInformation then ContentEntry.gridInformation.column else Index,
			uiTreatmentType = WIDGETSEEALL
		}) else nil
		
		return ReactModule.createElement(WidgetTileWithImpressionsTaggingModule, {
			size = UDim2.new(0, ItemWidth, 0, YOffset),
			cardStyle = if FFlagAXLookAndFeelBackgrounds then WidgetInfo.template.cardStyle else nil,
			contentType = ContentEntry.type or WidgetConstants.ContentType.Asset,
			tileContentType = WidgetInfo.type,
			contentId = ContentEntry.id or "",
			index = Index,
			refCache = UseRefCacheResult,
			resultsListRef = p1.gridRef,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			itemsPerRow = p1.itemsPerRow,
			hideItemName = p1.hideItemName,
			analyticsItemCountPerPage = p1.itemsPerRow,
			creatorNameFooterEnabled = CreatorNameFooterEnabled,
			priceFooterEnabled = PriceFooterEnabled,
			creatorNameTileFooterEnabled = CreatorNameTileFooterEnabled,
			isCreatorNameVisible = FooterVisibilityFromItemFooters.isCreatorNameVisible,
			isTitleVisible = FooterVisibilityFromItemFooters.isTitleVisible,
			isPriceVisible = FooterVisibilityFromItemFooters.isPriceVisible,
			isTallTile = if FFlagAXTallTilesForAdvancedBodiesWidget then IsTallBundleWidget else nil,
			impressionsTag = Text,
			disable3DRendering = if GetFFlagAXAnimatedLooksThumbnailsModule() then p1.widgetFocused else nil,
			widgetAnalyticsInfo = if AXCarouselFixMissingAnalytics2 then JoinResult else CryoModule.Dictionary.join(p1.widgetAnalyticsInfo, { uiTreatmentType = WIDGETSEEALL }),
			onThumbnailLoaded = p1.onThumbnailLoaded,
			selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then p1.selectedCategory else nil,
			selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then p1.selectedSubcategory else nil,
			selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then p1.selectedCategoryInfo else nil
		})
	end
	
	local Items1 = {}
	
	if SeeAllButton then
		for i = 1, Smallest do
			table.insert(Items1, WidgetInfo.content and WidgetInfo.content[i] or {})
		end
	end
	local ScaledRelativeSize = 0
	local TallCatalogItemTile = if FFlagAXTallTilesForAdvancedBodiesWidget and IsTallBundleWidget then ConstantsModule.ItemTileType.TallCatalogItemTile else ConstantsModule.ItemTileType.CatalogItemTile
	
	if SeeAllButton then
		ScaledRelativeSize = UseStyleResult.Font.Header2.RelativeSize * UseStyleResult.Font.BaseSize
		TallCatalogItemTile = ConstantsModule.ItemTileType.CatalogItemTile
		
		if IsLooksWidget then
			ScaledRelativeSize = UseStyleResult.Font.SubHeader1.RelativeSize * UseStyleResult.Font.BaseSize
			TallCatalogItemTile = ConstantsModule.ItemTileType.LookItemTile
		elseif FFlagAXTallTilesForAdvancedBodiesWidget and IsTallBundleWidget then
			TallCatalogItemTile = ConstantsModule.ItemTileType.TallCatalogItemTile
		end
	end
	local GridItemHeightGetterWithOptionsResult = UtilsModule.GridItemHeightGetterWithOptions({
		itemTileType = TallCatalogItemTile,
		fontHeight = ScaledRelativeSize,
		hideItemName = p1.hideItemName,
		itemCreatorNamesEnabled = CreatorNameTileFooterEnabled,
		itemPriceEnabled = PriceFooterEnabled,
		isWidgetFocused = p1.widgetFocused
	})
	local GridItemHeightGetterWithOptionsResultResult: number = GridItemHeightGetterWithOptionsResult(ItemWidth)
	
	if IsLooksWidget then
		CreatorNameFooterEnabled = CreatorNameFooterEnabled and CreatorNameTileFooterEnabled or false
		local Total = 0
		
		if PriceFooterEnabled then
			Total += if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_350 else UseDesignTokensResult.Global.Size_175
		end
		if CreatorNameFooterEnabled then
			Total += if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_350 else UseDesignTokensResult.Global.Size_175
		end
		local _ = GridItemHeightGetterWithOptionsResultResult + Total
		YOffset += Total
	end
	local Smallest2: number = if p1.displayAsItemGroupWidget then math.min(p1.itemsPerRow, Smallest1) else math.min(Smallest1, UseItemCarouselWidgetViewModelResult.cardWindowStart + p1.itemsPerRow + AXCarouselLoadingBuffer)
	for i1 = 1, Smallest2 do
		local ContentEntry = WidgetInfo.content and WidgetInfo.content[i1] or {}
		ContentEntry.gridInformation = { row = 1, column = i1 }
		table.insert(Items, RenderItem(ContentEntry, i1))
	end
	local Element = if p1.displayAsItemGroupWidget then ReactModule.createElement(Grid, {
		itemsPerRow = p1.itemsPerRow,
		renderItem = function(p2)
			-- upvalues: RenderItem (copy)
			local Item = p2.item
			
			return RenderItem({
				id = Item.id,
				type = Item.type,
				gridInformation = Item.gridInformation
			}, p2.index)
		end,
		getItemId = function(p2): string
			-- upvalues: p1 (copy)
			return p2.id .. p1.itemsPerRow
		end,
		items = CryoModule.List.getRange(WidgetInfo.content or {}, 1, (p1.rowCount or 1) * p1.itemsPerRow),
		gapVertical = ItemGap,
		gapHorizontal = ItemGap,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}) else ReactModule.createElement(ScrollingAppCarousel, {
		carouselHeight = 0,
		shouldExpandToFitContentHeight = true,
		items = Items,
		index = math.max(1, (math.min(UseItemCarouselWidgetViewModelResult.cardWindowIndex, Smallest1))),
		styleProps = StyleProps,
		itemCount = Smallest1,
		itemWidth = math.max(1, ItemWidth),
		itemPadding = ItemGap,
		carouselMargin = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Space_600,
		canvasWidth = math.max(1, CanvasWidth),
		onChangeCanvasPosition = UseItemCarouselWidgetViewModelResult2,
		onRefCallback = UseItemCarouselWidgetViewModelResult2
	})
	local Element1 = ReactModule.createElement(ScreenSizeImpressionsDetector, {
		onRequestImpressionsSignal = UseRefResult.current,
		onImpressionsDetected = function(ItemPositions)
			-- upvalues: p1 (copy), t (upval), WidgetInfo (copy), AXCarouselFixMissingAnalytics2 (upval), WidgetEventImpressionsReporterModule (upval), UseRoactServiceModuleResult (copy), CryoModule (upval), ConstantsModule (upval), UseSelectorResult (copy), WIDGETSEEALL (ref)
			for _, itemPosition in ItemPositions do
				local Text = p1.widgetInfo.id .. "_" .. itemPosition
				
				if not t[Text] then
					local ContentEntry = WidgetInfo.content and WidgetInfo.content[itemPosition] or {}
					
					if AXCarouselFixMissingAnalytics2 then
						WidgetEventImpressionsReporterModule(UseRoactServiceModuleResult, CryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
							widgetPosition = p1.widgetRow,
							widgetId = p1.widgetInfo.id,
							itemPosition = itemPosition,
							itemId = ContentEntry.id,
							itemType = ContentEntry.type,
							lookType = if ContentEntry.type == ConstantsModule.ItemType.Look and UseSelectorResult and UseSelectorResult[ConstantsModule.ItemType.Look] and UseSelectorResult[ConstantsModule.ItemType.Look][ContentEntry.id] then UseSelectorResult[ConstantsModule.ItemType.Look][ContentEntry.id].lookType else nil,
							widgetAbsPosition = (p1.widgetRow - 1) * p1.itemsPerRow,
							uiTreatmentType = WIDGETSEEALL
						}))
					else
						WidgetEventImpressionsReporterModule(UseRoactServiceModuleResult, {
							widgetPosition = p1.widgetRow,
							widgetId = p1.widgetInfo.id,
							itemPosition = itemPosition,
							itemId = ContentEntry.id,
							itemType = ContentEntry.type,
							widgetAbsPosition = (p1.widgetRow - 1) * p1.itemsPerRow,
							uiTreatmentType = WIDGETSEEALL
						})
					end
					t[Text] = true
				end
			end
		end,
		impressionsTag = Text
	})
	local WidgetTitle = ""
	local WidgetDescription = ""
	
	if WidgetInfo.template then
		WidgetTitle = if WidgetInfo.template.title then UseLocalizationResult.widgetTitle else WidgetInfo.template.localizedTitle
		WidgetDescription = if WidgetInfo.template.description then UseLocalizationResult.widgetDescription else WidgetInfo.template.localizedDescription
	end
	local Element2 = nil
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if not p1.widgetFocused and not (if FFlagAXMoveAllTabToWidgetOnly then not (WidgetTitle or WidgetDescription) else nil) then
		Element2 = ReactModule.createElement(WidgetHeader, {
			LayoutOrder = 1,
			titleText = WidgetTitle,
			descriptionText = WidgetDescription,
			seeAllCallback = if SeeAllButton then p1.requestWidgetAcquireFocus else nil,
			seeAllRef = UseRefResult3
		})
	end
	local UseRefResult2 = ReactModule.useRef(nil)
	UseImpressionsTaggerFunction(UseRefResult2, WidgetConstants.WidgetExposureMetadata.TagName, p1.widgetRow)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), AddUnifiedEventLoggingFunction (upval), CryoModule (upval), p1 (copy), UnifiedEventLogEnums (upval), WIDGETSEEALL (ref), WidgetInfo (copy), UnifiedEventLogConstants (upval), UseRefResult3 (copy), HttpService (upval), WidgetConstants (upval)
		local Current = UseRefResult2 and UseRefResult2.current
		
		if Current then
			AddUnifiedEventLoggingFunction(UseRefResult2, CryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
				gridPositionColumn = 1,
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
				gridPositionRow = p1.widgetRow,
				uiTreatmentType = WIDGETSEEALL,
				themeId = if WidgetInfo then WidgetInfo.tagId else nil
			}), {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
			
			if UseRefResult3 and UseRefResult3.current then
				AddUnifiedEventLoggingFunction(UseRefResult3, {
					elementName = "SEE_ALL",
					gridPositionColumn = 1,
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					requestId = p1.widgetAnalyticsInfo.requestId,
					elementMetadata = HttpService:JSONEncode({
						widget_id = p1.widgetAnalyticsInfo.widgetId,
						widget_type = p1.widgetAnalyticsInfo.widgetType,
						tag_id = if WidgetInfo then WidgetInfo.tagId else nil
					}),
					gridPositionRow = p1.widgetRow
				}, {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
			if p1.ixpLayerToExpose then
				Current:SetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey, p1.ixpLayerToExpose)
			end
		end
	end, { p1.ixpLayerToExpose })
	
	return ReactModule.createElement(WidgetLayout, {
		headerSlot = Element2,
		contentSlot = if p1.widgetFocused then ReactModule.createElement(WidgetLoadableGridViewModule, {
			widgetInfo = p1.widgetInfo,
			impressionsTag = Text,
			getItemHeight = GridItemHeightGetterWithOptionsResult,
			items = Items1,
			totalNumItems = Smallest,
			renderItem = RenderItem,
			getItemMetrics = p1.getItemMetrics,
			itemsPerRow = p1.itemsPerRow
		}) else ReactModule.createElement(ReactModule.Fragment, {}, {
			["Widget_" .. WidgetInfo.id] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				ref = UseRefResult2
			}, Element),
			ImpressionsDetector = Element1
		})
	})
end