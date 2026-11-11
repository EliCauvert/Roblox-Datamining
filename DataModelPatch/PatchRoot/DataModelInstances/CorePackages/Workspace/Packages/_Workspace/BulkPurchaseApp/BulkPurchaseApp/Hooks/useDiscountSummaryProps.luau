local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local DiscountType = require(Parent.IAPExperience).DiscountType
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagPurchasePromptFetchCartPricing = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

return function(p1, PriceInRobux)
	-- upvalues: ReactModule (copy), DiscountType (copy), FFlagPurchasePromptFetchCartPricing (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), DiscountType (upval), FFlagPurchasePromptFetchCartPricing (upval), PriceInRobux (copy)
		if not p1 then
			return nil
		end
		local Discounts = {}
		
		for _, discount in p1.discounts do
			table.insert(Discounts, {
				type = DiscountType[discount.discountCampaign] or DiscountType.Uncategorized,
				amountInRobux = discount.robuxDiscountAmount or 0,
				percent = discount.robuxDiscountPercentage or 0,
				localizedDiscountAttribution = if FFlagPurchasePromptFetchCartPricing then discount.localizedDiscountAttribution else nil
			})
		end
		return {
			itemPrice = {
				basePriceInRobux = p1.originalPrice,
				priceInRobux = PriceInRobux,
				discounts = Discounts
			}
		}
	end, { p1, PriceInRobux })
end