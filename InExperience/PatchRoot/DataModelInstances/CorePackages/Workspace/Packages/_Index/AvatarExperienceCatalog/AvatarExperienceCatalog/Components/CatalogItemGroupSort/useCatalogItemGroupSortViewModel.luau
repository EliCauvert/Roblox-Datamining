local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Parent.AvatarExperienceCommon)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local UnifiedEventLogEnums = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogItemInformationPopover = AvatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local FFlagAXDeferLookImpressionsForHydration = AvatarExperienceFlagsModule.FFlagAXDeferLookImpressionsForHydration
local FFlagAXSduiSortSessionImpressionDedup = AvatarExperienceFlagsModule.FFlagAXSduiSortSessionImpressionDedup
local FFlagAXSduiSeeAllClickLogging = AvatarExperienceFlagsModule.FFlagAXSduiSeeAllClickLogging
local FFlagAXSduiSponsoredItemClickTracking = AvatarExperienceFlagsModule.FFlagAXSduiSponsoredItemClickTracking
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local GetFooterVisibilityFromItemFootersModule = require(AvatarExperienceCatalog.Utils.getFooterVisibilityFromItemFooters)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local SelectHydratedLookTypeModule = require(AvatarExperienceCatalog.State.Selectors.selectHydratedLookType)
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local UseOnRequestImpressionsSignalModule = require(script.Parent.Parent.Hooks.useOnRequestImpressionsSignal)
local UseHydrateCatalogSortOnDemandEffectModule = require(script.Parent.Parent.Hooks.useHydrateCatalogSortOnDemandEffect)
local UseAddUnifiedLoggingToCatalogSortEffectModule = require(script.Parent.Parent.Hooks.useAddUnifiedLoggingToCatalogSortEffect)
local UseFirstSeenImpressionFilterModule = require(script.Parent.Parent.Hooks.useFirstSeenImpressionFilter)
local UseSessionSeenImpressionFilterModule = require(script.Parent.Parent.Hooks.useSessionSeenImpressionFilter)
local UseDeferLooksWithoutHydrationFilterModule = require(script.Parent.Parent.Hooks.useDeferLooksWithoutHydrationFilter)
local UseComposedImpressionFilterModule = require(script.Parent.Parent.Hooks.useComposedImpressionFilter)
local UseOnCatalogSortImpressionsDetectedCallbackModule = require(script.Parent.Parent.Hooks.useOnCatalogSortImpressionsDetectedCallback)
local UseOpenInformationPopoverModule = require(script.Parent.Parent.Hooks.useOpenInformationPopover)
local UseCatalogSortSeeAllLoggingModule = require(script.Parent.Parent.Hooks.useCatalogSortSeeAllLogging)
local _ = require(script.Parent.CatalogItemGroupSortView)

local function _(p1, p2: number, p3): number
	local v1 = if p2 > 0 then p2 else 1
	
	return (math.floor(math.max(0, p1 - (v1 - 1) * p3) / v1))
end

