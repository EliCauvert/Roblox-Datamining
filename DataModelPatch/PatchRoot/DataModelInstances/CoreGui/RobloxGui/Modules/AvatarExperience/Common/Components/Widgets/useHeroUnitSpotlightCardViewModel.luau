local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseImpressionsTaggerFunction = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local GetItemSelectionActionFunction = AvatarExperienceAnalyticsModule.Utils.getItemSelectionAction
local GetMarketplaceUnifiedItemTypeFunction = AvatarExperienceAnalyticsModule.Utils.getMarketplaceUnifiedItemType
local GetTimedOptionForItemDataFunction = AvatarExperienceAnalyticsModule.Utils.getTimedOptionForItemData
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseWidgetItemPayloadFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useWidgetItemPayload
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local SendUnifiedClickItemDetailsEventFunction = AvatarExperienceAnalyticsModule.sendUnifiedClickItemDetailsEvent
local UseUnifiedEventTaggingFunction = AvatarExperienceAnalyticsModule.useUnifiedEventTagging
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local SelectIsFullViewTableModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullViewTable)
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local MaybePromptForR15UpgradeModule = require(Modules.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local UseTryOnAssetOrBundleModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.useTryOnAssetOrBundle)
local UseCatalogCategoryImpressionsInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local _ = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitSpotlightCardView)
local UseHeroUnitResponsiveStyleModule = require(Modules.AvatarExperience.Common.Components.Widgets.useHeroUnitResponsiveStyle)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAddTypesToWidgetItems = AvatarExperienceFlagsModule.FFlagAddTypesToWidgetItems
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local AXHeroBugfixesRemoveAdditionalAssetInfoCall = game:DefineFastFlag("AXHeroBugfixesRemoveAdditionalAssetInfoCall", false)

