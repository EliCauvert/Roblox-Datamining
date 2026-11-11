local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)
local DeriveSelectedOfferIdsFromCartPricingModule = require(script.Parent.deriveSelectedOfferIdsFromCartPricing)

return function(p1)
	-- upvalues: DeriveSelectedOfferIdsFromCartPricingModule (copy)
	if p1 == nil then
		return nil
	end
	local DeriveSelectedOfferIdsFromCartPricingModuleResult = DeriveSelectedOfferIdsFromCartPricingModule(p1)
	
	if #DeriveSelectedOfferIdsFromCartPricingModuleResult == 0 then
		return nil
	end
	local Offers = {}
	
	for _, Id in DeriveSelectedOfferIdsFromCartPricingModuleResult do
		table.insert(Offers, { Id = Id })
	end
	return { Offers = Offers }
end