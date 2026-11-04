local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local NotificationService = game:GetService("NotificationService")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local TutilsModule = require(Parent.tutils)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local _ = require(Parent.Http)
local RoactUtilsModule = require(Parent.RoactUtils)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local ToastRoduxModule = require(Parent.ToastRodux)
local CryoModule = require(Parent.Cryo)
local SharedFlagsModule = require(Parent.SharedFlags)
local RobloxEventReceiver = require(Parent.RealtimeDelivery).RobloxEventReceiver
local _ = require(AvatarExperienceCatalog.Components.Checkout.CheckoutPage)
local PurchaseItemsSuccessThunkModule = require(AvatarExperienceCatalog.State.Thunks.PurchaseItemsSuccessThunk)
local SaveAsAvatarThunkModule = require(AvatarExperienceCatalog.State.Thunks.SaveAsAvatarThunk)
local SaveAsMakeupLookThunkModule = require(AvatarExperienceCatalog.State.Thunks.SaveAsMakeupLookThunk)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local SetSelectedTimedOptionModule = require(AvatarExperienceCatalog.State.Actions.SetSelectedTimedOption)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local Constants = AvatarExperienceCommonModule.Constants
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ToastType = ToastRoduxModule.Enums.ToastType
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local DiscountTypeEnum = AvatarExperienceCommonModule.Enums.DiscountTypeEnum
local PurchaseItemsModule = require(AvatarExperienceCatalog.Requests.PurchaseItems)
local GetRobloxSubscriptionProductsFunction = require(Parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local MapPurchaseItemsResponseModule = require(AvatarExperienceCatalog.Requests.PurchaseItems.mapPurchaseItemsResponse)
local GetEquippableAssetsFromTryOnItemsModule = require(AvatarExperienceCatalog.Utils.TryOns.getEquippableAssetsFromTryOnItems)
local GetTryOnItemsContainsOnlyMakeupTypesModule = require(AvatarExperienceCatalog.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local _ = require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)
local GetIsInsufficientRobuxErrorFunction = AvatarExperienceCommonModule.Utils.getIsInsufficientRobuxError
local UseAXCatalogStoreContextModule = require(AvatarExperienceCatalog.Context.useAXCatalogStoreContext)
local UseOffersCartPricingCalculationsForCartItemsModule = require(AvatarExperienceCatalog.Hooks.useOffersCartPricingCalculationsForCartItems)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseNetworkingFunction = AvatarExperienceCommonModule.Hooks.useNetworking
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseSaveOptionsStoredValuesModule = require(AvatarExperienceCatalog.Hooks.useSaveOptionsStoredValues)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendUnifiedEventForDeferredActionFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventForDeferredAction
local GetUnifiedLoggingSurfaceFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedLoggingSurface
local GetMarketplaceUnifiedAssetTypeFunction = AvatarExperienceAnalyticsModule.Utils.getMarketplaceUnifiedAssetType
local GetMarketplaceUnifiedBundleTypeFunction = AvatarExperienceAnalyticsModule.Utils.getMarketplaceUnifiedBundleType
local SendUnifiedEventsForMultiItemShoppingFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventsForMultiItemShopping
local GetUnifiedEventsForMISFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedEventsForMIS
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local FFlagAXMISOffersChip = AvatarExperienceFlagsModule.FFlagAXMISOffersChip
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceFlagsModule.FFlagAXUnifiedEventStrictPayloads
local FFlagAXMISSaveWearFix = AvatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local FFlagAXBackgroundsEquipTryOnCounters = AvatarExperienceFlagsModule.FFlagAXBackgroundsEquipTryOnCounters
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local ReportBackgroundUserActionCounter = AvatarExperienceAnalyticsModule.reportBackgroundUserActionCounter
local AXFixSelectUserRobloxSubscriptionNil = game:DefineFastFlag("AXFixSelectUserRobloxSubscriptionNil", false)

local function selectTryOnLookId(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local v1 = if FFlagAXCatalogMakeupSupport then function(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
end else nil
local v2: ((any) -> any)? = nil
local v3: ((any) -> any)? = nil

if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	v2 = function(p1)
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	
	v3 = function(p1)
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end
local function selectAvatarSceneLooks(p1)
	return p1.AvatarExperience.AvatarScene.Looks
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function selectTryOnItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectTryOnBodyColor3s(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
end

local function selectTryOnBodyScales(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.Scale
end

local function selectTryOnBodyPartColorRangeIds(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
end

local function _(p1)
	return p1.AvatarExperience.Common.AssetInfos or {}
end

local _ = function(p1)
	return p1.AvatarExperience.Common.BundleInfos or {}
end

local _ = function(p1)
	return p1.AvatarExperience.Common.Collectibles or {}
end

local function selectLocalUserId(p1)
	return p1.LocalUserId
end

local function selectShouldTryOnWithoutEquippedItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
end

local function selectUserRobux(p1)
	local LocalUserId = p1.LocalUserId
	
	return if LocalUserId and p1.UserRobux then p1.UserRobux[LocalUserId] else nil
end

local function v71(p1)
	-- upvalues: AXFixSelectUserRobloxSubscriptionNil (copy)
	local LocalUserId = p1.LocalUserId
	
	return if LocalUserId and p1.Users and (not AXFixSelectUserRobloxSubscriptionNil or p1.Users[LocalUserId]) then p1.Users[LocalUserId].hasRobloxSubscription else false
end

local function selectItemInfoForTryOnItems(p1)
	-- upvalues: Constants (copy), FFlagAXDurablesForMIS (copy)
	local AssetInfos = p1.AvatarExperience.Common.AssetInfos or {}
	local BundleInfos = p1.AvatarExperience.Common.BundleInfos or {}
	local Collectibles = p1.AvatarExperience.Common.Collectibles or {}
	local List = {}
	
	for _, tryOnItem in p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(List, {
				itemId = tryOnItem.itemId,
				itemType = tryOnItem.itemType,
				itemData = tryOnItem.itemData,
				collectibleItemId = tryOnItem.itemId,
				ordering = tryOnItem.itemRecency
			})
		else
			local AssetInfo = if tryOnItem.itemType == Enum.AvatarItemType.Asset.Name then AssetInfos[tryOnItem.itemId] else BundleInfos[tryOnItem.itemId]
			local CollectibleItemId = if AssetInfo then AssetInfo.collectibleItemId else nil
			local CollectiblesItem = if CollectibleItemId and Collectibles.CollectiblesItemInfo then Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
			
			if AssetInfo and CollectibleItemId and CollectiblesItem then
				table.insert(List, {
					itemId = tryOnItem.itemId,
					itemType = tryOnItem.itemType,
					itemData = AssetInfo,
					collectibleItemId = CollectibleItemId,
					ordering = tryOnItem.itemRecency,
					collectibleItemInfo = CollectiblesItem,
					resellableInstances = if Collectibles.CollectiblesResellableInstances then Collectibles.CollectiblesResellableInstances[CollectibleItemId] else nil,
					selectedTimedOptionIndex = if FFlagAXDurablesForMIS then tryOnItem.selectedTimedOptionIndex else nil
				})
			end
		end
	end
	return List
end

local function v73(JoinResults, DiscountedItemsFromOffers)
	-- upvalues: FFlagAXMISOffersChip (copy)
	local List = {}
	
	for _, joinResult in JoinResults do
		local Copy = table.clone(joinResult)
		
		if DiscountedItemsFromOffers[Copy.collectibleItemId] then
			Copy.discountInformation = DiscountedItemsFromOffers[Copy.collectibleItemId].discountInformation or {}
			Copy.priceInRobuxDiscountedByOffers = DiscountedItemsFromOffers[Copy.collectibleItemId].priceInRobux
			Copy.offerApplied = if FFlagAXMISOffersChip then #DiscountedItemsFromOffers[Copy.collectibleItemId].offerIdsApplied > 0 else nil
		end
		table.insert(List, Copy)
	end
	return List
end

return function(p2)
	-- upvalues: Parent (copy), UseAXCatalogStoreContextModule (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseNetworkingFunction (copy), UseDispatchFunction (copy), FFlagAXMISWithOffers (copy), UseSaveOptionsStoredValuesModule (copy), UseSignalStateFunction (copy), FFlagAXUnifiedEventStrictPayloads (copy), UseSelectorFunction (copy), selectScreenSize (copy), FFlagAXMISWithBlackbird (copy), ReactModule (copy), selectTryOnItems (copy), TutilsModule (copy), selectTryOnBodyColor3s (copy), selectTryOnBodyScales (copy), selectTryOnBodyPartColorRangeIds (copy), selectTryOnLookId (copy), FFlagAXCatalogMakeupSupport (copy), v1 (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v2 (ref), v3 (ref), selectAvatarSceneLooks (copy), selectItemInfoForTryOnItems (copy), selectShouldTryOnWithoutEquippedItems (copy), selectLocalUserId (copy), selectUserRobux (copy), v71 (copy), UseLocalizationFunction (copy), LocalizationRoactContext (copy), UseAppPolicyFunction (copy), UseNavigationFocusFunction (copy), FFlagAXEnableExpiredUserLookCheckout (copy), RobloxEventReceiver (copy), NotificationService (copy), AvatarScreen (copy), GetRobloxSubscriptionProductsFunction (copy), MutedErrorFunction (copy), UseOffersCartPricingCalculationsForCartItemsModule (copy), CryoModule (copy), Constants (copy), FFlagAXBackgroundsEquipTryOnCounters (copy), ReportBackgroundUserActionCounter (copy), UnifiedEventLogEnums (copy), UnifiedEventLogConstants (copy), UnifiedSelectionListStore (copy), CartIdService (copy), GetMarketplaceUnifiedAssetTypeFunction (copy), GetMarketplaceUnifiedBundleTypeFunction (copy), SendUnifiedEventForDeferredActionFunction (copy), GetUnifiedLoggingSurfaceFunction (copy), FFlagAXDurablesForMIS (copy), SetSelectedTimedOptionModule (copy), v73 (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), ToastType (copy), SetCurrentToastMessageFunction (copy), GetTryOnItemsContainsOnlyMakeupTypesModule (copy), FFlagAXMISSaveWearFix (copy), SaveAsMakeupLookThunkModule (copy), SaveAsAvatarThunkModule (copy), GetTryOnItemReducerKeyFunction (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), GetEquippableAssetsFromTryOnItemsModule (copy), PurchaseItemsSuccessThunkModule (copy), DiscountTypeEnum (copy), CloseCentralOverlayFunction (copy), PromiseModule (copy), AvatarScreenProperties (copy), GetUnifiedEventsForMISFunction (copy), SendUnifiedEventsForMultiItemShoppingFunction (copy), PurchaseItemsModule (copy), MapPurchaseItemsResponseModule (copy), GetIsInsufficientRobuxErrorFunction (copy)
	local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
	local ShoppingCartStore = UseAXCatalogStoreContextModule().shoppingCartStore
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNetworkingResult = UseNetworkingFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSaveOptionsStoredValuesModuleResult = if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModule() else nil
	local UseSignalStateResult = UseSignalStateFunction(ShoppingCartStore.getItems)
	local UseSelectorResult = if FFlagAXUnifiedEventStrictPayloads then UseSelectorFunction(selectScreenSize) else nil
	local UseSignalStateResult1 = if FFlagAXMISWithBlackbird then UseSignalStateFunction(ShoppingCartStore.getDiscounts) else nil
	local UseSignalStateResult2 = UseSignalStateFunction(ShoppingCartStore.getCanPurchase)
	local UseSignalStateResult3 = UseSignalStateFunction(ShoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local UseSignalStateResult4 = UseSignalStateFunction(ShoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local UseSignalStateResult5 = UseSignalStateFunction(ShoppingCartStore.getErroredItemCount)
	local IsSaveOptionsOpen = nil
	local Callback = nil
	
	if FFlagAXMISWithOffers then
		IsSaveOptionsOpen, Callback = ReactModule.useState(false)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(not FFlagAXMISWithOffers or not UseSaveOptionsStoredValuesModuleResult or UseSaveOptionsStoredValuesModuleResult.getWearAfterPurchase())
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then UseSaveOptionsStoredValuesModuleResult.getAddToAvatars() else false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local v4 = nil
	local Callback1 = nil
	
	if FFlagAXMISWithBlackbird then
		v4, Callback1 = ReactModule.useState({})
	end
	local v5 = nil
	local Callback2 = nil
	
	if FFlagAXMISWithOffers then
		v5, Callback2 = ReactModule.useState(false)
	end
	local UseSelectorResult1 = UseSelectorFunction(selectTryOnItems, TutilsModule.deepEqual)
	local UseSelectorResult2 = UseSelectorFunction(selectTryOnBodyColor3s, TutilsModule.deepEqual)
	local UseSelectorResult3 = UseSelectorFunction(selectTryOnBodyScales, TutilsModule.deepEqual)
	local UseSelectorResult4 = UseSelectorFunction(selectTryOnBodyPartColorRangeIds, TutilsModule.deepEqual)
	local UseSelectorResult5 = UseSelectorFunction(selectTryOnLookId)
	local UseSelectorResult6 = if FFlagAXCatalogMakeupSupport then UseSelectorFunction(v1) else nil
	local UseSelectorResult7 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorFunction(v2) else nil
	local UseSelectorResult8 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorFunction(v3) else nil
	local UseSelectorResult9 = UseSelectorFunction(selectAvatarSceneLooks, TutilsModule.deepEqual)
	local UseSelectorResult10 = UseSelectorFunction(selectItemInfoForTryOnItems, TutilsModule.deepEqual)
	local UseSelectorResult11 = UseSelectorFunction(selectShouldTryOnWithoutEquippedItems)
	local UseSelectorResult12 = UseSelectorFunction(selectLocalUserId)
	local UseSelectorResult13 = UseSelectorFunction(selectUserRobux)
	local UseSelectorResult14 = if FFlagAXMISWithBlackbird then UseSelectorFunction(v71) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseFailedButton = "Feature.Avatar.Action.GotIt",
		characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved",
		purchaseFailedTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = #UseSignalStateResult
		}
	})
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return p3.getDisableResellingCollectiblesForCompliance()
	end)
	local UseAppPolicyResult1 = if FFlagAXMISWithBlackbird then UseAppPolicyFunction(function(p3)
		return p3.getDisableBlackbirdEntrypoints()
	end) else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseRefResult1 = nil
	
	if FFlagAXEnableExpiredUserLookCheckout then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
			return RobloxEventReceiver.new(NotificationService)
		end, {})
		UseRefResult1 = ReactModule.useRef(nil)
		
		if UseMemoResult ~= nil then
			UseRefResult1.current = UseMemoResult:observeEvent("AvatarAssetOwnershipNotifications", function()
				-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy)
				if (if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name) else nil) == AvatarScreen.ExpiredUserLookCheckout then
					UseNavigationResult.pop(2)
				end
			end)
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseSelectorResult13 (copy), FFlagAXMISWithBlackbird (upval), GetRobloxSubscriptionProductsFunction (upval), Callback1 (ref), MutedErrorFunction (upval), FFlagAXEnableExpiredUserLookCheckout (upval), UseRefResult1 (ref)
		if p2.fetchUserRobux and not UseSelectorResult13 then
			p2.fetchUserRobux()
		end
		if FFlagAXMISWithBlackbird then
			GetRobloxSubscriptionProductsFunction():andThen(function(Result)
				-- upvalues: Callback1 (upval)
				Callback1(Result)
			end):catch(function(Err)
				-- upvalues: MutedErrorFunction (upval)
				MutedErrorFunction("CheckoutPageViewModel", "Failed to fetch Roblox subscription products: " .. tostring(Err))
			end)
		end
		return function()
			-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseRefResult1 (upval)
			if FFlagAXEnableExpiredUserLookCheckout and UseRefResult1.current ~= nil then
				UseRefResult1.current:disconnect()
				UseRefResult1.current = nil
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationFocusResult (copy), UseRefResult (copy), p2 (copy)
		if UseNavigationFocusResult and UseRefResult.current and p2.fetchUserRobux then
			p2.fetchUserRobux()
			UseRefResult.current = false
		end
	end, { UseNavigationFocusResult, p2.fetchUserRobux })
	ReactModule.useLayoutEffect(function()
		-- upvalues: ShoppingCartStore (copy), UseSelectorResult10 (copy), UseAppPolicyResult (copy), FFlagAXMISWithOffers (upval), Callback2 (ref), FFlagAXEnableExpiredUserLookCheckout (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy)
		ShoppingCartStore.syncFromTryOns(UseSelectorResult10, UseAppPolicyResult)
		
		if FFlagAXMISWithOffers then
			Callback2(true)
		end
		local Name = if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name) else nil
		
		if FFlagAXEnableExpiredUserLookCheckout then
			if UseSelectorResult10 and #UseSelectorResult10 <= 0 and (Name == AvatarScreen.Checkout or Name == AvatarScreen.ExpiredUserLookCheckout) then
				UseNavigationResult.goBack()
				
				return
			end
		elseif UseSelectorResult10 and #UseSelectorResult10 <= 0 then
			UseNavigationResult.goBack()
		end
	end, {
		ShoppingCartStore,
		UseSelectorResult10,
		UseAppPolicyResult,
		UseNavigationResult,
		if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseAvatarRouteResult (copy), FFlagAXEnableExpiredUserLookCheckout (upval), AvatarScreen (upval)
		local Name = UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)
		
		return FFlagAXEnableExpiredUserLookCheckout and Name == AvatarScreen.ExpiredUserLookCheckout or Name == AvatarScreen.Checkout
	end, { UseAvatarRouteResult })
	local UseOffersCartPricingCalculationsForCartItemsModuleResult = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModule(UseSignalStateResult, UseMemoResult1, v5) else nil
	local UseMemoResult2 = if FFlagAXEnableExpiredUserLookCheckout then ReactModule.useMemo(function(): boolean
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval)
		return (UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)) == AvatarScreen.ExpiredUserLookCheckout
	end, { UseAvatarRouteResult }) else nil
	local UseMemoResult3 = if FFlagAXMISWithBlackbird then ReactModule.useMemo(function(): boolean
		-- upvalues: UseSelectorResult14 (copy), UseAppPolicyResult1 (copy), FFlagAXMISWithOffers (upval), CryoModule (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseSignalStateResult (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (upval), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (upval)
		if not UseSelectorResult14 and not UseAppPolicyResult1 and (not FFlagAXMISWithOffers or FFlagAXMISWithOffers and #CryoModule.Dictionary.keys(UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable) == 0) then
			for _, value in UseSignalStateResult do
				if FIntBlackbirdUpsellMinPriceForDiscountInclusive <= value.priceInRobux and value.priceInRobux <= FIntBlackbirdUpsellMaxPriceForDiscountInclusive and (not value.isOwned or value.isOwned and value.expirationTime) then
					return true
				end
			end
		end
		return false
	end, {
		UseSelectorResult14,
		UseAppPolicyResult1,
		UseSignalStateResult,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable else nil
	}) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), Constants (upval), FFlagAXMISWithOffers (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), FFlagAXDurablesForMIS (upval)
		local List = {}
		
		for _, value in UseSignalStateResult do
			if value.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
				local DiscountedItemsFromOffer = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers[value.collectibleItemId] else nil
				table.insert(List, {
					agreedPriceRobux = if FFlagAXMISWithOffers and DiscountedItemsFromOffer then DiscountedItemsFromOffer.priceInRobux else value.priceInRobux,
					collectibleProductId = value.collectibleProductId,
					collectibleItemId = if FFlagAXMISWithOffers then value.collectibleItemId else nil,
					rentalOption = if FFlagAXDurablesForMIS and value.selectedTimedOptionDays and value.selectedTimedOptionDays > 0 then { durationDays = value.selectedTimedOptionDays } else nil,
					offerIds = if FFlagAXMISWithOffers and DiscountedItemsFromOffer then DiscountedItemsFromOffer.offerIdsApplied else nil
				})
			end
		end
		return List
	end, {
		UseSignalStateResult,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseLocalizationResult (copy), ToastType (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = UseLocalizationResult.characterSavedHeading,
			toastSubMessage = UseLocalizationResult.characterSavedMsg,
			toastType = ToastType.SuccessConfirmation
		}))
	end, { UseDispatchResult, UseLocalizationResult })
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: FFlagAXCatalogMakeupSupport (upval), GetTryOnItemsContainsOnlyMakeupTypesModule (upval), UseSelectorResult9 (copy), UseSelectorResult6 (copy), UseSelectorResult5 (copy), FFlagAXMISSaveWearFix (upval), UseDispatchResult (copy), SaveAsMakeupLookThunkModule (upval), UseNetworkingResult (copy), p2 (copy), SaveAsAvatarThunkModule (upval), UseResult1 (copy)
		if not FFlagAXCatalogMakeupSupport then
			UseDispatchResult(SaveAsAvatarThunkModule(if UseSelectorResult9 and UseSelectorResult9[UseSelectorResult5] and UseSelectorResult9[UseSelectorResult5].name then UseSelectorResult9[UseSelectorResult5].name else "Avatar", p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p3, UseResult1))
			
			return
		end
		local TryOnItemsContainsOnlyMakeupTypesModule = GetTryOnItemsContainsOnlyMakeupTypesModule(p3)
		local Name = if UseSelectorResult9 and UseSelectorResult9[UseSelectorResult5] and UseSelectorResult9[UseSelectorResult5].name then UseSelectorResult9[UseSelectorResult5].name elseif UseSelectorResult9 and UseSelectorResult9[UseSelectorResult6] and UseSelectorResult9[UseSelectorResult6].name then UseSelectorResult9[UseSelectorResult6].name elseif TryOnItemsContainsOnlyMakeupTypesModule then "Makeup" else "Avatar"
		
		if not TryOnItemsContainsOnlyMakeupTypesModule then
			UseDispatchResult(SaveAsAvatarThunkModule(Name, p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p3, UseResult1))
			
			return
		end
		if FFlagAXMISSaveWearFix then
			UseDispatchResult(SaveAsMakeupLookThunkModule(UseNetworkingResult, Name, p3, nil, p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))
			
			return
		else
			UseDispatchResult(SaveAsMakeupLookThunkModule(UseNetworkingResult, Name, p3))
		end
	end, {
		UseDispatchResult, UseResult1,
		p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		UseSelectorResult9, UseSelectorResult5,
		if FFlagAXCatalogMakeupSupport then UseNetworkingResult else nil,
		if FFlagAXCatalogMakeupSupport then UseSelectorResult6 else nil
	})
	local UseResult3 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: ShoppingCartStore (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UseSelectorResult9 (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), p2 (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseContextResult (copy), ToastType (upval), GetTryOnItemReducerKeyFunction (upval), UseStateResult1 (copy), UseResult2 (copy), FFlagAXMISSaveWearFix (upval), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), UseStateResult (copy), GetEquippableAssetsFromTryOnItemsModule (upval), PurchaseItemsSuccessThunkModule (upval), UseSelectorResult11 (copy), UseSelectorResult2 (copy), UseSelectorResult3 (copy), UseSelectorResult4 (copy)
		local UpdateCartFromPurchaseResponseResult = ShoppingCartStore.updateCartFromPurchaseResponse(p3)
		local BoughtItems = UpdateCartFromPurchaseResponseResult.boughtItems
		local EquippableItems = UpdateCartFromPurchaseResponseResult.equippableItems
		local NeedDataRefeshItems = UpdateCartFromPurchaseResponseResult.needDataRefeshItems
		local Tbl = nil
		local Tbl1 = nil
		
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then
			Tbl = UseSelectorResult9[UseSelectorResult5]
			
			if Tbl ~= nil then
				Tbl = table.clone(Tbl)
				Tbl.itemId = UseSelectorResult5
			end
			Tbl1 = UseSelectorResult9[UseSelectorResult6]
			
			if Tbl1 ~= nil then
				Tbl1 = table.clone(Tbl1)
				Tbl1.itemId = UseSelectorResult6
			end
		end
		for _, needDataRefeshItem in NeedDataRefeshItems do
			if p2.fetchItemData then
				p2.fetchItemData(needDataRefeshItem.itemId, needDataRefeshItem.itemType)
			end
		end
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = UseContextResult:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #BoughtItems }),
			toastType = ToastType.InformationMessage
		}))
		local List = {}
		
		for _, equippableItem in EquippableItems do
			local v6 = p4[GetTryOnItemReducerKeyFunction(equippableItem.itemId, equippableItem.itemType)]
			
			if v6 then
				table.insert(List, v6)
			end
		end
		if UseStateResult1 then
			UseResult2(List)
		end
		if not FFlagAXMISSaveWearFix then
			for _, equippableItem1 in EquippableItems do
				if p2.onRemoveItem then
					p2.onRemoveItem(equippableItem1.itemId, equippableItem1.itemType)
				end
			end
		end
		local t = {}
		
		if not FFlagAXMISSaveWearFix and FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end
		if UseStateResult then
			t = GetEquippableAssetsFromTryOnItemsModule(List)
		end
		UseDispatchResult(PurchaseItemsSuccessThunkModule(BoughtItems, t, UseSelectorResult11, UseSelectorResult2, UseSelectorResult3, UseSelectorResult4, List, p2.getBundleOutfitInfoFromProvidedTryOns, UseSelectorResult6 ~= nil, if FFlagAXMISEnableMultiShoppingUnifiedEvents then Tbl else nil, if FFlagAXMISEnableMultiShoppingUnifiedEvents then Tbl1 else nil, if FFlagAXMISSaveWearFix then p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
		if FFlagAXMISSaveWearFix then
			for _, equippableItem2 in EquippableItems do
				if p2.onRemoveItem then
					p2.onRemoveItem(equippableItem2.itemId, equippableItem2.itemType)
				end
			end
			if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end
	end, {
		UseDispatchResult, ShoppingCartStore.updateCartFromPurchaseResponse,
		UseStateResult, UseStateResult1, UseSelectorResult2, UseSelectorResult3,
		UseSelectorResult4, UseSelectorResult11, UseResult2, p2.onRemoveItem,
		p2.fetchItemData, p2.getBundleOutfitInfoFromProvidedTryOns,
		UseSelectorResult6,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult5 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult9 else nil,
		if FFlagAXMISSaveWearFix then p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	})
	local UseResult4 = if FFlagAXMISWithBlackbird then ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult1 (copy), DiscountTypeEnum (upval), UseSignalStateResult4 (copy), UseSignalStateResult3 (copy), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseDispatchResult (copy), PurchasePromptLiteModule (copy), CloseCentralOverlayFunction (upval), PromiseModule (upval), UseRefResult (copy)
		local v7 = nil
		
		if UseSignalStateResult1 then
			for _, value in UseSignalStateResult1 do
				if value.discountCampaign == DiscountTypeEnum.RobloxPlusSubscription then
					v7 = value
					break
				end
			end
		end
		local List = {}
		
		if v7 then
			table.insert(List, 1, {
				Type = DiscountTypeEnum.RobloxPlusSubscription,
				AmountInRobux = UseSignalStateResult4 - UseSignalStateResult3,
				Percent = v7.robuxDiscountPercentage
			})
		end
		if UseOffersCartPricingCalculationsForCartItemsModuleResult.discountSummaryEntriesFromOffers then
			for _, discountSummaryEntriesFromOffer in UseOffersCartPricingCalculationsForCartItemsModuleResult.discountSummaryEntriesFromOffers do
				table.insert(List, {
					Type = discountSummaryEntriesFromOffer.type,
					AmountInRobux = discountSummaryEntriesFromOffer.amountInRobux,
					Percent = discountSummaryEntriesFromOffer.percent,
					LocalizedDiscountAttribution = discountSummaryEntriesFromOffer.localizedDiscountAttribution
				})
			end
		end
		UseDispatchResult(PurchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end,
				fetchProductInfo = function()
					-- upvalues: PromiseModule (upval), UseSignalStateResult3 (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (upval), v7 (ref), UseSignalStateResult4 (upval), List (copy)
					return PromiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount,
						SavingsSummaryOverride = if v7 then UseOffersCartPricingCalculationsForCartItemsModuleResult.savingsSummary else nil,
						BasePriceInRobux = if v7 then UseSignalStateResult4 else nil,
						PriceDiscountDetails = if v7 then List else nil
					})
				end
			}
		}))
		UseRefResult.current = true
	end, {
		UseNavigationResult, UseDispatchResult, UseSignalStateResult3,
		UseSignalStateResult4, UseSignalStateResult1,
		UseOffersCartPricingCalculationsForCartItemsModuleResult
	}) else ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseRefResult (copy)
		UseNavigationResult.navigate(AvatarScreen.InsufficientRobuxPrompt)
		UseRefResult.current = true
	end, { UseNavigationResult })
	local UseMemoResult4 = if FFlagAXMISWithBlackbird then ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), DiscountTypeEnum (upval), FFlagAXMISWithOffers (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseSignalStateResult4 (copy), UseSignalStateResult3 (copy)
		local v8 = nil
		
		if UseSignalStateResult1 then
			for _, value in UseSignalStateResult1 do
				if value.discountCampaign == DiscountTypeEnum.RobloxPlusSubscription then
					v8 = value
					break
				end
			end
		end
		if not FFlagAXMISWithOffers then
			return if v8 and UseSignalStateResult4 and UseSignalStateResult3 then {
				itemPrice = {
					basePriceInRobux = UseSignalStateResult4,
					priceInRobux = UseSignalStateResult3,
					discounts = {
						{
							type = DiscountTypeEnum.RobloxPlusSubscription,
							amountInRobux = UseSignalStateResult4 - UseSignalStateResult3,
							percent = v8.robuxDiscountPercentage
						}
					}
				}
			} else nil
		end
		local Copy = table.clone(UseOffersCartPricingCalculationsForCartItemsModuleResult.discountSummaryEntriesFromOffers)
		
		if v8 then
			table.insert(Copy, 1, {
				type = DiscountTypeEnum.RobloxPlusSubscription,
				amountInRobux = UseSignalStateResult4 - UseSignalStateResult3,
				percent = v8.robuxDiscountPercentage
			})
		end
		return {
			itemPrice = {
				basePriceInRobux = UseSignalStateResult4,
				priceInRobux = math.max(UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount, 0),
				discounts = Copy
			},
			savingsSummary = UseOffersCartPricingCalculationsForCartItemsModuleResult.savingsSummary
		}
	end, {
		UseSignalStateResult4, UseSignalStateResult3, UseSignalStateResult1,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.discountSummaryEntriesFromOffers else nil,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else nil,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.savingsSummary else nil
	}) else nil
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UseSelectorResult9 (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), UseSelectorResult7 (copy), UseSelectorResult8 (copy), UseAvatarRouteResult (copy), AvatarScreenProperties (upval), FFlagAXUnifiedEventStrictPayloads (upval), GetUnifiedEventsForMISFunction (upval), UseSignalStateResult (copy), UseSelectorResult1 (copy), UnifiedEventLogEnums (upval), SendUnifiedEventsForMultiItemShoppingFunction (upval), MutedErrorFunction (upval), PurchaseItemsModule (upval), UseNetworkingResult (copy), UseSelectorResult12 (copy), UseResult (copy), MapPurchaseItemsResponseModule (upval), UseResult3 (copy), TutilsModule (upval), PurchasePromptLiteModule (copy), p2 (copy), GetIsInsufficientRobuxErrorFunction (upval), UseResult4 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseLocalizationResult (copy)
		UseStateResult2_2(true)
		
		if FFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function()
			-- upvalues: UseSelectorResult9 (upval), UseSelectorResult5 (upval), UseSelectorResult6 (upval), UseSelectorResult7 (upval), UseSelectorResult8 (upval), UseAvatarRouteResult (upval), AvatarScreenProperties (upval), FFlagAXUnifiedEventStrictPayloads (upval), GetUnifiedEventsForMISFunction (upval), UseSignalStateResult (upval), UseSelectorResult1 (upval), UnifiedEventLogEnums (upval), SendUnifiedEventsForMultiItemShoppingFunction (upval)
			local UseSelectorResultEntry = UseSelectorResult9[UseSelectorResult5]
			
			if UseSelectorResultEntry ~= nil then
				UseSelectorResultEntry = table.clone(UseSelectorResultEntry)
				UseSelectorResultEntry.itemId = UseSelectorResult5
			end
			local UseSelectorResultEntry1 = UseSelectorResult9[UseSelectorResult6]
			
			if UseSelectorResultEntry1 ~= nil then
				UseSelectorResultEntry1 = table.clone(UseSelectorResultEntry1)
				UseSelectorResultEntry1.itemId = UseSelectorResult6
			end
			if UseSelectorResultEntry then
				UseSelectorResultEntry.isOrganicLook = UseSelectorResult7 == nil
			end
			if UseSelectorResultEntry1 then
				UseSelectorResultEntry1.isOrganicLook = UseSelectorResult8 == nil
			end
			local AvatarScreenProperty = AvatarScreenProperties[UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)]
			local UnifiedLoggingSurface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
			
			if FFlagAXUnifiedEventStrictPayloads then
				local UnifiedEventsForMIS, UnifiedEventsForMIS2 = GetUnifiedEventsForMISFunction(UseSignalStateResult, UseSelectorResult1, UseSelectorResultEntry, UseSelectorResultEntry1, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, UnifiedLoggingSurface, UseSelectorResult7, UseSelectorResult8)
				SendUnifiedEventsForMultiItemShoppingFunction(UnifiedEventsForMIS, UnifiedLoggingSurface, UnifiedEventsForMIS2)
				
				return
			else
				SendUnifiedEventsForMultiItemShoppingFunction(GetUnifiedEventsForMISFunction(UseSignalStateResult, UseSelectorResult1, UseSelectorResultEntry, UseSelectorResultEntry1, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), UnifiedLoggingSurface)
			end
		end) then
			MutedErrorFunction("Failed to send unified events for multi-item shopping purchase attempt")
		end
		PurchaseItemsModule({
			networkImpl = UseNetworkingResult,
			userId = UseSelectorResult12,
			lookId = UseSelectorResult5,
			makeupLookId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult6 else nil,
			lineItems = UseResult()
		}):andThen(function(Result)
			-- upvalues: MapPurchaseItemsResponseModule (upval), UseResult3 (upval), TutilsModule (upval), UseSelectorResult1 (upval), PurchasePromptLiteModule (upval), p2 (upval)
			if Result.isJSONValid and Result.responseCode == 200 then
				UseResult3(MapPurchaseItemsResponseModule(Result.responseBody), TutilsModule.deepCopy(UseSelectorResult1))
				PurchasePromptLiteModule.Events.firePurchaseCompleted()
				
				if p2.fetchUserRobux then
					p2.fetchUserRobux()
				end
			end
		end):catch(function(Err)
			-- upvalues: GetIsInsufficientRobuxErrorFunction (upval), UseResult4 (upval), UseNavigationResult (upval), AvatarScreen (upval), UseSignalStateResult (upval), UseLocalizationResult (upval)
			if GetIsInsufficientRobuxErrorFunction(Err) then
				UseResult4()
				
				return
			else
				UseNavigationResult.navigate(AvatarScreen.GenericPrompt, {
					titleText = if #UseSignalStateResult == 1 then UseLocalizationResult.purchaseFailedTitle else UseLocalizationResult.purchaseFailedTitlePlural,
					bodyText = UseLocalizationResult.purchaseFailedUnknownError,
					buttonText = UseLocalizationResult.purchaseFailedButton
				})
			end
		end):finally(function()
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end)
	end, {
		UseResult, UseSelectorResult12, UseNetworkingResult, UseResult4,
		p2.fetchUserRobux, UseResult3, UseSignalStateResult, UseLocalizationResult,
		UseNavigationResult, UseSelectorResult5,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult6 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult9 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult1 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult7 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult8 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseAvatarRouteResult else nil,
		PurchasePromptLiteModule.Events.firePurchaseCompleted
	})
	
	return {
		canPurchase = UseSignalStateResult2,
		cartItems = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), CryoModule (upval), Constants (upval), p2 (copy), FFlagAXBackgroundsEquipTryOnCounters (upval), ReportBackgroundUserActionCounter (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), FFlagAXUnifiedEventStrictPayloads (upval), UnifiedEventLogConstants (upval), UnifiedSelectionListStore (upval), CartIdService (upval), GetMarketplaceUnifiedAssetTypeFunction (upval), GetMarketplaceUnifiedBundleTypeFunction (upval), UseSelectorResult (copy), SendUnifiedEventForDeferredActionFunction (upval), GetUnifiedLoggingSurfaceFunction (upval), UseAvatarRouteResult (copy), FFlagAXDurablesForMIS (upval), ShoppingCartStore (copy), UseDispatchResult (copy), SetSelectedTimedOptionModule (upval), FFlagAXMISWithOffers (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), v73 (upval)
			local JoinResults = {}
			
			for i, value in UseSignalStateResult do
				table.insert(JoinResults, CryoModule.Dictionary.join(value, {
					onActivated = function()
						-- upvalues: value (copy), Constants (upval), p2 (upval)
						if value.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then return end
						if p2.onOpenItemDetailsPage then
							p2.onOpenItemDetailsPage(value.itemId, value.itemType, value.itemSubType)
						end
					end,
					onRemove = function()
						-- upvalues: p2 (upval), FFlagAXBackgroundsEquipTryOnCounters (upval), ReportBackgroundUserActionCounter (upval), value (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), FFlagAXUnifiedEventStrictPayloads (upval), UnifiedEventLogConstants (upval), UnifiedSelectionListStore (upval), CartIdService (upval), GetMarketplaceUnifiedAssetTypeFunction (upval), GetMarketplaceUnifiedBundleTypeFunction (upval), i (copy), UseSelectorResult (upval), SendUnifiedEventForDeferredActionFunction (upval), GetUnifiedLoggingSurfaceFunction (upval), UseAvatarRouteResult (upval)
						if p2.onRemoveItem then
							if FFlagAXBackgroundsEquipTryOnCounters then
								ReportBackgroundUserActionCounter.reportIfAvatarBackgroundAsset("RemoveTryOn", value.itemType, value.itemSubType)
							end
							p2.onRemoveItem(value.itemId, value.itemType)
							
							if FFlagAXMISEnableMultiShoppingUnifiedEvents then
								local ASSET = if value.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif value.itemType == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else nil
								local v9 = nil
								local v10 = nil
								local v11 = nil
								local v12 = nil
								local v13 = nil
								local v14 = nil
								
								if FFlagAXUnifiedEventStrictPayloads then
									local ATTRIBUTEPREFIX = UnifiedEventLogConstants.ATTRIBUTE_PREFIX
									local Text = ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_ID
									local Text1 = ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_TYPE
									
									for _, value1 in UnifiedSelectionListStore.getSelectionList() do
										if tostring(value1[Text]) == tostring(value.itemId) and tostring(value1[Text1]) == tostring(ASSET) then
											v9 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_ROW]
											v10 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_COLUMN]
											v11 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ELEMENT_SIZE_HEIGHT]
											v12 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ELEMENT_SIZE_WIDTH]
											v13 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_SCREEN_SIZE_HEIGHT]
											v14 = value1[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_SCREEN_SIZE_WIDTH]
											break
										end
									end
								end
								SendUnifiedEventForDeferredActionFunction({
									action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED,
									cartId = CartIdService.getCartId(),
									itemId = value.itemId,
									itemType = if FFlagAXUnifiedEventStrictPayloads then if value.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else ASSET,
									assetType = if value.itemType == "Asset" then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedAssetTypeFunction(value.itemSubType) else value.itemSubType else nil,
									bundleType = if value.itemType == "Asset" then nil elseif FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedBundleTypeFunction(value.itemSubType) else value.itemSubType,
									gridPositionRow = if FFlagAXUnifiedEventStrictPayloads then v9 or i else nil,
									gridPositionColumn = if FFlagAXUnifiedEventStrictPayloads then v10 or 1 else nil,
									elementSizeHeight = if FFlagAXUnifiedEventStrictPayloads then v11 else nil,
									elementSizeWidth = if FFlagAXUnifiedEventStrictPayloads then v12 else nil,
									screenSizeHeight = if FFlagAXUnifiedEventStrictPayloads then v13 or (if UseSelectorResult then math.round(UseSelectorResult.Y) else nil) else nil,
									screenSizeWidth = if FFlagAXUnifiedEventStrictPayloads then v14 or (if UseSelectorResult then math.round(UseSelectorResult.X) else nil) else nil
								}, if FFlagAXUnifiedEventStrictPayloads then {
									surface = GetUnifiedLoggingSurfaceFunction(UseAvatarRouteResult)
								} else nil)
							end
						end
					end,
					onTimedOptionPriceChanged = if FFlagAXDurablesForMIS then function(p5, Days)
						-- upvalues: ShoppingCartStore (upval), value (copy), CryoModule (upval), UseDispatchResult (upval), SetSelectedTimedOptionModule (upval)
						if ShoppingCartStore.updateItemPrice then
							if value.timedOptions then
								UseDispatchResult(SetSelectedTimedOptionModule({
									itemId = value.itemId,
									itemType = value.itemType,
									selectedTimedOptionIndex = CryoModule.List.findWhere(value.timedOptions, function(p6): boolean
										-- upvalues: Days (copy)
										return p6.days == Days
									end) or #value.timedOptions
								}))
							end
							ShoppingCartStore.updateItemPrice(value.itemId, value.itemType, p5, Days)
						end
					end else nil
				}))
			end
			if FFlagAXMISWithOffers and UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers and #CryoModule.Dictionary.keys(UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers) > 0 then
				JoinResults = v73(JoinResults, UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers)
			end
			return JoinResults
		end, {
			UseSignalStateResult,
			if FFlagAXUnifiedEventStrictPayloads then UseSelectorResult else nil,
			if FFlagAXUnifiedEventStrictPayloads then UseAvatarRouteResult else nil,
			p2.onOpenItemDetailsPage, p2.onRemoveItem,
			if FFlagAXDurablesForMIS then ShoppingCartStore else nil,
			if FFlagAXDurablesForMIS then UseDispatchResult else nil,
			if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers else nil
		}),
		discounts = if FFlagAXMISWithBlackbird then UseSignalStateResult1 else nil,
		erroredItemCount = UseSignalStateResult5,
		isPurchasing = UseStateResult3,
		isVisible = UseMemoResult1,
		hideBuyOptions = if FFlagAXEnableExpiredUserLookCheckout then UseMemoResult2 else nil,
		shouldShowBlackbirdUpsellBanner = if FFlagAXMISWithBlackbird then UseMemoResult3 else nil,
		isWearAfterPurchaseChecked = UseStateResult,
		isAddToMyAvatarsChecked = UseStateResult1,
		isSaveOptionsOpen = IsSaveOptionsOpen,
		onCheckoutButtonActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagAXMISWithOffers (upval), UseSignalStateResult3 (copy), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseSelectorResult13 (copy), UseResult4 (copy), UseResult5 (copy)
			local UseSignalStateResultDelta = if FFlagAXMISWithOffers then UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else UseSignalStateResult3
			
			if UseSelectorResult13 and UseSelectorResult13 < UseSignalStateResultDelta then
				UseResult4()
				
				return
			else
				UseResult5()
			end
		end, {
			UseSelectorResult13,
			UseSignalStateResult3,
			UseResult5,
			UseResult4,
			if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else nil
		}),
		onOpenItemDetailsPage = ReactModule.useCallback(function(p5, p6, p7)
			-- upvalues: p2 (copy)
			if p2.onOpenItemDetailsPage then
				p2.onOpenItemDetailsPage(p5, p6, p7)
			end
		end, { p2.onOpenItemDetailsPage }),
		onRemoveItem = ReactModule.useCallback(function(p5, p6, _)
			-- upvalues: p2 (copy)
			if p2.onRemoveItem then
				p2.onRemoveItem(p5, p6)
			end
		end, {
			p2.onRemoveItem,
			UseSelectorResult1,
			UseNavigationResult
		}),
		onUnavailableButtonActivated = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
			UseNavigationResult.navigate(AvatarScreen.CartUnavailableItemsPrompt)
		end, { UseNavigationResult }),
		onWearAfterPurchaseToggle = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), UseStateResult (copy), FFlagAXMISWithOffers (upval), UseSaveOptionsStoredValuesModuleResult (copy)
			UseStateResult2(not UseStateResult)
			
			if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then
				UseSaveOptionsStoredValuesModuleResult.setWearAfterPurchase(not UseStateResult)
			end
		end, {
			UseStateResult,
			if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModuleResult else nil
		}),
		onAddToMyAvatarsToggle = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), FFlagAXMISWithOffers (upval), UseSaveOptionsStoredValuesModuleResult (copy)
			UseStateResult2_1(not UseStateResult1)
			
			if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then
				UseSaveOptionsStoredValuesModuleResult.setAddToAvatars(not UseStateResult1)
			end
		end, {
			UseStateResult1,
			if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModuleResult else nil
		}),
		onSaveOptionsOpenToggle = if FFlagAXMISWithOffers then ReactModule.useCallback(function()
			-- upvalues: Callback (ref), IsSaveOptionsOpen (ref)
			Callback(not IsSaveOptionsOpen)
		end, { IsSaveOptionsOpen }) else nil,
		purchasableItemsTotalPriceInRobux = if FFlagAXMISWithOffers then math.max(UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount, 0) else UseSignalStateResult3,
		purchasableItemsTotalOriginalPriceInRobux = UseSignalStateResult4,
		robloxSubscriptionProducts = if FFlagAXMISWithBlackbird then v4 else nil,
		discountSummaryProps = if FFlagAXMISWithBlackbird then UseMemoResult4 else nil,
		offersAvailable = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable else nil,
		handleDeselectOfferId = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.handleDeselectOfferId else nil
	}
end