return function(p1)
	-- upvalues: UseCatalogPageMonolithDependenciesModule (copy), UseTokensFunction (copy), ReactModule (copy), UseOnRequestImpressionsSignalModule (copy), FFlagAXSduiSeeAllClickLogging (copy), UseCatalogSortSeeAllLoggingModule (copy), UseFirstSeenImpressionFilterModule (copy), FFlagAXSduiSortSessionImpressionDedup (copy), UseSessionSeenImpressionFilterModule (copy), UseDeferLooksWithoutHydrationFilterModule (copy), UseComposedImpressionFilterModule (copy), FFlagAXDeferLookImpressionsForHydration (copy), UseStoreFunction (copy), UseHydrateCatalogSortOnDemandEffectModule (copy), UseLocalizationFunction (copy), FFlagAXCatalogItemInformationPopover (copy), UseOpenInformationPopoverModule (copy), GetFooterVisibilityFromItemFootersModule (copy), UnifiedEventLogEnums (copy), UseAddUnifiedLoggingToCatalogSortEffectModule (copy), ItemTypeEnum (copy), SelectHydratedLookTypeModule (copy), CryoModule (copy), WidgetConstantsModule (copy), FFlagAXSduiSponsoredItemClickTracking (copy), UseOnCatalogSortImpressionsDetectedCallbackModule (copy)
	local WidgetTileWithImpressionsTagging = UseCatalogPageMonolithDependenciesModule().WidgetTileWithImpressionsTagging
	local UseTokensResult = UseTokensFunction()
	local WidgetInfo = p1.widgetInfo
	local WidgetConfiguration = p1.widgetConfiguration
	local ItemsPerRow: number = p1.itemsPerRow
	local RowCount = p1.rowCount or 1
	local UseRefResult = ReactModule.useRef(nil)
	local UseOnRequestImpressionsSignalModuleResult = UseOnRequestImpressionsSignalModule()
	local v1 = nil
	local v2 = nil
	
	if FFlagAXSduiSeeAllClickLogging then
		v1, v40 = UseCatalogSortSeeAllLoggingModule(p1.onSeeAll, p1.widgetAnalyticsInfo)
	end
	local Id = WidgetInfo and WidgetInfo.id or ""
	local Text = "WIDGET_ITEM_GROUP" .. "_" .. Id
	local UseSessionSeenImpressionFilterModuleResult = if FFlagAXSduiSortSessionImpressionDedup then UseSessionSeenImpressionFilterModule(Id) else UseFirstSeenImpressionFilterModule(Id)
	local UseComposedImpressionFilterModuleResult = UseComposedImpressionFilterModule({
		UseDeferLooksWithoutHydrationFilterModule(WidgetInfo),
		UseSessionSeenImpressionFilterModuleResult
	})
	local UseComposedImpressionFilterModuleResult1 = if FFlagAXDeferLookImpressionsForHydration then UseComposedImpressionFilterModuleResult else UseSessionSeenImpressionFilterModuleResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval)
		return (setmetatable({}, {
			__index = function(p2, p3)
				-- upvalues: ReactModule (upval)
				local Ref = ReactModule.createRef()
				rawset(p2, p3, Ref)
				
				return Ref
			end
		}))
	end, {})
	local UseStoreResult = UseStoreFunction()
	local Medium = UseTokensResult.Gap.Medium
	local ItemsPerRow1 = if ItemsPerRow > 0 then ItemsPerRow else 1
	local Floored = math.floor(math.max(0, (p1.rowWidth or 0) - (ItemsPerRow1 - 1) * Medium) / ItemsPerRow1)
	UseHydrateCatalogSortOnDemandEffectModule(WidgetInfo, WidgetConfiguration, ItemsPerRow)
	local UseLocalizationResult = UseLocalizationFunction({
		widgetTitle = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.title else nil,
		widgetDescription = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.description else nil
	})
	local WidgetTitle = nil
	local WidgetDescription = nil
	local InformationPopoverText = nil
	
	if WidgetInfo and WidgetInfo.template then
		WidgetTitle = if WidgetInfo.template.title then UseLocalizationResult.widgetTitle else WidgetInfo.template.localizedTitle
		WidgetDescription = if WidgetInfo.template.description then UseLocalizationResult.widgetDescription else WidgetInfo.template.localizedDescription
		
		if FFlagAXCatalogItemInformationPopover then
			InformationPopoverText = WidgetInfo.template.informationPopoverText
		end
	end
	local UseOpenInformationPopoverModuleResult = if FFlagAXCatalogItemInformationPopover then UseOpenInformationPopoverModule(WidgetTitle, InformationPopoverText) else nil
	local FooterVisibilityFromItemFootersModule = GetFooterVisibilityFromItemFootersModule(if WidgetInfo and WidgetInfo.template then WidgetInfo.template.itemFooters else nil)
	local ITEMGROUP = UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
	UseAddUnifiedLoggingToCatalogSortEffectModule({
		containerRef = UseRefResult,
		widgetInfo = WidgetInfo,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		uiTreatmentType = ITEMGROUP,
		seeAllRef = if FFlagAXSduiSeeAllClickLogging then v1 else nil,
		seeAllCallback = if FFlagAXSduiSeeAllClickLogging then p1.onSeeAll else nil
	})
	
	local function buildPerTileAnalyticsInfo(p2, GridPositionColumn)
		-- upvalues: FFlagAXDeferLookImpressionsForHydration (upval), ItemTypeEnum (upval), SelectHydratedLookTypeModule (upval), UseStoreResult (copy), CryoModule (upval), p1 (copy), WidgetInfo (copy), ITEMGROUP (copy)
		return CryoModule.Dictionary.join(p1.widgetAnalyticsInfo, {
			itemPosition = GridPositionColumn,
			itemId = p2.id,
			itemType = p2.type,
			lookType = if FFlagAXDeferLookImpressionsForHydration or p2.type ~= ItemTypeEnum.Look then nil else SelectHydratedLookTypeModule(UseStoreResult:getState(), p2.id),
			themeId = WidgetInfo and WidgetInfo.tagId,
			gridPositionRow = p1.widgetRow,
			gridPositionColumn = GridPositionColumn,
			uiTreatmentType = ITEMGROUP
		})
	end
	
	local AdTrackingDataByItemId = p1.adTrackingDataByItemId
	local Content = if WidgetInfo then WidgetInfo.content else nil
	
	return {
		headerText = WidgetTitle,
		headerDescription = WidgetDescription,
		informationPopoverText = InformationPopoverText,
		onInformationIconActivated = UseOpenInformationPopoverModuleResult,
		seeAllCallback = if FFlagAXSduiSeeAllClickLogging then v2 else p1.onSeeAll,
		seeAllRef = if FFlagAXSduiSeeAllClickLogging then v1 else nil,
		itemsPerRow = ItemsPerRow,
		itemGap = Medium,
		gridItems = ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), Content (copy), RowCount (copy), ItemsPerRow (copy)
			return CryoModule.List.getRange(Content or {}, 1, RowCount * ItemsPerRow)
		end, { Content, RowCount, ItemsPerRow }),
		renderTile = function(p2, Index)
			-- upvalues: buildPerTileAnalyticsInfo (copy), ReactModule (upval), WidgetTileWithImpressionsTagging (copy), Floored (copy), WidgetInfo (copy), WidgetConstantsModule (upval), UseMemoResult (copy), p1 (copy), ItemsPerRow (copy), FooterVisibilityFromItemFootersModule (copy), Text (copy), FFlagAXSduiSponsoredItemClickTracking (upval), AdTrackingDataByItemId (copy)
			return ReactModule.createElement(WidgetTileWithImpressionsTagging, {
				size = UDim2.new(0, Floored, 0, 0),
				cardStyle = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.cardStyle else nil,
				contentType = p2.type or WidgetConstantsModule.ContentType.Asset,
				tileContentType = WidgetInfo and WidgetInfo.type,
				contentId = p2.id or "",
				index = Index,
				refCache = UseMemoResult,
				resultsListRef = p1.gridRef,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				itemsPerRow = ItemsPerRow,
				analyticsItemCountPerPage = ItemsPerRow,
				isCreatorNameVisible = FooterVisibilityFromItemFootersModule.isCreatorNameVisible,
				isTitleVisible = FooterVisibilityFromItemFootersModule.isTitleVisible,
				isPriceVisible = FooterVisibilityFromItemFootersModule.isPriceVisible,
				impressionsTag = Text,
				widgetAnalyticsInfo = buildPerTileAnalyticsInfo(p2, Index),
				onThumbnailLoaded = p1.onThumbnailLoaded,
				adTrackingData = if FFlagAXSduiSponsoredItemClickTracking and AdTrackingDataByItemId and p2.id then AdTrackingDataByItemId[p2.id] else nil
			})
		end,
		containerRef = UseRefResult,
		impressionsKey = Text,
		widgetRow = p1.widgetRow,
		onItemsUpdatedSignal = UseOnRequestImpressionsSignalModuleResult,
		onImpressionsDetected = UseOnCatalogSortImpressionsDetectedCallbackModule({
			widgetInfo = WidgetInfo,
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			widgetRow = p1.widgetRow,
			itemsPerRow = ItemsPerRow,
			uiTreatmentType = ITEMGROUP
		}),
		filterImpressionFunc = UseComposedImpressionFilterModuleResult1,
		horizontalMargin = p1.horizontalMargin,
		widgetId = Id
	}
end