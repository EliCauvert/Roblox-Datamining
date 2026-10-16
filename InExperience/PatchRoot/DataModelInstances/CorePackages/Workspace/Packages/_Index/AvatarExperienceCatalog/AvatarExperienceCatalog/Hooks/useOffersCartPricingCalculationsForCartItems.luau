local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TutilsModule = require(Parent.tutils)
local ToastRoduxModule = require(Parent.ToastRodux)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local PostCartPricingForOffersModule = require(AvatarExperienceCatalog.Api.PostCartPricingForOffers.postCartPricingForOffers)
local UseAXCatalogStoreContextModule = require(AvatarExperienceCatalog.Context.useAXCatalogStoreContext)
local DecodeLuauUnicodeEscapesModule = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.decodeLuauUnicodeEscapes)
local ToastType = ToastRoduxModule.Enums.ToastType
local DiscountTypeEnum = AvatarExperienceCommonModule.Enums.DiscountTypeEnum
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseNetworkingFunction = AvatarExperienceCommonModule.Hooks.useNetworking
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local Constants = AvatarExperienceCommonModule.Constants
local AXDoNotPass356FetchCartPricing = game:DefineFastFlag("AXDoNotPass356FetchCartPricing", false)

local function buildItemsForOffersCartPricingRequest(List) --[[ Line: 40 ]]
	-- upvalues: AXDoNotPass356FetchCartPricing (copy), Constants (copy)
	local List1 = {}
	
	for _, value in List do
		local NoSelectedTimedOptionDays: boolean = value.selectedTimedOptionDays == nil or value.selectedTimedOptionDays == 0
		
		if not AXDoNotPass356FetchCartPricing or value.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(List1, {
				collectibleItemId = value.collectibleItemId,
				collectibleProductId = value.collectibleProductId,
				isPermanent = value.selectedTimedOptionDays == nil or value.selectedTimedOptionDays == 0,
				rentalDays = if NoSelectedTimedOptionDays then nil else value.selectedTimedOptionDays
			})
		end
	end
	return List1
end

local function getOffersAvailableMap(AvailableOffers) --[[ Line: 59 ]]
	-- upvalues: DecodeLuauUnicodeEscapesModule (copy)
	local t = {}
	
	if AvailableOffers ~= nil then
		for _, availableOffer in AvailableOffers do
			t[availableOffer.offerId] = availableOffer
			
			if availableOffer.localizedDescription then
				availableOffer.localizedDescription = DecodeLuauUnicodeEscapesModule(availableOffer.localizedDescription)
			end
		end
	end
	return t
end

local function calculateTotalDiscountFromSelectedOffers(Items, List): number --[[ Line: 72 ]]
	local t = {}
	
	for _, value in List do
		if value.selected then
			t[value.offerId] = true
		end
	end
	local NewRobuxDiscountAmount = 0
	
	for _, item in Items do
		local DiscountInformation = item.discountInformation
		
		if DiscountInformation ~= nil and DiscountInformation.discounts ~= nil then
			for _, discount in DiscountInformation.discounts do
				if t[discount.discountCampaign] then
					NewRobuxDiscountAmount += discount.robuxDiscountAmount
				end
			end
		end
	end
	return NewRobuxDiscountAmount
end

local function getDiscountedItemsFromItemsData(Items, p1) --[[ Line: 95 ]]
	local t = {}
	
	for _, item in Items do
		local OfferIdsApplied = {}
		
		if item.discountInformation and item.discountInformation.discounts then
			for _, discount in item.discountInformation.discounts do
				if p1[discount.discountCampaign] and p1[discount.discountCampaign].selected then
					table.insert(OfferIdsApplied, discount.discountCampaign)
				end
			end
		end
		t[item.collectibleItemId] = {
			collectibleItemId = item.collectibleItemId,
			priceInRobux = item.priceInRobux,
			discountInformation = item.discountInformation,
			offerIdsApplied = OfferIdsApplied
		}
	end
	return t
end

