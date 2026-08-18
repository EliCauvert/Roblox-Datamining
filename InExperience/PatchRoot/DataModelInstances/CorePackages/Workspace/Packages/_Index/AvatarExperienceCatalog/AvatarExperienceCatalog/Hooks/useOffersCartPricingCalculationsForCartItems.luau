local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local mutedError = require(parent.Loggers).mutedError
local tutilsModule = require(parent.tutils)
local signalsReactModule = require(parent.SignalsReact)
local toastRoduxModule = require(parent.ToastRodux)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local postCartPricingForOffersModule = require(avatarExperienceCatalog.Api.PostCartPricingForOffers.postCartPricingForOffers)
local useAXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.useAXCatalogStoreContext)
local decodeLuauUnicodeEscapesModule = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.decodeLuauUnicodeEscapes)
local toastType = toastRoduxModule.Enums.ToastType
local discountTypeEnum = avatarExperienceCommonModule.Enums.DiscountTypeEnum
local useSignalState = signalsReactModule.useSignalState
local useNetworking = avatarExperienceCommonModule.Hooks.useNetworking
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local constants = avatarExperienceCommonModule.Constants
local AXDoNotPass356FetchCartPricing = game:DefineFastFlag("AXDoNotPass356FetchCartPricing", false)

local function buildItemsForOffersCartPricingRequest(p0) --[[ line: 31 ]]
	-- upvalues: AXDoNotPass356FetchCartPricing (ref), constants (ref)
	local t = {}
	
	for i, v in p0 do
		local var19 = if v.selectedTimedOptionDays ~= nil then v.selectedTimedOptionDays == 0 else true
		
		if not AXDoNotPass356FetchCartPricing or v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(t, {
				collectibleItemId = v.collectibleItemId,
				collectibleProductId = v.collectibleProductId,
				isPermanent = if v.selectedTimedOptionDays ~= nil then v.selectedTimedOptionDays == 0 else true,
				rentalDays = if not var19 then v.selectedTimedOptionDays else nil
			})
		end
	end
	return t
end

local function getOffersAvailableMap(p1) --[[ line: 50 ]]
	-- upvalues: decodeLuauUnicodeEscapesModule (ref)
	local t = {}
	
	if p1 ~= nil then
		for i, v in p1 do
			t[v.offerId] = v
			
			if v.localizedDescription then
				v.localizedDescription = decodeLuauUnicodeEscapesModule(v.localizedDescription)
			end
		end
	end
	return t
end

local function calculateTotalDiscountFromSelectedOffers(p2, p3) --[[ line: 63 ]]
	local t = {}
	
	for i, v in p3 do
		if v.selected then
			t[v.offerId] = true
		end
	end
	local var22 = 0
	
	for i_1, v_1 in p2 do
		local discountInformation = v_1.discountInformation
		
		if discountInformation ~= nil and discountInformation.discounts ~= nil then
			for i_2, v_2 in discountInformation.discounts do
				if t[v_2.discountCampaign] then
					var22 += v_2.robuxDiscountAmount
				end
			end
		end
	end
	return var22
end

local function getDiscountedItemsFromItemsData(p4, p5) --[[ line: 86 ]]
	local t = {}
	
	for i, v in p4 do
		local t_1 = {}
		
		if v.discountInformation and v.discountInformation.discounts then
			for i_1, v_1 in v.discountInformation.discounts do
				if p5[v_1.discountCampaign] and p5[v_1.discountCampaign].selected then
					table.insert(t_1, v_1.discountCampaign)
				end
			end
		end
		t[v.collectibleItemId] = {
			collectibleItemId = v.collectibleItemId,
			priceInRobux = v.priceInRobux,
			discountInformation = v.discountInformation,
			offerIdsApplied = t_1
		}
	end
	return t
end

local function getAllDiscountSummaryEntries(p6, p7) --[[ line: 112 ]]
	-- upvalues: discountTypeEnum (ref)
	local t = {}
	
	for i, v in p6 do
		local discountInformation = v.discountInformation
		
		if discountInformation ~= nil and discountInformation.discounts ~= nil then
			for i_1, v_1 in discountInformation.discounts do
				if p7[v_1.discountCampaign] ~= nil then
					table.insert(t, {
						type = discountTypeEnum.Uncategorized,
						amountInRobux = v_1.robuxDiscountAmount,
						percent = v_1.robuxDiscountPercentage,
						localizedDiscountAttribution = v_1.localizedDiscountAttribution
					})
				end
			end
		end
	end
	return t
end

local t = {}

