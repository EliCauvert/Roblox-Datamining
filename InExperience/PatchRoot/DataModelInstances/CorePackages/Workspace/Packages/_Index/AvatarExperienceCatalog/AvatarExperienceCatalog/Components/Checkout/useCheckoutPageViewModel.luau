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

local function selectTryOnLookId(p0) --[[ line: 92 ]]
	return p0.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local var28 = if fFlagAXCatalogMakeupSupport then function(p1) --[[ line: 98 ]]
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
end else nil
local var29 = nil
local var30 = nil

if fFlagAXMISEnableMultiShoppingUnifiedEvents then
	var29 = function(p2) --[[ line: 105 ]]
		return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	
	var30 = function(p3) --[[ line: 109 ]]
		return p3.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end
local function selectAvatarSceneLooks(p4) --[[ line: 114 ]]
	return p4.AvatarExperience.AvatarScene.Looks
end

local function selectTryOnItems(p5) --[[ line: 118 ]]
	return p5.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectTryOnBodyColor3s(p6) --[[ line: 122 ]]
	return p6.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
end

local function selectTryOnBodyScales(p7) --[[ line: 126 ]]
	return p7.AvatarExperience.AvatarScene.OutfitTryOn.Scale
end

local function selectTryOnBodyPartColorRangeIds(p8) --[[ line: 130 ]]
	return p8.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
end

local function _(value) --[[ line: 134 | named "selectAssetInfos" ]]
	return value.AvatarExperience.Common.AssetInfos or {}
end

local _ = function(p9) --[[ line: 138 | named "selectBundleInfos" ]]
	return p9.AvatarExperience.Common.BundleInfos or {}
end

local _ = function(p10) --[[ line: 142 | named "selectCollectibles" ]]
	return p10.AvatarExperience.Common.Collectibles or {}
end

local function selectLocalUserId(p11) --[[ line: 146 ]]
	return p11.LocalUserId
end

local function selectShouldTryOnWithoutEquippedItems(p12) --[[ line: 150 ]]
	return p12.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
end

local function selectUserRobux(p13) --[[ line: 154 ]]
	local localUserId = p13.LocalUserId
	
	return if localUserId and p13.UserRobux then p13.UserRobux[localUserId] else nil
end

local var39 = function(p14) --[[ line: 162 ]]
	local localUserId = p14.LocalUserId
	
	return if localUserId and p14.Users then p14.Users[localUserId].hasRobloxSubscription else false
end

local function selectItemInfoForTryOnItems(a) --[[ line: 174 ]]
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
		local var46 = if v.itemType == Enum.AvatarItemType.Asset.Name then assetInfos[v.itemId] else bundleInfos[v.itemId]
		local var47 = if var46 then var46.collectibleItemId else nil
		local var48 = if var47 and collectibles.CollectiblesItemInfo then collectibles.CollectiblesItemInfo[var47] else nil
		
		if var46 and var47 and var48 then
			table.insert(t, {
				itemId = v.itemId,
				itemType = v.itemType,
				itemData = var46,
				collectibleItemId = var47,
				ordering = v.itemRecency,
				collectibleItemInfo = var48,
				resellableInstances = if collectibles.CollectiblesResellableInstances then collectibles.CollectiblesResellableInstances[var47] else nil,
				selectedTimedOptionIndex = if fFlagAXDurablesForMIS then v.selectedTimedOptionIndex else nil
			})
		end
	end
	return t
end

local var41 = function(p15, p16) --[[ line: 222 ]]
	-- upvalues: fFlagAXDurables2Option (ref)
	local t = {}
	
	for i, v in p15 do
		local cloned = table.clone(v)
		
		if not p16[cloned.collectibleItemId] then
			table.insert(t, cloned)
			continue
		end
		local var51
		cloned.discountInformation = p16[cloned.collectibleItemId].discountInformation or {}
		cloned.priceInRobuxDiscountedByOffers = p16[cloned.collectibleItemId].priceInRobux
		
		if fFlagAXDurables2Option then
			var51 = #p16[cloned.collectibleItemId].offerIdsApplied > 0
			var51 = nil
		else
			var51 = nil
		end
		cloned.offerApplied = var51
	end
	return t
end

