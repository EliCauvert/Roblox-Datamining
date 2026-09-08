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

local function buildItemsForOffersCartPricingRequest(p1)
	-- upvalues: AXDoNotPass356FetchCartPricing (ref), constants (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = if v.selectedTimedOptionDays ~= nil then v.selectedTimedOptionDays == 0 else true
		
		if not AXDoNotPass356FetchCartPricing or v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(t, {
				collectibleItemId = v.collectibleItemId,
				collectibleProductId = v.collectibleProductId,
				isPermanent = if v.selectedTimedOptionDays ~= nil then v.selectedTimedOptionDays == 0 else true,
				rentalDays = if not var1 then v.selectedTimedOptionDays else nil
			})
		end
	end
	return t
end

local function getOffersAvailableMap(p2)
	-- upvalues: decodeLuauUnicodeEscapesModule (ref)
	local t = {}
	
	if p2 ~= nil then
		for i, v in p2 do
			t[v.offerId] = v
			
			if v.localizedDescription then
				v.localizedDescription = decodeLuauUnicodeEscapesModule(v.localizedDescription)
			end
		end
	end
	return t
end

local function calculateTotalDiscountFromSelectedOffers(p3, p4)
	local t = {}
	
	for i, v in p4 do
		if v.selected then
			t[v.offerId] = true
		end
	end
	local var2 = 0
	
	for i_1, v_1 in p3 do
		local discountInformation = v_1.discountInformation
		
		if discountInformation ~= nil and discountInformation.discounts ~= nil then
			for i_2, v_2 in discountInformation.discounts do
				if t[v_2.discountCampaign] then
					var2 += v_2.robuxDiscountAmount
				end
			end
		end
	end
	return var2
end

local function getDiscountedItemsFromItemsData(p5, p6)
	local t = {}
	
	for i, v in p5 do
		local t_1 = {}
		
		if v.discountInformation and v.discountInformation.discounts then
			for i_1, v_1 in v.discountInformation.discounts do
				if p6[v_1.discountCampaign] and p6[v_1.discountCampaign].selected then
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

local function getAllDiscountSummaryEntries(p7, p8)
	-- upvalues: discountTypeEnum (ref)
	local t = {}
	
	for i, v in p7 do
		local discountInformation = v.discountInformation
		
		if discountInformation ~= nil and discountInformation.discounts ~= nil then
			for i_1, v_1 in discountInformation.discounts do
				if p8[v_1.discountCampaign] ~= nil then
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

return function(p9, p10, p11)
	-- upvalues: useAXCatalogStoreContextModule (ref), useNetworking (ref), useDispatch (ref), useSignalState (ref), reactModule (ref), buildItemsForOffersCartPricingRequest (ref), useLocalization (ref), toastType (ref), setCurrentToastMessage (ref), tutilsModule (ref), postCartPricingForOffersModule (ref), cryoModule (ref), t (write), getOffersAvailableMap (ref), getDiscountedItemsFromItemsData (ref), calculateTotalDiscountFromSelectedOffers (ref), getAllDiscountSummaryEntries (ref), mutedError (ref), decodeLuauUnicodeEscapesModule (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var3 = useNetworking()
	local var4 = useDispatch()
	local var5 = useSignalState(catalogOffersBannerStore.getPayload)
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState({})
	local var10, var11 = reactModule.useState({})
	local var12, var13 = reactModule.useState(0)
	local var14, var15 = reactModule.useState({})
	local var16 = reactModule.useRef(false)
	local var17 = buildItemsForOffersCartPricingRequest(p9)
	local var18 = reactModule.useRef({})
	local var19 = useLocalization({
		fetchFailed = "Feature.Catalog.Title.Checkout.OfferFailedToFetch",
		toggleFailed = "Feature.Catalog.Title.Checkout.OfferFailedToUpdate"
	})
	local var20 = reactModule.useCallback(function(p12)
		-- upvalues: toastType (copy), var4 (ref), setCurrentToastMessage (copy)
		var4(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = p12,
			toastType = toastType.NetworkingError
		}))
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p11 (ref), var17 (ref), tutilsModule (copy), var18 (ref), postCartPricingForOffersModule (copy), var3 (ref), cryoModule (copy), t (copy), getOffersAvailableMap (copy), var7 (ref), var9 (ref), var11 (ref), getDiscountedItemsFromItemsData (copy), var13 (ref), calculateTotalDiscountFromSelectedOffers (copy), var15 (ref), getAllDiscountSummaryEntries (copy), mutedError (copy), var20 (ref), var19 (ref)
		if var5 and p11 and (#var17 ~= 0 and not tutilsModule.deepEqual(var17, var18.current)) then
			var18.current = var17
			local var21, _ = postCartPricingForOffersModule(var3, {
				featureKey = "MARKETPLACE_CART",
				items = var17,
				unselectedOffers = cryoModule.Dictionary.keys(t)
			})
			var21:andThen(function(p12)
				-- upvalues: getOffersAvailableMap (copy), var7 (copy), var9 (copy), var11 (copy), getDiscountedItemsFromItemsData (copy), var13 (copy), calculateTotalDiscountFromSelectedOffers (copy), var15 (copy), getAllDiscountSummaryEntries (copy), mutedError (copy)
				if p12 and p12.items then
					local var22 = getOffersAvailableMap(p12.availableOffers)
					var7(p12.savingsSummary)
					var9(var22)
					var11(getDiscountedItemsFromItemsData(p12.items, var22))
					var13(calculateTotalDiscountFromSelectedOffers(p12.items, var22))
					var15(getAllDiscountSummaryEntries(p12.items, var22))
					
					return
				end
				mutedError("marketplace-sales/v1/cart-pricing did not return items in payload")
			end):catch(function(_)
				-- upvalues: var20 (copy), var19 (copy)
				var20(var19.fetchFailed)
			end)
			
			return
		end
	end, {
		var3, var17, var5, p11, var20, var19
	})
	reactModule.useEffect(function()
		-- upvalues: p10 (ref), var18 (ref), var7 (ref), var9 (ref), var11 (ref), var13 (ref), var15 (ref)
		if not p10 then
			var18.current = {}
			var7(nil)
			var9({})
			var11({})
			var13(0)
			var15({})
		end
	end, { p10 })
	
	return {
		offersAvailable = var8,
		discountedItemsFromOffers = var10,
		totalSelectedOffersDiscount = var12,
		discountSummaryEntriesFromOffers = var14,
		savingsSummary = if var6 then decodeLuauUnicodeEscapesModule(var6) else nil,
		handleDeselectOfferId = reactModule.useCallback(function(p12)
			-- upvalues: var16 (ref), t (copy), postCartPricingForOffersModule (copy), var3 (ref), var17 (ref), cryoModule (copy), getOffersAvailableMap (copy), var7 (ref), var9 (ref), var11 (ref), getDiscountedItemsFromItemsData (copy), var13 (ref), calculateTotalDiscountFromSelectedOffers (copy), var15 (ref), getAllDiscountSummaryEntries (copy), mutedError (copy), var20 (ref), var19 (ref)
			if var16.current then return end
			var16.current = true
			local cloned = table.clone(t)
			
			if t[p12] then
				t[p12] = nil
			else
				t[p12] = true
			end
			local var21, _ = postCartPricingForOffersModule(var3, {
				featureKey = "MARKETPLACE_CART",
				items = var17,
				unselectedOffers = cryoModule.Dictionary.keys(t)
			})
			var21:andThen(function(p13)
				-- upvalues: getOffersAvailableMap (copy), var7 (copy), var9 (copy), var11 (copy), getDiscountedItemsFromItemsData (copy), var13 (copy), calculateTotalDiscountFromSelectedOffers (copy), var15 (copy), getAllDiscountSummaryEntries (copy), mutedError (copy), var16 (copy)
				if p13 and p13.items then
					local var22 = getOffersAvailableMap(p13.availableOffers)
					var7(p13.savingsSummary)
					var9(var22)
					var11(getDiscountedItemsFromItemsData(p13.items, var22))
					var13(calculateTotalDiscountFromSelectedOffers(p13.items, var22))
					var15(getAllDiscountSummaryEntries(p13.items, var22))
				else
					mutedError("marketplace-sales/v1/cart-pricing did not return items in payload")
				end
				var16.current = false
			end):catch(function(_)
				-- upvalues: t (copy), cloned (ref), var20 (copy), var19 (copy), var16 (copy)
				t = cloned
				var20(var19.toggleFailed)
				var16.current = false
			end)
		end, { var3, var17, var20, var19 })
	}
end