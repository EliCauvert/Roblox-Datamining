local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)
local deriveSelectedOfferIdsFromCartPricingModule = require(script.Parent.deriveSelectedOfferIdsFromCartPricing)

return function(p0) --[[ line: 18 | named "derivePurchaseOptionsFromCartPricingResponse" ]]
	-- upvalues: deriveSelectedOfferIdsFromCartPricingModule (ref)
	if p0 == nil then
		return nil
	end
	local var1 = deriveSelectedOfferIdsFromCartPricingModule(p0)
	
	if #var1 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in var1 do
		table.insert(t, { Id = v })
	end
	return { Offers = t }
end