return function(p17) --[[ line: 256 | named "useCheckoutPageViewModel" ]]
	-- upvalues: parent (ref), useAXCatalogStoreContextModule (ref), useNavigation (ref), useAvatarRoute (ref), useNetworking (ref), useDispatch (ref), fFlagAXMISWithOffers (ref), useSaveOptionsStoredValuesModule (ref), useSignalState (ref), fFlagAXMISWithBlackbird (ref), reactModule (ref), useSelector (ref), selectTryOnItems (ref), tutilsModule (ref), selectTryOnBodyColor3s (ref), selectTryOnBodyScales (ref), selectTryOnBodyPartColorRangeIds (ref), selectTryOnLookId (ref), fFlagAXCatalogMakeupSupport (ref), var28 (write), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), var29 (write), var30 (write), selectAvatarSceneLooks (ref), selectItemInfoForTryOnItems (ref), selectShouldTryOnWithoutEquippedItems (ref), selectLocalUserId (ref), selectUserRobux (ref), var39 (ref), useLocalization (ref), localizationRoactContext (ref), useAppPolicy (ref), useNavigationFocus (ref), fFlagAXEnableExpiredUserLookCheckout (ref), robloxEventReceiver (ref), notificationService (ref), avatarScreen (ref), getRobloxSubscriptionProducts (ref), mutedError (ref), useOffersCartPricingCalculationsForCartItemsModule (ref), cryoModule (ref), constants (ref), fFlagAXBackgroundsEquipTryOnCounters (ref), reportBackgroundUserActionCounter (ref), unifiedEventLogEnums (ref), sendUnifiedEventForDeferredAction (ref), cartIdService (ref), fFlagAXDurablesForMIS (ref), setSelectedTimedOptionModule (ref), var41 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), toastType (ref), setCurrentToastMessage (ref), getTryOnItemsContainsOnlyMakeupTypesModule (ref), fFlagAXMISSaveWearFix (ref), saveAsMakeupLookThunkModule (ref), saveAsAvatarThunkModule (ref), getTryOnItemReducerKey (ref), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (ref), avatarLastEquippedStateStore (ref), getEquippableAssetsFromTryOnItemsModule (ref), purchaseItemsSuccessThunkModule (ref), AXFixLookPurchaseMissingPurchaseSuccess (ref), discountTypeEnum (ref), closeCentralOverlay (ref), promiseModule (ref), avatarScreenProperties (ref), sendUnifiedEventsForMultiItemShopping (ref), getUnifiedEventsForMIS (ref), purchaseItemsModule (ref), mapPurchaseItemsResponseModule (ref), getIsInsufficientRobuxError (ref)
	local purchasePromptLiteModule = require(parent.PurchasePromptLite)
	local shoppingCartStore = useAXCatalogStoreContextModule().shoppingCartStore
	local var53 = useNavigation()
	local var54 = useAvatarRoute()
	local var55 = useNetworking()
	local var56 = useDispatch()
	local var57 = if fFlagAXMISWithOffers then useSaveOptionsStoredValuesModule() else nil
	local var58 = useSignalState(shoppingCartStore.getItems)
	local var59 = if fFlagAXMISWithBlackbird then useSignalState(shoppingCartStore.getDiscounts) else nil
	local var60 = useSignalState(shoppingCartStore.getCanPurchase)
	local var61 = useSignalState(shoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local var62 = useSignalState(shoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local var63 = useSignalState(shoppingCartStore.getErroredItemCount)
	local var64 = nil
	local var65 = nil
	
	if fFlagAXMISWithOffers then
		local var66, var67 = reactModule.useState(false)
		var64 = var66
		var65 = var67
	end
	local useState = reactModule.useState
	local var68 = if fFlagAXMISWithOffers and var57 then var57.getWearAfterPurchase() else true
	useState, var68 = useState(var68)
	local useState_1 = reactModule.useState
	local var69 = if fFlagAXMISWithOffers and var57 then var57.getAddToAvatars() else false
	useState_1, var69 = useState_1(var69)
	local var70, var71 = reactModule.useState(false)
	local var72 = nil
	local var73 = nil
	
	if fFlagAXMISWithBlackbird then
		local var74, var75 = reactModule.useState({})
		var72 = var74
		var73 = var75
	end
	local var76 = nil
	local var77 = nil
	
	if fFlagAXMISWithOffers then
		local var78, var79 = reactModule.useState(false)
		var76 = var78
		var77 = var79
	end
	local var80 = useSelector(selectTryOnItems, tutilsModule.deepEqual)
	local var81 = useSelector(selectTryOnBodyColor3s, tutilsModule.deepEqual)
	local var82 = useSelector(selectTryOnBodyScales, tutilsModule.deepEqual)
	local var83 = useSelector(selectTryOnBodyPartColorRangeIds, tutilsModule.deepEqual)
	local var84 = useSelector(selectTryOnLookId)
	local var85 = if fFlagAXCatalogMakeupSupport then useSelector(var28) else nil
	local var86 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var29) else nil
	local var87 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var30) else nil
	local var88 = useSelector(selectAvatarSceneLooks, tutilsModule.deepEqual)
	local var89 = useSelector(selectItemInfoForTryOnItems, tutilsModule.deepEqual)
	local var90 = useSelector(selectShouldTryOnWithoutEquippedItems)
	local var91 = useSelector(selectLocalUserId)
	local var92 = useSelector(selectUserRobux)
	local var93 = if fFlagAXMISWithBlackbird then useSelector(var39) else nil
	local var94 = useLocalization({
		purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseFailedButton = "Feature.Avatar.Action.GotIt",
		characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved",
		purchaseFailedTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = #var58
		}
	})
	local var95 = reactModule.useContext(localizationRoactContext)
	local var96 = useAppPolicy(function(p18) --[[ line: 327 ]]
		return p18.getDisableResellingCollectiblesForCompliance()
	end)
	local var97 = if fFlagAXMISWithBlackbird then useAppPolicy(function(p19) --[[ line: 331 ]]
		return p19.getDisableBlackbirdEntrypoints()
	end) else nil
	local var98 = reactModule.useRef(false)
	local var99 = useNavigationFocus()
	local var100 = nil
	
	if fFlagAXEnableExpiredUserLookCheckout then
		local var101 = reactModule.useMemo(function() --[[ line: 345 ]]
			-- upvalues: robloxEventReceiver (copy), notificationService (copy)
			return robloxEventReceiver.new(notificationService)
		end, {})
		var100 = reactModule.useRef(nil)
		
		if var101 ~= nil then
			var100.current = var101:observeEvent("AvatarAssetOwnershipNotifications", function() --[[ line: 353 ]]
				-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var54 (ref), avatarScreen (copy), var53 (ref)
				if (if fFlagAXEnableExpiredUserLookCheckout then var54 and (var54.current and var54.current.name) else nil) == avatarScreen.ExpiredUserLookCheckout then
					var53.pop(2)
				end
			end)
		end
	end
	reactModule.useEffect(function() --[[ line: 367 ]]
		-- upvalues: p17 (ref), var92 (ref), fFlagAXMISWithBlackbird (copy), getRobloxSubscriptionProducts (copy), var73 (write), mutedError (copy), fFlagAXEnableExpiredUserLookCheckout (copy), var100 (write)
		if p17.fetchUserRobux and not var92 then
			p17.fetchUserRobux()
		end
		if fFlagAXMISWithBlackbird then
			getRobloxSubscriptionProducts():andThen(function(p21) --[[ line: 375 ]]
				-- upvalues: var73 (copy)
				var73(p21)
			end):catch(function(p20) --[[ line: 378 ]]
				-- upvalues: mutedError (copy)
				mutedError("CheckoutPageViewModel", "Failed to fetch Roblox subscription products: " .. tostring(p20))
			end)
		end
		return function() --[[ line: 386 ]]
			-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var100 (copy)
			if fFlagAXEnableExpiredUserLookCheckout and var100.current ~= nil then
				var100.current:disconnect()
				var100.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 398 ]]
		-- upvalues: var99 (ref), var98 (ref), p17 (ref)
		if var99 and var98.current and p17.fetchUserRobux then
			p17.fetchUserRobux()
			var98.current = false
		end
	end, { var99, p17.fetchUserRobux })
	reactModule.useLayoutEffect(function() --[[ line: 407 ]]
		-- upvalues: shoppingCartStore (ref), var89 (ref), var96 (ref), fFlagAXMISWithOffers (copy), var77 (write), fFlagAXEnableExpiredUserLookCheckout (copy), var54 (ref), avatarScreen (copy), var53 (ref)
		shoppingCartStore.syncFromTryOns(var89, var96)
		
		if fFlagAXMISWithOffers then
			var77(true)
		end
		local var120 = if fFlagAXEnableExpiredUserLookCheckout then var54 and (var54.current and var54.current.name) else nil
		
		if fFlagAXEnableExpiredUserLookCheckout then
			if var89 and #var89 <= 0 and (var120 == avatarScreen.Checkout or var120 == avatarScreen.ExpiredUserLookCheckout) then
				var53.goBack()
				
				return
			end
		elseif var89 and #var89 <= 0 then
			var53.goBack()
		end
	end, {
		shoppingCartStore,
		var89,
		var96,
		var53,
		if fFlagAXEnableExpiredUserLookCheckout then var54 else nil
	})
	local var102 = reactModule.useMemo(function() --[[ line: 443 ]]
		-- upvalues: var54 (ref), fFlagAXEnableExpiredUserLookCheckout (copy), avatarScreen (copy)
		local name = var54 and (var54.current and var54.current.name)
		
		return if fFlagAXEnableExpiredUserLookCheckout then if name ~= avatarScreen.ExpiredUserLookCheckout then name == avatarScreen.Checkout else true else name == avatarScreen.Checkout
	end, { var54 })
	local var103 = if fFlagAXMISWithOffers then useOffersCartPricingCalculationsForCartItemsModule(var58, var102, var76) else nil
	local var104 = reactModule.useMemo(function() --[[ line: 459 ]]
		-- upvalues: var58 (ref), cryoModule (copy), constants (copy), p17 (ref), fFlagAXBackgroundsEquipTryOnCounters (copy), reportBackgroundUserActionCounter (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), unifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), cartIdService (copy), fFlagAXDurablesForMIS (copy), shoppingCartStore (ref), var56 (ref), setSelectedTimedOptionModule (copy), fFlagAXMISWithOffers (copy), var103 (write), var41 (copy)
		local t = {}
		
		for i, v in var58 do
			table.insert(t, cryoModule.Dictionary.join(v, {
				onActivated = function() --[[ line: 465 ]]
					-- upvalues: v (ref), constants (copy), p17 (copy)
					if v.itemId == constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then return end
					if p17.onOpenItemDetailsPage then
						p17.onOpenItemDetailsPage(v.itemId, v.itemType, v.itemSubType)
					end
				end,
				onRemove = function() --[[ line: 474 ]]
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
				onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then function(p22, p23) --[[ line: 506 ]]
					-- upvalues: shoppingCartStore (copy), v (ref), cryoModule (copy), var56 (copy), setSelectedTimedOptionModule (copy)
					if shoppingCartStore.updateItemPrice then
						if v.timedOptions then
							var56(setSelectedTimedOptionModule({
								itemId = v.itemId,
								itemType = v.itemType,
								selectedTimedOptionIndex = cryoModule.List.findWhere(v.timedOptions, function(p24) --[[ line: 511 ]]
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
		if fFlagAXMISWithOffers and var103.discountedItemsFromOffers and #cryoModule.Dictionary.keys(var103.discountedItemsFromOffers) > 0 then
			t = var41(t, var103.discountedItemsFromOffers)
		end
		return t
	end, {
		var58, p17.onOpenItemDetailsPage, p17.onRemoveItem,
		if fFlagAXDurablesForMIS then shoppingCartStore else nil,
		if fFlagAXDurablesForMIS then var56 else nil,
		if fFlagAXMISWithOffers then var103.discountedItemsFromOffers else nil
	})
	local var105 = if fFlagAXEnableExpiredUserLookCheckout then reactModule.useMemo(function() --[[ line: 556 ]]
		-- upvalues: var54 (ref), avatarScreen (copy)
		return (var54 and (var54.current and var54.current.name)) == avatarScreen.ExpiredUserLookCheckout
	end, { var54 }) else nil
	local var106 = if fFlagAXMISWithBlackbird then reactModule.useMemo(function() --[[ line: 564 ]]
		-- upvalues: var93 (ref), var97 (ref), fFlagAXMISWithOffers (copy), cryoModule (copy), var103 (write), var58 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy)
		if not var93 and not var97 and (not fFlagAXMISWithOffers or fFlagAXMISWithOffers and #cryoModule.Dictionary.keys(var103.offersAvailable) == 0) then
			for i, v in var58 do
				if fIntBlackbirdUpsellMinPriceForDiscountInclusive <= v.priceInRobux and v.priceInRobux <= fIntBlackbirdUpsellMaxPriceForDiscountInclusive and (not v.isOwned or v.isOwned and v.expirationTime) then
					return true
				end
			end
		end
		return false
	end, {
		var93,
		var97,
		var58,
		if fFlagAXMISWithOffers then var103.offersAvailable else nil
	}) else nil
	local var107 = reactModule.useCallback(function(p25, p26, _) --[[ line: 595 ]]
		-- upvalues: p17 (ref)
		if p17.onRemoveItem then
			p17.onRemoveItem(p25, p26)
		end
	end, { p17.onRemoveItem, var80, var53 })
	local var108 = reactModule.useCallback(function(p27, p28, p29) --[[ line: 601 ]]
		-- upvalues: p17 (ref)
		if p17.onOpenItemDetailsPage then
			p17.onOpenItemDetailsPage(p27, p28, p29)
		end
	end, { p17.onOpenItemDetailsPage })
	local var109 = reactModule.useCallback(function() --[[ line: 607 ]]
		-- upvalues: var53 (ref), avatarScreen (copy)
		var53.navigate(avatarScreen.CartUnavailableItemsPrompt)
	end, { var53 })
	local var110 = reactModule.useCallback(function() --[[ line: 611 ]]
		-- upvalues: var68 (ref), useState (ref), fFlagAXMISWithOffers (copy), var57 (ref)
		var68(not useState)
		
		if fFlagAXMISWithOffers and var57 then
			var57.setWearAfterPurchase(not useState)
		end
	end, { useState, if fFlagAXMISWithOffers then var57 else nil })
	local var111 = reactModule.useCallback(function() --[[ line: 618 ]]
		-- upvalues: var69 (ref), useState_1 (ref), fFlagAXMISWithOffers (copy), var57 (ref)
		var69(not useState_1)
		
		if fFlagAXMISWithOffers and var57 then
			var57.setAddToAvatars(not useState_1)
		end
	end, { useState_1, if fFlagAXMISWithOffers then var57 else nil })
	local var112 = if fFlagAXMISWithOffers then reactModule.useCallback(function() --[[ line: 626 ]]
		-- upvalues: var65 (write), var64 (write)
		var65(not var64)
	end, { var64 }) else nil
	local var113 = reactModule.useCallback(function() --[[ line: 631 ]]
		-- upvalues: var58 (ref), constants (copy), fFlagAXMISWithOffers (copy), var103 (write), fFlagAXDurablesForMIS (copy)
		local t = {}
		
		for i, v in var58 do
			if v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
				local var124 = if fFlagAXMISWithOffers then var103.discountedItemsFromOffers[v.collectibleItemId] else nil
				table.insert(t, {
					agreedPriceRobux = if fFlagAXMISWithOffers and var124 then var124.priceInRobux else v.priceInRobux,
					collectibleProductId = v.collectibleProductId,
					collectibleItemId = if fFlagAXMISWithOffers then v.collectibleItemId else nil,
					rentalOption = if fFlagAXDurablesForMIS and v.selectedTimedOptionDays and v.selectedTimedOptionDays > 0 then { durationDays = v.selectedTimedOptionDays } else nil,
					offerIds = if fFlagAXMISWithOffers and var124 then var124.offerIdsApplied else nil
				})
			end
		end
		return t
	end, { var58, if fFlagAXMISWithOffers then var103 else nil })
	local var114 = reactModule.useCallback(function() --[[ line: 664 ]]
		-- upvalues: var94 (ref), toastType (copy), var56 (ref), setCurrentToastMessage (copy)
		var56(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var94.characterSavedHeading,
			toastSubMessage = var94.characterSavedMsg,
			toastType = toastType.SuccessConfirmation
		}))
	end, { var56, var94 })
	local var115 = reactModule.useCallback(function(p30) --[[ line: 674 ]]
		-- upvalues: fFlagAXCatalogMakeupSupport (copy), getTryOnItemsContainsOnlyMakeupTypesModule (copy), var88 (ref), var85 (ref), var84 (ref), fFlagAXMISSaveWearFix (copy), var56 (ref), saveAsMakeupLookThunkModule (copy), var55 (ref), p17 (ref), saveAsAvatarThunkModule (copy), var114 (ref)
		if fFlagAXCatalogMakeupSupport then
			local var125 = getTryOnItemsContainsOnlyMakeupTypesModule(p30)
			local var126 = if var88 and var88[var85] and var88[var85].name then var88[var85].name elseif var125 then "Makeup" else "Avatar"
			
			if var88 and var88[var84] and var88[var84].name then
				var126 = var88[var84].name
			end
			if not var125 then
				var56(saveAsAvatarThunkModule(var126, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p30, var114))
				
				return
			elseif fFlagAXMISSaveWearFix then
				var56(saveAsMakeupLookThunkModule(var55, var126, p30, nil, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))
				
				return
			end
			var56(saveAsMakeupLookThunkModule(var55, var126, p30))
			
			return
		else
			var56(saveAsAvatarThunkModule(if var88 and var88[var84] and var88[var84].name then var88[var84].name else "Avatar", p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p30, var114))
		end
	end, {
		var56, var114, p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		var88, var84, if fFlagAXCatalogMakeupSupport then var55 else nil,
		if fFlagAXCatalogMakeupSupport then var85 else nil
	})
	local var116 = reactModule.useCallback(function(p31) --[[ line: 739 ]]
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var88 (ref), var84 (ref), var85 (ref), p17 (ref), var56 (ref), setCurrentToastMessage (copy), var95 (ref), toastType (copy), getTryOnItemReducerKey (copy), var80 (ref), useState_1 (ref), var115 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var90 (ref), var81 (ref), var82 (ref), var83 (ref)
		local var127 = shoppingCartStore.updateCartFromPurchaseResponse(p31)
		local boughtItems = var127.boughtItems
		local equippableItems = var127.equippableItems
		local needDataRefeshItems = var127.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var88[var84]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var84
			end
			cloned_1 = var88[var85]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var85
			end
		end
		for i, v in needDataRefeshItems do
			if p17.fetchItemData then
				p17.fetchItemData(v.itemId, v.itemType)
			end
		end
		var56(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var95:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
			toastType = toastType.InformationMessage
		}))
		local t = {}
		
		for i_1, v_1 in equippableItems do
			local itemId = var80[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)]
			
			if itemId then
				table.insert(t, itemId)
			end
		end
		if useState_1 then
			var115(t)
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
		var56(purchaseItemsSuccessThunkModule(boughtItems, t_1, var90, var81, var82, var83, t, p17.getBundleOutfitInfoFromProvidedTryOns, var85 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
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
		var56, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var81, var82, var83, var80, var90, var115, p17.onRemoveItem, p17.fetchItemData,
		p17.getBundleOutfitInfoFromProvidedTryOns, var85,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var84 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var88 else nil,
		if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	})
	local var117 = if AXFixLookPurchaseMissingPurchaseSuccess then reactModule.useCallback(function(p32, p33) --[[ line: 872 ]]
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var88 (ref), var84 (ref), var85 (ref), p17 (ref), var56 (ref), setCurrentToastMessage (copy), var95 (ref), toastType (copy), getTryOnItemReducerKey (copy), useState_1 (ref), var115 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var90 (ref), var81 (ref), var82 (ref), var83 (ref)
		local var132 = shoppingCartStore.updateCartFromPurchaseResponse(p32)
		local boughtItems = var132.boughtItems
		local equippableItems = var132.equippableItems
		local needDataRefeshItems = var132.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var88[var84]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var84
			end
			cloned_1 = var88[var85]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var85
			end
		end
		for i, v in needDataRefeshItems do
			if p17.fetchItemData then
				p17.fetchItemData(v.itemId, v.itemType)
			end
		end
		var56(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var95:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
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
			var115(t)
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
		var56(purchaseItemsSuccessThunkModule(boughtItems, t_1, var90, var81, var82, var83, t, p17.getBundleOutfitInfoFromProvidedTryOns, var85 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
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
		var56, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var81, var82, var83, var90, var115, p17.onRemoveItem, p17.fetchItemData,
		p17.getBundleOutfitInfoFromProvidedTryOns, var85,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var84 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var88 else nil,
		if fFlagAXMISSaveWearFix then p17.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	}) else nil
	local var118 = if fFlagAXMISWithBlackbird then reactModule.useCallback(function() --[[ line: 1007 ]]
		-- upvalues: var59 (ref), discountTypeEnum (copy), var56 (ref), purchasePromptLiteModule (ref), closeCentralOverlay (copy), promiseModule (copy), var61 (ref), var62 (ref), var98 (ref)
		local var137 = nil
		
		if var59 then
			for i, v in var59 do
				if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
					var137 = v
					break
				end
			end
		end
		var56(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function() --[[ line: 1023 ]]
					-- upvalues: var56 (copy), closeCentralOverlay (copy)
					var56(closeCentralOverlay())
				end,
				fetchProductInfo = function() --[[ line: 1026 ]]
					-- upvalues: promiseModule (copy), var61 (copy), var137 (write), var62 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = var61,
						BasePriceInRobux = if var137 then var62 else nil,
						PriceDiscountDetails = if var137 then {
							{
								Type = var137.discountCampaign,
								AmountInRobux = var62 - var61,
								Percent = var137.robuxDiscountPercentage
							}
						} else nil
					})
				end
			}
		}))
		var98.current = true
	end, {
		var53,
		var56,
		var61,
		var62,
		var59
	}) else reactModule.useCallback(function() --[[ line: 1057 ]]
		-- upvalues: var53 (ref), avatarScreen (copy), var98 (ref)
		var53.navigate(avatarScreen.InsufficientRobuxPrompt)
		var98.current = true
	end, { var53 })
	local var119 = reactModule.useCallback(function() --[[ line: 1136 ]]
		-- upvalues: var71 (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var88 (ref), var84 (ref), var85 (ref), var86 (ref), var87 (ref), var54 (ref), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var58 (ref), var80 (ref), unifiedEventLogEnums (copy), mutedError (copy), purchaseItemsModule (copy), var55 (ref), var91 (ref), var113 (ref), mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var117 (ref), tutilsModule (copy), var116 (ref), p17 (ref), getIsInsufficientRobuxError (copy), var118 (ref), var53 (ref), avatarScreen (copy), var94 (ref)
		var71(true)
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function() --[[ line: 1140 ]]
			-- upvalues: var88 (copy), var84 (copy), var85 (copy), var86 (copy), var87 (copy), var54 (copy), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var58 (copy), var80 (copy), unifiedEventLogEnums (copy)
			local var138 = var88[var84]
			
			if var138 ~= nil then
				var138 = table.clone(var138)
				var138.itemId = var84
			end
			local var139 = var88[var85]
			
			if var139 ~= nil then
				var139 = table.clone(var139)
				var139.itemId = var85
			end
			if var138 then
				var138.isOrganicLook = var86 == nil
			end
			if var139 then
				var139.isOrganicLook = var87 == nil
			end
			local var140 = avatarScreenProperties[var54 and (var54.current and var54.current.name)]
			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(var58, var80, var138, var139, unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), if var140 and var140.analyticsData then var140.analyticsData.unifiedLoggingSurface else nil)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase attempt")
		end
		purchaseItemsModule({
			networkImpl = var55,
			userId = var91,
			lookId = var84,
			makeupLookId = if fFlagAXMISEnableMultiShoppingUnifiedEvents then var85 else nil,
			lineItems = var113()
		}):andThen(function(p35) --[[ line: 1194 ]]
			-- upvalues: mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var117 (copy), tutilsModule (copy), var80 (copy), var116 (copy), p17 (copy)
			if p35.isJSONValid and p35.responseCode == 200 then
				local var141 = mapPurchaseItemsResponseModule(p35.responseBody)
				
				if AXFixLookPurchaseMissingPurchaseSuccess and var117 then
					var117(var141, tutilsModule.deepCopy(var80))
				else
					var116(var141)
				end
				if p17.fetchUserRobux then
					p17.fetchUserRobux()
				end
			end
		end):catch(function(p34) --[[ line: 1209 ]]
			-- upvalues: getIsInsufficientRobuxError (copy), var118 (copy), var53 (copy), avatarScreen (copy), var58 (copy), var94 (copy)
			if getIsInsufficientRobuxError(p34) then
				var118()
				
				return
			end
			var53.navigate(avatarScreen.GenericPrompt, {
				titleText = if #var58 == 1 then var94.purchaseFailedTitle else var94.purchaseFailedTitlePlural,
				bodyText = var94.purchaseFailedUnknownError,
				buttonText = var94.purchaseFailedButton
			})
		end):finally(function() --[[ line: 1222 ]]
			-- upvalues: var71 (copy)
			var71(false)
		end)
	end, {
		var113, var91, var55, var118, p17.fetchUserRobux, var116, var58, var94, var53,
		var84, if fFlagAXMISEnableMultiShoppingUnifiedEvents then var85 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var88 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var80 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var86 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var87 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var54 else nil,
		if AXFixLookPurchaseMissingPurchaseSuccess then var117 else nil
	})
	
	return {
		canPurchase = var60,
		cartItems = var104,
		discounts = if fFlagAXMISWithBlackbird then var59 else nil,
		erroredItemCount = var63,
		isPurchasing = var70,
		isVisible = var102,
		hideBuyOptions = if fFlagAXEnableExpiredUserLookCheckout then var105 else nil,
		shouldShowBlackbirdUpsellBanner = if fFlagAXMISWithBlackbird then var106 else nil,
		isWearAfterPurchaseChecked = useState,
		isAddToMyAvatarsChecked = useState_1,
		isSaveOptionsOpen = var64,
		onCheckoutButtonActivated = reactModule.useCallback(function() --[[ line: 1248 ]]
			-- upvalues: fFlagAXMISWithOffers (copy), var61 (ref), var103 (write), var92 (ref), var118 (ref), var119 (ref)
			if var92 and var92 < (if fFlagAXMISWithOffers then var61 - var103.totalSelectedOffersDiscount else var61) then
				var118()
				
				return
			end
			var119()
		end, {
			var92,
			var61,
			var119,
			var118,
			if fFlagAXMISWithOffers then var103.totalSelectedOffersDiscount else nil
		}),
		onOpenItemDetailsPage = var108,
		onRemoveItem = var107,
		onUnavailableButtonActivated = var109,
		onWearAfterPurchaseToggle = var110,
		onAddToMyAvatarsToggle = var111,
		onSaveOptionsOpenToggle = var112,
		purchasableItemsTotalPriceInRobux = if fFlagAXMISWithOffers then math.max(var61 - var103.totalSelectedOffersDiscount, 0) else var61,
		purchasableItemsTotalOriginalPriceInRobux = var62,
		robloxSubscriptionProducts = if fFlagAXMISWithBlackbird then var72 else nil,
		discountSummaryProps = if fFlagAXMISWithBlackbird then if fFlagAXMISWithBlackbird then reactModule.useMemo(function() --[[ line: 1065 ]]
			-- upvalues: var59 (ref), discountTypeEnum (copy), fFlagAXMISWithOffers (copy), var103 (write), var62 (ref), var61 (ref)
			local var142 = nil
			
			if var59 then
				for i, v in var59 do
					if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
						var142 = v
						break
					end
				end
			end
			if fFlagAXMISWithOffers then
				local cloned = table.clone(var103.discountSummaryEntriesFromOffers)
				
				if var142 then
					table.insert(cloned, 1, {
						type = discountTypeEnum.RobloxPlusSubscription,
						amountInRobux = var62 - var61,
						percent = var142.robuxDiscountPercentage
					})
				end
				return {
					itemPrice = {
						basePriceInRobux = var62,
						priceInRobux = math.max(var61 - var103.totalSelectedOffersDiscount, 0),
						discounts = cloned
					},
					savingsSummary = var103.savingsSummary
				}
			else
				return if var142 and var62 and var61 then {
					itemPrice = {
						basePriceInRobux = var62,
						priceInRobux = var61,
						discounts = {
							{
								type = discountTypeEnum.RobloxPlusSubscription,
								amountInRobux = var62 - var61,
								percent = var142.robuxDiscountPercentage
							}
						}
					}
				} else nil
			end
		end, {
			var62, var61, var59,
			if fFlagAXMISWithOffers then var103.discountSummaryEntriesFromOffers else nil,
			if fFlagAXMISWithOffers then var103.totalSelectedOffersDiscount else nil,
			if fFlagAXMISWithOffers then var103.savingsSummary else nil
		}) else nil else nil,
		offersAvailable = if fFlagAXMISWithOffers then var103.offersAvailable else nil,
		handleDeselectOfferId = if fFlagAXMISWithOffers then var103.handleDeselectOfferId else nil
	}
end