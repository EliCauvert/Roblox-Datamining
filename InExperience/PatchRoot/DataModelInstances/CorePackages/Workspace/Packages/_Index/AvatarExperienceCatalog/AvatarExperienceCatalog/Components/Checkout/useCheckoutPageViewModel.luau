local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local notificationService = game:GetService("NotificationService")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local tutilsModule = require(parent.tutils)
local mutedError = require(parent.Loggers).mutedError
local _ = require(parent.Http)
local roactUtilsModule = require(parent.RoactUtils)
local signalsReactModule = require(parent.SignalsReact)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local toastRoduxModule = require(parent.ToastRodux)
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local robloxEventReceiver = require(parent.RealtimeDelivery).RobloxEventReceiver
local _ = require(avatarExperienceCatalog.Components.Checkout.CheckoutPage)
local purchaseItemsSuccessThunkModule = require(avatarExperienceCatalog.State.Thunks.PurchaseItemsSuccessThunk)
local saveAsAvatarThunkModule = require(avatarExperienceCatalog.State.Thunks.SaveAsAvatarThunk)
local saveAsMakeupLookThunkModule = require(avatarExperienceCatalog.State.Thunks.SaveAsMakeupLookThunk)
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local setSelectedTimedOptionModule = require(avatarExperienceCatalog.State.Actions.SetSelectedTimedOption)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local constants = avatarExperienceCommonModule.Constants
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local toastType = toastRoduxModule.Enums.ToastType
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local discountTypeEnum = avatarExperienceCommonModule.Enums.DiscountTypeEnum
local purchaseItemsModule = require(avatarExperienceCatalog.Requests.PurchaseItems)
local getRobloxSubscriptionProducts = robloxSubscriptionPurchaseAppModule.Network.getRobloxSubscriptionProducts
local avatarLastEquippedStateStore = avatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local mapPurchaseItemsResponseModule = require(avatarExperienceCatalog.Requests.PurchaseItems.mapPurchaseItemsResponse)
local getEquippableAssetsFromTryOnItemsModule = require(avatarExperienceCatalog.Utils.TryOns.getEquippableAssetsFromTryOnItems)
local getTryOnItemsContainsOnlyMakeupTypesModule = require(avatarExperienceCatalog.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes)
local getTryOnItemReducerKey = avatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local getIsInsufficientRobuxError = avatarExperienceCommonModule.Utils.getIsInsufficientRobuxError
local useAXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.useAXCatalogStoreContext)
local useOffersCartPricingCalculationsForCartItemsModule = require(avatarExperienceCatalog.Hooks.useOffersCartPricingCalculationsForCartItems)
local useSignalState = signalsReactModule.useSignalState
local useNetworking = avatarExperienceCommonModule.Hooks.useNetworking
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local useSaveOptionsStoredValuesModule = require(avatarExperienceCatalog.Hooks.useSaveOptionsStoredValues)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local sendUnifiedEventForDeferredAction = avatarExperienceAnalyticsModule.sendUnifiedEventForDeferredAction
local sendUnifiedEventsForMultiItemShopping = avatarExperienceAnalyticsModule.sendUnifiedEventsForMultiItemShopping
local getUnifiedEventsForMIS = avatarExperienceAnalyticsModule.Utils.getUnifiedEventsForMIS
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local cartIdService = avatarExperienceAnalyticsModule.Lib.CartIdService
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local AXEnsureOfferBannerRefetchMIS = game:DefineFastFlag("AXEnsureOfferBannerRefetchMIS", false)
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local fFlagAXEnableExpiredUserLookCheckout = avatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = avatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXMISSaveWearFix = avatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local AXFixLookPurchaseMissingPurchaseSuccess = game:DefineFastFlag("AXFixLookPurchaseMissingPurchaseSuccess", false)
local fFlagAXBackgroundsEquipTryOnCounters = avatarExperienceFlagsModule.FFlagAXBackgroundsEquipTryOnCounters
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local reportBackgroundUserActionCounter = avatarExperienceAnalyticsModule.reportBackgroundUserActionCounter

