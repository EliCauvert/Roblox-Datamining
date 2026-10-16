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
local SendUnifiedEventsForMultiItemShoppingFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventsForMultiItemShopping
local GetUnifiedEventsForMISFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedEventsForMIS
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagAXFixMISUpsellDiscountSummary = SharedFlagsModule.FFlagAXFixMISUpsellDiscountSummary
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local FFlagAXMISOffersChip = AvatarExperienceFlagsModule.FFlagAXMISOffersChip
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXMISSaveWearFix = AvatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local FFlagAXBackgroundsEquipTryOnCounters = AvatarExperienceFlagsModule.FFlagAXBackgroundsEquipTryOnCounters
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local ReportBackgroundUserActionCounter = AvatarExperienceAnalyticsModule.reportBackgroundUserActionCounter

local function selectTryOnLookId(p1) --[[ Line: 98 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local v1 = if FFlagAXCatalogMakeupSupport then function(p1) --[[ Line: 104 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
end else nil
local v2: ((any) -> any)? = nil
local v3: ((any) -> any)? = nil

if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	v2 = function(p1) --[[ Line: 111 ]]
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	
	v3 = function(p1) --[[ Line: 115 ]]
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end
local function selectAvatarSceneLooks(p1) --[[ Line: 120 ]]
	return p1.AvatarExperience.AvatarScene.Looks
end

local function selectTryOnItems(p1) --[[ Line: 124 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectTryOnBodyColor3s(p1) --[[ Line: 128 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
end

local function selectTryOnBodyScales(p1) --[[ Line: 132 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.Scale
end

local function selectTryOnBodyPartColorRangeIds(p1) --[[ Line: 136 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
end

local function _(p1) --[[ Line: 140 | Named "selectAssetInfos" ]]
	return p1.AvatarExperience.Common.AssetInfos or {}
end

local _ = function(p1) --[[ Line: 144 | Named "selectBundleInfos" ]]
	return p1.AvatarExperience.Common.BundleInfos or {}
end

local _ = function(p1) --[[ Line: 148 | Named "selectCollectibles" ]]
	return p1.AvatarExperience.Common.Collectibles or {}
end

local function selectLocalUserId(p1) --[[ Line: 152 ]]
	return p1.LocalUserId
end

local function selectShouldTryOnWithoutEquippedItems(p1) --[[ Line: 156 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
end

local function selectUserRobux(p1) --[[ Line: 160 ]]
	local LocalUserId = p1.LocalUserId
	
	return if LocalUserId and p1.UserRobux then p1.UserRobux[LocalUserId] else nil
end

local function v67(p1) --[[ Line: 168 ]]
	local LocalUserId = p1.LocalUserId
	
	return if LocalUserId and p1.Users then p1.Users[LocalUserId].hasRobloxSubscription else false
end

local function selectItemInfoForTryOnItems(p1) --[[ Line: 180 ]]
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

local function v69(JoinResults, DiscountedItemsFromOffers) --[[ Line: 228 ]]
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

return function(p2) --[[ Line: 262 | Named "useCheckoutPageViewModel" ]]
	-- upvalues: Parent (copy), UseAXCatalogStoreContextModule (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseNetworkingFunction (copy), UseDispatchFunction (copy), FFlagAXMISWithOffers (copy), UseSaveOptionsStoredValuesModule (copy), UseSignalStateFunction (copy), FFlagAXMISWithBlackbird (copy), ReactModule (copy), UseSelectorFunction (copy), selectTryOnItems (copy), TutilsModule (copy), selectTryOnBodyColor3s (copy), selectTryOnBodyScales (copy), selectTryOnBodyPartColorRangeIds (copy), selectTryOnLookId (copy), FFlagAXCatalogMakeupSupport (copy), v1 (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v2 (ref), v3 (ref), selectAvatarSceneLooks (copy), selectItemInfoForTryOnItems (copy), selectShouldTryOnWithoutEquippedItems (copy), selectLocalUserId (copy), selectUserRobux (copy), v67 (copy), UseLocalizationFunction (copy), LocalizationRoactContext (copy), UseAppPolicyFunction (copy), UseNavigationFocusFunction (copy), FFlagAXEnableExpiredUserLookCheckout (copy), RobloxEventReceiver (copy), NotificationService (copy), AvatarScreen (copy), GetRobloxSubscriptionProductsFunction (copy), MutedErrorFunction (copy), UseOffersCartPricingCalculationsForCartItemsModule (copy), CryoModule (copy), Constants (copy), FFlagAXBackgroundsEquipTryOnCounters (copy), ReportBackgroundUserActionCounter (copy), UnifiedEventLogEnums (copy), SendUnifiedEventForDeferredActionFunction (copy), CartIdService (copy), FFlagAXDurablesForMIS (copy), SetSelectedTimedOptionModule (copy), v69 (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), ToastType (copy), SetCurrentToastMessageFunction (copy), GetTryOnItemsContainsOnlyMakeupTypesModule (copy), FFlagAXMISSaveWearFix (copy), SaveAsMakeupLookThunkModule (copy), SaveAsAvatarThunkModule (copy), GetTryOnItemReducerKeyFunction (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), GetEquippableAssetsFromTryOnItemsModule (copy), PurchaseItemsSuccessThunkModule (copy), DiscountTypeEnum (copy), FFlagAXFixMISUpsellDiscountSummary (copy), CloseCentralOverlayFunction (copy), PromiseModule (copy), AvatarScreenProperties (copy), SendUnifiedEventsForMultiItemShoppingFunction (copy), GetUnifiedEventsForMISFunction (copy), PurchaseItemsModule (copy), MapPurchaseItemsResponseModule (copy), GetIsInsufficientRobuxErrorFunction (copy)
	local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
	local ShoppingCartStore = UseAXCatalogStoreContextModule().shoppingCartStore
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNetworkingResult = UseNetworkingFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSaveOptionsStoredValuesModuleResult = if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModule() else nil
	local UseSignalStateResult = UseSignalStateFunction(ShoppingCartStore.getItems)
	local UseSignalStateResult1 = if FFlagAXMISWithBlackbird then UseSignalStateFunction(ShoppingCartStore.getDiscounts) else nil
	local UseSignalStateResult2 = UseSignalStateFunction(ShoppingCartStore.getCanPurchase)
	local UseSignalStateResult3 = UseSignalStateFunction(ShoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local UseSignalStateResult4 = UseSignalStateFunction(ShoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local UseSignalStateResult5 = UseSignalStateFunction(ShoppingCartStore.getErroredItemCount)
	local IsSaveOptionsOpen = nil
	local Callback1 = nil
	
	if FFlagAXMISWithOffers then
		IsSaveOptionsOpen, Callback1 = ReactModule.useState(false)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(not FFlagAXMISWithOffers or not UseSaveOptionsStoredValuesModuleResult or UseSaveOptionsStoredValuesModuleResult.getWearAfterPurchase())
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then UseSaveOptionsStoredValuesModuleResult.getAddToAvatars() else false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local v4 = nil
	local Callback2 = nil
	
	if FFlagAXMISWithBlackbird then
		v4, Callback2 = ReactModule.useState({})
	end
	local v5 = nil
	local Callback = nil
	
	if FFlagAXMISWithOffers then
		v5, Callback = ReactModule.useState(false)
	end
	local UseSelectorResult = UseSelectorFunction(selectTryOnItems, TutilsModule.deepEqual)
	local UseSelectorResult1 = UseSelectorFunction(selectTryOnBodyColor3s, TutilsModule.deepEqual)
	local UseSelectorResult2 = UseSelectorFunction(selectTryOnBodyScales, TutilsModule.deepEqual)
	local UseSelectorResult3 = UseSelectorFunction(selectTryOnBodyPartColorRangeIds, TutilsModule.deepEqual)
	local UseSelectorResult4 = UseSelectorFunction(selectTryOnLookId)
	local UseSelectorResult5 = if FFlagAXCatalogMakeupSupport then UseSelectorFunction(v1) else nil
	local UseSelectorResult6 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorFunction(v2) else nil
	local UseSelectorResult7 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorFunction(v3) else nil
	local UseSelectorResult8 = UseSelectorFunction(selectAvatarSceneLooks, TutilsModule.deepEqual)
	local UseSelectorResult9 = UseSelectorFunction(selectItemInfoForTryOnItems, TutilsModule.deepEqual)
	local UseSelectorResult10 = UseSelectorFunction(selectShouldTryOnWithoutEquippedItems)
	local UseSelectorResult11 = UseSelectorFunction(selectLocalUserId)
	local UseSelectorResult12 = UseSelectorFunction(selectUserRobux)
	local UseSelectorResult13 = if FFlagAXMISWithBlackbird then UseSelectorFunction(v67) else nil
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
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3) --[[ Line: 333 ]]
		return p3.getDisableResellingCollectiblesForCompliance()
	end)
	local UseAppPolicyResult1 = if FFlagAXMISWithBlackbird then UseAppPolicyFunction(function(p3) --[[ Line: 337 ]]
		return p3.getDisableBlackbirdEntrypoints()
	end) else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseRefResult1 = nil
	
	if FFlagAXEnableExpiredUserLookCheckout then
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 351 ]]
			-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
			return RobloxEventReceiver.new(NotificationService)
		end, {})
		UseRefResult1 = ReactModule.useRef(nil)
		
		if UseMemoResult ~= nil then
			UseRefResult1.current = UseMemoResult:observeEvent("AvatarAssetOwnershipNotifications", function() --[[ Line: 359 ]]
				-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy)
				if (if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name) else nil) == AvatarScreen.ExpiredUserLookCheckout then
					UseNavigationResult.pop(2)
				end
			end)
		end
	end
	ReactModule.useEffect(function() --[[ Line: 373 ]]
		-- upvalues: p2 (copy), UseSelectorResult12 (copy), FFlagAXMISWithBlackbird (upval), GetRobloxSubscriptionProductsFunction (upval), Callback2 (ref), MutedErrorFunction (upval), FFlagAXEnableExpiredUserLookCheckout (upval), UseRefResult1 (ref)
		if p2.fetchUserRobux and not UseSelectorResult12 then
			p2.fetchUserRobux()
		end
		if FFlagAXMISWithBlackbird then
			GetRobloxSubscriptionProductsFunction():andThen(function(Result) --[[ Line: 381 ]]
				-- upvalues: Callback2 (upval)
				Callback2(Result)
			end):catch(function(Err) --[[ Line: 384 ]]
				-- upvalues: MutedErrorFunction (upval)
				MutedErrorFunction("CheckoutPageViewModel", "Failed to fetch Roblox subscription products: " .. tostring(Err))
			end)
		end
		return function() --[[ Line: 392 ]]
			-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseRefResult1 (upval)
			if FFlagAXEnableExpiredUserLookCheckout and UseRefResult1.current ~= nil then
				UseRefResult1.current:disconnect()
				UseRefResult1.current = nil
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 404 ]]
		-- upvalues: UseNavigationFocusResult (copy), UseRefResult (copy), p2 (copy)
		if UseNavigationFocusResult and UseRefResult.current and p2.fetchUserRobux then
			p2.fetchUserRobux()
			UseRefResult.current = false
		end
	end, { UseNavigationFocusResult, p2.fetchUserRobux })
	ReactModule.useLayoutEffect(function() --[[ Line: 413 ]]
		-- upvalues: ShoppingCartStore (copy), UseSelectorResult9 (copy), UseAppPolicyResult (copy), FFlagAXMISWithOffers (upval), Callback (ref), FFlagAXEnableExpiredUserLookCheckout (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy)
		ShoppingCartStore.syncFromTryOns(UseSelectorResult9, UseAppPolicyResult)
		
		if FFlagAXMISWithOffers then
			Callback(true)
		end
		local Name = if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name) else nil
		
		if FFlagAXEnableExpiredUserLookCheckout then
			if UseSelectorResult9 and #UseSelectorResult9 <= 0 and (Name == AvatarScreen.Checkout or Name == AvatarScreen.ExpiredUserLookCheckout) then
				UseNavigationResult.goBack()
				
				return
			end
		elseif UseSelectorResult9 and #UseSelectorResult9 <= 0 then
			UseNavigationResult.goBack()
		end
	end, {
		ShoppingCartStore,
		UseSelectorResult9,
		UseAppPolicyResult,
		UseNavigationResult,
		if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean --[[ Line: 449 ]]
		-- upvalues: UseAvatarRouteResult (copy), FFlagAXEnableExpiredUserLookCheckout (upval), AvatarScreen (upval)
		local Name = UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)
		
		return FFlagAXEnableExpiredUserLookCheckout and Name == AvatarScreen.ExpiredUserLookCheckout or Name == AvatarScreen.Checkout
	end, { UseAvatarRouteResult })
	local UseOffersCartPricingCalculationsForCartItemsModuleResult = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModule(UseSignalStateResult, UseMemoResult1, v5) else nil
	local UseMemoResult2 = if FFlagAXEnableExpiredUserLookCheckout then ReactModule.useMemo(function(): boolean --[[ Line: 562 ]]
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval)
		return (UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)) == AvatarScreen.ExpiredUserLookCheckout
	end, { UseAvatarRouteResult }) else nil
	local UseMemoResult3 = if FFlagAXMISWithBlackbird then ReactModule.useMemo(function(): boolean --[[ Line: 570 ]]
		-- upvalues: UseSelectorResult13 (copy), UseAppPolicyResult1 (copy), FFlagAXMISWithOffers (upval), CryoModule (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseSignalStateResult (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (upval), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (upval)
		if not UseSelectorResult13 and not UseAppPolicyResult1 and (not FFlagAXMISWithOffers or FFlagAXMISWithOffers and #CryoModule.Dictionary.keys(UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable) == 0) then
			for _, value in UseSignalStateResult do
				if FIntBlackbirdUpsellMinPriceForDiscountInclusive <= value.priceInRobux and value.priceInRobux <= FIntBlackbirdUpsellMaxPriceForDiscountInclusive and (not value.isOwned or value.isOwned and value.expirationTime) then
					return true
				end
			end
		end
		return false
	end, {
		UseSelectorResult13,
		UseAppPolicyResult1,
		UseSignalStateResult,
		if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable else nil
	}) else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 637 ]]
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
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 670 ]]
		-- upvalues: UseLocalizationResult (copy), ToastType (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = UseLocalizationResult.characterSavedHeading,
			toastSubMessage = UseLocalizationResult.characterSavedMsg,
			toastType = ToastType.SuccessConfirmation
		}))
	end, { UseDispatchResult, UseLocalizationResult })
	local UseResult2 = ReactModule.useCallback(function(p3) --[[ Line: 680 ]]
		-- upvalues: FFlagAXCatalogMakeupSupport (upval), GetTryOnItemsContainsOnlyMakeupTypesModule (upval), UseSelectorResult8 (copy), UseSelectorResult5 (copy), UseSelectorResult4 (copy), FFlagAXMISSaveWearFix (upval), UseDispatchResult (copy), SaveAsMakeupLookThunkModule (upval), UseNetworkingResult (copy), p2 (copy), SaveAsAvatarThunkModule (upval), UseResult1 (copy)
		if not FFlagAXCatalogMakeupSupport then
			UseDispatchResult(SaveAsAvatarThunkModule(if UseSelectorResult8 and UseSelectorResult8[UseSelectorResult4] and UseSelectorResult8[UseSelectorResult4].name then UseSelectorResult8[UseSelectorResult4].name else "Avatar", p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p3, UseResult1))
			
			return
		end
		local TryOnItemsContainsOnlyMakeupTypesModule = GetTryOnItemsContainsOnlyMakeupTypesModule(p3)
		local Name = if UseSelectorResult8 and UseSelectorResult8[UseSelectorResult4] and UseSelectorResult8[UseSelectorResult4].name then UseSelectorResult8[UseSelectorResult4].name elseif UseSelectorResult8 and UseSelectorResult8[UseSelectorResult5] and UseSelectorResult8[UseSelectorResult5].name then UseSelectorResult8[UseSelectorResult5].name elseif TryOnItemsContainsOnlyMakeupTypesModule then "Makeup" else "Avatar"
		
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
		UseSelectorResult8, UseSelectorResult4,
		if FFlagAXCatalogMakeupSupport then UseNetworkingResult else nil,
		if FFlagAXCatalogMakeupSupport then UseSelectorResult5 else nil
	})
	local UseResult3 = ReactModule.useCallback(function(p3, p4) --[[ Line: 745 ]]
		-- upvalues: ShoppingCartStore (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UseSelectorResult8 (copy), UseSelectorResult4 (copy), UseSelectorResult5 (copy), p2 (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseContextResult (copy), ToastType (upval), GetTryOnItemReducerKeyFunction (upval), UseStateResult1 (copy), UseResult2 (copy), FFlagAXMISSaveWearFix (upval), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), UseStateResult (copy), GetEquippableAssetsFromTryOnItemsModule (upval), PurchaseItemsSuccessThunkModule (upval), UseSelectorResult10 (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy), UseSelectorResult3 (copy)
		local UpdateCartFromPurchaseResponseResult = ShoppingCartStore.updateCartFromPurchaseResponse(p3)
		local BoughtItems = UpdateCartFromPurchaseResponseResult.boughtItems
		local EquippableItems = UpdateCartFromPurchaseResponseResult.equippableItems
		local NeedDataRefeshItems = UpdateCartFromPurchaseResponseResult.needDataRefeshItems
		local Tbl = nil
		local Tbl1 = nil
		
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then
			Tbl = UseSelectorResult8[UseSelectorResult4]
			
			if Tbl ~= nil then
				Tbl = table.clone(Tbl)
				Tbl.itemId = UseSelectorResult4
			end
			Tbl1 = UseSelectorResult8[UseSelectorResult5]
			
			if Tbl1 ~= nil then
				Tbl1 = table.clone(Tbl1)
				Tbl1.itemId = UseSelectorResult5
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
		UseDispatchResult(PurchaseItemsSuccessThunkModule(BoughtItems, t, UseSelectorResult10, UseSelectorResult1, UseSelectorResult2, UseSelectorResult3, List, p2.getBundleOutfitInfoFromProvidedTryOns, UseSelectorResult5 ~= nil, if FFlagAXMISEnableMultiShoppingUnifiedEvents then Tbl else nil, if FFlagAXMISEnableMultiShoppingUnifiedEvents then Tbl1 else nil, if FFlagAXMISSaveWearFix then p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
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
		UseStateResult, UseStateResult1, UseSelectorResult1, UseSelectorResult2,
		UseSelectorResult3, UseSelectorResult10, UseResult2, p2.onRemoveItem,
		p2.fetchItemData, p2.getBundleOutfitInfoFromProvidedTryOns,
		UseSelectorResult5,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult4 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult8 else nil,
		if FFlagAXMISSaveWearFix then p2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	})
	local UseResult4 = if FFlagAXMISWithBlackbird then ReactModule.useCallback(function() --[[ Line: 879 ]]
		-- upvalues: UseSignalStateResult1 (copy), DiscountTypeEnum (upval), FFlagAXFixMISUpsellDiscountSummary (upval), UseSignalStateResult4 (copy), UseSignalStateResult3 (copy), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseDispatchResult (copy), PurchasePromptLiteModule (copy), CloseCentralOverlayFunction (upval), PromiseModule (upval), UseRefResult (copy)
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
		
		if FFlagAXFixMISUpsellDiscountSummary then
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
		end
		UseDispatchResult(PurchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function() --[[ Line: 916 ]]
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end,
				fetchProductInfo = function() --[[ Line: 919 ]]
					-- upvalues: PromiseModule (upval), FFlagAXFixMISUpsellDiscountSummary (upval), UseSignalStateResult3 (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (upval), v7 (ref), UseSignalStateResult4 (upval), List (copy)
					return PromiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = if FFlagAXFixMISUpsellDiscountSummary then UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else UseSignalStateResult3,
						SavingsSummaryOverride = if FFlagAXFixMISUpsellDiscountSummary and v7 then UseOffersCartPricingCalculationsForCartItemsModuleResult.savingsSummary else nil,
						BasePriceInRobux = if v7 then UseSignalStateResult4 else nil,
						PriceDiscountDetails = if v7 then if FFlagAXFixMISUpsellDiscountSummary then List else {
							{
								Type = v7.discountCampaign,
								AmountInRobux = UseSignalStateResult4 - UseSignalStateResult3,
								Percent = v7.robuxDiscountPercentage
							}
						} else nil
					})
				end
			}
		}))
		UseRefResult.current = true
	end, {
		UseNavigationResult, UseDispatchResult, UseSignalStateResult3,
		UseSignalStateResult4, UseSignalStateResult1,
		if FFlagAXFixMISUpsellDiscountSummary then UseOffersCartPricingCalculationsForCartItemsModuleResult else nil
	}) else ReactModule.useCallback(function() --[[ Line: 959 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseRefResult (copy)
		UseNavigationResult.navigate(AvatarScreen.InsufficientRobuxPrompt)
		UseRefResult.current = true
	end, { UseNavigationResult })
	local UseMemoResult4 = if FFlagAXMISWithBlackbird then ReactModule.useMemo(function() --[[ Line: 967 ]]
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
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 1038 ]]
		-- upvalues: UseStateResult2_2 (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UseSelectorResult8 (copy), UseSelectorResult4 (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), UseSelectorResult7 (copy), UseAvatarRouteResult (copy), AvatarScreenProperties (upval), SendUnifiedEventsForMultiItemShoppingFunction (upval), GetUnifiedEventsForMISFunction (upval), UseSignalStateResult (copy), UseSelectorResult (copy), UnifiedEventLogEnums (upval), MutedErrorFunction (upval), PurchaseItemsModule (upval), UseNetworkingResult (copy), UseSelectorResult11 (copy), UseResult (copy), MapPurchaseItemsResponseModule (upval), UseResult3 (copy), TutilsModule (upval), PurchasePromptLiteModule (copy), p2 (copy), GetIsInsufficientRobuxErrorFunction (upval), UseResult4 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseLocalizationResult (copy)
		UseStateResult2_2(true)
		
		if FFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function() --[[ Line: 1042 ]]
			-- upvalues: UseSelectorResult8 (upval), UseSelectorResult4 (upval), UseSelectorResult5 (upval), UseSelectorResult6 (upval), UseSelectorResult7 (upval), UseAvatarRouteResult (upval), AvatarScreenProperties (upval), SendUnifiedEventsForMultiItemShoppingFunction (upval), GetUnifiedEventsForMISFunction (upval), UseSignalStateResult (upval), UseSelectorResult (upval), UnifiedEventLogEnums (upval)
			local UseSelectorResultEntry = UseSelectorResult8[UseSelectorResult4]
			
			if UseSelectorResultEntry ~= nil then
				UseSelectorResultEntry = table.clone(UseSelectorResultEntry)
				UseSelectorResultEntry.itemId = UseSelectorResult4
			end
			local UseSelectorResultEntry1 = UseSelectorResult8[UseSelectorResult5]
			
			if UseSelectorResultEntry1 ~= nil then
				UseSelectorResultEntry1 = table.clone(UseSelectorResultEntry1)
				UseSelectorResultEntry1.itemId = UseSelectorResult5
			end
			if UseSelectorResultEntry then
				UseSelectorResultEntry.isOrganicLook = UseSelectorResult6 == nil
			end
			if UseSelectorResultEntry1 then
				UseSelectorResultEntry1.isOrganicLook = UseSelectorResult7 == nil
			end
			local AvatarScreenProperty = AvatarScreenProperties[UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)]
			SendUnifiedEventsForMultiItemShoppingFunction(GetUnifiedEventsForMISFunction(UseSignalStateResult, UseSelectorResult, UseSelectorResultEntry, UseSelectorResultEntry1, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil)
		end) then
			MutedErrorFunction("Failed to send unified events for multi-item shopping purchase attempt")
		end
		PurchaseItemsModule({
			networkImpl = UseNetworkingResult,
			userId = UseSelectorResult11,
			lookId = UseSelectorResult4,
			makeupLookId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult5 else nil,
			lineItems = UseResult()
		}):andThen(function(Result) --[[ Line: 1096 ]]
			-- upvalues: MapPurchaseItemsResponseModule (upval), UseResult3 (upval), TutilsModule (upval), UseSelectorResult (upval), PurchasePromptLiteModule (upval), p2 (upval)
			if Result.isJSONValid and Result.responseCode == 200 then
				UseResult3(MapPurchaseItemsResponseModule(Result.responseBody), TutilsModule.deepCopy(UseSelectorResult))
				PurchasePromptLiteModule.Events.firePurchaseCompleted()
				
				if p2.fetchUserRobux then
					p2.fetchUserRobux()
				end
			end
		end):catch(function(Err) --[[ Line: 1112 ]]
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
		end):finally(function() --[[ Line: 1125 ]]
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end)
	end, {
		UseResult, UseSelectorResult11, UseNetworkingResult, UseResult4,
		p2.fetchUserRobux, UseResult3, UseSignalStateResult, UseLocalizationResult,
		UseNavigationResult, UseSelectorResult4,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult5 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult8 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult6 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorResult7 else nil,
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseAvatarRouteResult else nil,
		PurchasePromptLiteModule.Events.firePurchaseCompleted
	})
	
	return {
		canPurchase = UseSignalStateResult2,
		cartItems = ReactModule.useMemo(function() --[[ Line: 465 ]]
			-- upvalues: UseSignalStateResult (copy), CryoModule (upval), Constants (upval), p2 (copy), FFlagAXBackgroundsEquipTryOnCounters (upval), ReportBackgroundUserActionCounter (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), SendUnifiedEventForDeferredActionFunction (upval), CartIdService (upval), FFlagAXDurablesForMIS (upval), ShoppingCartStore (copy), UseDispatchResult (copy), SetSelectedTimedOptionModule (upval), FFlagAXMISWithOffers (upval), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), v69 (upval)
			local JoinResults = {}
			
			for _, value in UseSignalStateResult do
				table.insert(JoinResults, CryoModule.Dictionary.join(value, {
					onActivated = function() --[[ Line: 471 ]]
						-- upvalues: value (copy), Constants (upval), p2 (upval)
						if value.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then return end
						if p2.onOpenItemDetailsPage then
							p2.onOpenItemDetailsPage(value.itemId, value.itemType, value.itemSubType)
						end
					end,
					onRemove = function() --[[ Line: 480 ]]
						-- upvalues: p2 (upval), FFlagAXBackgroundsEquipTryOnCounters (upval), ReportBackgroundUserActionCounter (upval), value (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), SendUnifiedEventForDeferredActionFunction (upval), CartIdService (upval)
						if p2.onRemoveItem then
							if FFlagAXBackgroundsEquipTryOnCounters then
								ReportBackgroundUserActionCounter.reportIfAvatarBackgroundAsset("RemoveTryOn", value.itemType, value.itemSubType)
							end
							p2.onRemoveItem(value.itemId, value.itemType)
							
							if FFlagAXMISEnableMultiShoppingUnifiedEvents then
								SendUnifiedEventForDeferredActionFunction({
									action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED,
									cartId = CartIdService.getCartId(),
									itemId = value.itemId,
									itemType = if value.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif value.itemType == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else nil,
									assetType = if value.itemType == "Asset" then value.itemSubType else nil,
									bundleType = if value.itemType == "Asset" then nil else value.itemSubType
								})
							end
						end
					end,
					onTimedOptionPriceChanged = if FFlagAXDurablesForMIS then function(p5, Days) --[[ Line: 512 ]]
						-- upvalues: ShoppingCartStore (upval), value (copy), CryoModule (upval), UseDispatchResult (upval), SetSelectedTimedOptionModule (upval)
						if ShoppingCartStore.updateItemPrice then
							if value.timedOptions then
								UseDispatchResult(SetSelectedTimedOptionModule({
									itemId = value.itemId,
									itemType = value.itemType,
									selectedTimedOptionIndex = CryoModule.List.findWhere(value.timedOptions, function(p6): boolean --[[ Line: 517 ]]
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
				JoinResults = v69(JoinResults, UseOffersCartPricingCalculationsForCartItemsModuleResult.discountedItemsFromOffers)
			end
			return JoinResults
		end, {
			UseSignalStateResult, p2.onOpenItemDetailsPage, p2.onRemoveItem,
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
		onCheckoutButtonActivated = ReactModule.useCallback(function() --[[ Line: 1151 ]]
			-- upvalues: FFlagAXMISWithOffers (upval), UseSignalStateResult3 (copy), UseOffersCartPricingCalculationsForCartItemsModuleResult (ref), UseSelectorResult12 (copy), UseResult4 (copy), UseResult5 (copy)
			local UseSignalStateResultDelta = if FFlagAXMISWithOffers then UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else UseSignalStateResult3
			
			if UseSelectorResult12 and UseSelectorResult12 < UseSignalStateResultDelta then
				UseResult4()
				
				return
			else
				UseResult5()
			end
		end, {
			UseSelectorResult12,
			UseSignalStateResult3,
			UseResult5,
			UseResult4,
			if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount else nil
		}),
		onOpenItemDetailsPage = ReactModule.useCallback(function(p5, p6, p7) --[[ Line: 607 ]]
			-- upvalues: p2 (copy)
			if p2.onOpenItemDetailsPage then
				p2.onOpenItemDetailsPage(p5, p6, p7)
			end
		end, { p2.onOpenItemDetailsPage }),
		onRemoveItem = ReactModule.useCallback(function(p5, p6, _) --[[ Line: 601 ]]
			-- upvalues: p2 (copy)
			if p2.onRemoveItem then
				p2.onRemoveItem(p5, p6)
			end
		end, { p2.onRemoveItem, UseSelectorResult, UseNavigationResult }),
		onUnavailableButtonActivated = ReactModule.useCallback(function() --[[ Line: 613 ]]
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
			UseNavigationResult.navigate(AvatarScreen.CartUnavailableItemsPrompt)
		end, { UseNavigationResult }),
		onWearAfterPurchaseToggle = ReactModule.useCallback(function() --[[ Line: 617 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult (copy), FFlagAXMISWithOffers (upval), UseSaveOptionsStoredValuesModuleResult (copy)
			UseStateResult2(not UseStateResult)
			
			if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then
				UseSaveOptionsStoredValuesModuleResult.setWearAfterPurchase(not UseStateResult)
			end
		end, {
			UseStateResult,
			if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModuleResult else nil
		}),
		onAddToMyAvatarsToggle = ReactModule.useCallback(function() --[[ Line: 624 ]]
			-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), FFlagAXMISWithOffers (upval), UseSaveOptionsStoredValuesModuleResult (copy)
			UseStateResult2_1(not UseStateResult1)
			
			if FFlagAXMISWithOffers and UseSaveOptionsStoredValuesModuleResult then
				UseSaveOptionsStoredValuesModuleResult.setAddToAvatars(not UseStateResult1)
			end
		end, {
			UseStateResult1,
			if FFlagAXMISWithOffers then UseSaveOptionsStoredValuesModuleResult else nil
		}),
		onSaveOptionsOpenToggle = if FFlagAXMISWithOffers then ReactModule.useCallback(function() --[[ Line: 632 ]]
			-- upvalues: Callback1 (ref), IsSaveOptionsOpen (ref)
			Callback1(not IsSaveOptionsOpen)
		end, { IsSaveOptionsOpen }) else nil,
		purchasableItemsTotalPriceInRobux = if FFlagAXMISWithOffers then math.max(UseSignalStateResult3 - UseOffersCartPricingCalculationsForCartItemsModuleResult.totalSelectedOffersDiscount, 0) else UseSignalStateResult3,
		purchasableItemsTotalOriginalPriceInRobux = UseSignalStateResult4,
		robloxSubscriptionProducts = if FFlagAXMISWithBlackbird then v4 else nil,
		discountSummaryProps = if FFlagAXMISWithBlackbird then UseMemoResult4 else nil,
		offersAvailable = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.offersAvailable else nil,
		handleDeselectOfferId = if FFlagAXMISWithOffers then UseOffersCartPricingCalculationsForCartItemsModuleResult.handleDeselectOfferId else nil
	}
end