return function(p8, p9, p10) --[[ line: 137 | named "useOffersCartPricingCalculationsForCartItems" ]]
	-- upvalues: useAXCatalogStoreContextModule (ref), useNetworking (ref), useDispatch (ref), useSignalState (ref), reactModule (ref), buildItemsForOffersCartPricingRequest (ref), useLocalization (ref), toastType (ref), setCurrentToastMessage (ref), tutilsModule (ref), postCartPricingForOffersModule (ref), cryoModule (ref), t (write), getOffersAvailableMap (ref), getDiscountedItemsFromItemsData (ref), calculateTotalDiscountFromSelectedOffers (ref), getAllDiscountSummaryEntries (ref), mutedError (ref), decodeLuauUnicodeEscapesModule (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var26 = useNetworking()
	local var27 = useDispatch()
	local var28 = useSignalState(catalogOffersBannerStore.getPayload)
	local var29, var30 = reactModule.useState(nil)
	local var31, var32 = reactModule.useState({})
	local var33, var34 = reactModule.useState({})
	local var35, var36 = reactModule.useState(0)
	local var37, var38 = reactModule.useState({})
	local var39 = reactModule.useRef(false)
	local var40 = buildItemsForOffersCartPricingRequest(p8)
	local var41 = reactModule.useRef({})
	local var42 = useLocalization({
		fetchFailed = "Feature.Catalog.Title.Checkout.OfferFailedToFetch",
		toggleFailed = "Feature.Catalog.Title.Checkout.OfferFailedToUpdate"
	})
	local var43 = reactModule.useCallback(function(p11) --[[ line: 163 ]]
		-- upvalues: toastType (copy), var27 (ref), setCurrentToastMessage (copy)
		var27(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = p11,
			toastType = toastType.NetworkingError
		}))
	end, { var27 })
	reactModule.useEffect(function() --[[ line: 172 ]]
		-- upvalues: var28 (ref), p10 (ref), var40 (ref), tutilsModule (copy), var41 (ref), postCartPricingForOffersModule (copy), var26 (ref), cryoModule (copy), t (copy), getOffersAvailableMap (copy), var30 (ref), var32 (ref), var34 (ref), getDiscountedItemsFromItemsData (copy), var36 (ref), calculateTotalDiscountFromSelectedOffers (copy), var38 (ref), getAllDiscountSummaryEntries (copy), mutedError (copy), var43 (ref), var42 (ref)
		if var28 and p10 and (#var40 ~= 0 and not tutilsModule.deepEqual(var40, var41.current)) then
			var41.current = var40
			local var44, _ = postCartPricingForOffersModule(var26, {
				featureKey = "MARKETPLACE_CART",
				items = var40,
				unselectedOffers = cryoModule.Dictionary.keys(t)
			})
			var44:andThen(function(p12) --[[ line: 190 ]]
				-- upvalues: getOffersAvailableMap (copy), var30 (copy), var32 (copy), var34 (copy), getDiscountedItemsFromItemsData (copy), var36 (copy), calculateTotalDiscountFromSelectedOffers (copy), var38 (copy), getAllDiscountSummaryEntries (copy), mutedError (copy)
				if p12 and p12.items then
					local var45 = getOffersAvailableMap(p12.availableOffers)
					var30(p12.savingsSummary)
					var32(var45)
					var34(getDiscountedItemsFromItemsData(p12.items, var45))
					var36(calculateTotalDiscountFromSelectedOffers(p12.items, var45))
					var38(getAllDiscountSummaryEntries(p12.items, var45))
					
					return
				end
				mutedError("marketplace-sales/v1/cart-pricing did not return items in payload")
			end):catch(function(_) --[[ line: 204 ]]
				-- upvalues: var43 (copy), var42 (copy)
				var43(var42.fetchFailed)
			end)
			
			return
		end
	end, {
		var26, var40, var28, p10, var43, var42
	})
	reactModule.useEffect(function() --[[ line: 216 ]]
		-- upvalues: p9 (ref), var41 (ref), var30 (ref), var32 (ref), var34 (ref), var36 (ref), var38 (ref)
		if not p9 then
			var41.current = {}
			var30(nil)
			var32({})
			var34({})
			var36(0)
			var38({})
		end
	end, { p9 })
	
	return {
		offersAvailable = var31,
		discountedItemsFromOffers = var33,
		totalSelectedOffersDiscount = var35,
		discountSummaryEntriesFromOffers = var37,
		savingsSummary = if var29 then decodeLuauUnicodeEscapesModule(var29) else nil,
		handleDeselectOfferId = reactModule.useCallback(function(p13) --[[ line: 228 ]]
			-- upvalues: var39 (ref), t (copy), postCartPricingForOffersModule (copy), var26 (ref), var40 (ref), cryoModule (copy), getOffersAvailableMap (copy), var30 (ref), var32 (ref), var34 (ref), getDiscountedItemsFromItemsData (copy), var36 (ref), calculateTotalDiscountFromSelectedOffers (copy), var38 (ref), getAllDiscountSummaryEntries (copy), mutedError (copy), var43 (ref), var42 (ref)
			if var39.current then return end
			var39.current = true
			local cloned = table.clone(t)
			
			if t[p13] then
				t[p13] = nil
			else
				t[p13] = true
			end
			local var47, _ = postCartPricingForOffersModule(var26, {
				featureKey = "MARKETPLACE_CART",
				items = var40,
				unselectedOffers = cryoModule.Dictionary.keys(t)
			})
			var47:andThen(function(p14) --[[ line: 250 ]]
				-- upvalues: getOffersAvailableMap (copy), var30 (copy), var32 (copy), var34 (copy), getDiscountedItemsFromItemsData (copy), var36 (copy), calculateTotalDiscountFromSelectedOffers (copy), var38 (copy), getAllDiscountSummaryEntries (copy), mutedError (copy), var39 (copy)
				if p14 and p14.items then
					local var48 = getOffersAvailableMap(p14.availableOffers)
					var30(p14.savingsSummary)
					var32(var48)
					var34(getDiscountedItemsFromItemsData(p14.items, var48))
					var36(calculateTotalDiscountFromSelectedOffers(p14.items, var48))
					var38(getAllDiscountSummaryEntries(p14.items, var48))
				else
					mutedError("marketplace-sales/v1/cart-pricing did not return items in payload")
				end
				var39.current = false
			end):catch(function(_) --[[ line: 266 ]]
				-- upvalues: t (copy), cloned (ref), var43 (copy), var42 (copy), var39 (copy)
				t = cloned
				var43(var42.toggleFailed)
				var39.current = false
			end)
		end, { var26, var40, var43, var42 })
	}
end