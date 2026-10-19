local CartPricingResponseLineItemModule = require(script.Parent.cartPricingResponseLineItem)
local FFlagPurchasePromptFetchCartPricingForLooks = require(script:FindFirstAncestor("IAPExperience").Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local AXAllowFreeItemsFromOffer = game:DefineFastFlag("AXAllowFreeItemsFromOffer", false)
local _ = require(script.Parent.Parent.PricingTypes)

return function(p1) --[[ Line: 45 | Named "deriveCartPricingView" ]]
	-- upvalues: CartPricingResponseLineItemModule (copy), AXAllowFreeItemsFromOffer (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local Errors = p1.errors
	
	if type(Errors) == "table" and next(Errors) ~= nil then
		return nil
	end
	local Items = p1.items
	
	if type(Items) ~= "table" or next(Items) == nil then
		return nil
	end
	local PriceAfterDiscount = 0
	local NewCartLineRegularPriceInRobux = 0
	
	for _, item in Items do
		local CartLineSalePriceInRobux: number = CartPricingResponseLineItemModule.getCartLineSalePriceInRobux(item)
		
		if CartLineSalePriceInRobux == nil then
			return nil
		end
		PriceAfterDiscount += CartLineSalePriceInRobux
		NewCartLineRegularPriceInRobux += CartPricingResponseLineItemModule.getCartLineRegularPriceInRobux(item, CartLineSalePriceInRobux)
	end
	if not AXAllowFreeItemsFromOffer and PriceAfterDiscount <= 0 then
		return nil
	end
	if AXAllowFreeItemsFromOffer and PriceAfterDiscount < 0 then
		return nil
	end
	local ExtractCartPricingMarketingOffersResult = CartPricingResponseLineItemModule.extractCartPricingMarketingOffers(p1)
	local SelectedOfferIds = {}
	
	for _, value in ExtractCartPricingMarketingOffersResult do
		if value.selected then
			table.insert(SelectedOfferIds, value.offerId)
		end
	end
	local ConsolidateRobloxPlusDiscountsResult = if FFlagPurchasePromptFetchCartPricingForLooks then CartPricingResponseLineItemModule.consolidateRobloxPlusDiscounts((CartPricingResponseLineItemModule.extractDiscountRowsFromLineItems(Items))) else nil
	
	return {
		priceAfterDiscount = PriceAfterDiscount,
		originalPrice = NewCartLineRegularPriceInRobux,
		priceWithoutOffersDiscounts = CartPricingResponseLineItemModule.computePriceWithoutOffersDiscounts(Items, PriceAfterDiscount),
		hasSavings = PriceAfterDiscount < NewCartLineRegularPriceInRobux,
		itemCount = #Items,
		discounts = if FFlagPurchasePromptFetchCartPricingForLooks then ConsolidateRobloxPlusDiscountsResult else CartPricingResponseLineItemModule.extractDiscountRowsFromLineItems(Items),
		offers = ExtractCartPricingMarketingOffersResult,
		selectedOfferIds = SelectedOfferIds,
		savingsSummary = CartPricingResponseLineItemModule.extractCartPricingSavingsSummary(p1)
	}
end