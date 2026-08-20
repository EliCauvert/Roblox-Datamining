local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCatalogItemInformationPopover = avatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local fFlagAXDeferLookImpressionsForHydration = avatarExperienceFlagsModule.FFlagAXDeferLookImpressionsForHydration
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
local useDeferLooksWithoutHydrationFilterModule = require(script.Parent.Parent.Hooks.useDeferLooksWithoutHydrationFilter)
local useComposedImpressionFilterModule = require(script.Parent.Parent.Hooks.useComposedImpressionFilter)
local useOnCatalogSortImpressionsDetectedCallbackModule = require(script.Parent.Parent.Hooks.useOnCatalogSortImpressionsDetectedCallback)
local useOpenInformationPopoverModule = require(script.Parent.Parent.Hooks.useOpenInformationPopover)
local _ = require(script.Parent.CatalogItemCarouselSortView)
local AXCarouselLoadingBuffer = game:DefineFastInt("AXCarouselLoadingBuffer", 1)
local AXCarouselPeakFraction = game:DefineFastInt("AXCarouselPeakFraction", 33)
local AXCarouselItemsBasedOnFrameSize = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3)
local t = { leftPosition = 28, rightPosition = 15 }

local function _(p0, p1, p2) --[[ line: 117 | named "computeItemWidth" ]]
	local var20 = if p1 > 0 then p1 else 1
	
	return math.floor(math.max(0, p0 - (var20 - 1) * p2) / var20)
end

