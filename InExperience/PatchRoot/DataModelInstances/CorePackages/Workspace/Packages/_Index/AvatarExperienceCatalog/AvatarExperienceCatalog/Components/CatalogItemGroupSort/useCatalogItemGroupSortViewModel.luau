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
local _ = require(script.Parent.CatalogItemGroupSortView)

local function _(p0, p1, p2) --[[ line: 105 | named "computeItemWidth" ]]
	local var16 = if p1 > 0 then p1 else 1
	
	return math.floor(math.max(0, p0 - (var16 - 1) * p2) / var16)
end

return function(p3) --[[ line: 112 | named "useCatalogItemGroupSortViewModel" ]]
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useTokens (ref), reactModule (ref), useOnRequestImpressionsSignalModule (ref), useFirstSeenImpressionFilterModule (ref), useDeferLooksWithoutHydrationFilterModule (ref), useComposedImpressionFilterModule (ref), fFlagAXDeferLookImpressionsForHydration (ref), useStore (ref), useHydrateCatalogSortOnDemandEffectModule (ref), useLocalization (ref), fFlagAXCatalogItemInformationPopover (ref), useOpenInformationPopoverModule (ref), getFooterVisibilityFromItemFootersModule (ref), unifiedEventLogEnums (ref), useAddUnifiedLoggingToCatalogSortEffectModule (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref), cryoModule (ref), widgetConstantsModule (ref), useOnCatalogSortImpressionsDetectedCallbackModule (ref)
	local widgetTileWithImpressionsTagging = useCatalogPageMonolithDependenciesModule().WidgetTileWithImpressionsTagging
	local var17 = useTokens()
	local widgetInfo = p3.widgetInfo
	local widgetConfiguration = p3.widgetConfiguration
	local itemsPerRow = p3.itemsPerRow
	local rowCount = p3.rowCount or 1
	local var19 = reactModule.useRef(nil)
	local var20 = useOnRequestImpressionsSignalModule()
	local var21 = if widgetInfo then widgetInfo.id else ""
	local text = "WIDGET_ITEM_GROUP" .. "_" .. var21
	local var23 = useFirstSeenImpressionFilterModule(var21)
	local var24 = if fFlagAXDeferLookImpressionsForHydration then useComposedImpressionFilterModule({
		useDeferLooksWithoutHydrationFilterModule(widgetInfo),
		var23
	}) else var23
	local var25 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: reactModule (copy)
		return setmetatable({}, {
			__index = function(p4, p5) --[[ line: 156 ]]
				-- upvalues: reactModule (copy)
				local var36 = reactModule.createRef()
				rawset(p4, p5, var36)
				
				return var36
			end
		})
	end, {})
	local var26 = useStore()
	local medium = var17.Gap.Medium
	local var27 = if itemsPerRow > 0 then itemsPerRow else 1
	local floored = math.floor(math.max(0, (p3.rowWidth or 0) - (var27 - 1) * medium) / var27)
	useHydrateCatalogSortOnDemandEffectModule(widgetInfo, widgetConfiguration, itemsPerRow)
	local var29 = useLocalization({
		widgetTitle = if widgetInfo and widgetInfo.template then widgetInfo.template.title else nil,
		widgetDescription = if widgetInfo and widgetInfo.template then widgetInfo.template.description else nil
	})
	local var30 = nil
	local var31 = nil
	local informationPopoverText = nil
	
	if widgetInfo and widgetInfo.template then
		var30 = if widgetInfo.template.title then var29.widgetTitle else widgetInfo.template.localizedTitle
		var31 = if widgetInfo.template.description then var29.widgetDescription else widgetInfo.template.localizedDescription
		
		if fFlagAXCatalogItemInformationPopover then
			informationPopoverText = widgetInfo.template.informationPopoverText
		end
	end
	local var32 = if fFlagAXCatalogItemInformationPopover then useOpenInformationPopoverModule(var30, informationPopoverText) else nil
	local var33 = getFooterVisibilityFromItemFootersModule(if widgetInfo and widgetInfo.template then widgetInfo.template.itemFooters else nil)
	local ITEM_GROUP = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
	useAddUnifiedLoggingToCatalogSortEffectModule({
		containerRef = var19,
		widgetInfo = widgetInfo,
		widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
		widgetRow = p3.widgetRow,
		uiTreatmentType = ITEM_GROUP
	})
	
	local function buildPerTileAnalyticsInfo(p6, p7) --[[ line: 208 ]]
		-- upvalues: fFlagAXDeferLookImpressionsForHydration (copy), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var26 (ref), cryoModule (copy), p3 (ref), widgetInfo (ref), ITEM_GROUP (ref)
		return cryoModule.Dictionary.join(p3.widgetAnalyticsInfo, {
			itemPosition = p7,
			itemId = p6.id,
			itemType = p6.type,
			lookType = if not (fFlagAXDeferLookImpressionsForHydration or p6.type ~= itemTypeEnum.Look) then selectHydratedLookTypeModule(var26:getState(), p6.id) else nil,
			themeId = widgetInfo and widgetInfo.tagId,
			gridPositionRow = p3.widgetRow,
			gridPositionColumn = p7,
			uiTreatmentType = ITEM_GROUP
		})
	end
	
	local var35 = if widgetInfo then widgetInfo.content else nil
	
	return {
		headerText = var30,
		headerDescription = var31,
		informationPopoverText = informationPopoverText,
		onInformationIconActivated = var32,
		seeAllCallback = p3.onSeeAll,
		itemsPerRow = itemsPerRow,
		itemGap = medium,
		gridItems = reactModule.useMemo(function() --[[ line: 264 ]]
			-- upvalues: cryoModule (copy), var35 (ref), rowCount (ref), itemsPerRow (ref)
			return cryoModule.List.getRange(var35 or {}, 1, rowCount * itemsPerRow)
		end, { var35, rowCount, itemsPerRow }),
		renderTile = function(p8, p9) --[[ line: 239 ]]
			-- upvalues: buildPerTileAnalyticsInfo (ref), reactModule (copy), widgetTileWithImpressionsTagging (ref), floored (ref), widgetInfo (ref), widgetConstantsModule (copy), var25 (ref), p3 (ref), itemsPerRow (ref), var33 (ref), text (ref)
			return reactModule.createElement(widgetTileWithImpressionsTagging, {
				size = UDim2.new(0, floored, 0, 0),
				cardStyle = if widgetInfo and widgetInfo.template then widgetInfo.template.cardStyle else nil,
				contentType = p8.type or widgetConstantsModule.ContentType.Asset,
				tileContentType = widgetInfo and widgetInfo.type,
				contentId = p8.id or "",
				index = p9,
				refCache = var25,
				resultsListRef = p3.gridRef,
				itemDetailsPeekViewRefs = p3.itemDetailsPeekViewRefs,
				itemsPerRow = itemsPerRow,
				analyticsItemCountPerPage = itemsPerRow,
				isCreatorNameVisible = var33.isCreatorNameVisible,
				isTitleVisible = var33.isTitleVisible,
				isPriceVisible = var33.isPriceVisible,
				impressionsTag = text,
				widgetAnalyticsInfo = buildPerTileAnalyticsInfo(p8, p9),
				onThumbnailLoaded = p3.onThumbnailLoaded
			})
		end,
		containerRef = var19,
		impressionsKey = text,
		widgetRow = p3.widgetRow,
		onItemsUpdatedSignal = var20,
		onImpressionsDetected = useOnCatalogSortImpressionsDetectedCallbackModule({
			widgetInfo = widgetInfo,
			widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
			widgetRow = p3.widgetRow,
			itemsPerRow = itemsPerRow,
			uiTreatmentType = ITEM_GROUP
		}),
		filterImpressionFunc = var24,
		horizontalMargin = p3.horizontalMargin,
		widgetId = var21
	}
end