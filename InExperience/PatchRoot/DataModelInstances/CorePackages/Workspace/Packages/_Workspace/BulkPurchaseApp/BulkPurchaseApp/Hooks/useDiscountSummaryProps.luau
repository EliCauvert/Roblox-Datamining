local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local discountType = require(parent.IAPExperience).DiscountType
local _ = require(bulkPurchaseApp.Store.Types)
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local fFlagAXAddOffersToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), discountType (ref), fFlagPurchasePromptFetchCartPricing (ref), fFlagAXAddOffersToBulkPurchaseModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), discountType (copy), fFlagPurchasePromptFetchCartPricing (copy), fFlagAXAddOffersToBulkPurchaseModule (copy), p2 (ref), p3 (ref)
		if not p1 then
			return nil
		end
		local t = {}
		
		for i, v in p1.discounts do
			table.insert(t, {
				type = discountType[v.discountCampaign] or discountType.Uncategorized,
				amountInRobux = v.robuxDiscountAmount or 0,
				percent = v.robuxDiscountPercentage or 0,
				localizedDiscountAttribution = if fFlagPurchasePromptFetchCartPricing or fFlagAXAddOffersToBulkPurchaseModule then v.localizedDiscountAttribution else nil
			})
		end
		return {
			itemPrice = {
				basePriceInRobux = p1.originalPrice,
				priceInRobux = p2,
				discounts = t
			},
			savingsSummary = if fFlagAXAddOffersToBulkPurchaseModule then p3 else nil
		}
	end, { p1, p2, p3 })
end