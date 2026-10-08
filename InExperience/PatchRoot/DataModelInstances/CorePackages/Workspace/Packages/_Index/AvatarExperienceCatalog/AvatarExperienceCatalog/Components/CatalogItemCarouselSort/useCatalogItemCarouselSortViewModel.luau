local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.AvatarExperienceCommon)
local itemTypeEnum = require(parent.AvatarExperienceModel).Enums.ItemTypeEnum
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCatalogItemInformationPopover = avatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local fFlagAXDeferLookImpressionsForHydration = avatarExperienceFlagsModule.FFlagAXDeferLookImpressionsForHydration
local fFlagAXSduiSortSessionImpressionDedup = avatarExperienceFlagsModule.FFlagAXSduiSortSessionImpressionDedup
local fFlagAXSduiSeeAllClickLogging = avatarExperienceFlagsModule.FFlagAXSduiSeeAllClickLogging
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local getFooterVisibilityFromItemFootersModule = require(avatarExperienceCatalog.Utils.getFooterVisibilityFromItemFooters)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedLookTypeModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedLookType)
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local useOnRequestImpressionsSignalModule = require(script.Parent.Parent.Hooks.useOnRequestImpressionsSignal)
local useHydrateCatalogSortOnDemandEffectModule = require(script.Parent.Parent.Hooks.useHydrateCatalogSortOnDemandEffect)
local useAddUnifiedLoggingToCatalogSortEffectModule = require(script.Parent.Parent.Hooks.useAddUnifiedLoggingToCatalogSortEffect)
local useFirstSeenImpressionFilterModule = require(script.Parent.Parent.Hooks.useFirstSeenImpressionFilter)
local useSessionSeenImpressionFilterModule = require(script.Parent.Parent.Hooks.useSessionSeenImpressionFilter)
local useDeferLooksWithoutHydrationFilterModule = require(script.Parent.Parent.Hooks.useDeferLooksWithoutHydrationFilter)
local useComposedImpressionFilterModule = require(script.Parent.Parent.Hooks.useComposedImpressionFilter)
local useOnCatalogSortImpressionsDetectedCallbackModule = require(script.Parent.Parent.Hooks.useOnCatalogSortImpressionsDetectedCallback)
local useOpenInformationPopoverModule = require(script.Parent.Parent.Hooks.useOpenInformationPopover)
local useCatalogSortSeeAllLoggingModule = require(script.Parent.Parent.Hooks.useCatalogSortSeeAllLogging)
local _ = require(script.Parent.CatalogItemCarouselSortView)
local AXCarouselLoadingBuffer = game:DefineFastInt("AXCarouselLoadingBuffer", 1)
local AXCarouselPeakFraction = game:DefineFastInt("AXCarouselPeakFraction", 33)
local AXCarouselItemsBasedOnFrameSize = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3)
local t = { leftPosition = 28, rightPosition = 15 }

local function _(p1, p2, p3)
	local var1 = if p2 > 0 then p2 else 1
	
	return math.floor(math.max(0, p1 - (var1 - 1) * p3) / var1)
end

