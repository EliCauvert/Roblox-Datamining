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
local _ = require(script.Parent.CatalogItemGroupSortView)

local function _(p1, p2, p3)
	local var1 = if p2 > 0 then p2 else 1
	
	return math.floor(math.max(0, p1 - (var1 - 1) * p3) / var1)
end

return function(p1)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useTokens (ref), reactModule (ref), useOnRequestImpressionsSignalModule (ref), fFlagAXSduiSeeAllClickLogging (ref), useCatalogSortSeeAllLoggingModule (ref), useFirstSeenImpressionFilterModule (ref), fFlagAXSduiSortSessionImpressionDedup (ref), useSessionSeenImpressionFilterModule (ref), useDeferLooksWithoutHydrationFilterModule (ref), useComposedImpressionFilterModule (ref), fFlagAXDeferLookImpressionsForHydration (ref), useStore (ref), useHydrateCatalogSortOnDemandEffectModule (ref), useLocalization (ref), fFlagAXCatalogItemInformationPopover (ref), useOpenInformationPopoverModule (ref), getFooterVisibilityFromItemFootersModule (ref), unifiedEventLogEnums (ref), useAddUnifiedLoggingToCatalogSortEffectModule (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref), cryoModule (ref), widgetConstantsModule (ref), useOnCatalogSortImpressionsDetectedCallbackModule (ref)
	local widgetTileWithImpressionsTagging = useCatalogPageMonolithDependenciesModule().WidgetTileWithImpressionsTagging
	local var1 = useTokens()
	local widgetInfo = p1.widgetInfo
	local widgetConfiguration = p1.widgetConfiguration
	local itemsPerRow = p1.itemsPerRow
	local rowCount = p1.rowCount or 1
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
	local text = "WIDGET_ITEM_GROUP" .. "_" .. var27
	local var9 = if fFlagAXSduiSortSessionImpressionDedup then useSessionSeenImpressionFilterModule(var8) else useFirstSeenImpressionFilterModule(var8)
	local var10 = if fFlagAXDeferLookImpressionsForHydration then useComposedImpressionFilterModule({
		useDeferLooksWithoutHydrationFilterModule(widgetInfo),
		var9
	}) else var9
	local var11 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy)
		return setmetatable({}, {
			__index = function(p2, p3)
				-- upvalues: reactModule (copy)
				local var12 = reactModule.createRef()
				rawset(p2, p3, var12)
				
				return var12
			end
		})
	end, {})
	local var12 = useStore()
	local medium = var1.Gap.Medium
	local var13 = if itemsPerRow > 0 then itemsPerRow else 1
	local floored = math.floor(math.max(0, (p1.rowWidth or 0) - (var13 - 1) * medium) / var13)
	useHydrateCatalogSortOnDemandEffectModule(widgetInfo, widgetConfiguration, itemsPerRow)
	local var14 = useLocalization({
		widgetTitle = if widgetInfo and widgetInfo.template then widgetInfo.template.title else nil,
		widgetDescription = if widgetInfo and widgetInfo.template then widgetInfo.template.description else nil
	})
	local var15 = nil
	local var16 = nil
	local informationPopoverText = nil
	
	if widgetInfo and widgetInfo.template then
		var15 = if widgetInfo.template.title then var14.widgetTitle else widgetInfo.template.localizedTitle
		var16 = if widgetInfo.template.description then var14.widgetDescription else widgetInfo.template.localizedDescription
		
		if fFlagAXCatalogItemInformationPopover then
			informationPopoverText = widgetInfo.template.informationPopoverText
		end
	end
	local var17 = if fFlagAXCatalogItemInformationPopover then useOpenInformationPopoverModule(var15, informationPopoverText) else nil
	local var18 = getFooterVisibilityFromItemFootersModule(if widgetInfo and widgetInfo.template then widgetInfo.template.itemFooters else nil)
	local ITEM_GROUP = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
	useAddUnifiedLoggingToCatalogSortEffectModule({
		containerRef = var2,
		widgetInfo = widgetInfo,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		uiTreatmentType = ITEM_GROUP,
		seeAllRef = if fFlagAXSduiSeeAllClickLogging then var4 else nil,
		seeAllCallback = if fFlagAXSduiSeeAllClickLogging then p1.onSeeAll else nil
	})
	
	local function buildPerTileAnalyticsInfo(p2, p3)
		-- upvalues: fFlagAXDeferLookImpressionsForHydration (copy), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var12 (ref), cryoModule (copy), p1 (ref), widgetInfo (ref), ITEM_GROUP (ref)
		return cryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
			itemPosition = p3,
			itemId = p2.id,
			itemType = p2.type,
			lookType = if not (fFlagAXDeferLookImpressionsForHydration or p2.type ~= itemTypeEnum.Look) then selectHydratedLookTypeModule(var12:getState(), p2.id) else nil,
			themeId = widgetInfo and widgetInfo.tagId,
			gridPositionRow = p1.widgetRow,
			gridPositionColumn = p3,
			uiTreatmentType = ITEM_GROUP
		})
	end
	
	local var19 = if widgetInfo then widgetInfo.content else nil
	
	return {
		headerText = var15,
		headerDescription = var16,
		informationPopoverText = informationPopoverText,
		onInformationIconActivated = var17,
		seeAllCallback = if fFlagAXSduiSeeAllClickLogging then var5 else p1.onSeeAll,
		seeAllRef = if fFlagAXSduiSeeAllClickLogging then var4 else nil,
		itemsPerRow = itemsPerRow,
		itemGap = medium,
		gridItems = reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), var19 (ref), rowCount (ref), itemsPerRow (ref)
			return cryoModule.List.getRange(var19 or {}, 1, rowCount * itemsPerRow)
		end, { var19, rowCount, itemsPerRow }),
		renderTile = function(p2, p3)
			-- upvalues: buildPerTileAnalyticsInfo (ref), reactModule (copy), widgetTileWithImpressionsTagging (ref), floored (ref), widgetInfo (ref), widgetConstantsModule (copy), var11 (ref), p1 (ref), itemsPerRow (ref), var18 (ref), text (ref)
			return reactModule.createElement(widgetTileWithImpressionsTagging, {
				size = UDim2.new(0, floored, 0, 0),
				cardStyle = if widgetInfo and widgetInfo.template then widgetInfo.template.cardStyle else nil,
				contentType = p2.type or widgetConstantsModule.ContentType.Asset,
				tileContentType = widgetInfo and widgetInfo.type,
				contentId = p2.id or "",
				index = p3,
				refCache = var11,
				resultsListRef = p1.gridRef,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				itemsPerRow = itemsPerRow,
				analyticsItemCountPerPage = itemsPerRow,
				isCreatorNameVisible = var18.isCreatorNameVisible,
				isTitleVisible = var18.isTitleVisible,
				isPriceVisible = var18.isPriceVisible,
				impressionsTag = text,
				widgetAnalyticsInfo = buildPerTileAnalyticsInfo(p2, p3),
				onThumbnailLoaded = p1.onThumbnailLoaded
			})
		end,
		containerRef = var2,
		impressionsKey = text,
		widgetRow = p1.widgetRow,
		onItemsUpdatedSignal = var3,
		onImpressionsDetected = useOnCatalogSortImpressionsDetectedCallbackModule({
			widgetInfo = widgetInfo,
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			widgetRow = p1.widgetRow,
			itemsPerRow = itemsPerRow,
			uiTreatmentType = ITEM_GROUP
		}),
		filterImpressionFunc = var10,
		horizontalMargin = p1.horizontalMargin,
		widgetId = var8
	}
end