local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(CorePackages.Packages.Promise)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local _ = require(Modules.AvatarExperience.Common.Reducers.Looks)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLoggingUtils = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local ProductPurchaseSurface = require(CorePackages.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local LookUtilsModule = require(Modules.AvatarExperience.Common.Util.LookUtils)
local HandleLooksPurchaseSuccessModule = require(Modules.AvatarExperience.Catalog.Thunks.HandleLooksPurchaseSuccess)
local LookDetailsBottomBarUtilsModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local AXFixUnifiedPurchaseFlowSessionTag = game:DefineFastFlag("AXFixUnifiedPurchaseFlowSessionTag", false)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXRenameBackToAddToAvatar = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRenameBackToAddToAvatar
local FFlagSkipCompletionModalForMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSkipCompletionModalForMarketplace
local HideLookDiscountPercentWithIneligibleItems = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)
local FFlagPurchasePromptFetchCartPricingForLooks = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local FFlagPurchasePromptFetchCartPricing = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPurchasePromptFetchCartPricing
local UseShouldFetchCartPricingForLookPurchasePromptFunction = AvatarExperienceCatalogModule.Hooks.useShouldFetchCartPricingForLookPurchasePrompt

local function _(Name, Name1)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	local v1 = nil
	local v2 = nil
	
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.Name == Name then
			v1 = i
			
			if not Name1 or not value.Subcategories then break end
			for i1, subcategory in value.Subcategories do
				if subcategory.Name == Name1 then
					v2 = i1
					
					return v1, v2
				end
			end
			return v1, v2
		end
	end
	return v1, v2
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseAvatarSaveContextFunction (copy), FFlagPurchasePromptFetchCartPricing (copy), UseShouldFetchCartPricingForLookPurchasePromptFunction (copy), ReactModule (copy), LookUtilsModule (copy), CryoModule (copy), WidgetConstants (copy), CloseCentralOverlayModule (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), AXFixUnifiedPurchaseFlowSessionTag (copy), UnifiedEventLogEnums (copy), CartIdService (copy), UnifiedEventLoggingUtils (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogConstants (copy), LookDetailsBottomBarUtilsModule (copy), HandleLooksPurchaseSuccessModule (copy), HideLookDiscountPercentWithIneligibleItems (copy), PromiseModule (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy), FFlagAXCatalogMakeupSupport (copy), ConstantsModule (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagAXRenameBackToAddToAvatar (copy), ProductPurchaseSurface (copy), FFlagSkipCompletionModalForMarketplace (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), ConstantsModule1 (copy), ConstantsModule2 (copy), GetAvatarEditorCategoriesModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule1)
	local UseAvatarSaveContextResult = UseAvatarSaveContextFunction()
	local UseShouldFetchCartPricingForLookPurchasePromptResult = if FFlagPurchasePromptFetchCartPricing then UseShouldFetchCartPricingForLookPurchasePromptFunction() else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: LookUtilsModule (upval), p1 (copy), CryoModule (upval), UseRoactServiceModuleResult1 (copy), WidgetConstants (upval)
		local _, _, _, PurchaseInfoForLookId4 = LookUtilsModule.getPurchaseInfoForLookId(p1.tryOnItems, p1.lookDetailsObj, p1.lookId)
		local JoinResult = if p1.lookAnalyticsInfo then CryoModule.Dictionary.join(p1.lookAnalyticsInfo, {
			totalRobux = p1.totalPrice,
			assetIds = PurchaseInfoForLookId4
		}) else nil
		
		if JoinResult and #PurchaseInfoForLookId4 > 0 then
			UseRoactServiceModuleResult1.widgetInteractionV2(JoinResult, WidgetConstants.ActionType.PURCHASE_ATTEMPT)
		end
	end, {
		p1.tryOnItems, p1.lookDetailsObj, p1.lookId, p1.lookAnalyticsInfo,
		p1.totalPrice, UseRoactServiceModuleResult1
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
		UseDispatchResult(CloseCentralOverlayModule())
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), p1 (copy), AXFixUnifiedPurchaseFlowSessionTag (upval), CryoModule (upval), UnifiedEventLogEnums (upval), CartIdService (upval), UnifiedEventLoggingUtils (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogConstants (upval)
		if FFlagAXMISEnableMultiShoppingUnifiedEvents and not p1.lookAnalyticsInfo then
			p1.lookAnalyticsInfo = {}
		end
		if Current and p1.lookAnalyticsInfo then
			local config = { current = Current }
			local LookType = if p1.lookId and p1.lookDetailsObj and p1.lookDetailsObj[p1.lookId] then p1.lookDetailsObj[p1.lookId].lookType else nil
			
			if AXFixUnifiedPurchaseFlowSessionTag then
				AddUnifiedEventLoggingFunction(config, CryoModule.Dictionary.join(p1.lookAnalyticsInfo, {
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
					cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
					itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
					organicLookType = if p1.lookAnalyticsInfo.widgetType or not LookType then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(LookType),
					widgetLookType = if p1.lookAnalyticsInfo.widgetType and LookType then UnifiedEventLoggingUtils.formatLookTypeAttribute(LookType) else nil,
					widgetItemPrice = if p1.lookAnalyticsInfo.widgetType then p1.totalPrice else nil,
					organicItemPrice = if p1.lookAnalyticsInfo.widgetType then nil else p1.totalPrice
				}), {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
				
				return
			end
			AddUnifiedEventLoggingFunction(config, (CryoModule.Dictionary.join(p1.lookAnalyticsInfo, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
				cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
				organicLookType = if p1.lookAnalyticsInfo.widgetType or not LookType then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(LookType),
				widgetLookType = if p1.lookAnalyticsInfo.widgetType and LookType then UnifiedEventLoggingUtils.formatLookTypeAttribute(LookType) else nil,
				widgetItemPrice = if p1.lookAnalyticsInfo.widgetType then p1.totalPrice else nil,
				organicItemPrice = if p1.lookAnalyticsInfo.widgetType then nil else p1.totalPrice,
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			}, {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})))
		end
	end, {
		p1.totalPrice,
		p1.lookAnalyticsInfo,
		p1.lookDetailsObj,
		p1.lookId
	})
	local UseResult3 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: LookDetailsBottomBarUtilsModule (upval), p1 (copy), LookUtilsModule (upval), CryoModule (upval), UseDispatchResult (copy), HandleLooksPurchaseSuccessModule (upval), UseRoactServiceModuleResult (copy), UseAvatarSaveContextResult (copy), UseNavigationResult (copy), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult2 (copy), UseAvatarRouteResult (copy)
		local OwnedTryOnItems = LookDetailsBottomBarUtilsModule.getOwnedTryOnItems(p1.tryOnItems, p1.lookDetailsObj, p1.lookId)
		local IsTryOnFromOutsideAX = p1.isTryOnFromOutsideAX
		local _, _, _, PurchaseInfoForLookId4 = LookUtilsModule.getPurchaseInfoForLookId(p1.tryOnItems, p1.lookDetailsObj, p1.lookId)
		UseDispatchResult(HandleLooksPurchaseSuccessModule(p2, p3, UseRoactServiceModuleResult, p1.lookId, p1.totalPrice, p1.tryOnItems, OwnedTryOnItems, UseAvatarSaveContextResult, IsTryOnFromOutsideAX, if p1.lookAnalyticsInfo then CryoModule.Dictionary.join(p1.lookAnalyticsInfo, {
			totalRobux = p1.totalPrice,
			assetIds = PurchaseInfoForLookId4
		}) else nil, UseNavigationResult, UseRoactServiceModuleResult1, UseRoactServiceModuleResult2, UseAvatarRouteResult))
	end, {
		UseDispatchResult, UseRoactServiceModuleResult, p1.lookId,
		p1.lookAnalyticsInfo, p1.totalPrice, p1.tryOnItems, UseAvatarSaveContextResult,
		UseNavigationResult, UseRoactServiceModuleResult1,
		UseRoactServiceModuleResult2, p1.lookDetailsObj, UseAvatarRouteResult,
		p1.isTryOnFromOutsideAX
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), HideLookDiscountPercentWithIneligibleItems (upval), PromiseModule (upval)
		local t = {}
		local LookDiscounts = if p1.lookId and p1.lookDetailsObj[p1.lookId] and p1.lookDetailsObj[p1.lookId].lookDiscounts then p1.lookDetailsObj[p1.lookId].lookDiscounts else nil
		
		if LookDiscounts then
			local LookDiscount = LookDiscounts[1]
			t.Type = LookDiscount.discountCampaign
			t.AmountInRobux = if p1.originalPrice then p1.originalPrice - p1.totalPrice else nil
			t.Percent = if HideLookDiscountPercentWithIneligibleItems and p1.hasNonDiscountedItems then 0 else LookDiscount.robuxDiscountPercentage
		end
		return PromiseModule.resolve({
			IsForSale = true,
			Name = "Looks",
			PriceInRobux = p1.totalPrice,
			BasePriceInRobux = p1.originalPrice,
			PriceDiscountDetails = { t }
		})
	end, {
		p1.lookId,
		p1.lookDetailsObj,
		p1.originalPrice,
		p1.totalPrice,
		if HideLookDiscountPercentWithIneligibleItems then p1.hasNonDiscountedItems else nil
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagPurchasePromptFetchCartPricingForLooks (upval), LookUtilsModule (upval), FFlagAXCatalogMakeupSupport (upval), ConstantsModule (upval), UseDispatchResult (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), UseResult1 (copy), UseResult (copy), UseResult3 (copy), UseResult2 (copy), UseResult4 (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval), FFlagAXRenameBackToAddToAvatar (upval), ProductPurchaseSurface (upval), FFlagSkipCompletionModalForMarketplace (upval), UseShouldFetchCartPricingForLookPurchasePromptResult (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval)
		if p1.lookId then
			local CartPricingRequestedItemsForLookId = if FFlagPurchasePromptFetchCartPricingForLooks and LookUtilsModule.getCartPricingRequestedItemsForLookId then LookUtilsModule.getCartPricingRequestedItemsForLookId(p1.tryOnItems, p1.lookDetailsObj, p1.lookId) else nil
			local _, PurchaseInfoForLookId2, PurchaseInfoForLookId3, _, PurchaseInfoForLookId5 = LookUtilsModule.getPurchaseInfoForLookId(p1.tryOnItems, p1.lookDetailsObj, p1.lookId)
			local IsLookTypeMatch = if FFlagAXCatalogMakeupSupport and p1.lookDetailsObj and p1.lookDetailsObj[p1.lookId] and p1.lookDetailsObj[p1.lookId].lookType then p1.lookDetailsObj[p1.lookId].lookType == ConstantsModule.LookType.Makeup else nil
			UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
				productPayload = {
					kind = "Look",
					salesLocationId = 0,
					id = p1.lookId,
					expectedPrice = p1.totalPrice,
					excludedAssetIds = PurchaseInfoForLookId2,
					excludedBundleIds = PurchaseInfoForLookId3,
					timedOptions = if PurchaseInfoForLookId5 and #PurchaseInfoForLookId5 > 0 then PurchaseInfoForLookId5 else nil,
					cartPricingRequestedItems = if FFlagPurchasePromptFetchCartPricingForLooks and CartPricingRequestedItemsForLookId and #CartPricingRequestedItemsForLookId > 0 then CartPricingRequestedItemsForLookId else nil
				},
				purchaseCallbacks = {
					onFlowComplete = UseResult1,
					onPurchaseAttempt = UseResult,
					onPurchaseSuccess = UseResult3,
					onBuyItemButtonMounted = UseResult2,
					fetchProductInfo = UseResult4
				},
				postPurchaseActions = {
					{
						isActionSelected = true,
						label = if FFlagAXCatalogMakeupSupport and IsLookTypeMatch then p1.localized.wearAfterPurchaseMakeupLabel elseif FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.localized.wearAvatarAfterPurchaseLabel else p1.localized.wearAfterPurchaseLabel,
						actionKey = ConstantsModule.WearAfterPurchasePostPurchaseActionKey
					},
					{
						isActionSelected = true,
						label = if FFlagAXCatalogMakeupSupport and IsLookTypeMatch then p1.localized.saveAsMakeupLookLabel elseif FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if FFlagAXRenameBackToAddToAvatar then p1.localized.addToMyAvatarsLabel else p1.localized.saveAsCharacterLabel else p1.localized.addToMyAvatarsLabel,
						actionKey = ConstantsModule.SaveAsCharacterPostPurchaseActionKey
					}
				},
				purchaseAnalyticsMetadata = { surface = ProductPurchaseSurface.Catalog },
				purchaseOptions = {
					shouldSkipOwnershipCheck = true,
					skipPurchaseSuccessModal = if FFlagSkipCompletionModalForMarketplace then true else nil,
					shouldFetchCartPricing = UseShouldFetchCartPricingForLookPurchasePromptResult
				}
			}, if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then true else nil))
			
			return
		end
	end, {
		UseDispatchResult, p1.lookId, p1.totalPrice, p1.tryOnItems, p1.lookDetailsObj,
		UseRoactServiceModuleResult, UseAvatarSaveContextResult, UseNavigationResult,
		UseRoactServiceModuleResult1, UseRoactServiceModuleResult2, p1.localized,
		UseAvatarRouteResult, p1.isTryOnFromOutsideAX, UseResult1, UseResult,
		UseResult3, UseResult2, UseResult4,
		UseShouldFetchCartPricingForLookPurchasePromptResult
	})
	
	return {
		onPurchaseAttempt = UseResult,
		onFlowComplete = UseResult1,
		onBuyItemButtonMounted = UseResult2,
		onPurchaseSuccess = UseResult3,
		openUnifiedPurchasePrompt = UseResult5,
		onButtonPressWithUnifiedPurchaseFlow = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseRoactServiceModuleResult1 (copy), ConstantsModule1 (upval), CryoModule (upval), ConstantsModule2 (upval), GetAvatarEditorCategoriesModule (upval), AvatarScreen (upval), UseNavigationResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseResult5 (copy)
			if p1.userRobux < p1.totalPrice then
				UseRoactServiceModuleResult1.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
			end
			if not CryoModule.isEmpty(p1.itemsToPurchase) or p1.lookId == nil then
				UseResult5()
				
				return
			end
			local CharacterKey = ConstantsModule2.CharacterKey
			local CategoryOverride = nil
			local SubcategoryOverride = nil
			
			for i, value in GetAvatarEditorCategoriesModule() do
				if value.Name == CharacterKey then
					CategoryOverride = i
					break
				end
			end
			local LeaveCatalogToAvatarPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			local config = {
				onOverlayClosed = p1.onOverlayClosed,
				categoryOverride = CategoryOverride,
				subcategoryOverride = SubcategoryOverride
			}
			UseRoactServiceModuleResult1.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), LeaveCatalogToAvatarPrompt (copy), config (copy)
				UseNavigationResult.navigate(LeaveCatalogToAvatarPrompt, config)
			end))
		end, {
			p1.tryOnItems, p1.lookDetailsObj, p1.lookId, p1.userRobux, UseDispatchResult,
			UseNavigationResult, p1.onOverlayClosed, UseRoactServiceModuleResult1,
			UseAvatarRouteResult, p1.itemsToPurchase, p1.totalPrice, UseResult5
		})
	}
end