return function(p1, p2)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useTokens (ref), reactModule (ref), useOnRequestImpressionsSignalModule (ref), fFlagAXSduiSeeAllClickLogging (ref), useCatalogSortSeeAllLoggingModule (ref), useFirstSeenImpressionFilterModule (ref), fFlagAXSduiSortSessionImpressionDedup (ref), useSessionSeenImpressionFilterModule (ref), useDeferLooksWithoutHydrationFilterModule (ref), useComposedImpressionFilterModule (ref), fFlagAXDeferLookImpressionsForHydration (ref), useStore (ref), AXCarouselItemsBasedOnFrameSize (ref), AXCarouselPeakFraction (ref), useHydrateCatalogSortOnDemandEffectModule (ref), useLocalization (ref), fFlagAXCatalogItemInformationPopover (ref), useOpenInformationPopoverModule (ref), getFooterVisibilityFromItemFootersModule (ref), unifiedEventLogEnums (ref), useAddUnifiedLoggingToCatalogSortEffectModule (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref), cryoModule (ref), widgetConstantsModule (ref), AXCarouselLoadingBuffer (ref), useOnCatalogSortImpressionsDetectedCallbackModule (ref), t (ref)
	local widgetTileWithImpressionsTagging = useCatalogPageMonolithDependenciesModule().WidgetTileWithImpressionsTagging
	local var1 = useTokens()
	local widgetInfo = p1.widgetInfo
	local widgetConfiguration = p1.widgetConfiguration
	local itemsPerRow = p1.itemsPerRow
	local var2 = reactModule.useRef(nil)
	local var3 = useOnRequestImpressionsSignalModule()
	local var4 = nil
	local var5 = nil
	
	if fFlagAXSduiSeeAllClickLogging then
		local var6, var7 = useCatalogSortSeeAllLoggingModule(p1.onSeeAll, p1.widgetAnalyticsInfo)
		var4 = var6
		var5 = var7
	end
	local var8 = if widgetInfo then widgetInfo.id else ""
	local text = "WIDGET_CAROUSEL" .. "_" .. var30
	local var9 = if fFlagAXSduiSortSessionImpressionDedup then useSessionSeenImpressionFilterModule(var8) else useFirstSeenImpressionFilterModule(var8)
	local var10 = if fFlagAXDeferLookImpressionsForHydration then useComposedImpressionFilterModule({
		useDeferLooksWithoutHydrationFilterModule(widgetInfo),
		var9
	}) else var9
	local var11 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy)
		return setmetatable({}, {
			__index = function(p3, p4)
				-- upvalues: reactModule (copy)
				local var12 = reactModule.createRef()
				rawset(p3, p4, var12)
				
				return var12
			end
		})
	end, {})
	local var12 = useStore()
	local minValue = math.min(if widgetInfo and widgetInfo.content then #widgetInfo.content else 0, itemsPerRow * AXCarouselItemsBasedOnFrameSize - AXCarouselItemsBasedOnFrameSize + 1)
	local medium = var1.Gap.Medium
	local rowWidth = p1.rowWidth or 0
	local var13 = itemsPerRow + AXCarouselPeakFraction / 100
	local var14 = if var13 > 0 then var13 else 1
	local floored = math.floor(math.max(0, rowWidth - (var14 - 1) * medium) / var14)
	local var15 = minValue * floored + math.max(0, minValue - 1) * medium
	local var16, var17 = reactModule.useState({ cardWindowStart = 1, cardWindowIndex = 1 })
	useHydrateCatalogSortOnDemandEffectModule(widgetInfo, widgetConfiguration, itemsPerRow)
	local var18 = reactModule.useCallback(function(p3)
		-- upvalues: floored (ref), medium (ref), var16 (ref), var17 (ref), var3 (ref)
		if not p3 then return end
		local x = p3.CanvasPosition.X
		local maxValue = math.max(1, floored + medium)
		local maxValue_1 = math.max(1, math.floor(x / maxValue))
		local var19 = math.max(0, math.floor(x / maxValue)) + 1
		
		if maxValue_1 ~= var16.cardWindowStart or var19 ~= var16.cardWindowIndex then
			var17({ cardWindowStart = maxValue_1, cardWindowIndex = var19 })
			var3:fire()
		end
	end, { var16, floored, medium, var3 })
	local var19 = useLocalization({
		widgetTitle = if widgetInfo and widgetInfo.template then widgetInfo.template.title else nil,
		widgetDescription = if widgetInfo and widgetInfo.template then widgetInfo.template.description else nil
	})
	local var20 = nil
	local var21 = nil
	local informationPopoverText = nil
	
	if widgetInfo and widgetInfo.template then
		var20 = if widgetInfo.template.title then var19.widgetTitle else widgetInfo.template.localizedTitle
		var21 = if widgetInfo.template.description then var19.widgetDescription else widgetInfo.template.localizedDescription
		
		if fFlagAXCatalogItemInformationPopover then
			informationPopoverText = widgetInfo.template.informationPopoverText
		end
	end
	local var22 = if fFlagAXCatalogItemInformationPopover then useOpenInformationPopoverModule(var20, informationPopoverText) else nil
	local var23 = getFooterVisibilityFromItemFootersModule(if widgetInfo and widgetInfo.template then widgetInfo.template.itemFooters else nil)
	local CAROUSEL = unifiedEventLogEnums.WidgetUiTreatment.CAROUSEL
	useAddUnifiedLoggingToCatalogSortEffectModule({
		containerRef = var2,
		widgetInfo = widgetInfo,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		uiTreatmentType = CAROUSEL,
		seeAllRef = if fFlagAXSduiSeeAllClickLogging then var4 else nil,
		seeAllCallback = if fFlagAXSduiSeeAllClickLogging then p1.onSeeAll else nil
	})
	
	local function buildPerTileAnalyticsInfo(p3, p4)
		-- upvalues: fFlagAXDeferLookImpressionsForHydration (copy), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var12 (ref), cryoModule (copy), p1 (ref), widgetInfo (ref), CAROUSEL (ref)
		return cryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
			itemPosition = p4,
			itemId = p3.id,
			itemType = p3.type,
			lookType = if not (fFlagAXDeferLookImpressionsForHydration or p3.type ~= itemTypeEnum.Look) then selectHydratedLookTypeModule(var12:getState(), p3.id) else nil,
			themeId = widgetInfo and widgetInfo.tagId,
			gridPositionRow = p1.widgetRow,
			gridPositionColumn = p4,
			uiTreatmentType = CAROUSEL
		})
	end
	
	local var24 = function(p3, p4)
		-- upvalues: buildPerTileAnalyticsInfo (ref), reactModule (copy), widgetTileWithImpressionsTagging (ref), floored (ref), widgetInfo (ref), widgetConstantsModule (copy), var11 (ref), p1 (ref), itemsPerRow (ref), var23 (ref), text (ref)
		return reactModule.createElement(widgetTileWithImpressionsTagging, {
			size = UDim2.new(0, floored, 0, 0),
			cardStyle = if widgetInfo and widgetInfo.template then widgetInfo.template.cardStyle else nil,
			contentType = p3.type or widgetConstantsModule.ContentType.Asset,
			tileContentType = widgetInfo and widgetInfo.type,
			contentId = p3.id or "",
			index = p4,
			refCache = var11,
			resultsListRef = p1.gridRef,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			itemsPerRow = itemsPerRow,
			analyticsItemCountPerPage = itemsPerRow,
			isCreatorNameVisible = var23.isCreatorNameVisible,
			isTitleVisible = var23.isTitleVisible,
			isPriceVisible = var23.isPriceVisible,
			impressionsTag = text,
			widgetAnalyticsInfo = buildPerTileAnalyticsInfo(p3, p4),
			onThumbnailLoaded = p1.onThumbnailLoaded
		})
	end
	
	local minValue_1 = math.min(minValue, var16.cardWindowStart + itemsPerRow + AXCarouselLoadingBuffer)
	local var25 = if widgetInfo then widgetInfo.content else nil
	
	return {
		headerText = var20,
		headerDescription = var21,
		informationPopoverText = informationPopoverText,
		onInformationIconActivated = var22,
		seeAllCallback = if fFlagAXSduiSeeAllClickLogging then var5 else p1.onSeeAll,
		seeAllRef = if fFlagAXSduiSeeAllClickLogging then var4 else nil,
		itemsPerRow = itemsPerRow,
		itemGap = medium,
		itemWidth = floored,
		canvasWidth = var15,
		carouselItemCount = math.max(1, minValue),
		carouselIndex = var16.cardWindowIndex,
		visibleItems = reactModule.useMemo(function()
			-- upvalues: var25 (ref), minValue_1 (ref)
			local var26 = var25 or {}
			local t = {}
			
			for i = 1, minValue_1 do
				local var27 = var26[i]
				table.insert(t, {
					id = if var27 then var27.id else nil,
					type = if var27 then var27.type else nil,
					absoluteIndex = i,
					gridInformation = { row = 1, column = i }
				})
			end
			return t
		end, { var25, minValue_1 }),
		renderTile = var24,
		onScrollChanged = var18,
		containerRef = var2,
		impressionsKey = text,
		widgetRow = p1.widgetRow,
		onItemsUpdatedSignal = var3,
		onImpressionsDetected = useOnCatalogSortImpressionsDetectedCallbackModule({
			widgetInfo = widgetInfo,
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			widgetRow = p1.widgetRow,
			itemsPerRow = itemsPerRow,
			uiTreatmentType = CAROUSEL
		}),
		filterImpressionFunc = var10,
		carouselMargin = var1.Margin.Large,
		carouselArrowStyleProps = t,
		horizontalMargin = p1.horizontalMargin,
		widgetId = var8,
		ref = p2
	}
end