local function selectSpotlightCardTryOnState(p1, ItemId, Type)
	-- upvalues: GetTryOnItemReducerKeyFunction (copy), FFlagAXMISEnableMultiShopping (copy), ConstantsModule (copy), PeekViewState (copy), SelectIsFullViewTableModule (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	local TryOnItems = OutfitTryOn.TryOnItems
	local IsSelected = false
	
	if ItemId and Type then
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(ItemId, Type)
		
		if FFlagAXMISEnableMultiShopping then
			IsSelected = TryOnItems[TryOnItemReducerKey] ~= nil
		else
			local NoLookId = OutfitTryOn.LookId == nil
			IsSelected = TryOnItems[TryOnItemReducerKey] ~= nil and NoLookId
		end
	end
	return {
		isSelected = IsSelected,
		isAvatarR6 = p1.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6,
		isItemDetailsViewStateFull = p1.AvatarExperience.Common.ItemDetailsPeekView.viewState == PeekViewState.Full,
		fullView = SelectIsFullViewTableModule(p1)
	}
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), RoactNetworkingModule (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), UseImpressionsTaggerFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ItemDataModule (copy), AXHeroBugfixesRemoveAdditionalAssetInfoCall (copy), FetchAssetOrBundleInfoModule (copy), selectSpotlightCardTryOnState (copy), TutilsModule (copy), MaybePromptForR15UpgradeModule (copy), UseTryOnAssetOrBundleModule (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), UseCatalogCategoryImpressionsInfoModule (copy), AvatarScreen (copy), GetMarketplaceUnifiedItemTypeFunction (copy), UnifiedEventLogEnums (copy), UseWidgetItemPayloadFunction (copy), GetItemSelectionActionFunction (copy), GetTimedOptionForItemDataFunction (copy), FFlagAddTypesToWidgetItems (copy), UseUnifiedEventTaggingFunction (copy), UnifiedEventLogConstants (copy), SendUnifiedClickItemDetailsEventFunction (copy), CatalogUtilsModule (copy), OpenItemDetailsModule (copy), UseHeroUnitResponsiveStyleModule (copy), UseLocalizationFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local WidgetInfo = p1.widgetInfo
	local Template = WidgetInfo.template
	local ContentEntry = (WidgetInfo.content or {})[1]
	local Id = if ContentEntry then ContentEntry.id else nil
	local Type = if ContentEntry then ContentEntry.type else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactNetworkingModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefResult = ReactModule.useRef(nil)
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, 1)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: Id (copy), Type (copy)
		if Id and Type then
			local HydratedWidget = p2.AvatarExperience.Common.Widgets.HydratedWidgetData[Type]
			
			return if HydratedWidget then HydratedWidget[tostring(Id)] else nil
		else
			return nil
		end
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: Id (copy), Type (copy), ItemDataModule (upval)
		return if Id and Type then ItemDataModule(p2.AvatarExperience.Common, tostring(Id), Type) else nil
	end, GetUseSelectorDeepEqualsFunction())
	
	if not AXHeroBugfixesRemoveAdditionalAssetInfoCall then
		ReactModule.useEffect(function()
			-- upvalues: Id (copy), Type (copy), UseDispatchResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy)
			if Id and Type then
				UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult, tostring(Id), Type))
			end
		end, {
			Id,
			Type,
			UseRoactServiceModuleResult1,
			UseRoactServiceModuleResult,
			UseDispatchResult
		})
	end
	local Text = if Id then tostring(Id) else nil
	local UseSelectorResult2 = UseSelectorFunction(ReactModule.useCallback(function(p2)
		-- upvalues: selectSpotlightCardTryOnState (upval), Text (copy), Type (copy)
		return (selectSpotlightCardTryOnState(p2, Text, Type))
	end, { Text, Type }), TutilsModule.shallowEqual)
	local UseTryOnAssetOrBundleModuleResult = UseTryOnAssetOrBundleModule({
		itemId = Text,
		itemType = Type,
		itemData = UseSelectorResult1,
		isSelected = UseSelectorResult2.isSelected,
		textButtonRef = UseRefResult,
		fullView = UseSelectorResult2.fullView,
		isAvatarR6 = UseSelectorResult2.isAvatarR6,
		isItemDetailsViewStateFull = UseSelectorResult2.isItemDetailsViewStateFull,
		maybePromptForR15Upgrade = ReactModule.useCallback(function()
			-- upvalues: Text (copy), Type (copy), UseDispatchResult (copy), MaybePromptForR15UpgradeModule (upval), UseNavigationResult (copy)
			return if Text and Type then UseDispatchResult(MaybePromptForR15UpgradeModule(UseNavigationResult, Text, Type, nil, nil, false)) else false
		end, { UseDispatchResult, UseNavigationResult, Text, Type }),
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo
	})
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	local UseCatalogCategoryImpressionsInfoModuleResult = if FFlagAXCatalogCategoriesStoreImprovePerf then UseCatalogCategoryImpressionsInfoModule(Name == AvatarScreen.CatalogSearch, p1.selectedCategory, p1.selectedSubcategory, p1.selectedCategoryInfo) else UseCatalogCategoryImpressionsInfoModule(Name == AvatarScreen.CatalogSearch)
	local Price = if UseSelectorResult then UseSelectorResult.price else nil
	local IsSelected = UseSelectorResult2.isSelected
	UseUnifiedEventTaggingFunction({
		ref = UseRefResult,
		payload = UseWidgetItemPayloadFunction({
			itemPosition = 1,
			gridPositionColumn = 1,
			action = GetItemSelectionActionFunction(IsSelected),
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			itemId = Text,
			itemType = GetMarketplaceUnifiedItemTypeFunction(Type) or UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
			gridPositionRow = p1.widgetRow or 1,
			uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.HERO_UNIT,
			themeId = WidgetInfo.tagId,
			category = UseCatalogCategoryImpressionsInfoModuleResult.impressionsCategory,
			subcategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsSubcategory,
			taxonomyId = UseCatalogCategoryImpressionsInfoModuleResult.impressionsTaxonomyId,
			widgetItemPrice = Price,
			widgetTimedOption = GetTimedOptionForItemDataFunction(UseSelectorResult1),
			widgetAssetType = if FFlagAddTypesToWidgetItems and UseSelectorResult1 then UseSelectorResult1.assetType else nil,
			widgetBundleType = if FFlagAddTypesToWidgetItems and UseSelectorResult1 then UseSelectorResult1.bundleType else nil
		}),
		isReady = Text ~= nil and Price ~= nil,
		options = {
			isSelected = IsSelected,
			sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
		}
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Text (copy), Type (copy), SendUnifiedClickItemDetailsEventFunction (upval), UseAvatarRouteResult (copy), CatalogUtilsModule (upval), UseSelectorResult1 (copy), UseSelectorResult (copy), UseDispatchResult (copy), OpenItemDetailsModule (upval), UseRoactServiceModuleResult (copy), UseNavigationResult (copy), p1 (copy)
		if Text and Type then
			SendUnifiedClickItemDetailsEventFunction({
				itemId = Text,
				itemType = Type,
				avatarRoute = UseAvatarRouteResult
			})
			local Price = if UseSelectorResult then UseSelectorResult.price else nil
			UseDispatchResult(OpenItemDetailsModule({
				showFullWithNoPeekView = true,
				itemId = Text,
				itemType = Type,
				itemSubType = CatalogUtilsModule.GetItemSubType(Type, UseSelectorResult1),
				priceInRobux = (if UseSelectorResult1 then UseSelectorResult1.lowestPrice or UseSelectorResult1.priceInRobux else nil) or Price,
				catalogAnalytics = UseRoactServiceModuleResult,
				avatarRoute = UseAvatarRouteResult,
				navigation = UseNavigationResult,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				resultsListRef = p1.resultsListRef,
				widgetInfo = p1.widgetAnalyticsInfo
			}))
			
			return
		end
	end, {
		UseDispatchResult, Text, Type, UseSelectorResult1, UseSelectorResult,
		UseRoactServiceModuleResult, UseAvatarRouteResult, UseNavigationResult,
		p1.itemDetailsPeekViewRefs, p1.resultsListRef, p1.widgetAnalyticsInfo
	})
	local UseHeroUnitResponsiveStyleModuleResult = UseHeroUnitResponsiveStyleModule(p1.rowWidth)
	
	return {
		cardRef = UseRefResult,
		cardHeight = UseHeroUnitResponsiveStyleModuleResult.spotlightCardHeight,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Large),
		backgroundLayers = if Template.widgetStyle and Template.widgetStyle.backgroundLayers then Template.widgetStyle.backgroundLayers else nil,
		titleText = Template.localizedTitle,
		titleTag = UseHeroUnitResponsiveStyleModuleResult.titleTag,
		descriptionText = Template.localizedDescription,
		descriptionTag = UseHeroUnitResponsiveStyleModuleResult.descriptionTag,
		titleGroupGapTag = UseHeroUnitResponsiveStyleModuleResult.titleGroupGapTag,
		priceInRobux = Price,
		availableUntil = Template.availableUntil,
		buttonSize = UseHeroUnitResponsiveStyleModuleResult.spotlightButtonSize,
		cardPaddingTag = UseHeroUnitResponsiveStyleModuleResult.cardPaddingTag,
		detailsButtonText = UseLocalizationFunction({ detailsButtonText = "Feature.Catalog.Label.Details" }).detailsButtonText,
		isSelected = UseSelectorResult2.isSelected,
		onTryOn = UseTryOnAssetOrBundleModuleResult,
		onOpenDetails = UseResult
	}
end