local function getAllDiscountSummaryEntries(Items, p2) --[[ Line: 121 ]]
	-- upvalues: DiscountTypeEnum (copy)
	local List = {}
	
	for _, item in Items do
		local DiscountInformation = item.discountInformation
		
		if DiscountInformation ~= nil and DiscountInformation.discounts ~= nil then
			for _, discount in DiscountInformation.discounts do
				if p2[discount.discountCampaign] ~= nil then
					table.insert(List, {
						type = DiscountTypeEnum.Uncategorized,
						amountInRobux = discount.robuxDiscountAmount,
						percent = discount.robuxDiscountPercentage,
						localizedDiscountAttribution = discount.localizedDiscountAttribution
					})
				end
			end
		end
	end
	return List
end

local Tbl = {}

return function(p3, p4, p5) --[[ Line: 146 | Named "useOffersCartPricingCalculationsForCartItems" ]]
	-- upvalues: UseAXCatalogStoreContextModule (copy), UseNetworkingFunction (copy), UseDispatchFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), buildItemsForOffersCartPricingRequest (copy), UseLocalizationFunction (copy), ToastType (copy), SetCurrentToastMessageFunction (copy), TutilsModule (copy), PostCartPricingForOffersModule (copy), CryoModule (copy), Tbl (ref), getOffersAvailableMap (copy), getDiscountedItemsFromItemsData (copy), calculateTotalDiscountFromSelectedOffers (copy), getAllDiscountSummaryEntries (copy), MutedErrorFunction (copy), DecodeLuauUnicodeEscapesModule (copy)
	local CatalogOffersBannerStore = UseAXCatalogStoreContextModule().catalogOffersBannerStore
	local UseNetworkingResult = UseNetworkingFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = UseSignalStateFunction(CatalogOffersBannerStore.getPayload)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(false)
	local ItemsForOffersCartPricingRequest = buildItemsForOffersCartPricingRequest(p3)
	local UseRefResult1 = ReactModule.useRef({})
	local UseLocalizationResult = UseLocalizationFunction({
		fetchFailed = "Feature.Catalog.Title.Checkout.OfferFailedToFetch",
		toggleFailed = "Feature.Catalog.Title.Checkout.OfferFailedToUpdate"
	})
	local UseResult = ReactModule.useCallback(function(ToastMessage) --[[ Line: 173 ]]
		-- upvalues: ToastType (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = ToastMessage,
			toastType = ToastType.NetworkingError
		}))
	end, { UseDispatchResult })
	ReactModule.useEffect(function() --[[ Line: 182 ]]
		-- upvalues: UseSignalStateResult (copy), p5 (copy), ItemsForOffersCartPricingRequest (copy), TutilsModule (upval), UseRefResult1 (copy), PostCartPricingForOffersModule (upval), UseNetworkingResult (copy), CryoModule (upval), Tbl (upval), getOffersAvailableMap (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), getDiscountedItemsFromItemsData (upval), UseStateResult2_3 (copy), calculateTotalDiscountFromSelectedOffers (upval), UseStateResult2_4 (copy), getAllDiscountSummaryEntries (upval), MutedErrorFunction (upval), UseResult (copy), UseLocalizationResult (copy)
		if UseSignalStateResult and p5 and #ItemsForOffersCartPricingRequest ~= 0 and not TutilsModule.deepEqual(ItemsForOffersCartPricingRequest, UseRefResult1.current) then
			UseRefResult1.current = ItemsForOffersCartPricingRequest
			local PostCartPricingForOffersModuleResult, _ = PostCartPricingForOffersModule(UseNetworkingResult, {
				featureKey = "MARKETPLACE_CART",
				items = ItemsForOffersCartPricingRequest,
				unselectedOffers = CryoModule.Dictionary.keys(Tbl)
			})
			PostCartPricingForOffersModuleResult:andThen(function(Result) --[[ Line: 200 ]]
				-- upvalues: getOffersAvailableMap (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), getDiscountedItemsFromItemsData (upval), UseStateResult2_3 (upval), calculateTotalDiscountFromSelectedOffers (upval), UseStateResult2_4 (upval), getAllDiscountSummaryEntries (upval), MutedErrorFunction (upval)
				if Result and Result.items then
					local OffersAvailableMap = getOffersAvailableMap(Result.availableOffers)
					UseStateResult2(Result.savingsSummary)
					UseStateResult2_1(OffersAvailableMap)
					UseStateResult2_2((getDiscountedItemsFromItemsData(Result.items, OffersAvailableMap)))
					UseStateResult2_3((calculateTotalDiscountFromSelectedOffers(Result.items, OffersAvailableMap)))
					UseStateResult2_4((getAllDiscountSummaryEntries(Result.items, OffersAvailableMap)))
					
					return
				else
					MutedErrorFunction("marketplace-sales/v1/cart-pricing did not return items in payload")
				end
			end):catch(function(_) --[[ Line: 214 ]]
				-- upvalues: UseResult (upval), UseLocalizationResult (upval)
				UseResult(UseLocalizationResult.fetchFailed)
			end)
			
			return
		end
	end, {
		UseNetworkingResult, ItemsForOffersCartPricingRequest, UseSignalStateResult,
		p5, UseResult, UseLocalizationResult
	})
	ReactModule.useEffect(function() --[[ Line: 226 ]]
		-- upvalues: p4 (copy), UseRefResult1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy)
		if not p4 then
			UseRefResult1.current = {}
			UseStateResult2(nil)
			UseStateResult2_1({})
			UseStateResult2_2({})
			UseStateResult2_3(0)
			UseStateResult2_4({})
		end
	end, { p4 })
	
	return {
		offersAvailable = UseStateResult1,
		discountedItemsFromOffers = UseStateResult3,
		totalSelectedOffersDiscount = UseStateResult4,
		discountSummaryEntriesFromOffers = UseStateResult5,
		savingsSummary = if UseStateResult then DecodeLuauUnicodeEscapesModule(UseStateResult) else nil,
		handleDeselectOfferId = ReactModule.useCallback(function(Key) --[[ Line: 238 ]]
			-- upvalues: UseRefResult (copy), Tbl (upval), PostCartPricingForOffersModule (upval), UseNetworkingResult (copy), ItemsForOffersCartPricingRequest (copy), CryoModule (upval), getOffersAvailableMap (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), getDiscountedItemsFromItemsData (upval), UseStateResult2_3 (copy), calculateTotalDiscountFromSelectedOffers (upval), UseStateResult2_4 (copy), getAllDiscountSummaryEntries (upval), MutedErrorFunction (upval), UseResult (copy), UseLocalizationResult (copy)
			if UseRefResult.current then return end
			UseRefResult.current = true
			local Copy = table.clone(Tbl)
			
			if Tbl[Key] then
				Tbl[Key] = nil
			else
				Tbl[Key] = true
			end
			local PostCartPricingForOffersModuleResult, _ = PostCartPricingForOffersModule(UseNetworkingResult, {
				featureKey = "MARKETPLACE_CART",
				items = ItemsForOffersCartPricingRequest,
				unselectedOffers = CryoModule.Dictionary.keys(Tbl)
			})
			PostCartPricingForOffersModuleResult:andThen(function(Result) --[[ Line: 260 ]]
				-- upvalues: getOffersAvailableMap (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), getDiscountedItemsFromItemsData (upval), UseStateResult2_3 (upval), calculateTotalDiscountFromSelectedOffers (upval), UseStateResult2_4 (upval), getAllDiscountSummaryEntries (upval), MutedErrorFunction (upval), UseRefResult (upval)
				if Result and Result.items then
					local OffersAvailableMap = getOffersAvailableMap(Result.availableOffers)
					UseStateResult2(Result.savingsSummary)
					UseStateResult2_1(OffersAvailableMap)
					UseStateResult2_2((getDiscountedItemsFromItemsData(Result.items, OffersAvailableMap)))
					UseStateResult2_3((calculateTotalDiscountFromSelectedOffers(Result.items, OffersAvailableMap)))
					UseStateResult2_4((getAllDiscountSummaryEntries(Result.items, OffersAvailableMap)))
				else
					MutedErrorFunction("marketplace-sales/v1/cart-pricing did not return items in payload")
				end
				UseRefResult.current = false
			end):catch(function(_) --[[ Line: 276 ]]
				-- upvalues: Tbl (upval), Copy (copy), UseResult (upval), UseLocalizationResult (upval), UseRefResult (upval)
				Tbl = Copy
				UseResult(UseLocalizationResult.toggleFailed)
				UseRefResult.current = false
			end)
		end, {
			UseNetworkingResult,
			ItemsForOffersCartPricingRequest,
			UseResult,
			UseLocalizationResult
		})
	}
end