local function selectTryOnLookId(p0) --[[ line: 93 ]]
	return p0.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local var29 = if fFlagAXCatalogMakeupSupport then function(p1) --[[ line: 99 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
end else nil
local var30 = nil
local var31 = nil

if fFlagAXMISEnableMultiShoppingUnifiedEvents then
	var30 = function(p2) --[[ line: 106 ]]
		return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	
	var31 = function(p3) --[[ line: 110 ]]
		return p3.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end
local function selectAvatarSceneLooks(p4) --[[ line: 115 ]]
	return p4.AvatarExperience.AvatarScene.Looks
end

local function selectTryOnItems(p5) --[[ line: 119 ]]
	return p5.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectTryOnBodyColor3s(p6) --[[ line: 123 ]]
	return p6.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
end

local function selectTryOnBodyScales(p7) --[[ line: 127 ]]
	return p7.AvatarExperience.AvatarScene.OutfitTryOn.Scale
end

local function selectTryOnBodyPartColorRangeIds(p8) --[[ line: 131 ]]
	return p8.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
end

local function _(value) --[[ line: 135 | named "selectAssetInfos" ]]
	return value.AvatarExperience.Common.AssetInfos or {}
end

local _ = function(p9) --[[ line: 139 | named "selectBundleInfos" ]]
	return p9.AvatarExperience.Common.BundleInfos or {}
end

local _ = function(p10) --[[ line: 143 | named "selectCollectibles" ]]
	return p10.AvatarExperience.Common.Collectibles or {}
end

local function selectLocalUserId(p11) --[[ line: 147 ]]
	return p11.LocalUserId
end

local function selectShouldTryOnWithoutEquippedItems(p12) --[[ line: 151 ]]
	return p12.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
end

local function selectUserRobux(p13) --[[ line: 155 ]]
	local localUserId = p13.LocalUserId
	
	return if localUserId and p13.UserRobux then p13.UserRobux[localUserId] else nil
end

local var40 = function(p14) --[[ line: 163 ]]
	local localUserId = p14.LocalUserId
	
	return if localUserId and p14.Users then p14.Users[localUserId].hasRobloxSubscription else false
end

local function selectItemInfoForTryOnItems(a) --[[ line: 175 ]]
	-- upvalues: constants (ref), fFlagAXDurablesForMIS (ref)
	local tryOnItems = a.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local assetInfos = a.AvatarExperience.Common.AssetInfos or {}
	local bundleInfos = a.AvatarExperience.Common.BundleInfos or {}
	local collectibles = a.AvatarExperience.Common.Collectibles or {}
	local t = {}
	
	for i, v in tryOnItems do
		if v.itemId == constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(t, {
				itemId = v.itemId,
				itemType = v.itemType,
				itemData = v.itemData,
				collectibleItemId = v.itemId,
				ordering = v.itemRecency
			})
			continue
		end
		local var47 = if v.itemType == Enum.AvatarItemType.Asset.Name then assetInfos[v.itemId] else bundleInfos[v.itemId]
		local var48 = if var47 then var47.collectibleItemId else nil
		local var49 = if var48 and collectibles.CollectiblesItemInfo then collectibles.CollectiblesItemInfo[var48] else nil
		
		if var47 and var48 and var49 then
			table.insert(t, {
				itemId = v.itemId,
				itemType = v.itemType,
				itemData = var47,
				collectibleItemId = var48,
				ordering = v.itemRecency,
				collectibleItemInfo = var49,
				resellableInstances = if collectibles.CollectiblesResellableInstances then collectibles.CollectiblesResellableInstances[var48] else nil,
				selectedTimedOptionIndex = if fFlagAXDurablesForMIS then v.selectedTimedOptionIndex else nil
			})
		end
	end
	return t
end

local var42 = function(p15, p16) --[[ line: 223 ]]
	-- upvalues: fFlagAXDurables2Option (ref)
	local t = {}
	
	for i, v in p15 do
		local cloned = table.clone(v)
		
		if not p16[cloned.collectibleItemId] then
			table.insert(t, cloned)
			continue
		end
		local var52
		cloned.discountInformation = p16[cloned.collectibleItemId].discountInformation or {}
		cloned.priceInRobuxDiscountedByOffers = p16[cloned.collectibleItemId].priceInRobux
		
		if fFlagAXDurables2Option then
			var52 = #p16[cloned.collectibleItemId].offerIdsApplied > 0
			var52 = nil
		else
			var52 = nil
		end
		cloned.offerApplied = var52
	end
	return t
end

return function(p17) --[[ line: 257 | named "useCheckoutPageViewModel" ]]
	-- upvalues: parent (ref), useAXCatalogStoreContextModule (ref), useNavigation (ref), useAvatarRoute (ref), useNetworking (ref), useDispatch (ref), fFlagAXMISWithOffers (ref), useSaveOptionsStoredValuesModule (ref), useSignalState (ref), fFlagAXMISWithBlackbird (ref), reactModule (ref), useSelector (ref), selectTryOnItems (ref), tutilsModule (ref), selectTryOnBodyColor3s (ref), selectTryOnBodyScales (ref), selectTryOnBodyPartColorRangeIds (ref), selectTryOnLookId (ref), fFlagAXCatalogMakeupSupport (ref), var29 (write), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), var30 (write), var31 (write), selectAvatarSceneLooks (ref), selectItemInfoForTryOnItems (ref), selectShouldTryOnWithoutEquippedItems (ref), selectLocalUserId (ref), selectUserRobux (ref), var40 (ref), useLocalization (ref), localizationRoactContext (ref), useAppPolicy (ref), useNavigationFocus (ref), fFlagAXEnableExpiredUserLookCheckout (ref), robloxEventReceiver (ref), notificationService (ref), avatarScreen (ref), getRobloxSubscriptionProducts (ref), mutedError (ref), useOffersCartPricingCalculationsForCartItemsModule (ref), cryoModule (ref), constants (ref), fFlagAXBackgroundsEquipTryOnCounters (ref), reportBackgroundUserActionCounter (ref), unifiedEventLogEnums (ref), sendUnifiedEventForDeferredAction (ref), cartIdService (ref), fFlagAXDurablesForMIS (ref), setSelectedTimedOptionModule (ref), var42 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), toastType (ref), setCurrentToastMessage (ref), getTryOnItemsContainsOnlyMakeupTypesModule (ref), fFlagAXMISSaveWearFix (ref), saveAsMakeupLookThunkModule (ref), saveAsAvatarThunkModule (ref), getTryOnItemReducerKey (ref), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (ref), avatarLastEquippedStateStore (ref), getEquippableAssetsFromTryOnItemsModule (ref), purchaseItemsSuccessThunkModule (ref), AXFixLookPurchaseMissingPurchaseSuccess (ref), discountTypeEnum (ref), closeCentralOverlay (ref), promiseModule (ref), avatarScreenProperties (ref), sendUnifiedEventsForMultiItemShopping (ref), getUnifiedEventsForMIS (ref), purchaseItemsModule (ref), mapPurchaseItemsResponseModule (ref), AXEnsureOfferBannerRefetchMIS (ref), getIsInsufficientRobuxError (ref)
	local purchasePromptLiteModule = require(parent.PurchasePromptLite)
	local shoppingCartStore = useAXCatalogStoreContextModule().shoppingCartStore
	local var54 = useNavigation()
	local var55 = useAvatarRoute()
	local var56 = useNetworking()
	local var57 = useDispatch()
	local var58 = if fFlagAXMISWithOffers then useSaveOptionsStoredValuesModule() else nil
	local var59 = useSignalState(shoppingCartStore.getItems)
	local var60 = if fFlagAXMISWithBlackbird then useSignalState(shoppingCartStore.getDiscounts) else nil
	local var61 = useSignalState(shoppingCartStore.getCanPurchase)
	local var62 = useSignalState(shoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local var63 = useSignalState(shoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local var64 = useSignalState(shoppingCartStore.getErroredItemCount)
	local var65 = nil
	local var66 = nil
	
	if fFlagAXMISWithOffers then
		local var67, var68 = reactModule.useState(false)
		var65 = var67
		var66 = var68
	end
	local useState = reactModule.useState
	local var69 = if fFlagAXMISWithOffers and var58 then var58.getWearAfterPurchase() else true
	useState, var69 = useState(var69)
	local useState_1 = reactModule.useState
	local var70 = if fFlagAXMISWithOffers and var58 then var58.getAddToAvatars() else false
	useState_1, var70 = useState_1(var70)
	local var71, var72 = reactModule.useState(false)
	local var73 = nil
	local var74 = nil
	
	if fFlagAXMISWithBlackbird then
		local var75, var76 = reactModule.useState({})
		var73 = var75
		var74 = var76
	end
	local var77 = nil
	local var78 = nil
	
	if fFlagAXMISWithOffers then
		local var79, var80 = reactModule.useState(false)
		var77 = var79
		var78 = var80
	end
	local var81 = useSelector(selectTryOnItems, tutilsModule.deepEqual)
	local var82 = useSelector(selectTryOnBodyColor3s, tutilsModule.deepEqual)
	local var83 = useSelector(selectTryOnBodyScales, tutilsModule.deepEqual)
	local var84 = useSelector(selectTryOnBodyPartColorRangeIds, tutilsModule.deepEqual)
	local var85 = useSelector(selectTryOnLookId)
	local var86 = if fFlagAXCatalogMakeupSupport then useSelector(var29) else nil
	local var87 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var30) else nil
	local var88 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var31) else nil
	local var89 = useSelector(selectAvatarSceneLooks, tutilsModule.deepEqual)
	local var90 = useSelector(selectItemInfoForTryOnItems, tutilsModule.deepEqual)
	local var91 = useSelector(selectShouldTryOnWithoutEquippedItems)
	local var92 = useSelector(selectLocalUserId)
	local var93 = useSelector(selectUserRobux)
	local var94 = if fFlagAXMISWithBlackbird then useSelector(var40) else nil
	local var95 = useLocalization({
		purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseFailedButton = "Feature.Avatar.Action.GotIt",
		characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved",
		purchaseFailedTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = #var59
		}
	})
	local var96 = reactModule.useContext(localizationRoactContext)
	local var97 = useAppPolicy(function(p18) --[[ line: 328 ]]
		return p18.getDisableResellingCollectiblesForCompliance()
	end)
	local var98 = if fFlagAXMISWithBlackbird then useAppPolicy(function(p19) --[[ line: 332 ]]
		return p19.getDisableBlackbirdEntrypoints()
	end) else nil
	local var99 = reactModule.useRef(false)
	local var100 = useNavigationFocus()
	local var101 = nil
	
	if fFlagAXEnableExpiredUserLookCheckout then
		local var102 = reactModule.useMemo(function() --[[ line: 346 ]]
			-- upvalues: robloxEventReceiver (copy), notificationService (copy)
			return robloxEventReceiver.new(notificationService)
		end, {})
		var101 = reactModule.useRef(nil)
		
		if var102 ~= nil then
			var101.current = var102:observeEvent("AvatarAssetOwnershipNotifications", function() --[[ line: 354 ]]
				-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var55 (ref), avatarScreen (copy), var54 (ref)
				if (if fFlagAXEnableExpiredUserLookCheckout then var55 and (var55.current and var55.current.name) else nil) == avatarScreen.ExpiredUserLookCheckout then
					var54.pop(2)
				end
			end)
		end
	end
	reactModule.useEffect(function() --[[ line: 368 ]]
		-- upvalues: p17 (ref), var93 (ref), fFlagAXMISWithBlackbird (copy), getRobloxSubscriptionProducts (copy), var74 (write), mutedError (copy), fFlagAXEnableExpiredUserLookCheckout (copy), var101 (write)
		if p17.fetchUserRobux and not var93 then
			p17.fetchUserRobux()
		end
		if fFlagAXMISWithBlackbird then
			getRobloxSubscriptionProducts():andThen(function(p21) --[[ line: 376 ]]
				-- upvalues: var74 (copy)
				var74(p21)
			end):catch(function(p20) --[[ line: 379 ]]
				-- upvalues: mutedError (copy)
				mutedError("CheckoutPageViewModel", "Failed to fetch Roblox subscription products: " .. tostring(p20))
			end)
		end
		return function() --[[ line: 387 ]]
			-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var101 (copy)
			if fFlagAXEnableExpiredUserLookCheckout and var101.current ~= nil then
				var101.current:disconnect()
				var101.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 399 ]]
		-- upvalues: var100 (ref), var99 (ref), p17 (ref)
		if var100 and var99.current and p17.fetchUserRobux then
			p17.fetchUserRobux()
			var99.current = false
		end
	end, { var100, p17.fetchUserRobux })
	reactModule.useLayoutEffect(function() --[[ line: 408 ]]
		-- upvalues: shoppingCartStore (ref), var90 (ref), var97 (ref), fFlagAXMISWithOffers (copy), var78 (write), fFlagAXEnableExpiredUserLookCheckout (copy), var55 (ref), avatarScreen (copy), var54 (ref)
		shoppingCartStore.syncFromTryOns(var90, var97)
		
		if fFlagAXMISWithOffers then
			var78(true)
		end
		local var121 = if fFlagAXEnableExpiredUserLookCheckout then var55 and (var55.current and var55.current.name) else nil
		
		if fFlagAXEnableExpiredUserLookCheckout then
			if var90 and #var90 <= 0 and (var121 == avatarScreen.Checkout or var121 == avatarScreen.ExpiredUserLookCheckout) then
				var54.goBack()
				
				return
			end
		elseif var90 and #var90 <= 0 then
			var54.goBack()
		end
	end, {
		shoppingCartStore,
		var90,
		var97,
		var54,
		if fFlagAXEnableExpiredUserLookCheckout then var55 else nil
	})
	local var103 = reactModule.useMemo(function() --[[ line: 444 ]]
		-- upvalues: var55 (ref), fFlagAXEnableExpiredUserLookCheckout (copy), avatarScreen (copy)
		local name = var55 and (var55.current and var55.current.name)
		
		return if fFlagAXEnableExpiredUserLookCheckout then if name ~= avatarScreen.ExpiredUserLookCheckout then name == avatarScreen.Checkout else true else name == avatarScreen.Checkout
	end, { var55 })
	local var104 = if fFlagAXMISWithOffers then useOffersCartPricingCalculationsForCartItemsModule(var59, var103, var77) else nil
	local var105 = reactModule.useMemo(function() --[[ line: 460 ]]
		-- upvalues: var59 (ref), cryoModule (copy), constants (copy), p17 (ref), fFlagAXBackgroundsEquipTryOnCounters (copy), reportBackgroundUserActionCounter (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), unifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), cartIdService (copy), fFlagAXDurablesForMIS (copy), shoppingCartStore (ref), var57 (ref), setSelectedTimedOptionModule (copy), fFlagAXMISWithOffers (copy), var104 (write), var42 (copy)
		local t = {}
		
		for i, v in var59 do
			table.insert(t, cryoModule.Dictionary.join(v, {
				onActivated = function() --[[ line: 466 ]]
					-- upvalues: v (ref), constants (copy), p17 (copy)
					if v.itemId == constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then return end
					if p17.onOpenItemDetailsPage then
						p17.onOpenItemDetailsPage(v.itemId, v.itemType, v.itemSubType)
					end
				end,
				onRemove = function() --[[ line: 475 ]]
					-- upvalues: p17 (copy), fFlagAXBackgroundsEquipTryOnCounters (copy), reportBackgroundUserActionCounter (copy), v (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), unifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), cartIdService (copy)
					if p17.onRemoveItem then
						if fFlagAXBackgroundsEquipTryOnCounters then
							reportBackgroundUserActionCounter.reportIfAvatarBackgroundAsset("RemoveTryOn", v.itemType, v.itemSubType)
						end
						p17.onRemoveItem(v.itemId, v.itemType)
						
						if fFlagAXMISEnableMultiShoppingUnifiedEvents then
							local BUNDLE = nil
							
							if v.itemType == "Asset" then
								BUNDLE = unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
							elseif v.itemType == "Bundle" then
								BUNDLE = unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
							end
							sendUnifiedEventForDeferredAction({
								action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED,
								cartId = cartIdService.getCartId(),
								itemId = v.itemId,
								itemType = BUNDLE,
								assetType = if v.itemType == "Asset" then v.itemSubType else nil,
								bundleType = if v.itemType == "Asset" then nil else v.itemSubType
							})
						end
					end
				end,
				onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then function(p22, p23) --[[ line: 507 ]]
					-- upvalues: shoppingCartStore (copy), v (ref), cryoModule (copy), var57 (copy), setSelectedTimedOptionModule (copy)
					if shoppingCartStore.updateItemPrice then
						if v.timedOptions then
							var57(setSelectedTimedOptionModule({
								itemId = v.itemId,
								itemType = v.itemType,
								selectedTimedOptionIndex = cryoModule.List.findWhere(v.timedOptions, function(p24) --[[ line: 512 ]]
									-- upvalues: p23 (ref)
									return p24.days == p23
								end) or #v.timedOptions
							}))
						end
						shoppingCartStore.updateItemPrice(v.itemId, v.itemType, p22, p23)
					end
				end else nil
			}))
		end
		if fFlagAXMISWithOffers and var104.discountedItemsFromOffers and #cryoModule.Dictionary.keys(var104.discountedItemsFromOffers) > 0 then
			t = var42(t, var104.discountedItemsFromOffers)
		end
		return t
	end, {
		var59, p17.onOpenItemDetailsPage, p17.onRemoveItem,
		if fFlagAXDurablesForMIS then shoppingCartStore else nil,
		if fFlagAXDurablesForMIS then var57 else nil,
		if fFlagAXMISWithOffers then var104.discountedItemsFromOffers else nil
	})
	local var106 = if fFlagAXEnableExpiredUserLookCheckout then reactModule.useMemo(function() --[[ line: 557 ]]
		-- upvalues: var55 (ref), avatarScreen (copy)
		return (var55 and (var55.current and var55.current.name)) == avatarScreen.ExpiredUserLookCheckout
	end, { var55 }) else nil
	local var107 = if fFlagAXMISWithBlackbird then reactModule.useMemo(function() --[[ line: 565 ]]
		-- upvalues: var94 (ref), var98 (ref), fFlagAXMISWithOffers (copy), cryoModule (copy), var104 (write), var59 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy)
		if not var94 and not var98 and (not fFlagAXMISWithOffers or fFlagAXMISWithOffers and #cryoModule.Dictionary.keys(var104.offersAvailable) == 0) then
			for i, v in var59 do
				if fIntBlackbirdUpsellMinPriceForDiscountInclusive <= v.priceInRobux and v.priceInRobux <= fIntBlackbirdUpsellMaxPriceForDiscountInclusive and (not v.isOwned or v.isOwned and v.expirationTime) then
					return true
				end
			end
		end
		return false
	end, {
		var94,
		var98,
		var59,
		if fFlagAXMISWithOffers then var104.offersAvailable else nil
	}) else nil
	local var108 = reactModule.useCallback(function(p25, p26, _) --[[ line: 596 ]]
		-- upvalues: p17 (ref)
		if p17.onRemoveItem then
			p17.onRemoveItem(p25, p26)
		end
	end, { p17.onRemoveItem, var81, var54 })
	local var109 = reactModule.useCallback(function(p27, p28, p29) --[[ line: 602 ]]
		-- upvalues: p17 (ref)
		if p17.onOpenItemDetailsPage then
			p17.onOpenItemDetailsPage(p27, p28, p29)
		end
	end, { p17.onOpenItemDetailsPage })
	local var110 = reactModule.useCallback(function() --[[ line: 608 ]]
		-- upvalues: var54 (ref), avatarScreen (copy)
		var54.navigate(avatarScreen.CartUnavailableItemsPrompt)
	end, { var54 })
	local var111 = reactModule.useCallback(function() --[[ line: 612 ]]
		-- upvalues: var69 (ref), useState (ref), fFlagAXMISWithOffers (copy), var58 (ref)
		var69(not useState)
		
		if fFlagAXMISWithOffers and var58 then
			var58.setWearAfterPurchase(not useState)
		end
	end, { useState, if fFlagAXMISWithOffers then var58 else nil })
	local var112 = reactModule.useCallback(function() --[[ line: 619 ]]
		-- upvalues: var70 (ref), useState_1 (ref), fFlagAXMISWithOffers (copy), var58 (ref)
		var70(not useState_1)
		
		if fFlagAXMISWithOffers and var58 then
			var58.setAddToAvatars(not useState_1)
		end
	end, { useState_1, if fFlagAXMISWithOffers then var58 else nil })
	local var113 = if fFlagAXMISWithOffers then reactModule.useCallback(function() --[[ line: 627 ]]
		-- upvalues: var66 (write), var65 (write)
		var66(not var65)
	end, { var65 }) else nil
	local var114 = reactModule.useCallback(function() --[[ line: 632 ]]
		-- upvalues: var59 (ref), constants (copy), fFlagAXMISWithOffers (copy), var104 (write), fFlagAXDurablesForMIS (copy)
		local t = {}
		
		for i, v in var59 do
			if v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
				local var125 = if fFlagAXMISWithOffers then var104.discountedItemsFromOffers[v.collectibleItemId] else nil
				table.insert(t, {
					agreedPriceRobux = if fFlagAXMISWithOffers and var125 then var125.priceInRobux else v.priceInRobux,
					collectibleProductId = v.collectibleProductId,
					collectibleItemId = if fFlagAXMISWithOffers then v.collectibleItemId else nil,
					rentalOption = if fFlagAXDurablesForMIS and v.selectedTimedOptionDays and v.selectedTimedOptionDays > 0 then { durationDays = v.selectedTimedOptionDays } else nil,
					offerIds = if fFlagAXMISWithOffers and var125 then var125.offerIdsApplied else nil
				})
			end
		end
		return t
	end, { var59, if fFlagAXMISWithOffers then var104 else nil })
	local var115 = reactModule.useCallback(function() --[[ line: 665 ]]
		-- upvalues: var95 (ref), toastType (copy), var57 (ref), setCurrentToastMessage (copy)
		var57(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var95.characterSavedHeading,
			toastSubMessage = var95.characterSavedMsg,
			toastType = toastType.SuccessConfirmation
		}))
	end, { var57, var95 })
	local var116 = reactModule.useCallback(function(p30) --[[ line: 675 ]]
		-- upvalues: fFlagAXCatalogMakeupSupport (copy), getTryOnItemsContainsOnlyMakeupTypesModule (copy), var89 (ref), var86 (ref), var85 (ref), fFlagAXMISSaveWearFix (copy), var57 (ref), saveAsMakeupLookThunkModule (copy), var56 (ref), p17 (ref), saveAsAvatarThunkModule (copy), var115 (ref)
		if fFlagAXCatalogMakeupSupport then
			local var126 = getTryOnItemsContainsOnlyMakeupTypesModule(p30)
			local var127 = if var89 and var89[var86] and var89[var86].name then var89[var86].name elseif var126 then "Makeup" else "Avatar"
			
			if var89 and var89[var85] and var89[var85].name then
				var127 = var89[var85].name
			end
			if not var126 then
				var57(saveAsAvatarThunkModule(var127, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p30, var115))
				
				return
			elseif fFlagAXMISSaveWearFix then
				var57(saveAsMakeupLookThunkModule(var56, var127, p30, nil, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))
				
				return
			end
			var57(saveAsMakeupLookThunkModule(var56, var127, p30))
			
			return
		else
			var57(saveAsAvatarThunkModule(if var89 and var89[var85] and var89[var85].name then var89[var85].name else "Avatar", p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p30, var115))
		end
	end, {
		var57, var115, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		var89, var85, if fFlagAXCatalogMakeupSupport then var56 else nil,
		if fFlagAXCatalogMakeupSupport then var86 else nil
	})
	local var117 = reactModule.useCallback(function(p31) --[[ line: 740 ]]
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var89 (ref), var85 (ref), var86 (ref), p17 (ref), var57 (ref), setCurrentToastMessage (copy), var96 (ref), toastType (copy), getTryOnItemReducerKey (copy), var81 (ref), useState_1 (ref), var116 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var91 (ref), var82 (ref), var83 (ref), var84 (ref)
		local var128 = shoppingCartStore.updateCartFromPurchaseResponse(p31)
		local boughtItems = var128.boughtItems
		local equippableItems = var128.equippableItems
		local needDataRefeshItems = var128.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var89[var85]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var85
			end
			cloned_1 = var89[var86]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var86
			end
		end
		for i, v in needDataRefeshItems do
			if p17.fetchItemData then
				p17.fetchItemData(v.itemId, v.itemType)
			end
		end
		var57(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var96:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
			toastType = toastType.InformationMessage
		}))
		local t = {}
		
		for i_1, v_1 in equippableItems do
			local itemId = var81[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)]
			
			if itemId then
				table.insert(t, itemId)
			end
		end
		if useState_1 then
			var116(t)
		end
		if not fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p17.onRemoveItem then
					p17.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
		end
		local t_1 = {}
		
		if not fFlagAXMISSaveWearFix and fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end
		if useState then
			t_1 = getEquippableAssetsFromTryOnItemsModule(t)
		end
		var57(purchaseItemsSuccessThunkModule(boughtItems, t_1, var91, var82, var83, var84, t, p17.getBundleOutfitInfoFromProvidedTryOns, var86 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
		if fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p17.onRemoveItem then
					p17.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
			if fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end
	end, {
		var57, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var82, var83, var84, var81, var91, var116, p17.onRemoveItem, p17.fetchItemData,
		p17.getBundleOutfitInfoFromProvidedTryOns, var86,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var85 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var89 else nil,
		if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	})
	local var118 = if AXFixLookPurchaseMissingPurchaseSuccess then reactModule.useCallback(function(p32, p33) --[[ line: 873 ]]
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var89 (ref), var85 (ref), var86 (ref), p17 (ref), var57 (ref), setCurrentToastMessage (copy), var96 (ref), toastType (copy), getTryOnItemReducerKey (copy), useState_1 (ref), var116 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var91 (ref), var82 (ref), var83 (ref), var84 (ref)
		local var133 = shoppingCartStore.updateCartFromPurchaseResponse(p32)
		local boughtItems = var133.boughtItems
		local equippableItems = var133.equippableItems
		local needDataRefeshItems = var133.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var89[var85]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var85
			end
			cloned_1 = var89[var86]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var86
			end
		end
		for i, v in needDataRefeshItems do
			if p17.fetchItemData then
				p17.fetchItemData(v.itemId, v.itemType)
			end
		end
		var57(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var96:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
			toastType = toastType.InformationMessage
		}))
		local t = {}
		
		for i_1, v_1 in equippableItems do
			local itemId = p33[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)]
			
			if itemId then
				table.insert(t, itemId)
			end
		end
		if useState_1 then
			var116(t)
		end
		if not fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p17.onRemoveItem then
					p17.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
		end
		local t_1 = {}
		
		if not fFlagAXMISSaveWearFix and fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end
		if useState then
			t_1 = getEquippableAssetsFromTryOnItemsModule(t)
		end
		var57(purchaseItemsSuccessThunkModule(boughtItems, t_1, var91, var82, var83, var84, t, p17.getBundleOutfitInfoFromProvidedTryOns, var86 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
		if fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p17.onRemoveItem then
					p17.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
			if fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end
	end, {
		var57, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var82, var83, var84, var91, var116, p17.onRemoveItem, p17.fetchItemData,
		p17.getBundleOutfitInfoFromProvidedTryOns, var86,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var85 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var89 else nil,
		if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	}) else nil
	local var119 = if fFlagAXMISWithBlackbird then reactModule.useCallback(function() --[[ line: 1008 ]]
		-- upvalues: var60 (ref), discountTypeEnum (copy), var57 (ref), purchasePromptLiteModule (ref), closeCentralOverlay (copy), promiseModule (copy), var62 (ref), var63 (ref), var99 (ref)
		local var138 = nil
		
		if var60 then
			for i, v in var60 do
				if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
					var138 = v
					break
				end
			end
		end
		var57(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function() --[[ line: 1024 ]]
					-- upvalues: var57 (copy), closeCentralOverlay (copy)
					var57(closeCentralOverlay())
				end,
				fetchProductInfo = function() --[[ line: 1027 ]]
					-- upvalues: promiseModule (copy), var62 (copy), var138 (write), var63 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = var62,
						BasePriceInRobux = if var138 then var63 else nil,
						PriceDiscountDetails = if var138 then {
							{
								Type = var138.discountCampaign,
								AmountInRobux = var63 - var62,
								Percent = var138.robuxDiscountPercentage
							}
						} else nil
					})
				end
			}
		}))
		var99.current = true
	end, {
		var54,
		var57,
		var62,
		var63,
		var60
	}) else reactModule.useCallback(function() --[[ line: 1058 ]]
		-- upvalues: var54 (ref), avatarScreen (copy), var99 (ref)
		var54.navigate(avatarScreen.InsufficientRobuxPrompt)
		var99.current = true
	end, { var54 })
	local var120 = reactModule.useCallback(function() --[[ line: 1137 ]]
		-- upvalues: var72 (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var89 (ref), var85 (ref), var86 (ref), var87 (ref), var88 (ref), var55 (ref), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var59 (ref), var81 (ref), unifiedEventLogEnums (copy), mutedError (copy), purchaseItemsModule (copy), var56 (ref), var92 (ref), var114 (ref), mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var118 (ref), tutilsModule (copy), var117 (ref), AXEnsureOfferBannerRefetchMIS (copy), purchasePromptLiteModule (ref), p17 (ref), getIsInsufficientRobuxError (copy), var119 (ref), var54 (ref), avatarScreen (copy), var95 (ref)
		var72(true)
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function() --[[ line: 1141 ]]
			-- upvalues: var89 (copy), var85 (copy), var86 (copy), var87 (copy), var88 (copy), var55 (copy), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var59 (copy), var81 (copy), unifiedEventLogEnums (copy)
			local var139 = var89[var85]
			
			if var139 ~= nil then
				var139 = table.clone(var139)
				var139.itemId = var85
			end
			local var140 = var89[var86]
			
			if var140 ~= nil then
				var140 = table.clone(var140)
				var140.itemId = var86
			end
			if var139 then
				var139.isOrganicLook = var87 == nil
			end
			if var140 then
				var140.isOrganicLook = var88 == nil
			end
			local var141 = avatarScreenProperties[var55 and (var55.current and var55.current.name)]
			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(var59, var81, var139, var140, unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), if var141 and var141.analyticsData then var141.analyticsData.unifiedLoggingSurface else nil)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase attempt")
		end
		purchaseItemsModule({
			networkImpl = var56,
			userId = var92,
			lookId = var85,
			makeupLookId = if fFlagAXMISEnableMultiShoppingUnifiedEvents then var86 else nil,
			lineItems = var114()
		}):andThen(function(p35) --[[ line: 1195 ]]
			-- upvalues: mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var118 (copy), tutilsModule (copy), var81 (copy), var117 (copy), AXEnsureOfferBannerRefetchMIS (copy), purchasePromptLiteModule (copy), p17 (copy)
			if p35.isJSONValid and p35.responseCode == 200 then
				local var142 = mapPurchaseItemsResponseModule(p35.responseBody)
				
				if AXFixLookPurchaseMissingPurchaseSuccess and var118 then
					var118(var142, tutilsModule.deepCopy(var81))
				else
					var117(var142)
				end
				if AXEnsureOfferBannerRefetchMIS then
					purchasePromptLiteModule.Events.firePurchaseCompleted()
				end
				if p17.fetchUserRobux then
					p17.fetchUserRobux()
				end
			end
		end):catch(function(p34) --[[ line: 1217 ]]
			-- upvalues: getIsInsufficientRobuxError (copy), var119 (copy), var54 (copy), avatarScreen (copy), var59 (copy), var95 (copy)
			if getIsInsufficientRobuxError(p34) then
				var119()
				
				return
			end
			var54.navigate(avatarScreen.GenericPrompt, {
				titleText = if #var59 == 1 then var95.purchaseFailedTitle else var95.purchaseFailedTitlePlural,
				bodyText = var95.purchaseFailedUnknownError,
				buttonText = var95.purchaseFailedButton
			})
		end):finally(function() --[[ line: 1230 ]]
			-- upvalues: var72 (copy)
			var72(false)
		end)
	end, {
		var114, var92, var56, var119, p17.fetchUserRobux, var117, var59, var95, var54,
		var85, if fFlagAXMISEnableMultiShoppingUnifiedEvents then var86 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var89 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var81 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var87 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var88 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var55 else nil,
		if AXFixLookPurchaseMissingPurchaseSuccess then var118 else nil,
		if AXEnsureOfferBannerRefetchMIS then purchasePromptLiteModule.Events.firePurchaseCompleted else nil
	})
	
	return {
		canPurchase = var61,
		cartItems = var105,
		discounts = if fFlagAXMISWithBlackbird then var60 else nil,
		erroredItemCount = var64,
		isPurchasing = var71,
		isVisible = var103,
		hideBuyOptions = if fFlagAXEnableExpiredUserLookCheckout then var106 else nil,
		shouldShowBlackbirdUpsellBanner = if fFlagAXMISWithBlackbird then var107 else nil,
		isWearAfterPurchaseChecked = useState,
		isAddToMyAvatarsChecked = useState_1,
		isSaveOptionsOpen = var65,
		onCheckoutButtonActivated = reactModule.useCallback(function() --[[ line: 1257 ]]
			-- upvalues: fFlagAXMISWithOffers (copy), var62 (ref), var104 (write), var93 (ref), var119 (ref), var120 (ref)
			if var93 and var93 < (if fFlagAXMISWithOffers then var62 - var104.totalSelectedOffersDiscount else var62) then
				var119()
				
				return
			end
			var120()
		end, {
			var93,
			var62,
			var120,
			var119,
			if fFlagAXMISWithOffers then var104.totalSelectedOffersDiscount else nil
		}),
		onOpenItemDetailsPage = var109,
		onRemoveItem = var108,
		onUnavailableButtonActivated = var110,
		onWearAfterPurchaseToggle = var111,
		onAddToMyAvatarsToggle = var112,
		onSaveOptionsOpenToggle = var113,
		purchasableItemsTotalPriceInRobux = if fFlagAXMISWithOffers then math.max(var62 - var104.totalSelectedOffersDiscount, 0) else var62,
		purchasableItemsTotalOriginalPriceInRobux = var63,
		robloxSubscriptionProducts = if fFlagAXMISWithBlackbird then var73 else nil,
		discountSummaryProps = if fFlagAXMISWithBlackbird then if fFlagAXMISWithBlackbird then reactModule.useMemo(function() --[[ line: 1066 ]]
			-- upvalues: var60 (ref), discountTypeEnum (copy), fFlagAXMISWithOffers (copy), var104 (write), var63 (ref), var62 (ref)
			local var143 = nil
			
			if var60 then
				for i, v in var60 do
					if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
						var143 = v
						break
					end
				end
			end
			if fFlagAXMISWithOffers then
				local cloned = table.clone(var104.discountSummaryEntriesFromOffers)
				
				if var143 then
					table.insert(cloned, 1, {
						type = discountTypeEnum.RobloxPlusSubscription,
						amountInRobux = var63 - var62,
						percent = var143.robuxDiscountPercentage
					})
				end
				return {
					itemPrice = {
						basePriceInRobux = var63,
						priceInRobux = math.max(var62 - var104.totalSelectedOffersDiscount, 0),
						discounts = cloned
					},
					savingsSummary = var104.savingsSummary
				}
			else
				return if var143 and var63 and var62 then {
					itemPrice = {
						basePriceInRobux = var63,
						priceInRobux = var62,
						discounts = {
							{
								type = discountTypeEnum.RobloxPlusSubscription,
								amountInRobux = var63 - var62,
								percent = var143.robuxDiscountPercentage
							}
						}
					}
				} else nil
			end
		end, {
			var63, var62, var60,
			if fFlagAXMISWithOffers then var104.discountSummaryEntriesFromOffers else nil,
			if fFlagAXMISWithOffers then var104.totalSelectedOffersDiscount else nil,
			if fFlagAXMISWithOffers then var104.savingsSummary else nil
		}) else nil else nil,
		offersAvailable = if fFlagAXMISWithOffers then var104.offersAvailable else nil,
		handleDeselectOfferId = if fFlagAXMISWithOffers then var104.handleDeselectOfferId else nil
	}
end