return function(p3, p4) --[[ line: 124 | named "useCatalogItemCarouselSortViewModel" ]]
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useTokens (ref), reactModule (ref), useOnRequestImpressionsSignalModule (ref), useFirstSeenImpressionFilterModule (ref), useDeferLooksWithoutHydrationFilterModule (ref), useComposedImpressionFilterModule (ref), fFlagAXDeferLookImpressionsForHydration (ref), useStore (ref), AXCarouselItemsBasedOnFrameSize (ref), AXCarouselPeakFraction (ref), useHydrateCatalogSortOnDemandEffectModule (ref), useLocalization (ref), fFlagAXCatalogItemInformationPopover (ref), useOpenInformationPopoverModule (ref), getFooterVisibilityFromItemFootersModule (ref), unifiedEventLogEnums (ref), useAddUnifiedLoggingToCatalogSortEffectModule (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref), cryoModule (ref), widgetConstantsModule (ref), AXCarouselLoadingBuffer (ref), useOnCatalogSortImpressionsDetectedCallbackModule (ref), t (ref)
	local widgetTileWithImpressionsTagging = useCatalogPageMonolithDependenciesModule().WidgetTileWithImpressionsTagging
	local var21 = useTokens()
	local widgetInfo = p3.widgetInfo
	local widgetConfiguration = p3.widgetConfiguration
	local itemsPerRow = p3.itemsPerRow
	local var22 = reactModule.useRef(nil)
	local var23 = useOnRequestImpressionsSignalModule()
	local var24 = if widgetInfo then widgetInfo.id else ""
	local text = "WIDGET_CAROUSEL" .. "_" .. var24
	local var26 = useFirstSeenImpressionFilterModule(var24)
	local var27 = if fFlagAXDeferLookImpressionsForHydration then useComposedImpressionFilterModule({
		useDeferLooksWithoutHydrationFilterModule(widgetInfo),
		var26
	}) else var26
	local var28 = reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: reactModule (copy)
		return setmetatable({}, {
			__index = function(p5, p6) --[[ line: 170 ]]
				-- upvalues: reactModule (copy)
				local var48 = reactModule.createRef()
				rawset(p5, p6, var48)
				
				return var48
			end
		})
	end, {})
	local var29 = useStore()
	local minValue = math.min(if widgetInfo and widgetInfo.content then #widgetInfo.content else 0, itemsPerRow * AXCarouselItemsBasedOnFrameSize - AXCarouselItemsBasedOnFrameSize + 1)
	local medium = var21.Gap.Medium
	local rowWidth = p3.rowWidth or 0
	local var32 = itemsPerRow + AXCarouselPeakFraction / 100
	local var33 = if var32 > 0 then var32 else 1
	local floored = math.floor(math.max(0, rowWidth - (var33 - 1) * medium) / var33)
	local var35 = minValue * floored + math.max(0, minValue - 1) * medium
	local var36, var37 = reactModule.useState({ cardWindowStart = 1, cardWindowIndex = 1 })
	useHydrateCatalogSortOnDemandEffectModule(widgetInfo, widgetConfiguration, itemsPerRow)
	local var38 = reactModule.useCallback(function(p7) --[[ line: 208 ]]
		-- upvalues: floored (ref), medium (ref), var36 (ref), var37 (ref), var23 (ref)
		if not p7 then return end
		local x = p7.CanvasPosition.X
		local maxValue = math.max(1, floored + medium)
		local maxValue_1 = math.max(1, math.floor(x / maxValue))
		local var51 = math.max(0, math.floor(x / maxValue)) + 1
		
		if maxValue_1 ~= var36.cardWindowStart or var51 ~= var36.cardWindowIndex then
			var37({ cardWindowStart = maxValue_1, cardWindowIndex = var51 })
			var23:fire()
		end
	end, { var36, floored, medium, var23 })
	local var39 = useLocalization({
		widgetTitle = if widgetInfo and widgetInfo.template then widgetInfo.template.title else nil,
		widgetDescription = if widgetInfo and widgetInfo.template then widgetInfo.template.description else nil
	})
	local var40 = nil
	local var41 = nil
	local informationPopoverText = nil
	
	if widgetInfo and widgetInfo.template then
		var40 = if widgetInfo.template.title then var39.widgetTitle else widgetInfo.template.localizedTitle
		var41 = if widgetInfo.template.description then var39.widgetDescription else widgetInfo.template.localizedDescription
		
		if fFlagAXCatalogItemInformationPopover then
			informationPopoverText = widgetInfo.template.informationPopoverText
		end
	end
	local var42 = if fFlagAXCatalogItemInformationPopover then useOpenInformationPopoverModule(var40, informationPopoverText) else nil
	local var43 = getFooterVisibilityFromItemFootersModule(if widgetInfo and widgetInfo.template then widgetInfo.template.itemFooters else nil)
	local CAROUSEL = unifiedEventLogEnums.WidgetUiTreatment.CAROUSEL
	useAddUnifiedLoggingToCatalogSortEffectModule({
		containerRef = var22,
		widgetInfo = widgetInfo,
		widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
		widgetRow = p3.widgetRow,
		uiTreatmentType = CAROUSEL
	})
	
	local function buildPerTileAnalyticsInfo(p8, p9) --[[ line: 259 ]]
		-- upvalues: fFlagAXDeferLookImpressionsForHydration (copy), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var29 (ref), cryoModule (copy), p3 (ref), widgetInfo (ref), CAROUSEL (ref)
		return cryoModule.Dictionary.join(p3.widgetAnalyticsInfo, {
			itemPosition = p9,
			itemId = p8.id,
			itemType = p8.type,
			lookType = if not (fFlagAXDeferLookImpressionsForHydration or p8.type ~= itemTypeEnum.Look) then selectHydratedLookTypeModule(var29:getState(), p8.id) else nil,
			themeId = widgetInfo and widgetInfo.tagId,
			gridPositionRow = p3.widgetRow,
			gridPositionColumn = p9,
			uiTreatmentType = CAROUSEL
		})
	end
	
	local var45 = function(p10, p11) --[[ line: 290 ]]
		-- upvalues: buildPerTileAnalyticsInfo (ref), reactModule (copy), widgetTileWithImpressionsTagging (ref), floored (ref), widgetInfo (ref), widgetConstantsModule (copy), var28 (ref), p3 (ref), itemsPerRow (ref), var43 (ref), text (ref)
		return reactModule.createElement(widgetTileWithImpressionsTagging, {
			size = UDim2.new(0, floored, 0, 0),
			cardStyle = if widgetInfo and widgetInfo.template then widgetInfo.template.cardStyle else nil,
			contentType = p10.type or widgetConstantsModule.ContentType.Asset,
			tileContentType = widgetInfo and widgetInfo.type,
			contentId = p10.id or "",
			index = p11,
			refCache = var28,
			resultsListRef = p3.gridRef,
			itemDetailsPeekViewRefs = p3.itemDetailsPeekViewRefs,
			itemsPerRow = itemsPerRow,
			analyticsItemCountPerPage = itemsPerRow,
			isCreatorNameVisible = var43.isCreatorNameVisible,
			isTitleVisible = var43.isTitleVisible,
			isPriceVisible = var43.isPriceVisible,
			impressionsTag = text,
			widgetAnalyticsInfo = buildPerTileAnalyticsInfo(p10, p11),
			onThumbnailLoaded = p3.onThumbnailLoaded
		})
	end
	
	local minValue_1 = math.min(minValue, var36.cardWindowStart + itemsPerRow + AXCarouselLoadingBuffer)
	local var47 = if widgetInfo then widgetInfo.content else nil
	
	return {
		headerText = var40,
		headerDescription = var41,
		informationPopoverText = informationPopoverText,
		onInformationIconActivated = var42,
		seeAllCallback = p3.onSeeAll,
		itemsPerRow = itemsPerRow,
		itemGap = medium,
		itemWidth = floored,
		canvasWidth = var35,
		carouselItemCount = math.max(1, minValue),
		carouselIndex = var36.cardWindowIndex,
		visibleItems = reactModule.useMemo(function() --[[ line: 324 ]]
			-- upvalues: var47 (ref), minValue_1 (ref)
			local var47_1 = var47 or {}
			local t = {}
			
			for i = 1, minValue_1 do
				local var54 = var47_1[i]
				table.insert(t, {
					id = if var54 then var54.id else nil,
					type = if var54 then var54.type else nil,
					absoluteIndex = i,
					gridInformation = { row = 1, column = i }
				})
			end
			return t
		end, { var47, minValue_1 }),
		renderTile = var45,
		onScrollChanged = var38,
		containerRef = var22,
		impressionsKey = text,
		widgetRow = p3.widgetRow,
		onItemsUpdatedSignal = var23,
		onImpressionsDetected = useOnCatalogSortImpressionsDetectedCallbackModule({
			widgetInfo = widgetInfo,
			widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
			widgetRow = p3.widgetRow,
			itemsPerRow = itemsPerRow,
			uiTreatmentType = CAROUSEL
		}),
		filterImpressionFunc = var27,
		carouselMargin = var21.Margin.Large,
		carouselArrowStyleProps = t,
		horizontalMargin = p3.horizontalMargin,
		widgetId = var24,
		ref = p4
	}
end