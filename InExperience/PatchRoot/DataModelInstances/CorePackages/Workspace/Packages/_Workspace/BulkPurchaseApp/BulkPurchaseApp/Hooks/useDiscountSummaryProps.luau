local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local discountType = require(parent.IAPExperience).DiscountType
local _ = require(bulkPurchaseApp.Store.Types)
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

return function(p0, p1)
	-- upvalues: reactModule (ref), discountType (ref), fFlagPurchasePromptFetchCartPricing (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), discountType (copy), fFlagPurchasePromptFetchCartPricing (copy), p1 (ref)
		if not p0 then
			return nil
		end
		local t = {}
		
		for i, v in p0.discounts do
			table.insert(t, {
				type = discountType[v.discountCampaign] or discountType.Uncategorized,
				amountInRobux = v.robuxDiscountAmount or 0,
				percent = v.robuxDiscountPercentage or 0,
				localizedDiscountAttribution = if fFlagPurchasePromptFetchCartPricing then v.localizedDiscountAttribution else nil
			})
		end
		return {
			itemPrice = {
				basePriceInRobux = p0.originalPrice,
				priceInRobux = p1,
				discounts = t
			}
		}
	end, { p0, p1 })
end