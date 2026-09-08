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
local fFlagAXFixMISUpsellDiscountSummary = sharedFlagsModule.FFlagAXFixMISUpsellDiscountSummary
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

local function selectTryOnLookId(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local var1 = if fFlagAXCatalogMakeupSupport then function(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
end else nil
local var2 = nil
local var3 = nil

if fFlagAXMISEnableMultiShoppingUnifiedEvents then
	var2 = function(p1)
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	
	var3 = function(p1)
		return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end
local function selectAvatarSceneLooks(p1)
	return p1.AvatarExperience.AvatarScene.Looks
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

local function _(value)
	return value.AvatarExperience.Common.AssetInfos or {}
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
	local localUserId = p1.LocalUserId
	
	return if localUserId and p1.UserRobux then p1.UserRobux[localUserId] else nil
end

local var4 = function(p1)
	local localUserId = p1.LocalUserId
	
	return if localUserId and p1.Users then p1.Users[localUserId].hasRobloxSubscription else false
end

local function selectItemInfoForTryOnItems(a)
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
		local var5 = if v.itemType == Enum.AvatarItemType.Asset.Name then assetInfos[v.itemId] else bundleInfos[v.itemId]
		local var6 = if var5 then var5.collectibleItemId else nil
		local var7 = if var6 and collectibles.CollectiblesItemInfo then collectibles.CollectiblesItemInfo[var6] else nil
		
		if var5 and var6 and var7 then
			table.insert(t, {
				itemId = v.itemId,
				itemType = v.itemType,
				itemData = var5,
				collectibleItemId = var6,
				ordering = v.itemRecency,
				collectibleItemInfo = var7,
				resellableInstances = if collectibles.CollectiblesResellableInstances then collectibles.CollectiblesResellableInstances[var6] else nil,
				selectedTimedOptionIndex = if fFlagAXDurablesForMIS then v.selectedTimedOptionIndex else nil
			})
		end
	end
	return t
end

local var8 = function(p1, p2)
	-- upvalues: fFlagAXDurables2Option (ref)
	local t = {}
	
	for i, v in p1 do
		local cloned = table.clone(v)
		
		if not p2[cloned.collectibleItemId] then
			table.insert(t, cloned)
			continue
		end
		local var9
		cloned.discountInformation = p2[cloned.collectibleItemId].discountInformation or {}
		cloned.priceInRobuxDiscountedByOffers = p2[cloned.collectibleItemId].priceInRobux
		
		if fFlagAXDurables2Option then
			var9 = #p2[cloned.collectibleItemId].offerIdsApplied > 0
			var9 = nil
		else
			var9 = nil
		end
		cloned.offerApplied = var9
	end
	return t
end

return function(p3)
	-- upvalues: parent (ref), useAXCatalogStoreContextModule (ref), useNavigation (ref), useAvatarRoute (ref), useNetworking (ref), useDispatch (ref), fFlagAXMISWithOffers (ref), useSaveOptionsStoredValuesModule (ref), useSignalState (ref), fFlagAXMISWithBlackbird (ref), reactModule (ref), useSelector (ref), selectTryOnItems (ref), tutilsModule (ref), selectTryOnBodyColor3s (ref), selectTryOnBodyScales (ref), selectTryOnBodyPartColorRangeIds (ref), selectTryOnLookId (ref), fFlagAXCatalogMakeupSupport (ref), var1 (write), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), var2 (write), var3 (write), selectAvatarSceneLooks (ref), selectItemInfoForTryOnItems (ref), selectShouldTryOnWithoutEquippedItems (ref), selectLocalUserId (ref), selectUserRobux (ref), var4 (ref), useLocalization (ref), localizationRoactContext (ref), useAppPolicy (ref), useNavigationFocus (ref), fFlagAXEnableExpiredUserLookCheckout (ref), robloxEventReceiver (ref), notificationService (ref), avatarScreen (ref), getRobloxSubscriptionProducts (ref), mutedError (ref), useOffersCartPricingCalculationsForCartItemsModule (ref), cryoModule (ref), constants (ref), fFlagAXBackgroundsEquipTryOnCounters (ref), reportBackgroundUserActionCounter (ref), unifiedEventLogEnums (ref), sendUnifiedEventForDeferredAction (ref), cartIdService (ref), fFlagAXDurablesForMIS (ref), setSelectedTimedOptionModule (ref), var8 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), toastType (ref), setCurrentToastMessage (ref), getTryOnItemsContainsOnlyMakeupTypesModule (ref), fFlagAXMISSaveWearFix (ref), saveAsMakeupLookThunkModule (ref), saveAsAvatarThunkModule (ref), getTryOnItemReducerKey (ref), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (ref), avatarLastEquippedStateStore (ref), getEquippableAssetsFromTryOnItemsModule (ref), purchaseItemsSuccessThunkModule (ref), AXFixLookPurchaseMissingPurchaseSuccess (ref), discountTypeEnum (ref), fFlagAXFixMISUpsellDiscountSummary (ref), closeCentralOverlay (ref), promiseModule (ref), avatarScreenProperties (ref), sendUnifiedEventsForMultiItemShopping (ref), getUnifiedEventsForMIS (ref), purchaseItemsModule (ref), mapPurchaseItemsResponseModule (ref), AXEnsureOfferBannerRefetchMIS (ref), getIsInsufficientRobuxError (ref)
	local purchasePromptLiteModule = require(parent.PurchasePromptLite)
	local shoppingCartStore = useAXCatalogStoreContextModule().shoppingCartStore
	local var10 = useNavigation()
	local var11 = useAvatarRoute()
	local var12 = useNetworking()
	local var13 = useDispatch()
	local var14 = if fFlagAXMISWithOffers then useSaveOptionsStoredValuesModule() else nil
	local var15 = useSignalState(shoppingCartStore.getItems)
	local var16 = if fFlagAXMISWithBlackbird then useSignalState(shoppingCartStore.getDiscounts) else nil
	local var17 = useSignalState(shoppingCartStore.getCanPurchase)
	local var18 = useSignalState(shoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local var19 = useSignalState(shoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local var20 = useSignalState(shoppingCartStore.getErroredItemCount)
	local var21 = nil
	local var22 = nil
	
	if fFlagAXMISWithOffers then
		local var23, var24 = reactModule.useState(false)
		var21 = var23
		var22 = var24
	end
	local useState = reactModule.useState
	local var25 = if fFlagAXMISWithOffers and var14 then var14.getWearAfterPurchase() else true
	useState, var69 = useState(var25)
	local useState_1 = reactModule.useState
	local var26 = if fFlagAXMISWithOffers and var14 then var14.getAddToAvatars() else false
	useState_1, var70 = useState_1(var26)
	local var27, var28 = reactModule.useState(false)
	local var29 = nil
	local var30 = nil
	
	if fFlagAXMISWithBlackbird then
		local var31, var32 = reactModule.useState({})
		var29 = var31
		var30 = var32
	end
	local var33 = nil
	local var34 = nil
	
	if fFlagAXMISWithOffers then
		local var35, var36 = reactModule.useState(false)
		var33 = var35
		var34 = var36
	end
	local var37 = useSelector(selectTryOnItems, tutilsModule.deepEqual)
	local var38 = useSelector(selectTryOnBodyColor3s, tutilsModule.deepEqual)
	local var39 = useSelector(selectTryOnBodyScales, tutilsModule.deepEqual)
	local var40 = useSelector(selectTryOnBodyPartColorRangeIds, tutilsModule.deepEqual)
	local var41 = useSelector(selectTryOnLookId)
	local var42 = if fFlagAXCatalogMakeupSupport then useSelector(var1) else nil
	local var43 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var2) else nil
	local var44 = if fFlagAXMISEnableMultiShoppingUnifiedEvents then useSelector(var3) else nil
	local var45 = useSelector(selectAvatarSceneLooks, tutilsModule.deepEqual)
	local var46 = useSelector(selectItemInfoForTryOnItems, tutilsModule.deepEqual)
	local var47 = useSelector(selectShouldTryOnWithoutEquippedItems)
	local var48 = useSelector(selectLocalUserId)
	local var49 = useSelector(selectUserRobux)
	local var50 = if fFlagAXMISWithBlackbird then useSelector(var4) else nil
	local var51 = useLocalization({
		purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseFailedButton = "Feature.Avatar.Action.GotIt",
		characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved",
		purchaseFailedTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = #var15
		}
	})
	local var52 = reactModule.useContext(localizationRoactContext)
	local var53 = useAppPolicy(function(p4)
		return p4.getDisableResellingCollectiblesForCompliance()
	end)
	local var54 = if fFlagAXMISWithBlackbird then useAppPolicy(function(p4)
		return p4.getDisableBlackbirdEntrypoints()
	end) else nil
	local var55 = reactModule.useRef(false)
	local var56 = useNavigationFocus()
	local var57 = nil
	
	if fFlagAXEnableExpiredUserLookCheckout then
		local var58 = reactModule.useMemo(function()
			-- upvalues: robloxEventReceiver (copy), notificationService (copy)
			return robloxEventReceiver.new(notificationService)
		end, {})
		var57 = reactModule.useRef(nil)
		
		if var58 ~= nil then
			var57.current = var58:observeEvent("AvatarAssetOwnershipNotifications", function()
				-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var11 (ref), avatarScreen (copy), var10 (ref)
				if (if fFlagAXEnableExpiredUserLookCheckout then var11 and (var11.current and var11.current.name) else nil) == avatarScreen.ExpiredUserLookCheckout then
					var10.pop(2)
				end
			end)
		end
	end
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var49 (ref), fFlagAXMISWithBlackbird (copy), getRobloxSubscriptionProducts (copy), var30 (write), mutedError (copy), fFlagAXEnableExpiredUserLookCheckout (copy), var57 (write)
		if p3.fetchUserRobux and not var49 then
			p3.fetchUserRobux()
		end
		if fFlagAXMISWithBlackbird then
			getRobloxSubscriptionProducts():andThen(function(p4)
				-- upvalues: var30 (copy)
				var30(p4)
			end):catch(function(p4)
				-- upvalues: mutedError (copy)
				mutedError("CheckoutPageViewModel", "Failed to fetch Roblox subscription products: " .. tostring(p4))
			end)
		end
		return function()
			-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var57 (copy)
			if fFlagAXEnableExpiredUserLookCheckout and var57.current ~= nil then
				var57.current:disconnect()
				var57.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var56 (ref), var55 (ref), p3 (ref)
		if var56 and var55.current and p3.fetchUserRobux then
			p3.fetchUserRobux()
			var55.current = false
		end
	end, { var56, p3.fetchUserRobux })
	reactModule.useLayoutEffect(function()
		-- upvalues: shoppingCartStore (ref), var46 (ref), var53 (ref), fFlagAXMISWithOffers (copy), var34 (write), fFlagAXEnableExpiredUserLookCheckout (copy), var11 (ref), avatarScreen (copy), var10 (ref)
		shoppingCartStore.syncFromTryOns(var46, var53)
		
		if fFlagAXMISWithOffers then
			var34(true)
		end
		local var59 = if fFlagAXEnableExpiredUserLookCheckout then var11 and (var11.current and var11.current.name) else nil
		
		if fFlagAXEnableExpiredUserLookCheckout then
			if var46 and #var46 <= 0 and (var59 == avatarScreen.Checkout or var59 == avatarScreen.ExpiredUserLookCheckout) then
				var10.goBack()
				
				return
			end
		elseif var46 and #var46 <= 0 then
			var10.goBack()
		end
	end, {
		shoppingCartStore,
		var46,
		var53,
		var10,
		if fFlagAXEnableExpiredUserLookCheckout then var11 else nil
	})
	local var59 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), fFlagAXEnableExpiredUserLookCheckout (copy), avatarScreen (copy)
		local name = var11 and (var11.current and var11.current.name)
		
		return if fFlagAXEnableExpiredUserLookCheckout then if name ~= avatarScreen.ExpiredUserLookCheckout then name == avatarScreen.Checkout else true else name == avatarScreen.Checkout
	end, { var11 })
	local var60 = if fFlagAXMISWithOffers then useOffersCartPricingCalculationsForCartItemsModule(var15, var59, var33) else nil
	local var61 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), cryoModule (copy), constants (copy), p3 (ref), fFlagAXBackgroundsEquipTryOnCounters (copy), reportBackgroundUserActionCounter (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), unifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), cartIdService (copy), fFlagAXDurablesForMIS (copy), shoppingCartStore (ref), var13 (ref), setSelectedTimedOptionModule (copy), fFlagAXMISWithOffers (copy), var60 (write), var8 (copy)
		local t = {}
		
		for i, v in var15 do
			table.insert(t, cryoModule.Dictionary.join(v, {
				onActivated = function()
					-- upvalues: v (ref), constants (copy), p3 (copy)
					if v.itemId == constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then return end
					if p3.onOpenItemDetailsPage then
						p3.onOpenItemDetailsPage(v.itemId, v.itemType, v.itemSubType)
					end
				end,
				onRemove = function()
					-- upvalues: p3 (copy), fFlagAXBackgroundsEquipTryOnCounters (copy), reportBackgroundUserActionCounter (copy), v (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), unifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), cartIdService (copy)
					if p3.onRemoveItem then
						if fFlagAXBackgroundsEquipTryOnCounters then
							reportBackgroundUserActionCounter.reportIfAvatarBackgroundAsset("RemoveTryOn", v.itemType, v.itemSubType)
						end
						p3.onRemoveItem(v.itemId, v.itemType)
						
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
				onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then function(p4, p5)
					-- upvalues: shoppingCartStore (copy), v (ref), cryoModule (copy), var13 (copy), setSelectedTimedOptionModule (copy)
					if shoppingCartStore.updateItemPrice then
						if v.timedOptions then
							var13(setSelectedTimedOptionModule({
								itemId = v.itemId,
								itemType = v.itemType,
								selectedTimedOptionIndex = cryoModule.List.findWhere(v.timedOptions, function(p6)
									-- upvalues: p5 (ref)
									return p6.days == p5
								end) or #v.timedOptions
							}))
						end
						shoppingCartStore.updateItemPrice(v.itemId, v.itemType, p4, p5)
					end
				end else nil
			}))
		end
		if fFlagAXMISWithOffers and var60.discountedItemsFromOffers and #cryoModule.Dictionary.keys(var60.discountedItemsFromOffers) > 0 then
			t = var8(t, var60.discountedItemsFromOffers)
		end
		return t
	end, {
		var15, p3.onOpenItemDetailsPage, p3.onRemoveItem,
		if fFlagAXDurablesForMIS then shoppingCartStore else nil,
		if fFlagAXDurablesForMIS then var13 else nil,
		if fFlagAXMISWithOffers then var60.discountedItemsFromOffers else nil
	})
	local var62 = if fFlagAXEnableExpiredUserLookCheckout then reactModule.useMemo(function()
		-- upvalues: var11 (ref), avatarScreen (copy)
		return (var11 and (var11.current and var11.current.name)) == avatarScreen.ExpiredUserLookCheckout
	end, { var11 }) else nil
	local var63 = if fFlagAXMISWithBlackbird then reactModule.useMemo(function()
		-- upvalues: var50 (ref), var54 (ref), fFlagAXMISWithOffers (copy), cryoModule (copy), var60 (write), var15 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy)
		if not var50 and not var54 and (not fFlagAXMISWithOffers or fFlagAXMISWithOffers and #cryoModule.Dictionary.keys(var60.offersAvailable) == 0) then
			for i, v in var15 do
				if fIntBlackbirdUpsellMinPriceForDiscountInclusive <= v.priceInRobux and v.priceInRobux <= fIntBlackbirdUpsellMaxPriceForDiscountInclusive and (not v.isOwned or v.isOwned and v.expirationTime) then
					return true
				end
			end
		end
		return false
	end, {
		var50,
		var54,
		var15,
		if fFlagAXMISWithOffers then var60.offersAvailable else nil
	}) else nil
	local var64 = reactModule.useCallback(function(p4, p5, _)
		-- upvalues: p3 (ref)
		if p3.onRemoveItem then
			p3.onRemoveItem(p4, p5)
		end
	end, { p3.onRemoveItem, var37, var10 })
	local var65 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: p3 (ref)
		if p3.onOpenItemDetailsPage then
			p3.onOpenItemDetailsPage(p4, p5, p6)
		end
	end, { p3.onOpenItemDetailsPage })
	local var66 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), avatarScreen (copy)
		var10.navigate(avatarScreen.CartUnavailableItemsPrompt)
	end, { var10 })
	local var67 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), useState (ref), fFlagAXMISWithOffers (copy), var14 (ref)
		var25(not useState)
		
		if fFlagAXMISWithOffers and var14 then
			var14.setWearAfterPurchase(not useState)
		end
	end, { useState, if fFlagAXMISWithOffers then var14 else nil })
	local var68 = reactModule.useCallback(function()
		-- upvalues: var26 (ref), useState_1 (ref), fFlagAXMISWithOffers (copy), var14 (ref)
		var26(not useState_1)
		
		if fFlagAXMISWithOffers and var14 then
			var14.setAddToAvatars(not useState_1)
		end
	end, { useState_1, if fFlagAXMISWithOffers then var14 else nil })
	local var69 = if fFlagAXMISWithOffers then reactModule.useCallback(function()
		-- upvalues: var22 (write), var21 (write)
		var22(not var21)
	end, { var21 }) else nil
	local var70 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), constants (copy), fFlagAXMISWithOffers (copy), var60 (write), fFlagAXDurablesForMIS (copy)
		local t = {}
		
		for i, v in var15 do
			if v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
				local var71 = if fFlagAXMISWithOffers then var60.discountedItemsFromOffers[v.collectibleItemId] else nil
				table.insert(t, {
					agreedPriceRobux = if fFlagAXMISWithOffers and var71 then var71.priceInRobux else v.priceInRobux,
					collectibleProductId = v.collectibleProductId,
					collectibleItemId = if fFlagAXMISWithOffers then v.collectibleItemId else nil,
					rentalOption = if fFlagAXDurablesForMIS and v.selectedTimedOptionDays and v.selectedTimedOptionDays > 0 then { durationDays = v.selectedTimedOptionDays } else nil,
					offerIds = if fFlagAXMISWithOffers and var71 then var71.offerIdsApplied else nil
				})
			end
		end
		return t
	end, { var15, if fFlagAXMISWithOffers then var60 else nil })
	local var72 = reactModule.useCallback(function()
		-- upvalues: var51 (ref), toastType (copy), var13 (ref), setCurrentToastMessage (copy)
		var13(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var51.characterSavedHeading,
			toastSubMessage = var51.characterSavedMsg,
			toastType = toastType.SuccessConfirmation
		}))
	end, { var13, var51 })
	local var73 = reactModule.useCallback(function(p4)
		-- upvalues: fFlagAXCatalogMakeupSupport (copy), getTryOnItemsContainsOnlyMakeupTypesModule (copy), var45 (ref), var42 (ref), var41 (ref), fFlagAXMISSaveWearFix (copy), var13 (ref), saveAsMakeupLookThunkModule (copy), var12 (ref), p3 (ref), saveAsAvatarThunkModule (copy), var72 (ref)
		if fFlagAXCatalogMakeupSupport then
			local var74 = getTryOnItemsContainsOnlyMakeupTypesModule(p4)
			local var75 = if var45 and var45[var42] and var45[var42].name then var45[var42].name elseif var74 then "Makeup" else "Avatar"
			
			if var45 and var45[var41] and var45[var41].name then
				var75 = var45[var41].name
			end
			if not var74 then
				var13(saveAsAvatarThunkModule(var75, p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p4, var72))
				
				return
			elseif fFlagAXMISSaveWearFix then
				var13(saveAsMakeupLookThunkModule(var12, var75, p4, nil, p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))
				
				return
			end
			var13(saveAsMakeupLookThunkModule(var12, var75, p4))
			
			return
		else
			var13(saveAsAvatarThunkModule(if var45 and var45[var41] and var45[var41].name then var45[var41].name else "Avatar", p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p4, var72))
		end
	end, {
		var13, var72, p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		var45, var41, if fFlagAXCatalogMakeupSupport then var12 else nil,
		if fFlagAXCatalogMakeupSupport then var42 else nil
	})
	local var74 = reactModule.useCallback(function(p4)
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var45 (ref), var41 (ref), var42 (ref), p3 (ref), var13 (ref), setCurrentToastMessage (copy), var52 (ref), toastType (copy), getTryOnItemReducerKey (copy), var37 (ref), useState_1 (ref), var73 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var47 (ref), var38 (ref), var39 (ref), var40 (ref)
		local var75 = shoppingCartStore.updateCartFromPurchaseResponse(p4)
		local boughtItems = var75.boughtItems
		local equippableItems = var75.equippableItems
		local needDataRefeshItems = var75.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var45[var41]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var41
			end
			cloned_1 = var45[var42]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var42
			end
		end
		for i, v in needDataRefeshItems do
			if p3.fetchItemData then
				p3.fetchItemData(v.itemId, v.itemType)
			end
		end
		var13(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var52:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
			toastType = toastType.InformationMessage
		}))
		local t = {}
		
		for i_1, v_1 in equippableItems do
			local itemId = var37[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)]
			
			if itemId then
				table.insert(t, itemId)
			end
		end
		if useState_1 then
			var73(t)
		end
		if not fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p3.onRemoveItem then
					p3.onRemoveItem(v_2.itemId, v_2.itemType)
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
		var13(purchaseItemsSuccessThunkModule(boughtItems, t_1, var47, var38, var39, var40, t, p3.getBundleOutfitInfoFromProvidedTryOns, var42 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
		if fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p3.onRemoveItem then
					p3.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
			if fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end
	end, {
		var13, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var38, var39, var40, var37, var47, var73, p3.onRemoveItem, p3.fetchItemData,
		p3.getBundleOutfitInfoFromProvidedTryOns, var42,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var41 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var45 else nil,
		if fFlagAXMISSaveWearFix then p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	})
	local var76 = if AXFixLookPurchaseMissingPurchaseSuccess then reactModule.useCallback(function(p5, p6)
		-- upvalues: shoppingCartStore (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var45 (ref), var41 (ref), var42 (ref), p3 (ref), var13 (ref), setCurrentToastMessage (copy), var52 (ref), toastType (copy), getTryOnItemReducerKey (copy), useState_1 (ref), var73 (ref), fFlagAXMISSaveWearFix (copy), fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), useState (ref), getEquippableAssetsFromTryOnItemsModule (copy), purchaseItemsSuccessThunkModule (copy), var47 (ref), var38 (ref), var39 (ref), var40 (ref)
		local var77 = shoppingCartStore.updateCartFromPurchaseResponse(p5)
		local boughtItems = var77.boughtItems
		local equippableItems = var77.equippableItems
		local needDataRefeshItems = var77.needDataRefeshItems
		local cloned = nil
		local cloned_1 = nil
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then
			cloned = var45[var41]
			
			if cloned ~= nil then
				cloned = table.clone(cloned)
				cloned.itemId = var41
			end
			cloned_1 = var45[var42]
			
			if cloned_1 ~= nil then
				cloned_1 = table.clone(cloned_1)
				cloned_1.itemId = var42
			end
		end
		for i, v in needDataRefeshItems do
			if p3.fetchItemData then
				p3.fetchItemData(v.itemId, v.itemType)
			end
		end
		var13(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var52:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", { count = #boughtItems }),
			toastType = toastType.InformationMessage
		}))
		local t = {}
		
		for i_1, v_1 in equippableItems do
			local itemId = p6[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)]
			
			if itemId then
				table.insert(t, itemId)
			end
		end
		if useState_1 then
			var73(t)
		end
		if not fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p3.onRemoveItem then
					p3.onRemoveItem(v_2.itemId, v_2.itemType)
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
		var13(purchaseItemsSuccessThunkModule(boughtItems, t_1, var47, var38, var39, var40, t, p3.getBundleOutfitInfoFromProvidedTryOns, var42 ~= nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned else nil, if fFlagAXMISEnableMultiShoppingUnifiedEvents then cloned_1 else nil, if fFlagAXMISSaveWearFix then p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil))
		
		if fFlagAXMISSaveWearFix then
			for i_2, v_2 in equippableItems do
				if p3.onRemoveItem then
					p3.onRemoveItem(v_2.itemId, v_2.itemType)
				end
			end
			if fFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end
	end, {
		var13, shoppingCartStore.updateCartFromPurchaseResponse, useState, useState_1,
		var38, var39, var40, var47, var73, p3.onRemoveItem, p3.fetchItemData,
		p3.getBundleOutfitInfoFromProvidedTryOns, var42,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var41 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var45 else nil,
		if fFlagAXMISSaveWearFix then p3.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn else nil
	}) else nil
	local var78 = if fFlagAXMISWithBlackbird then reactModule.useCallback(function()
		-- upvalues: var16 (ref), discountTypeEnum (copy), fFlagAXFixMISUpsellDiscountSummary (copy), var19 (ref), var18 (ref), var60 (write), var13 (ref), purchasePromptLiteModule (ref), closeCentralOverlay (copy), promiseModule (copy), var55 (ref)
		local var79 = nil
		
		if var16 then
			for i, v in var16 do
				if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
					var79 = v
					break
				end
			end
		end
		local t = {}
		
		if fFlagAXFixMISUpsellDiscountSummary then
			if var79 then
				table.insert(t, 1, {
					Type = discountTypeEnum.RobloxPlusSubscription,
					AmountInRobux = var19 - var18,
					Percent = var79.robuxDiscountPercentage
				})
			end
			if var60.discountSummaryEntriesFromOffers then
				for i, v in var60.discountSummaryEntriesFromOffers do
					table.insert(t, {
						Type = v.type,
						AmountInRobux = v.amountInRobux,
						Percent = v.percent,
						LocalizedDiscountAttribution = v.localizedDiscountAttribution
					})
				end
			end
		end
		var13(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function()
					-- upvalues: var13 (copy), closeCentralOverlay (copy)
					var13(closeCentralOverlay())
				end,
				fetchProductInfo = function()
					-- upvalues: promiseModule (copy), fFlagAXFixMISUpsellDiscountSummary (copy), var18 (copy), var60 (copy), var79 (write), var19 (copy), t (ref)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = if fFlagAXFixMISUpsellDiscountSummary then var18 - var60.totalSelectedOffersDiscount else var18,
						SavingsSummaryOverride = if fFlagAXFixMISUpsellDiscountSummary and var79 then var60.savingsSummary else nil,
						BasePriceInRobux = if var79 then var19 else nil,
						PriceDiscountDetails = if var79 then if fFlagAXFixMISUpsellDiscountSummary then t else {
							{
								Type = var79.discountCampaign,
								AmountInRobux = var19 - var18,
								Percent = var79.robuxDiscountPercentage
							}
						} else nil
					})
				end
			}
		}))
		var55.current = true
	end, {
		var10, var13, var18, var19, var16,
		if fFlagAXFixMISUpsellDiscountSummary then var60 else nil
	}) else reactModule.useCallback(function()
		-- upvalues: var10 (ref), avatarScreen (copy), var55 (ref)
		var10.navigate(avatarScreen.InsufficientRobuxPrompt)
		var55.current = true
	end, { var10 })
	local var80 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), var45 (ref), var41 (ref), var42 (ref), var43 (ref), var44 (ref), var11 (ref), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var15 (ref), var37 (ref), unifiedEventLogEnums (copy), mutedError (copy), purchaseItemsModule (copy), var12 (ref), var48 (ref), var70 (ref), mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var76 (ref), tutilsModule (copy), var74 (ref), AXEnsureOfferBannerRefetchMIS (copy), purchasePromptLiteModule (ref), p3 (ref), getIsInsufficientRobuxError (copy), var78 (ref), var10 (ref), avatarScreen (copy), var51 (ref)
		var28(true)
		
		if fFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function()
			-- upvalues: var45 (copy), var41 (copy), var42 (copy), var43 (copy), var44 (copy), var11 (copy), avatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), var15 (copy), var37 (copy), unifiedEventLogEnums (copy)
			local var81 = var45[var41]
			
			if var81 ~= nil then
				var81 = table.clone(var81)
				var81.itemId = var41
			end
			local var82 = var45[var42]
			
			if var82 ~= nil then
				var82 = table.clone(var82)
				var82.itemId = var42
			end
			if var81 then
				var81.isOrganicLook = var43 == nil
			end
			if var82 then
				var82.isOrganicLook = var44 == nil
			end
			local var83 = avatarScreenProperties[var11 and (var11.current and var11.current.name)]
			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(var15, var37, var81, var82, unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), if var83 and var83.analyticsData then var83.analyticsData.unifiedLoggingSurface else nil)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase attempt")
		end
		purchaseItemsModule({
			networkImpl = var12,
			userId = var48,
			lookId = var41,
			makeupLookId = if fFlagAXMISEnableMultiShoppingUnifiedEvents then var42 else nil,
			lineItems = var70()
		}):andThen(function(p7)
			-- upvalues: mapPurchaseItemsResponseModule (copy), AXFixLookPurchaseMissingPurchaseSuccess (copy), var76 (copy), tutilsModule (copy), var37 (copy), var74 (copy), AXEnsureOfferBannerRefetchMIS (copy), purchasePromptLiteModule (copy), p3 (copy)
			if p7.isJSONValid and p7.responseCode == 200 then
				local var81 = mapPurchaseItemsResponseModule(p7.responseBody)
				
				if AXFixLookPurchaseMissingPurchaseSuccess and var76 then
					var76(var81, tutilsModule.deepCopy(var37))
				else
					var74(var81)
				end
				if AXEnsureOfferBannerRefetchMIS then
					purchasePromptLiteModule.Events.firePurchaseCompleted()
				end
				if p3.fetchUserRobux then
					p3.fetchUserRobux()
				end
			end
		end):catch(function(p7)
			-- upvalues: getIsInsufficientRobuxError (copy), var78 (copy), var10 (copy), avatarScreen (copy), var15 (copy), var51 (copy)
			if getIsInsufficientRobuxError(p7) then
				var78()
				
				return
			end
			var10.navigate(avatarScreen.GenericPrompt, {
				titleText = if #var15 == 1 then var51.purchaseFailedTitle else var51.purchaseFailedTitlePlural,
				bodyText = var51.purchaseFailedUnknownError,
				buttonText = var51.purchaseFailedButton
			})
		end):finally(function()
			-- upvalues: var28 (copy)
			var28(false)
		end)
	end, {
		var70, var48, var12, var78, p3.fetchUserRobux, var74, var15, var51, var10,
		var41, if fFlagAXMISEnableMultiShoppingUnifiedEvents then var42 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var45 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var37 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var43 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var44 else nil,
		if fFlagAXMISEnableMultiShoppingUnifiedEvents then var11 else nil,
		if AXFixLookPurchaseMissingPurchaseSuccess then var76 else nil,
		if AXEnsureOfferBannerRefetchMIS then purchasePromptLiteModule.Events.firePurchaseCompleted else nil
	})
	
	return {
		canPurchase = var17,
		cartItems = var61,
		discounts = if fFlagAXMISWithBlackbird then var16 else nil,
		erroredItemCount = var20,
		isPurchasing = var27,
		isVisible = var59,
		hideBuyOptions = if fFlagAXEnableExpiredUserLookCheckout then var62 else nil,
		shouldShowBlackbirdUpsellBanner = if fFlagAXMISWithBlackbird then var63 else nil,
		isWearAfterPurchaseChecked = useState,
		isAddToMyAvatarsChecked = useState_1,
		isSaveOptionsOpen = var21,
		onCheckoutButtonActivated = reactModule.useCallback(function()
			-- upvalues: fFlagAXMISWithOffers (copy), var18 (ref), var60 (write), var49 (ref), var78 (ref), var80 (ref)
			if var49 and var49 < (if fFlagAXMISWithOffers then var18 - var60.totalSelectedOffersDiscount else var18) then
				var78()
				
				return
			end
			var80()
		end, {
			var49,
			var18,
			var80,
			var78,
			if fFlagAXMISWithOffers then var60.totalSelectedOffersDiscount else nil
		}),
		onOpenItemDetailsPage = var65,
		onRemoveItem = var64,
		onUnavailableButtonActivated = var66,
		onWearAfterPurchaseToggle = var67,
		onAddToMyAvatarsToggle = var68,
		onSaveOptionsOpenToggle = var69,
		purchasableItemsTotalPriceInRobux = if fFlagAXMISWithOffers then math.max(var18 - var60.totalSelectedOffersDiscount, 0) else var18,
		purchasableItemsTotalOriginalPriceInRobux = var19,
		robloxSubscriptionProducts = if fFlagAXMISWithBlackbird then var29 else nil,
		discountSummaryProps = if fFlagAXMISWithBlackbird then if fFlagAXMISWithBlackbird then reactModule.useMemo(function()
			-- upvalues: var16 (ref), discountTypeEnum (copy), fFlagAXMISWithOffers (copy), var60 (write), var19 (ref), var18 (ref)
			local var81 = nil
			
			if var16 then
				for i, v in var16 do
					if v.discountCampaign == discountTypeEnum.RobloxPlusSubscription then
						var81 = v
						break
					end
				end
			end
			if fFlagAXMISWithOffers then
				local cloned = table.clone(var60.discountSummaryEntriesFromOffers)
				
				if var81 then
					table.insert(cloned, 1, {
						type = discountTypeEnum.RobloxPlusSubscription,
						amountInRobux = var19 - var18,
						percent = var81.robuxDiscountPercentage
					})
				end
				return {
					itemPrice = {
						basePriceInRobux = var19,
						priceInRobux = math.max(var18 - var60.totalSelectedOffersDiscount, 0),
						discounts = cloned
					},
					savingsSummary = var60.savingsSummary
				}
			else
				return if var81 and var19 and var18 then {
					itemPrice = {
						basePriceInRobux = var19,
						priceInRobux = var18,
						discounts = {
							{
								type = discountTypeEnum.RobloxPlusSubscription,
								amountInRobux = var19 - var18,
								percent = var81.robuxDiscountPercentage
							}
						}
					}
				} else nil
			end
		end, {
			var19, var18, var16,
			if fFlagAXMISWithOffers then var60.discountSummaryEntriesFromOffers else nil,
			if fFlagAXMISWithOffers then var60.totalSelectedOffersDiscount else nil,
			if fFlagAXMISWithOffers then var60.savingsSummary else nil
		}) else nil else nil,
		offersAvailable = if fFlagAXMISWithOffers then var60.offersAvailable else nil,
		handleDeselectOfferId = if fFlagAXMISWithOffers then var60.handleDeselectOfferId else nil
	}
end