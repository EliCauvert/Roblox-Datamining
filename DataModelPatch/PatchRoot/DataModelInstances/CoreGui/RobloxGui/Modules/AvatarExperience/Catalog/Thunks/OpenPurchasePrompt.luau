local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local PurchaseProductModule = require(Modules.AvatarExperience.Catalog.Thunks.PurchaseProduct)
local HandlePurchaseSuccessModule = require(Modules.AvatarExperience.Catalog.Thunks.HandlePurchaseSuccess)
local PromiseModule = require(CorePackages.Packages.Promise)
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local RobuxUpsellTriggerContextModule = require(Modules.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NewResult = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local CryoModule = require(CorePackages.Packages.Cryo)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetIsUserEligibleForUnifiedPurchaseFlowFunction = PurchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local FFlagAddTypesToWidgetItems = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagAXEnableUnifiedProductPurchaseForMarketplace = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableUnifiedProductPurchaseForMarketplace
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = SharedFlagsModule.FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagPurchasePromptSubtitleForTimedOptions = SharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local FFlagPurchaseModalTimedOptionExtension = SharedFlagsModule.FFlagPurchaseModalTimedOptionExtension
local FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration
local FFlagFixUnifiedPurchaseResalePurchases = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagFixUnifiedPurchaseResalePurchases
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles
local FFlagSkipCompletionModalForMarketplace = SharedFlagsModule.FFlagSkipCompletionModalForMarketplace
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors

local function buildUnifiedPurchaseProductInfo(p1, CollectibleProductId, PriceInRobux, Id, ProductType, TimedOptionDays)
	local t = {}
	local DiscountInformation = p1.discountInformation
	
	if TimedOptionDays and TimedOptionDays ~= 0 and p1.timedOptions then
		for _, timedOption in p1.timedOptions do
			if timedOption.days == TimedOptionDays then
				DiscountInformation = timedOption.discountInformation
				break
			end
		end
	end
	if DiscountInformation then
		local Discount = DiscountInformation.discounts[1]
		t.Type = Discount.discountCampaign
		t.AmountInRobux = Discount.robuxDiscountAmount
		t.Percent = Discount.robuxDiscountPercentage
	end
	return {
		AssetType = p1.assetType,
		CollectibleItemId = p1.collectibleItemId,
		CollectibleProductId = CollectibleProductId,
		Description = p1.description,
		PriceInRobux = PriceInRobux,
		BasePriceInRobux = if DiscountInformation then DiscountInformation.originalPrice else nil,
		PriceDiscountDetails = { t },
		ImageUrl = p1.imageUrl,
		Name = p1.name,
		ProductId = Id,
		AssetTypeId = p1.assetType,
		ProductType = ProductType,
		TargetId = p1.id,
		AssetId = p1.id,
		items = p1.items,
		product = { id = Id, isForSale = p1.isPurchasable }
	}
end

local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local config = {
	toastMessage = "IAPExperience.RobuxUpsell.Title.InsufficientRobux",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

return function(p2, OnOverlayClosed, p3, p4, FromProfile, FromAvatarRoute, ItemId, Asset, p5, p6, WidgetInfo, FromContentFeed, TimedOptionDays, p7, ShouldFetchCartPricing)
	-- upvalues: ItemDataModule (copy), AccessoryAdjustmentUtilsModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreen (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ConstantsModule (copy), CatalogUtilsModule (copy), FFlagAXEnableUnifiedProductPurchaseForMarketplace (copy), FFlagFixUnifiedPurchaseResalePurchases (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), NavigateWithLockFunction (copy), SetCurrentToastMessageModule (copy), config (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy), RobuxUpsellTriggerContextModule (copy), PurchaseProductModule (copy), HandlePurchaseSuccessModule (copy), CryoModule (copy), UnifiedEventLogEnums (copy), FFlagAddTypesToWidgetItems (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), CartIdService (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogConstants (copy), CloseCentralOverlayModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration (copy), PromiseModule (copy), buildUnifiedPurchaseProductInfo (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), NewResult (copy), FFlagPurchaseModalTimedOptionExtension (copy), FFlagSkipCompletionModalForMarketplace (copy), FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy)
	return function(p8)
		-- upvalues: ItemId (copy), Asset (copy), FromAvatarRoute (copy), ItemDataModule (upval), AccessoryAdjustmentUtilsModule (upval), p4 (copy), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreen (upval), FromProfile (copy), FromContentFeed (copy), FFlagAXFixPurchaseSurfaceLogging (upval), p3 (copy), ConstantsModule (upval), CatalogUtilsModule (upval), TimedOptionDays (copy), FFlagAXEnableUnifiedProductPurchaseForMarketplace (upval), FFlagFixUnifiedPurchaseResalePurchases (upval), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval), GetTTIEventNameFunction (upval), ProductPurchaseSurface (upval), TimeToInteractiveTracker (upval), OnOverlayClosed (copy), WidgetInfo (copy), NavigateWithLockFunction (upval), p5 (copy), SetCurrentToastMessageModule (upval), p6 (copy), config (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), OpenCentralOverlayForEconomicRestrictionPromptModule (upval), RobuxUpsellTriggerContextModule (upval), PurchaseProductModule (upval), p2 (copy), HandlePurchaseSuccessModule (upval), CryoModule (upval), UnifiedEventLogEnums (upval), FFlagAddTypesToWidgetItems (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), CartIdService (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogConstants (upval), CloseCentralOverlayModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration (upval), PromiseModule (upval), buildUnifiedPurchaseProductInfo (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), FFlagPurchasePromptSubtitleForTimedOptions (upval), p7 (copy), NewResult (upval), ShouldFetchCartPricing (copy), FFlagPurchaseModalTimedOptionExtension (upval), FFlagSkipCompletionModalForMarketplace (upval), FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles (upval), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval)
		local State = p8:getState()
		local Name = FromAvatarRoute.opaque.name
		local ItemDataModuleResult = ItemDataModule(State.AvatarExperience.Common, ItemId, Asset)
		
		if not ItemDataModuleResult then return end
		local CheckTryOnHasAdjustmentsResult = AccessoryAdjustmentUtilsModule.checkTryOnHasAdjustments(State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, (tostring(ItemId)))
		
		if p4 then
			local RequestId = State.AvatarExperience.Common.Widgets.WidgetInfo.RequestId
			local SearchKeyword = nil
			local CurrentRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(State) else State.Navigation and State.Navigation.currentRoute
			
			if CurrentRoute and CurrentRoute.name == AvatarScreen.CatalogSearch then
				SearchKeyword = CurrentRoute.params and (CurrentRoute.params.searchParams and CurrentRoute.params.searchParams.searchKeyword)
			end
			p4.clickPurchaseItemButton(ItemId, Asset, FromProfile, Name, RequestId, SearchKeyword, CheckTryOnHasAdjustmentsResult, State.AvatarExperience.AnalyticsMetadata, FromContentFeed, if FFlagAXFixPurchaseSurfaceLogging and p3 then p3.getParam(ConstantsModule.NavigationParams.fromSurface) else nil)
		end
		local ResellerUserAssetIds = ItemDataModuleResult.resellerUserAssetIds
		local UserAsset = State.AvatarExperience.Catalog.UserAssets[ResellerUserAssetIds and ResellerUserAssetIds[1]]
		local UserRobuxEntry = State.UserRobux[State.LocalUserId]
		local LowestPrice = ItemDataModuleResult.lowestPrice or ItemDataModuleResult.priceInRobux
		local ExpectedSellerId = nil
		local Name1 = nil
		local CollectibleItemId = nil
		local IsResellable = CatalogUtilsModule.IsResellable(ItemDataModuleResult)
		ExpectedSellerId = ItemDataModuleResult.expectedSellerId
		Name1 = ItemDataModuleResult.creator and ItemDataModuleResult.creator.name
		CollectibleItemId = ItemDataModuleResult.collectibleItemId
		
		if TimedOptionDays and ItemDataModuleResult.timedOptions then
			for _, timedOption in ItemDataModuleResult.timedOptions do
				if timedOption.days == TimedOptionDays then
					LowestPrice = timedOption.price
					break
				end
			end
		end
		local UserAssetId = nil
		
		if IsResellable and UserAsset then
			UserAssetId = UserAsset.userAssetId
			ExpectedSellerId = UserAsset.userId
			Name1 = UserAsset.userName
		end
		local CollectibleInstanceId = nil
		local CollectibleProductId = nil
		
		if CollectibleItemId then
			local CollectiblesItemInfo = State.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
			local CollectiblesResellersInstances = State.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances
			local CheapestCollectiblePurchaseInfoV2 = CatalogUtilsModule.findCheapestCollectiblePurchaseInfoV2(CollectibleItemId, IsResellable, CollectiblesItemInfo, CollectiblesResellersInstances, State.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances)
			
			if CheapestCollectiblePurchaseInfoV2.price and not TimedOptionDays then
				LowestPrice = CheapestCollectiblePurchaseInfoV2.price
			end
			if CheapestCollectiblePurchaseInfoV2.collectibleInstanceId then
				CollectibleInstanceId = CheapestCollectiblePurchaseInfoV2.collectibleInstanceId
				ExpectedSellerId = CheapestCollectiblePurchaseInfoV2.expectedSellerId
				Name1 = CheapestCollectiblePurchaseInfoV2.sellerName
			end
			if FFlagAXEnableUnifiedProductPurchaseForMarketplace then
				CollectibleProductId = CollectiblesItemInfo[CollectibleItemId].collectibleProductId
				
				if FFlagFixUnifiedPurchaseResalePurchases and CollectibleInstanceId ~= nil then
					local v1 = CollectiblesResellersInstances[CollectibleItemId]
					local InstancesEntry = v1 and (v1.Instances and v1.Instances[CollectibleInstanceId])
					
					if InstancesEntry and InstancesEntry.collectibleProductId then
						CollectibleProductId = InstancesEntry and InstancesEntry.collectibleProductId
					end
				end
			end
		end
		local function v70()
			-- upvalues: FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval), GetTTIEventNameFunction (upval), ProductPurchaseSurface (upval), TimeToInteractiveTracker (upval), LowestPrice (ref), UserRobuxEntry (copy), p3 (upval), AvatarScreen (upval), ItemId (copy), Asset (copy), ExpectedSellerId (ref), Name1 (ref), UserAssetId (ref), CollectibleInstanceId (ref), OnOverlayClosed (upval), FromProfile (upval), FromAvatarRoute (upval), WidgetInfo (upval), FromContentFeed (upval), TimedOptionDays (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ConstantsModule (upval), p8 (copy), NavigateWithLockFunction (upval), p5 (upval), SetCurrentToastMessageModule (upval), p6 (upval), config (upval), CatalogUtilsModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), ItemDataModuleResult (copy), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), OpenCentralOverlayForEconomicRestrictionPromptModule (upval), RobuxUpsellTriggerContextModule (upval), PurchaseProductModule (upval), p2 (upval), p4 (upval)
			if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then
				local TTIEventName = GetTTIEventNameFunction(ProductPurchaseSurface.Catalog)
				TimeToInteractiveTracker.trackStart(TTIEventName)
				TimeToInteractiveTracker.updateMetadata(TTIEventName, {
					category = "legacy_purchase_modal",
					page = ProductPurchaseSurface.Catalog
				})
			end
			if LowestPrice and LowestPrice <= UserRobuxEntry then
				p8:dispatch(NavigateWithLockFunction(function()
					-- upvalues: p3 (upval), AvatarScreen (upval), ItemId (upval), Asset (upval), LowestPrice (upval), ExpectedSellerId (upval), Name1 (upval), UserAssetId (upval), CollectibleInstanceId (upval), OnOverlayClosed (upval), FromProfile (upval), FromAvatarRoute (upval), WidgetInfo (upval), FromContentFeed (upval), TimedOptionDays (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ConstantsModule (upval)
					p3.navigate(AvatarScreen.PurchaseCatalogItem, {
						itemId = ItemId,
						itemType = Asset,
						priceInRobux = LowestPrice,
						sellerId = ExpectedSellerId,
						sellerName = Name1,
						userAssetId = UserAssetId,
						collectibleInstanceId = CollectibleInstanceId,
						onOverlayClosed = OnOverlayClosed,
						fromProfile = FromProfile,
						fromAvatarRoute = FromAvatarRoute,
						widgetInfo = WidgetInfo,
						fromContentFeed = FromContentFeed,
						timedOptionDays = TimedOptionDays,
						fromSurface = if FFlagAXFixPurchaseSurfaceLogging and p3 then p3.getParam(ConstantsModule.NavigationParams.fromSurface) else nil
					})
				end))
				
				return
			end
			if p5 then
				p8:dispatch(SetCurrentToastMessageModule(if p6 then p6 else config))
				
				return
			else
				local RobuxUpsellPrompt = AvatarScreen.InsufficientRobuxPrompt
				local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, CatalogUtilsModule.GetRbxThumbType(Asset), 150)
				
				local function v81(p9)
					-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), p8 (upval), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
					local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p9)
					local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p9)
					Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
						surface = EconomicRestrictionsSurface.AvatarExperience,
						failureReason = ParseEconomicRestrictionsFailureReasonResult
					})
					
					return p8:dispatch(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
				end
				
				RobuxUpsellPrompt = AvatarScreen.RobuxUpsellPrompt
				local config1 = {
					onOverlayClosed = OnOverlayClosed,
					triggerContext = RobuxUpsellTriggerContextModule.UACatalog,
					priceInRobux = LowestPrice,
					userRobux = UserRobuxEntry,
					itemProductId = ItemId,
					itemName = ItemDataModuleResult.name,
					itemIcon = RbxthumbWithTypeSizeAndOptions,
					purchaseItem = function()
						-- upvalues: p3 (upval), ItemDataModuleResult (upval), CatalogUtilsModule (upval), Asset (upval), p8 (upval), PurchaseProductModule (upval), p2 (upval), LowestPrice (upval), ExpectedSellerId (upval), ItemId (upval), UserAssetId (upval), p4 (upval), FromProfile (upval), CollectibleInstanceId (upval), WidgetInfo (upval), FromContentFeed (upval), v81 (copy), TimedOptionDays (upval)
						return p8:dispatch(PurchaseProductModule(p2, ItemDataModuleResult and (ItemDataModuleResult.product and ItemDataModuleResult.product.id), LowestPrice, ExpectedSellerId, ItemId, Asset, CatalogUtilsModule.GetItemSubType(Asset, ItemDataModuleResult), false, UserAssetId, p4, p3, FromProfile, false, if p3 then p3.state.routeName else nil, ItemDataModuleResult.collectibleItemId, CollectibleInstanceId, ItemDataModuleResult.creator and ItemDataModuleResult.creator.type, WidgetInfo, FromContentFeed, v81, TimedOptionDays))
					end
				}
				p8:dispatch(NavigateWithLockFunction(function()
					-- upvalues: p3 (upval), RobuxUpsellPrompt (ref), config1 (copy)
					p3.navigate(RobuxUpsellPrompt, config1)
				end))
			end
		end
		
		if not FFlagAXEnableUnifiedProductPurchaseForMarketplace then
			v70()
			
			return
		end
		local function v77()
			-- upvalues: Asset (copy), CatalogUtilsModule (upval), ItemDataModuleResult (copy), ConstantsModule (upval), p8 (copy), HandlePurchaseSuccessModule (upval), p2 (upval), ItemId (upval), Asset (upval), CollectibleItemId (ref), p4 (upval), FromProfile (upval), FromContentFeed (upval), FromAvatarRoute (upval), Name (copy), WidgetInfo (upval), LowestPrice (ref), p3 (upval), CryoModule (upval), UnifiedEventLogEnums (upval), FFlagAddTypesToWidgetItems (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), CartIdService (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogConstants (upval), CloseCentralOverlayModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration (upval), PromiseModule (upval), buildUnifiedPurchaseProductInfo (upval), CollectibleProductId (ref), ItemId (copy), TimedOptionDays (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), FFlagPurchasePromptSubtitleForTimedOptions (upval), p7 (upval), CollectibleInstanceId (ref), NewResult (upval), ProductPurchaseSurface (upval), ShouldFetchCartPricing (upval), UserRobuxEntry (copy), FFlagPurchaseModalTimedOptionExtension (upval), FFlagSkipCompletionModalForMarketplace (upval), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval)
			local function _(): boolean
				-- upvalues: Asset (upval), CatalogUtilsModule (upval), ItemDataModuleResult (upval), ConstantsModule (upval)
				local ItemSubType = CatalogUtilsModule.GetItemSubType(Asset, ItemDataModuleResult)
				
				return Asset == ConstantsModule.ItemType.Asset and ItemSubType ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation
			end
			
			local HasExpirationTime = FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and ItemDataModuleResult.expirationTime ~= nil or FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration
			
			local function v88()
				-- upvalues: PromiseModule (upval), buildUnifiedPurchaseProductInfo (upval), ItemDataModuleResult (upval), CollectibleProductId (upval), LowestPrice (upval), ItemId (upval), Asset (upval), TimedOptionDays (upval)
				return PromiseModule.resolve((buildUnifiedPurchaseProductInfo(ItemDataModuleResult, CollectibleProductId, LowestPrice, ItemId, Asset, TimedOptionDays)))
			end
			
			local ItemSubType = CatalogUtilsModule.GetItemSubType(Asset, ItemDataModuleResult)
			p8:dispatch(OpenCentralOverlayForUnifiedPurchasePromptModule({
				subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p7 else nil,
				productPayload = {
					equipIfPurchased = false,
					isRobloxPurchase = true,
					id = ItemId,
					kind = Asset,
					collectibleItemId = ItemDataModuleResult.collectibleItemId,
					collectibleItemInstanceId = CollectibleInstanceId,
					collectibleProductId = CollectibleProductId,
					expectedPrice = LowestPrice,
					timedOptionDays = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then TimedOptionDays else nil
				},
				purchaseCallbacks = {
					onFlowComplete = function()
						-- upvalues: p8 (upval), CloseCentralOverlayModule (upval)
						p8:dispatch(CloseCentralOverlayModule())
					end,
					onPurchaseSuccess = function(p9, p10)
						-- upvalues: CatalogUtilsModule (upval), Asset (upval), ItemDataModuleResult (upval), p8 (upval), HandlePurchaseSuccessModule (upval), p2 (upval), ItemId (upval), Asset (upval), CollectibleItemId (upval), p4 (upval), FromProfile (upval), FromContentFeed (upval), FromAvatarRoute (upval), Name (upval), WidgetInfo (upval), LowestPrice (upval), p3 (upval)
						p8:dispatch(HandlePurchaseSuccessModule(p9, p10, p2, ItemId, Asset, CollectibleItemId, p4, FromProfile, FromContentFeed, FromAvatarRoute, Name, WidgetInfo, LowestPrice, CatalogUtilsModule.GetItemSubType(Asset, ItemDataModuleResult), p3))
					end,
					onBuyItemButtonMounted = function(Current)
						-- upvalues: WidgetInfo (upval), CryoModule (upval), ItemId (upval), Asset (upval), ConstantsModule (upval), UnifiedEventLogEnums (upval), FFlagAddTypesToWidgetItems (upval), ItemDataModuleResult (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), CartIdService (upval), LowestPrice (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogConstants (upval)
						if Current then
							local WidgetInfo1 = WidgetInfo or {}
							AddUnifiedEventLoggingFunction({ current = Current }, CryoModule.Dictionary.join(WidgetInfo1, {
								itemId = ItemId,
								itemType = if Asset == ConstantsModule.ItemType.Asset then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif Asset == ConstantsModule.ItemType.Bundle then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else nil,
								assetType = if FFlagAddTypesToWidgetItems and WidgetInfo1.widgetType then nil else ItemDataModuleResult.assetType,
								widgetAssetType = if FFlagAddTypesToWidgetItems and WidgetInfo1.widgetType then ItemDataModuleResult.assetType else nil,
								bundleType = if FFlagAddTypesToWidgetItems and WidgetInfo1.widgetType then nil else ItemDataModuleResult.bundleType,
								widgetBundleType = if FFlagAddTypesToWidgetItems and WidgetInfo1.widgetType then ItemDataModuleResult.bundleType else nil,
								action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
								cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
								widgetItemPrice = if WidgetInfo1.widgetType then LowestPrice else nil,
								organicItemPrice = if WidgetInfo1.widgetType then nil else LowestPrice
							}), {
								sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
							})
						end
					end,
					fetchProductInfo = if FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration then v88 else nil
				},
				postPurchaseActions = Asset == ConstantsModule.ItemType.Asset and ItemSubType ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation and {
					{
						isActionSelected = true,
						label = NewResult:Format("Feature.Catalog.Label.WearAfterPurchase"),
						actionKey = ConstantsModule.WearAfterPurchasePostPurchaseActionKey
					}
				},
				purchaseAnalyticsMetadata = { surface = ProductPurchaseSurface.Catalog },
				purchaseOptions = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow or FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration or ShouldFetchCartPricing ~= nil then {
					shouldSkipOwnershipCheck = HasExpirationTime,
					providedRobuxBalance = if FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration then UserRobuxEntry else nil,
					completionMessage = if FFlagPurchaseModalTimedOptionExtension and ItemDataModuleResult.expirationTime ~= nil then NewResult:Format("Feature.Durables.PurchaseModal.SuccessMessage", {
						itemName = ItemDataModuleResult.name,
						number = tostring(TimedOptionDays)
					}) else nil,
					skipPurchaseSuccessModal = if FFlagSkipCompletionModalForMarketplace then true else nil,
					shouldFetchCartPricing = ShouldFetchCartPricing
				} else nil
			}, if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then true else nil))
		end
		
		if FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles then
			v77()
			
			return
		else
			GetIsUserEligibleForUnifiedPurchaseFlowFunction(p2):andThen(function(Result)
				-- upvalues: v77 (copy), v70 (copy)
				if Result then
					v77()
					
					return
				else
					v70()
				end
			end):catch(function(_)
				-- upvalues: v70 (copy)
				v70()
			end)
		end
	end
end