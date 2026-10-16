local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local DiscountType = require(Parent.IAPExperience).DiscountType
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagPurchasePromptFetchCartPricing = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return function(p1, PriceInRobux, p2) --[[ Line: 17 | Named "useDiscountSummaryProps" ]]
	-- upvalues: ReactModule (copy), DiscountType (copy), FFlagPurchasePromptFetchCartPricing (copy), FFlagAXAddOffersToBulkPurchaseModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 22 ]]
		-- upvalues: p1 (copy), DiscountType (upval), FFlagPurchasePromptFetchCartPricing (upval), FFlagAXAddOffersToBulkPurchaseModule (upval), PriceInRobux (copy), p2 (copy)
		if not p1 then
			return nil
		end
		local Discounts = {}
		
		for _, discount in p1.discounts do
			table.insert(Discounts, {
				type = DiscountType[discount.discountCampaign] or DiscountType.Uncategorized,
				amountInRobux = discount.robuxDiscountAmount or 0,
				percent = discount.robuxDiscountPercentage or 0,
				localizedDiscountAttribution = if FFlagPurchasePromptFetchCartPricing or FFlagAXAddOffersToBulkPurchaseModule then discount.localizedDiscountAttribution else nil
			})
		end
		return {
			itemPrice = {
				basePriceInRobux = p1.originalPrice,
				priceInRobux = PriceInRobux,
				discounts = Discounts
			},
			savingsSummary = if FFlagAXAddOffersToBulkPurchaseModule then p2 else nil
		}
	end, { p1, PriceInRobux, p2 })
end