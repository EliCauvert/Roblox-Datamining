local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)
local deriveSelectedOfferIdsFromCartPricingModule = require(script.Parent.deriveSelectedOfferIdsFromCartPricing)

return function(p1)
	-- upvalues: deriveSelectedOfferIdsFromCartPricingModule (ref)
	if p1 == nil then
		return nil
	end
	local var1 = deriveSelectedOfferIdsFromCartPricingModule(p1)
	
	if #var1 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in var1 do
		table.insert(t, { Id = v })
	end
	return { Offers = t }
end